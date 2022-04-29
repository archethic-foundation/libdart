/// SPDX-License-Identifier: AGPL-3.0-or-later
/// Package archEthic aims to provide a easy way to create Archethic transaction and to send them over the network.
///
/// This implementation is based on Official Archethic Javascript library for Node and Browser.

// Dart imports:
import 'dart:convert';
import 'dart:math';
import 'dart:typed_data';

// Package imports:
import 'package:crypto/crypto.dart' as crypto_lib show Hmac, sha512, Digest;
import 'package:jwk/jwk.dart';
import 'package:pointycastle/api.dart';

// Project imports:
import 'package:archethic_lib_dart/src/model/authorized_key.dart';
import 'package:archethic_lib_dart/src/model/crypto/key_pair.dart';
import 'package:archethic_lib_dart/src/model/service.dart';
import 'package:archethic_lib_dart/src/model/transaction.dart';
import 'package:archethic_lib_dart/src/utils/crypto.dart' as crypto;
import 'package:archethic_lib_dart/src/utils/utils.dart';

const int keychainOriginId = 0;

class Keychain {
  Keychain(this.seed, {this.version, this.services}) {
    version = 1;
    services ??= {};
  }

  Keychain.serviceUCO(this.seed, {this.version = 1}) {
    addService('uco', 'm/650\'/0\'/0\'');
  }

  Uint8List? seed;
  int? version;
  Map<String, Service>? services;

  void addService(String name, String derivationPath,
      {String curve = 'ed25519', String hashAlgo = 'sha256'}) {
    services ??= {};
    services!.addAll({
      name: Service(
          derivationPath: derivationPath, curve: curve, hashAlgo: hashAlgo)
    });
  }

  Uint8List encode() {
    List<int> servicesBuffer = List.empty(growable: true);
    services!.forEach((serviceName, service) {
      servicesBuffer = concatUint8List([
        Uint8List.fromList([serviceName.length]),
        Uint8List.fromList(serviceName.codeUnits),
        Uint8List.fromList([service.derivationPath!.length]),
        Uint8List.fromList(service.derivationPath!.codeUnits),
        Uint8List.fromList([crypto.curveToID(service.curve!)]),
        Uint8List.fromList([crypto.hashAlgoToID(service.hashAlgo!)])
      ]).toList();
    });

    return concatUint8List([
      encodeInt32(version!),
      Uint8List.fromList([seed!.length]),
      seed!,
      Uint8List.fromList([services!.length]),
      Uint8List.fromList(servicesBuffer)
    ]);
  }

  KeyPair deriveKeypair(String serviceName, {int index = 0}) {
    if (services![serviceName] == null) {
      throw 'Service doesn\'t exist in the keychain';
    }
    return deriveArchethicKeypair(
        seed, services![serviceName]!.derivationPath, index,
        curve: services![serviceName]!.curve);
  }

  Uint8List deriveAddress(String serviceName, {int index = 0}) {
    if (services![serviceName] == null) {
      throw 'Service doesn\'t exist in the keychain';
    }

    final KeyPair keyPair = deriveArchethicKeypair(
        seed, services![serviceName]!.derivationPath, index,
        curve: services![serviceName]!.curve);
    final int curveID = crypto.curveToID(services![serviceName]!.curve!);

    Uint8List hashedPublicKey =
        crypto.hash(keyPair.publicKey, algo: services![serviceName]!.hashAlgo!);

    return concatUint8List([
      Uint8List.fromList([curveID]),
      Uint8List.fromList(hashedPublicKey)
    ]);
  }

  Map<String, dynamic> toDID() {
    String address = crypto.deriveAddress(utf8.decode(seed!), 0);
    List<Map<String, dynamic>> servicesMetadata =
        List<Map<String, dynamic>>.empty(growable: true);
    services!.forEach((serviceName, service) {
      String purpose = service.derivationPath!
          .split('/')
          .map((e) => e.replaceAll("'", ''))
          .elementAt(1);

      // Only support of archethic derivation scheme for now
      if (purpose == '650') {
        final KeyPair keyPair = deriveArchethicKeypair(
            seed, service.derivationPath!, 0,
            curve: service.curve!);

        servicesMetadata.add({
          'id': 'did:archethic:$address#key${servicesMetadata.length}',
          'type': 'JsonWebKey2020',
          'publicKeyJwk': keyToJWK(keyPair.publicKey).toJson()
        });
      } else {
        throw 'Purpose \'' + purpose + '\' is not yet supported';
      }
    });

    return {
      '@context': [
        'https://www.w3.org/ns/did/v1',
      ],
      'id': 'did:archethic:$address',
      'authentication': servicesMetadata,
      'verificationMethod': servicesMetadata
    };
  }

  /// Create a new keychain and build a transaction
  /// @param {String} seed Keychain's seed
  /// @param {List<AuthorizedKey>} authorizedPublicKeys List of authorized public keys able to decrypt the keychain
  /// @param {Uint8List} originPrivateKey Origin private key to attest the transaction
  Transaction newKeychainTransaction(String seed,
      List<AuthorizedKey> authorizedPublicKeys, Uint8List originPrivateKey) {
    Keychain keychain = Keychain(Uint8List.fromList(utf8.encode(seed)));

    int aesKey = Random.secure().nextInt(32);

    List<AuthorizedKey> authorizedKeys =
        List<AuthorizedKey>.from(authorizedPublicKeys.map((key) {
      return {
        'publicKey': key,
        'encryptedSecretKey': crypto.ecEncrypt(aesKey, key)
      };
    }));

    return Transaction(type: 'hosting', data: Transaction.initData())
        .setContent(jsonEncode(keychain.toDID()))
        .addOwnership(
            crypto.aesEncrypt(keychain.encode(), aesKey), authorizedKeys)
        .build(seed, 0)
        .originSign(originPrivateKey);
  }

  /// Create a new access keychain and build a transaction
  /// @param {String} seed Access keychain's seed
  /// @param {Uint8List} keychainAddress Keychain's transaction address
  /// @param {Uint8List} originPrivateKey Origin private key to attest the transaction
  Transaction newAccessKeychainTransaction(
      String seed, Uint8List keychainAddress, Uint8List originPrivateKey) {
    int aesKey = Random.secure().nextInt(32);

    KeyPair keypair = crypto.deriveKeyPair(seed, 0);

    Uint8List encryptedSecretKey = crypto.ecEncrypt(aesKey, keypair.publicKey);

    List<AuthorizedKey> authorizedKeys = [
      AuthorizedKey(
          publicKey: utf8.decode(keypair.publicKey),
          encryptedSecretKey: utf8.decode(encryptedSecretKey))
    ];

    return Transaction(type: 'keychain_access', data: Transaction.initData())
        .addOwnership(
            crypto.aesEncrypt(keychainAddress, aesKey), authorizedKeys)
        .build(seed, 0)
        .originSign(originPrivateKey);
  }
}

Keychain decodeKeychain(Uint8List binary) {
  int pos = 0;
  int version = binary.sublist(pos, 4).buffer.asByteData().getInt32(0).toInt();
  pos = pos + 4;
  int seedSize = binary.sublist(pos, pos + 1)[0].toInt();
  pos++;
  Uint8List seed = binary.sublist(pos, pos + seedSize);
  pos = pos + seedSize;
  int nbServices = binary.sublist(pos, pos + 1)[0].toInt();
  pos++;

  Keychain keychain = Keychain(seed, version: version);
  for (int i = 0; i < nbServices; i++) {
    int serviceNameLength = binary.sublist(pos, pos + 1)[0].toInt();
    pos++;
    Uint8List serviceName = binary.sublist(pos, pos + serviceNameLength);
    pos = pos + serviceNameLength;
    int derivationPathLength = binary.sublist(pos, pos + 1)[0].toInt();
    pos++;
    Uint8List derivationPath = binary.sublist(pos, pos + derivationPathLength);
    pos = pos + derivationPathLength;
    int curveId = binary.sublist(pos, pos + 1)[0].toInt();
    pos++;
    int hashAlgoId = binary.sublist(pos, pos + 1)[0].toInt();
    pos++;

    keychain.addService(utf8.decode(serviceName), utf8.decode(derivationPath),
        curve: crypto.idToCurve(curveId),
        hashAlgo: crypto.idToHashAlgo(hashAlgoId));
  }
  return keychain;
}

KeyPair deriveArchethicKeypair(seed, derivationPath, index,
    {curve = "ed25519"}) {
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
  List<String> newPath = path.split('/').sublist(0, 3);
  newPath.add('$index\'');
  return newPath.join('/');
}

Jwk keyToJWK(Uint8List publicKey) {
  int curveID = publicKey[0];
  Uint8List key = publicKey.sublist(2, publicKey.length);

  switch (curveID) {
    case 0:
      return Jwk.fromJson(
          {"kty": "OKP", "crv": "Ed25519", "x": base64Url.encode(key)});
    case 1:
      Uint8List x = key.sublist(16);
      Uint8List y = key.sublist(-16);
      return Jwk.fromJson({
        "kty": "EC",
        "crv": "P-256",
        "x": base64Url.encode(x),
        "y": base64Url.encode(y)
      });
    case 2:
      Uint8List x = key.sublist(16);
      Uint8List y = key.sublist(-16);
      return Jwk.fromJson({
        "kty": "EC",
        "crv": "secp256k1",
        "x": base64Url.encode(x),
        "y": base64Url.encode(y)
      });
    default:
      throw 'Curve not supported';
  }
}
