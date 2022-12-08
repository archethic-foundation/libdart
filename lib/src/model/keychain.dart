/// SPDX-License-Identifier: AGPL-3.0-or-later
/// Package archEthic aims to provide a easy way to create Archethic transaction and to send them over the network.
///
/// This implementation is based on Official Archethic Javascript library for Node and Browser.
import 'dart:convert';
import 'dart:typed_data';

// Project imports:
import 'package:archethic_lib_dart/src/model/crypto/key_pair.dart';
import 'package:archethic_lib_dart/src/model/service.dart';
import 'package:archethic_lib_dart/src/model/transaction.dart';
import 'package:archethic_lib_dart/src/utils/crypto.dart' as crypto;
import 'package:archethic_lib_dart/src/utils/utils.dart';
// Package imports:
import 'package:crypto/crypto.dart' as crypto_lib show Hmac, sha512;
import 'package:jwk/jwk.dart';
import 'package:pointycastle/api.dart';

const int keychainOriginId = 0;

class Keychain {
  Keychain(this.seed, {this.version, this.services}) {
    version = 1;
    services ??= <String, Service>{};
  }

  Keychain.serviceUCO(this.seed, {this.version = 1}) {
    addService('uco', "m/650'/0/0");
  }

  Uint8List? seed;
  int? version;
  Map<String, Service>? services;

  void addService(String name, String derivationPath,
      {String curve = 'ed25519', String hashAlgo = 'sha256',}) {
    services ??= <String, Service>{};
    services!.addAll(<String, Service>{
      name: Service(
          derivationPath: derivationPath, curve: curve, hashAlgo: hashAlgo,)
    });
  }

  Uint8List encode() {
    var servicesBuffer = Uint8List(0);
    services!.forEach((String serviceName, Service service) {
      servicesBuffer = concatUint8List(<Uint8List>[
        servicesBuffer,
        Uint8List.fromList(<int>[serviceName.length]),
        Uint8List.fromList(serviceName.codeUnits),
        Uint8List.fromList(<int>[service.derivationPath!.length]),
        Uint8List.fromList(service.derivationPath!.codeUnits),
        Uint8List.fromList(<int>[crypto.curveToID(service.curve!)]),
        Uint8List.fromList(<int>[crypto.hashAlgoToID(service.hashAlgo!)])
      ]);
    });

    return concatUint8List(<Uint8List>[
      toByteArray(version!, length: 4),
      Uint8List.fromList(<int>[seed!.length]),
      seed!,
      Uint8List.fromList(<int>[services!.length]),
      Uint8List.fromList(servicesBuffer)
    ]);
  }

  KeyPair deriveKeypair(String serviceName, {int index = 0}) {
    if (services![serviceName] == null) {
      throw "Service doesn't exist in the keychain";
    }
    return deriveArchethicKeypair(
        seed, services![serviceName]!.derivationPath!, index,
        curve: services![serviceName]!.curve!,);
  }

  Uint8List deriveAddress(String serviceName, {int index = 0}) {
    if (services![serviceName] == null) {
      throw "Service doesn't exist in the keychain";
    }

    final keyPair = deriveArchethicKeypair(
        seed, services![serviceName]!.derivationPath!, index,
        curve: services![serviceName]!.curve!,);
    final curveID = crypto.curveToID(services![serviceName]!.curve!);

    final hashedPublicKey =
        crypto.hash(keyPair.publicKey, algo: services![serviceName]!.hashAlgo!);

    return concatUint8List(<Uint8List>[
      Uint8List.fromList(<int>[curveID]),
      Uint8List.fromList(hashedPublicKey)
    ]);
  }

  Transaction buildTransaction(
      Transaction transaction, String serviceName, int index,
      {String? curve = 'ed25519', String? hashAlgo = 'sha256',}) {
    final keypair = deriveKeypair(serviceName, index: index);
    transaction.address =
        uint8ListToHex(deriveAddress(serviceName, index: index + 1));

    final payloadForPreviousSignature = transaction.previousSignaturePayload();
    final previousSignature =
        crypto.sign(payloadForPreviousSignature, keypair.privateKey);

    transaction.setPreviousSignatureAndPreviousPublicKey(
        previousSignature, keypair.publicKey,);
    return transaction;
  }

  Map<String, dynamic> toDID() {
    final address = crypto.deriveAddress(uint8ListToHex(seed!), 0);
    final verificationMethods =
        List<Map<String, dynamic>>.empty(growable: true);
    final authentications = List<String>.empty(growable: true);

    services!.forEach((String serviceName, Service service) {
      final purpose = service.derivationPath!
          .split('/')
          .map((String e) => e.replaceAll("'", ''))
          .elementAt(1);

      // Only support of archethic derivation scheme for now
      if (purpose == '650') {
        final keyPair = deriveArchethicKeypair(seed, service.derivationPath!, 0,
            curve: service.curve!,);

        verificationMethods.add(<String, dynamic>{
          'id': 'did:archethic:$address#$serviceName',
          'type': 'JsonWebKey2020',
          'publicKeyJwk': keyToJWK(keyPair.publicKey, serviceName).toJson(),
          'controller': 'did:archethic:$address'
        });

        authentications.add('did:archethic:$address#$serviceName');
      } else {
        throw "Purpose '$purpose' is not yet supported";
      }
    });

    return <String, dynamic>{
      '@context': <String>[
        'https://www.w3.org/ns/did/v1',
      ],
      'id': 'did:archethic:$address',
      'authentication': authentications,
      'verificationMethod': verificationMethods
    };
  }
}

Keychain decodeKeychain(Uint8List binary) {
  var pos = 0;
  final version = binary.sublist(pos, 4).buffer.asByteData().getInt32(0);
  pos = pos + 4;
  final seedSize = binary.sublist(pos, pos + 1)[0];
  pos++;
  final seed = binary.sublist(pos, pos + seedSize);
  pos = pos + seedSize;
  final nbServices = binary.sublist(pos, pos + 1)[0];
  pos++;

  final keychain = Keychain(seed, version: version);
  for (var i = 0; i < nbServices; i++) {
    final serviceNameLength = binary.sublist(pos, pos + 1)[0];
    pos++;
    final serviceName = binary.sublist(pos, pos + serviceNameLength);
    pos = pos + serviceNameLength;
    final derivationPathLength = binary.sublist(pos, pos + 1)[0];
    pos++;
    final derivationPath = binary.sublist(pos, pos + derivationPathLength);
    pos = pos + derivationPathLength;
    final curveId = binary.sublist(pos, pos + 1)[0];
    pos++;
    final hashAlgoId = binary.sublist(pos, pos + 1)[0];
    pos++;

    keychain.addService(utf8.decode(serviceName), utf8.decode(derivationPath),
        curve: crypto.idToCurve(curveId),
        hashAlgo: crypto.idToHashAlgo(hashAlgoId),);
  }
  return keychain;
}

KeyPair deriveArchethicKeypair(dynamic seed, String derivationPath, int index,
    {String curve = 'ed25519',}) {
  // Hash the derivation path
  final sha256 = Digest('SHA-256');
  final hashedPath = sha256.process(Uint8List.fromList(
      replaceDerivationPathIndex(derivationPath, index).codeUnits,),);

  final hmac = crypto_lib.Hmac(crypto_lib.sha512, seed);
  final digest = hmac.convert(hashedPath);
  final extendedSeed = Uint8List.fromList(digest.bytes.sublist(0, 32));

  return crypto.generateDeterministicKeyPair(
      extendedSeed, curve, keychainOriginId,);
}

String replaceDerivationPathIndex(String path, int index) {
  final newPath = path.split('/');
  newPath.last = index.toString();
  return newPath.join('/');
}

Jwk keyToJWK(Uint8List publicKey, String keyId) {
  final curveID = publicKey[0];
  final key = publicKey.sublist(2, publicKey.length);

  switch (curveID) {
    case 0:
      return Jwk.fromJson(<dynamic, dynamic>{
        'kty': 'OKP',
        'crv': 'Ed25519',
        'x': base64Url.encode(key),
        'kid': keyId
      });
    case 1:
      final x = key.sublist(16);
      final y = key.sublist(-16);
      return Jwk.fromJson(<dynamic, dynamic>{
        'kty': 'EC',
        'crv': 'P-256',
        'x': base64Url.encode(x),
        'y': base64Url.encode(y),
        'kid': keyId
      });
    case 2:
      final x = key.sublist(16);
      final y = key.sublist(-16);
      return Jwk.fromJson(<dynamic, dynamic>{
        'kty': 'EC',
        'crv': 'secp256k1',
        'x': base64Url.encode(x),
        'y': base64Url.encode(y),
        'kid': keyId
      });
    default:
      throw 'Curve not supported';
  }
}
