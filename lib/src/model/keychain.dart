/// SPDX-License-Identifier: AGPL-3.0-or-later
/// Package archEthic aims to provide a easy way to create Archethic transaction and to send them over the network.
///
/// This implementation is based on Official Archethic Javascript library for Node and Browser.
import 'dart:convert';
import 'dart:typed_data';

import 'package:archethic_lib_dart/archethic_lib_dart.dart';
import 'package:archethic_lib_dart/src/model/address.dart';
import 'package:archethic_lib_dart/src/model/authorized_key.dart';
import 'package:archethic_lib_dart/src/model/crypto/key_pair.dart';
import 'package:archethic_lib_dart/src/model/service.dart';
import 'package:archethic_lib_dart/src/model/transaction.dart';
import 'package:archethic_lib_dart/src/utils/crypto.dart' as crypto;
import 'package:archethic_lib_dart/src/utils/uint8List_converter.dart';
import 'package:archethic_lib_dart/src/utils/utils.dart';
import 'package:crypto/crypto.dart' as crypto_lib show Hmac, sha512;
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:jwk/jwk.dart';
import 'package:pointycastle/api.dart';

part 'keychain.freezed.dart';
part 'keychain.g.dart';

const int keychainOriginId = 0;

@freezed
class Keychain with _$Keychain {
  const factory Keychain({
    @Uint8ListConverter() Uint8List? seed,
    @Default(1) final int version,
    @Default({}) final Map<String, Service> services,
  }) = _Keychain;
  const Keychain._();

  factory Keychain.fromJson(Map<String, dynamic> json) =>
      _$KeychainFromJson(json);

  Keychain copyWithService(
    String name,
    String derivationPath, {
    String curve = 'ed25519',
    String hashAlgo = 'sha256',
  }) {
    return copyWith(
      services: <String, Service>{
        ...services,
        name: Service(
          derivationPath: derivationPath,
          curve: curve,
          hashAlgo: hashAlgo,
        ),
      },
    );
  }

  Uint8List encode() {
    var servicesBuffer = Uint8List(0);
    services.forEach((String serviceName, Service service) {
      servicesBuffer = concatUint8List(<Uint8List>[
        servicesBuffer,
        Uint8List.fromList(<int>[serviceName.length]),
        Uint8List.fromList(serviceName.codeUnits),
        Uint8List.fromList(<int>[service.derivationPath.length]),
        Uint8List.fromList(service.derivationPath.codeUnits),
        Uint8List.fromList(<int>[crypto.curveToID(service.curve)]),
        Uint8List.fromList(<int>[crypto.hashAlgoToID(service.hashAlgo)]),
      ]);
    });

    return concatUint8List(<Uint8List>[
      toByteArray(version, length: 4),
      Uint8List.fromList(<int>[seed!.length]),
      seed!,
      Uint8List.fromList(<int>[services.length]),
      Uint8List.fromList(servicesBuffer),
    ]);
  }

  KeyPair deriveKeypair(
    String serviceName, {
    int index = 0,
    String pathSuffix = '',
  }) {
    if (services[serviceName] == null) {
      throw Exception(
        "Service doesn't exist in the keychain",
      );
    }
    return deriveArchethicKeypair(
      seed,
      services[serviceName]!.derivationPath,
      index,
      curve: services[serviceName]!.curve,
      pathSuffix: pathSuffix,
    );
  }

  Uint8List deriveAddress(
    String serviceName, {
    int index = 0,
    String pathSuffix = '',
  }) {
    if (services[serviceName] == null) {
      throw Exception(
        "Service doesn't exist in the keychain",
      );
    }

    final keyPair = deriveArchethicKeypair(
      seed,
      services[serviceName]!.derivationPath,
      index,
      curve: services[serviceName]!.curve,
      pathSuffix: pathSuffix,
    );
    final curveID = crypto.curveToID(services[serviceName]!.curve);

    final hashedPublicKey =
        crypto.hash(keyPair.publicKey, algo: services[serviceName]!.hashAlgo);

    return concatUint8List(<Uint8List>[
      Uint8List.fromList(<int>[curveID]),
      Uint8List.fromList(hashedPublicKey),
    ]);
  }

  ({Transaction transaction, KeyPair keyPair}) buildTransaction(
    Transaction transaction,
    String serviceName,
    int index, {
    String pathSuffix = '',
    String? curve = 'ed25519',
    String? hashAlgo = 'sha256',
  }) {
    final keypair =
        deriveKeypair(serviceName, index: index, pathSuffix: pathSuffix);
    final transactionWithAddress = transaction.copyWith(
      address: Address(
        address: uint8ListToHex(
          deriveAddress(
            serviceName,
            index: index + 1,
            pathSuffix: pathSuffix,
          ),
        ),
      ),
      previousPublicKey: uint8ListToHex(
        Uint8List.fromList(keypair.publicKey!),
      ),
    );
    final payloadForPreviousSignature =
        transactionWithAddress.previousSignaturePayload();
    final previousSignature =
        crypto.sign(payloadForPreviousSignature, keypair.privateKey);

    return (
      transaction:
          transactionWithAddress.setPreviousSignatureAndPreviousPublicKey(
        uint8ListToHex(previousSignature),
        uint8ListToHex(
          Uint8List.fromList(keypair.publicKey!),
        ),
      ),
      keyPair: keypair
    );
  }

  Map<String, dynamic> toDID() {
    final address = crypto.deriveAddress(uint8ListToHex(seed!), 0);
    final verificationMethods =
        List<Map<String, dynamic>>.empty(growable: true);
    final authentications = List<String>.empty(growable: true);

    services.forEach((String serviceName, Service service) {
      final purpose = service.derivationPath
          .split('/')
          .map((String e) => e.replaceAll("'", ''))
          .elementAt(1);

      // Only support of archethic derivation scheme for now
      if (purpose == '650') {
        final keyPair = deriveArchethicKeypair(
          seed,
          service.derivationPath,
          0,
          curve: service.curve,
        );

        verificationMethods.add(<String, dynamic>{
          'id': 'did:archethic:$address#$serviceName',
          'type': 'JsonWebKey2020',
          'publicKeyJwk':
              keyToJWK(Uint8List.fromList(keyPair.publicKey!), serviceName)
                  .toJson(),
          'controller': 'did:archethic:$address',
        });

        authentications.add('did:archethic:$address#$serviceName');
      } else {
        throw Exception("Purpose '$purpose' is not yet supported");
      }
    });

    return <String, dynamic>{
      '@context': <String>[
        'https://www.w3.org/ns/did/v1',
      ],
      'id': 'did:archethic:$address',
      'authentication': authentications,
      'verificationMethod': verificationMethods,
    };
  }

  ({Uint8List secret, List<AuthorizedKey> authorizedPublicKeys})
      ecEncryptServiceSeed(
    String service,
    List<String> publicKeys, {
    String pathSuffix = '',
  }) {
    if (services[service] == null) {
      throw Exception(
        "Service doesn't exist in the keychain",
      );
    }

    final serviceSelected = services[service];
    final extendedSeed = deriveServiceSeed(
      seed,
      serviceSelected!.derivationPath,
      0,
      pathSuffix: pathSuffix,
    );

    final aesKey = generateRandomAESKey();

    final secret = crypto.aesEncrypt(extendedSeed, aesKey);

    final authorizedPublicKeys = <AuthorizedKey>[];
    for (final key in publicKeys) {
      authorizedPublicKeys.add(
        AuthorizedKey(
          encryptedSecretKey: uint8ListToHex(crypto.ecEncrypt(aesKey, key)),
          publicKey: key,
        ),
      );
    }
    return (secret: secret, authorizedPublicKeys: authorizedPublicKeys);
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

  final services = <String, Service>{};
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

    services[utf8.decode(serviceName)] = Service(
      derivationPath: utf8.decode(derivationPath),
      curve: crypto.idToCurve(curveId),
      hashAlgo: crypto.idToHashAlgo(hashAlgoId),
    );
  }
  return Keychain(
    seed: seed,
    version: version,
    services: services,
  );
}

KeyPair deriveArchethicKeypair(
  dynamic seed,
  String derivationPath,
  int index, {
  String curve = 'ed25519',
  String pathSuffix = '',
}) {
  final extendedSeed = deriveServiceSeed(
    seed,
    derivationPath,
    index,
    pathSuffix: pathSuffix,
  );

  return isPathWithIndex(derivationPath)
      ? crypto.generateDeterministicKeyPair(
          extendedSeed,
          curve,
          keychainOriginId,
        )
      : deriveKeyPair(uint8ListToHex(extendedSeed), index, curve: curve);
}

Uint8List deriveServiceSeed(
  dynamic seed,
  String derivationPath,
  int index, {
  String pathSuffix = '',
}) {
  final sha256 = Digest('SHA-256');
  var hashedPath = Uint8List.fromList([]);
  if (isPathWithIndex(derivationPath)) {
    hashedPath = sha256.process(
      Uint8List.fromList(
        replaceDerivationPathIndex(derivationPath, pathSuffix, index).codeUnits,
      ),
    );
  } else {
    final path = derivationPath.split('/');
    final serviceName = path.removeLast() + pathSuffix;
    hashedPath = sha256.process(
      Uint8List.fromList(
        utf8.encode('${path.join('/')}/$serviceName'),
      ),
    );
  }

  final hmac = crypto_lib.Hmac(crypto_lib.sha512, seed);
  final digest = hmac.convert(hashedPath);
  return Uint8List.fromList(digest.bytes.sublist(0, 32));
}

bool isPathWithIndex(String path) {
  final servicePath = path.split('/');
  return servicePath.length == 4 && servicePath[3] == '0';
}

String replaceDerivationPathIndex(String path, String suffix, int index) {
  final pathArr = path.split('/');
  pathArr.removeLast();
  pathArr.add('${pathArr.removeLast()}$suffix');
  pathArr.add(index.toString());
  return pathArr.join('/');
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
        'kid': keyId,
      });
    case 1:
      final x = key.sublist(16);
      final y = key.sublist(-16);
      return Jwk.fromJson(<dynamic, dynamic>{
        'kty': 'EC',
        'crv': 'P-256',
        'x': base64Url.encode(x),
        'y': base64Url.encode(y),
        'kid': keyId,
      });
    case 2:
      final x = key.sublist(16);
      final y = key.sublist(-16);
      return Jwk.fromJson(<dynamic, dynamic>{
        'kty': 'EC',
        'crv': 'secp256k1',
        'x': base64Url.encode(x),
        'y': base64Url.encode(y),
        'kid': keyId,
      });
    default:
      throw Exception('Curve not supported');
  }
}
