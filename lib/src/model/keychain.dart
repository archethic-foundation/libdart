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
import 'package:crypto/crypto.dart' as crypto_lib show Hmac, sha512, Digest;
import 'package:jwk/jwk.dart';
import 'package:pointycastle/api.dart';

const int keychainOriginId = 0;

class Keychain {
  Keychain(this.seed, {this.version, this.services}) {
    version = 1;
    services ??= <String, Service>{};
  }

  Keychain.serviceUCO(this.seed, {this.version = 1}) {
    addService('uco', 'm/650\'/0\'/0\'');
  }

  Uint8List? seed;
  int? version;
  Map<String, Service>? services;

  void addService(String name, String derivationPath,
      {String curve = 'ed25519', String hashAlgo = 'sha256'}) {
    services ??= <String, Service>{};
    services!.addAll(<String, Service>{
      name: Service(
          derivationPath: derivationPath, curve: curve, hashAlgo: hashAlgo)
    });
  }

  Uint8List encode() {
    List<int> servicesBuffer = List<int>.empty(growable: true);
    services!.forEach((String serviceName, Service service) {
      servicesBuffer = concatUint8List(<Uint8List>[
        Uint8List.fromList(<int>[serviceName.length]),
        Uint8List.fromList(serviceName.codeUnits),
        Uint8List.fromList(<int>[service.derivationPath!.length]),
        Uint8List.fromList(service.derivationPath!.codeUnits),
        Uint8List.fromList(<int>[crypto.curveToID(service.curve!)]),
        Uint8List.fromList(<int>[crypto.hashAlgoToID(service.hashAlgo!)])
      ]).toList();
    });

    return concatUint8List(<Uint8List>[
      encodeInt32(version!),
      Uint8List.fromList(<int>[seed!.length]),
      seed!,
      Uint8List.fromList(<int>[services!.length]),
      Uint8List.fromList(servicesBuffer)
    ]);
  }

  KeyPair deriveKeypair(String serviceName, {int index = 0}) {
    if (services![serviceName] == null) {
      throw 'Service doesn\'t exist in the keychain';
    }
    return deriveArchethicKeypair(
        seed, services![serviceName]!.derivationPath!, index,
        curve: services![serviceName]!.curve!);
  }

  Uint8List deriveAddress(String serviceName, {int index = 0}) {
    if (services![serviceName] == null) {
      throw 'Service doesn\'t exist in the keychain';
    }

    final KeyPair keyPair = deriveArchethicKeypair(
        seed, services![serviceName]!.derivationPath!, index,
        curve: services![serviceName]!.curve!);
    final int curveID = crypto.curveToID(services![serviceName]!.curve!);

    final Uint8List hashedPublicKey =
        crypto.hash(keyPair.publicKey, algo: services![serviceName]!.hashAlgo!);

    return concatUint8List(<Uint8List>[
      Uint8List.fromList(<int>[curveID]),
      Uint8List.fromList(hashedPublicKey)
    ]);
  }

  Transaction buildTransaction(
      Transaction transaction, String serviceName, int index,
      {String? curve = 'ed25519', String? hashAlgo = 'sha256'}) {
    final KeyPair keypair = deriveKeypair(serviceName, index: index);
    transaction.address =
        uint8ListToHex(deriveAddress(serviceName, index: index + 1));

    final Uint8List payloadForPreviousSignature =
        transaction.previousSignaturePayload();
    final Uint8List previousSignature =
        crypto.sign(payloadForPreviousSignature, keypair.privateKey);

    transaction.setPreviousSignatureAndPreviousPublicKey(
        previousSignature, keypair.publicKey);
    return transaction;
  }

  Map<String, dynamic> toDID() {
    final String address = crypto.deriveAddress(utf8.decode(seed!), 0);
    final List<Map<String, dynamic>> servicesMetadata =
        List<Map<String, dynamic>>.empty(growable: true);
    services!.forEach((String serviceName, Service service) {
      final String purpose = service.derivationPath!
          .split('/')
          .map((String e) => e.replaceAll("'", ''))
          .elementAt(1);

      // Only support of archethic derivation scheme for now
      if (purpose == '650') {
        final KeyPair keyPair = deriveArchethicKeypair(
            seed, service.derivationPath!, 0,
            curve: service.curve!);

        servicesMetadata.add(<String, dynamic>{
          'id': 'did:archethic:$address#key${servicesMetadata.length}',
          'type': 'JsonWebKey2020',
          'publicKeyJwk': keyToJWK(keyPair.publicKey).toJson()
        });
      } else {
        throw 'Purpose \'$purpose\' is not yet supported';
      }
    });

    return <String, dynamic>{
      '@context': <String>[
        'https://www.w3.org/ns/did/v1',
      ],
      'id': 'did:archethic:$address',
      'authentication': servicesMetadata,
      'verificationMethod': servicesMetadata
    };
  }
}

Keychain decodeKeychain(Uint8List binary) {
  int pos = 0;
  final int version =
      binary.sublist(pos, 4).buffer.asByteData().getInt32(0).toInt();
  pos = pos + 4;
  final int seedSize = binary.sublist(pos, pos + 1)[0].toInt();
  pos++;
  final Uint8List seed = binary.sublist(pos, pos + seedSize);
  pos = pos + seedSize;
  final int nbServices = binary.sublist(pos, pos + 1)[0].toInt();
  pos++;

  final Keychain keychain = Keychain(seed, version: version);
  for (int i = 0; i < nbServices; i++) {
    final int serviceNameLength = binary.sublist(pos, pos + 1)[0].toInt();
    pos++;
    final Uint8List serviceName = binary.sublist(pos, pos + serviceNameLength);
    pos = pos + serviceNameLength;
    final int derivationPathLength = binary.sublist(pos, pos + 1)[0].toInt();
    pos++;
    final Uint8List derivationPath =
        binary.sublist(pos, pos + derivationPathLength);
    pos = pos + derivationPathLength;
    final int curveId = binary.sublist(pos, pos + 1)[0].toInt();
    pos++;
    final int hashAlgoId = binary.sublist(pos, pos + 1)[0].toInt();
    pos++;

    keychain.addService(utf8.decode(serviceName), utf8.decode(derivationPath),
        curve: crypto.idToCurve(curveId),
        hashAlgo: crypto.idToHashAlgo(hashAlgoId));
  }
  return keychain;
}

KeyPair deriveArchethicKeypair(dynamic seed, String derivationPath, int index,
    {String curve = 'ed25519'}) {
  // Hash the derivation path
  final Digest sha256 = Digest('SHA-256');
  final Uint8List hashedPath = sha256.process(Uint8List.fromList(
      replaceDerivationPathIndex(derivationPath, index).codeUnits));

  final crypto_lib.Hmac hmac = crypto_lib.Hmac(crypto_lib.sha512, seed);
  final crypto_lib.Digest digest = hmac.convert(hashedPath);
  final Uint8List extendedSeed =
      Uint8List.fromList(digest.bytes.sublist(0, 32));

  return crypto.generateDeterministicKeyPair(
      extendedSeed, curve, keychainOriginId);
}

String replaceDerivationPathIndex(String path, int index) {
  final List<String> newPath = path.split('/').sublist(0, 3);
  newPath.add('$index\'');
  return newPath.join('/');
}

Jwk keyToJWK(Uint8List publicKey) {
  final int curveID = publicKey[0];
  final Uint8List key = publicKey.sublist(2, publicKey.length);

  switch (curveID) {
    case 0:
      return Jwk.fromJson(<dynamic, dynamic>{
        'kty': 'OKP',
        'crv': 'Ed25519',
        'x': base64Url.encode(key)
      });
    case 1:
      final Uint8List x = key.sublist(16);
      final Uint8List y = key.sublist(-16);
      return Jwk.fromJson(<dynamic, dynamic>{
        'kty': 'EC',
        'crv': 'P-256',
        'x': base64Url.encode(x),
        'y': base64Url.encode(y)
      });
    case 2:
      final Uint8List x = key.sublist(16);
      final Uint8List y = key.sublist(-16);
      return Jwk.fromJson(<dynamic, dynamic>{
        'kty': 'EC',
        'crv': 'secp256k1',
        'x': base64Url.encode(x),
        'y': base64Url.encode(y)
      });
    default:
      throw 'Curve not supported';
  }
}
