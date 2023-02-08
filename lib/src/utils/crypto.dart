/// SPDX-License-Identifier: AGPL-3.0-or-later
import 'dart:convert' show utf8;
import 'dart:math' show Random;

// Project imports:
import 'package:archethic_lib_dart/src/model/crypto/aes_auth_encrypt_infos.dart';
import 'package:archethic_lib_dart/src/model/crypto/key_pair.dart';
import 'package:archethic_lib_dart/src/model/crypto/secret.dart';
import 'package:archethic_lib_dart/src/utils/utils.dart';
// Package imports:
import 'package:crypto/crypto.dart' as crypto show Hmac, sha256, sha512;
import 'package:crypto_keys/crypto_keys.dart' as crypto_keys
    show EncryptionResult, SymmetricKey, KeyPair, algorithms;
import 'package:ecdsa/ecdsa.dart' as ecdsa
    show Signature, deterministicSign, verify;
import 'package:elliptic/ecdh.dart' as ecdh show computeSecret;
import 'package:elliptic/elliptic.dart' as elliptic
    show PrivateKey, PublicKey, getSecp256k1, getP256;
import 'package:pinenacl/api.dart';
import 'package:pinenacl/ed25519.dart' as ed25519
    show SigningKey, VerifyKey, Signature;
import 'package:pinenacl/tweetnacl.dart' as tweetnacl show TweetNaClExt;
import 'package:pointycastle/export.dart' show Digest;
import 'package:x25519/x25519.dart' as x25519 show generateKeyPair, X25519;

const int softwareId = 1;

/// Get the ID of a given hash algorithm
/// @params {String} hashAlgo Hash algorithm
int hashAlgoToID(String hashAlgo) {
  switch (hashAlgo) {
    case 'sha256':
      return 0;
    case 'sha512':
      return 1;
    case 'sha3-256':
      return 2;
    case 'sha3-512':
      return 3;
    case 'blake2b':
      return 4;
    default:
      throw 'Hash algorithm not supported';
  }
}

/// Get the hash algo name from the hash algorithm ID
/// @param {int} ID Hash algorithm's ID
String idToHashAlgo(int id) {
  switch (id) {
    case 0:
      return 'sha256';
    case 1:
      return 'sha512';
    case 2:
      return 'sha3-256';
    case 3:
      return 'sha3-512';
    case 4:
      return 'blake2b';
    default:
      throw 'Hash algorithm ID not supported';
  }
}

/// Get the ID of a given Elliptic curve
///@params {String} curve Elliptic curve
int curveToID(String curve) {
  switch (curve) {
    case 'ed25519':
      return 0;
    case 'P256':
      return 1;
    case 'secp256k1':
      return 2;
    default:
      throw 'Curve not supported';
  }
}

/// Get the curve name from the curve ID
/// @param {int} ID Curve's ID
String idToCurve(int id) {
  switch (id) {
    case 0:
      return 'ed25519';
    case 1:
      return 'P256';
    case 2:
      return 'secp256k1';
    default:
      throw 'Curve ID not supported';
  }
}

/// Create a hash digest from the data with an hash algorithm identification prepending the digest
/// @param {String} seed Keypair derivation seed
/// @param {int} index Number to identify the order of keys to generate
/// @param {String} curve Elliptic curve to use ("ed25519", "P256", "secp256k1")
/// @param {String} hashAlgo Hash algorithm ("sha256", "sha512", "sha3-256", "sha3-512", "blake2b")
String deriveAddress(
  String seed,
  int index, {
  String curve = 'ed25519',
  String hashAlgo = 'sha256',
}) {
  final keypair = deriveKeyPair(seed, index, curve: curve);

  final curveID = curveToID(curve);
  final hashedPublicKey = hash(keypair.publicKey, algo: hashAlgo);
  return uint8ListToHex(
    concatUint8List(<Uint8List>[
      Uint8List.fromList(<int>[curveID]),
      hashedPublicKey
    ]),
  );
}

/// Create a hash digest from the data with an hash algorithm identification prepending the digest
/// @param {String | Uint8List} content Data to hash (string or buffer)
/// @param {String} algo Hash algorithm ("sha256", "sha512", "sha3-256", "sha3-512", "blake2b")
Uint8List hash(dynamic content, {String algo = 'sha256'}) {
  if (content is! List<int> && content is! String) {
    throw "'content' must be a string or Uint8List";
  }

  if (content is String) {
    if (isHex(content)) {
      content = Uint8List.fromList(utf8.encode(content));
    } else {
      content = Uint8List.fromList(content.codeUnits);
    }
  }

  final algoID = hashAlgoToID(algo);
  final digest = getHashDigest(content, algo);

  return concatUint8List(<Uint8List>[
    Uint8List.fromList(<int>[algoID]),
    digest
  ]);
}

Uint8List getHashDigest(dynamic content, dynamic algo) {
  switch (algo) {
    case 'sha256':
      final sha256 = Digest('SHA-256');
      return sha256.process(Uint8List.fromList(content));
    case 'sha512':
      final sha512 = Digest('SHA-512');
      return sha512.process(Uint8List.fromList(content));
    case 'sha3-256':
      final sha3_256 = Digest('SHA3-256');
      return sha3_256.process(Uint8List.fromList(content));
    case 'sha3-512':
      final sha3_512 = Digest('SHA3-512');
      return sha3_512.process(Uint8List.fromList(content));
    case 'blake2b':
      final blake2b = Digest('Blake2b');
      return blake2b.process(Uint8List.fromList(content));
    default:
      throw 'Hash algorithm not supported';
  }
}

/// Generate a keypair using a derivation function with a seed and an index. Each keys is prepending with a curve identification.
/// @param {String} seed Keypair derivation seed
/// @param {int} index Number to identify the order of keys to generate
/// @param {String} curve Elliptic curve to use ("P256", "secp256k1", "ed25519")
KeyPair deriveKeyPair(String seed, int index, {String curve = 'ed25519'}) {
  if (index < 0) {
    throw "index' must be a positive number";
  }

  final pvBuf = derivePrivateKey(seed, index);
  return generateDeterministicKeyPair(pvBuf, curve, softwareId);
}

/// Generate a new keypair deterministically with a given private key, curve and origin id
/// @params {Uint8List} privateKey Private key
/// @params {String} curve Elliptic curve
/// @params {int} originID Origin identification
KeyPair generateDeterministicKeyPair(
  Uint8List pvKey,
  String curve,
  int originID,
) {
  final curveID = curveToID(curve);
  final keyPair = getKeypair(pvKey, curve);
  return KeyPair(
    privateKey: concatUint8List(<Uint8List>[
      Uint8List.fromList(<int>[curveID]),
      Uint8List.fromList(<int>[originID]),
      Uint8List.fromList(keyPair.privateKey!),
    ]),
    publicKey: concatUint8List(<Uint8List>[
      Uint8List.fromList(<int>[curveID]),
      Uint8List.fromList(<int>[originID]),
      Uint8List.fromList(keyPair.publicKey!),
    ]),
  );
}

KeyPair getKeypair(Uint8List pvKey, String curve) {
  switch (curve) {
    case 'ed25519':
      final signingKey = ed25519.SigningKey(seed: pvKey);
      final pubBuf = signingKey.publicKey.toUint8List();
      return KeyPair(privateKey: pvKey, publicKey: pubBuf);
    case 'P256':
      final ec = elliptic.getP256();
      final privateKey = elliptic.PrivateKey.fromBytes(ec, pvKey);
      final publicKey = ec.privateToPublicKey(privateKey);
      return KeyPair(
        privateKey: pvKey,
        publicKey: hexToUint8List(publicKey.toHex()),
      );
    case 'secp256k1':
      final ec = elliptic.getSecp256k1();
      final privateKey = elliptic.PrivateKey.fromBytes(ec, pvKey);
      final publicKey = ec.privateToPublicKey(privateKey);
      return KeyPair(
        privateKey: pvKey,
        publicKey: hexToUint8List(publicKey.toHex()),
      );
    default:
      throw 'Curve not supported';
  }
}

/// Sign the data
/// @param {String | Uint8List} data Data to sign
/// @param {String | Uint8List} privateKey Private key to use to sign the data
Uint8List sign(dynamic data, dynamic privateKey) {
  if (data is! Uint8List && data is! String) {
    throw "'data' must be a string or Uint8List";
  }

  if (privateKey is! List<int> && privateKey is! String) {
    throw "'privateKey' must be a string or Uint8List";
  }

  if (data is String) {
    if (isHex(data)) {
      data = Uint8List.fromList(hexToUint8List(data));
    } else {
      data = Uint8List.fromList(utf8.encode(data));
    }
  }

  if (privateKey is String) {
    if (isHex(privateKey)) {
      privateKey = Uint8List.fromList(hexToUint8List(privateKey));
    } else {
      privateKey = Uint8List.fromList(utf8.encode(privateKey));
    }
  }

  final curveBuf = Uint8List.fromList(
    privateKey.sublist(0, 1),
  );
  final pvBuf = Uint8List.fromList(privateKey.sublist(2, privateKey.length));

  switch (curveBuf[0]) {
    case 0:
      final signingKey = ed25519.SigningKey(seed: pvBuf);
      final sm = signingKey.sign(data).signature;
      return Uint8List.fromList(sm);
    case 1:
      final sha256 = Digest('SHA-256');
      final msgHash = sha256.process(data);
      final ec = elliptic.getP256();
      final privateKey = elliptic.PrivateKey.fromBytes(ec, pvBuf);
      final sig = ecdsa.deterministicSign(privateKey, msgHash);
      return Uint8List.fromList(sig.toDER());
    case 2:
      final sha256 = Digest('SHA-256');
      final msgHash = sha256.process(data);

      final ec = elliptic.getSecp256k1();
      final privateKey = elliptic.PrivateKey.fromBytes(ec, pvBuf);
      final sig = ecdsa.deterministicSign(privateKey, msgHash);
      return Uint8List.fromList(sig.toDER());
    default:
      throw 'Curve not supported';
  }
}

bool verify(dynamic sig, dynamic data, dynamic publicKey) {
  if (sig is! Uint8List && sig is! String) {
    throw "'sig' must be a string or Uint8List";
  }

  if (data is! Uint8List && data is! String) {
    throw "'data' must be a string or Uint8List";
  }

  if (publicKey is! List<int> && publicKey is! String) {
    throw "'publicKey' must be a string or Uint8List";
  }

  if (sig is String) {
    if (isHex(sig)) {
      sig = Uint8List.fromList(hexToUint8List(sig));
    } else {
      throw "'signature' must be an hexadecimal string";
    }
  }

  if (data is String) {
    if (isHex(data)) {
      data = Uint8List.fromList(hexToUint8List(data));
    } else {
      data = Uint8List.fromList(utf8.encode(data));
    }
  }

  if (publicKey is String) {
    if (isHex(publicKey)) {
      publicKey = Uint8List.fromList(hexToUint8List(publicKey));
    } else {
      throw "'publicKey' must be an hexadecimal string";
    }
  }

  final curveBuf = Uint8List.fromList(publicKey.sublist(0, 1));
  final pubBuf = Uint8List.fromList(publicKey.sublist(2, publicKey.length));

  switch (curveBuf[0]) {
    case 0:
      final verifyKey = ed25519.VerifyKey(pubBuf);
      return verifyKey.verify(signature: ed25519.Signature(sig), message: data);
    case 1:
      final sha256 = Digest('SHA-256');
      final msgHash = sha256.process(data);

      final ec = elliptic.getP256();
      final publicKey = elliptic.PublicKey.fromHex(ec, uint8ListToHex(pubBuf));
      final signature = ecdsa.Signature.fromASN1(sig);
      return ecdsa.verify(publicKey, msgHash, signature);
    case 2:
      final sha256 = Digest('SHA-256');
      final msgHash = sha256.process(data);

      final ec = elliptic.getSecp256k1();
      final publicKey = elliptic.PublicKey.fromHex(ec, uint8ListToHex(pubBuf));
      final signature = ecdsa.Signature.fromASN1(sig);
      return ecdsa.verify(publicKey, msgHash, signature);

    default:
      throw 'Curve not supported';
  }
}

/// Encrypt a data for a given public key using ECIES algorithm
/// @param {String | Uint8List} data Data to encrypt
/// @param {String | Uint8List} publicKey Public key for the shared secret encryption
Uint8List ecEncrypt(dynamic data, dynamic publicKey) {
  if (data is! Uint8List && data is! String) {
    throw "'data' must be a string or Uint8List";
  }

  if (publicKey is! List<int> && publicKey is! String) {
    throw "'publicKey' must be a string or Uint8List";
  }

  if (data is String) {
    if (isHex(data)) {
      data = Uint8List.fromList(hexToUint8List(data));
    } else {
      data = Uint8List.fromList(utf8.encode(data));
    }
  }

  if (publicKey is String) {
    if (isHex(publicKey)) {
      publicKey = Uint8List.fromList(hexToUint8List(publicKey));
    } else {
      throw "'publicKey' must be an hexadecimal string";
    }
  }

  final curveBuf = Uint8List.fromList(publicKey.sublist(0, 1));
  final pubBuf = Uint8List.fromList(publicKey.sublist(2, publicKey.length));

  switch (curveBuf[0]) {
    case 0:
      final keyPair = x25519.generateKeyPair();
      final ephemeralPrivateKey = Uint8List.fromList(keyPair.privateKey);
      final ephemeralPublicKey = Uint8List.fromList(keyPair.publicKey);

      final curve25519Pub = Uint8List(32);
      tweetnacl.TweetNaClExt.crypto_sign_ed25519_pk_to_x25519_pk(
        curve25519Pub,
        pubBuf,
      );

      final sharedKey = x25519.X25519(ephemeralPrivateKey, curve25519Pub);

      final secret = deriveSecret(sharedKey);
      final aesAuthEncryptInfos = aesAuthEncrypt(
        data,
        Uint8List.fromList(secret.aesKey!),
        Uint8List.fromList(secret.iv!),
      );

      return concatUint8List(<Uint8List>[
        ephemeralPublicKey,
        Uint8List.fromList(aesAuthEncryptInfos.tag!),
        Uint8List.fromList(aesAuthEncryptInfos.encrypted!),
      ]);
    case 1:
      final ec = elliptic.getP256();
      final privateKey = ec.generatePrivateKey();
      final publicKey = elliptic.PublicKey.fromHex(ec, uint8ListToHex(pubBuf));
      final sharedKey =
          Uint8List.fromList(ecdh.computeSecret(privateKey, publicKey));
      final secret = deriveSecret(sharedKey);
      final aesAuthEncryptInfos = aesAuthEncrypt(
        data,
        Uint8List.fromList(secret.aesKey!),
        Uint8List.fromList(secret.iv!),
      );
      return concatUint8List(<Uint8List>[
        Uint8List.fromList(hexToUint8List(privateKey.publicKey.toHex())),
        Uint8List.fromList(aesAuthEncryptInfos.tag!),
        Uint8List.fromList(aesAuthEncryptInfos.encrypted!),
      ]);

    case 2:
      final ec = elliptic.getSecp256k1();
      final privateKey = ec.generatePrivateKey();
      final publicKey = elliptic.PublicKey.fromHex(ec, uint8ListToHex(pubBuf));
      final sharedKey =
          Uint8List.fromList(ecdh.computeSecret(privateKey, publicKey));
      final secret = deriveSecret(sharedKey);
      final aesAuthEncryptInfos = aesAuthEncrypt(
        data,
        Uint8List.fromList(secret.aesKey!),
        Uint8List.fromList(
          secret.iv!,
        ),
      );
      return concatUint8List(<Uint8List>[
        Uint8List.fromList(hexToUint8List(privateKey.publicKey.toHex())),
        Uint8List.fromList(
          aesAuthEncryptInfos.tag!,
        ),
        Uint8List.fromList(aesAuthEncryptInfos.encrypted!),
      ]);

    default:
      throw 'Curve not supported';
  }
}

/// Decrypt a ciphertext for a given private key using ECIES algorithm
/// @param {String | Uint8List} ciphertext Ciphertext to decrypt
/// @param {String | Uint8List} privateKey Private key for the shared secret encryption
Uint8List ecDecrypt(dynamic cipherText, dynamic privateKey) {
  if (cipherText is! Uint8List && cipherText is! String) {
    throw "'cipherText' must be a string or Uint8List";
  }

  if (privateKey is! List<int> && privateKey is! String) {
    throw "'publicKey' must be a string or Uint8List";
  }

  if (cipherText is String) {
    if (isHex(cipherText)) {
      cipherText = Uint8List.fromList(hexToUint8List(cipherText));
    } else {
      cipherText = Uint8List.fromList(utf8.encode(cipherText));
    }
  }

  if (privateKey is String) {
    if (isHex(privateKey)) {
      privateKey = Uint8List.fromList(hexToUint8List(privateKey));
    } else {
      throw "'privateKey' must be an hexadecimal string";
    }
  }

  final curveBuf = Uint8List.fromList(privateKey.sublist(0, 1));
  final pvBuf = Uint8List.fromList(privateKey.sublist(2, privateKey.length));

  switch (curveBuf[0]) {
    case 0:
      final Uint8List ephemeralPubKey = cipherText.sublist(0, 32);
      final Uint8List tag = cipherText.sublist(32, 32 + 16);
      final Uint8List encrypted =
          cipherText.sublist(32 + 16, cipherText.length);

      final curve25519pv = Uint8List(32);
      tweetnacl.TweetNaClExt.crypto_sign_ed25519_sk_to_x25519_sk(
        curve25519pv,
        pvBuf,
      );

      final sharedKey = x25519.X25519(curve25519pv, ephemeralPubKey);
      final secret = deriveSecret(sharedKey);

      return aesAuthDecrypt(
        encrypted,
        Uint8List.fromList(secret.aesKey!),
        Uint8List.fromList(secret.iv!),
        tag,
      );
    case 1:
      final Uint8List ephemeralPubKey = cipherText.sublist(0, 65);
      final Uint8List tag = cipherText.sublist(65, 65 + 16);
      final Uint8List encrypted =
          cipherText.sublist(65 + 16, cipherText.length);
      final ec = elliptic.getP256();
      final privateKey = elliptic.PrivateKey.fromBytes(ec, pvBuf);
      final publicKey =
          elliptic.PublicKey.fromHex(ec, uint8ListToHex(ephemeralPubKey));
      final sharedKey =
          Uint8List.fromList(ecdh.computeSecret(privateKey, publicKey));
      final secret = deriveSecret(sharedKey);

      return aesAuthDecrypt(
        encrypted,
        Uint8List.fromList(secret.aesKey!),
        Uint8List.fromList(secret.iv!),
        tag,
      );

    case 2:
      final Uint8List ephemeralPubKey = cipherText.sublist(0, 65);
      final Uint8List tag = cipherText.sublist(65, 65 + 16);
      final Uint8List encrypted =
          cipherText.sublist(65 + 16, cipherText.length);

      final ec = elliptic.getSecp256k1();
      final privateKey = elliptic.PrivateKey.fromBytes(ec, pvBuf);
      final publicKey =
          elliptic.PublicKey.fromHex(ec, uint8ListToHex(ephemeralPubKey));
      final sharedKey =
          Uint8List.fromList(ecdh.computeSecret(privateKey, publicKey));
      final secret = deriveSecret(sharedKey);

      return aesAuthDecrypt(
        encrypted,
        Uint8List.fromList(secret.aesKey!),
        Uint8List.fromList(secret.iv!),
        tag,
      );

    default:
      throw 'Curve not supported';
  }
}

/// Encrypt a data for a given public key using AES algorithm
/// @param {String | Uint8List} data Data to encrypt
/// @param {String | Uint8List} key Symmetric key
Uint8List aesEncrypt(dynamic data, dynamic key) {
  if (data is! Uint8List && data is! String) {
    throw "'data' must be a string or Uint8List";
  }

  if (key is! Uint8List && key is! String) {
    throw "'key' must be a string or Uint8List";
  }

  if (data is String) {
    if (isHex(data)) {
      data = Uint8List.fromList(hexToUint8List(data));
    } else {
      data = Uint8List.fromList(utf8.encode(data));
    }
  }

  if (key is String) {
    if (isHex(key)) {
      key = Uint8List.fromList(hexToUint8List(key));
    } else {
      throw "'key' must be an hexadecimal string";
    }
  }

  final keyPair = crypto_keys.KeyPair.symmetric(
    crypto_keys.SymmetricKey(keyValue: Uint8List.fromList(key)),
  );
  final iv = Uint8List.fromList(
    List<int>.generate(12, (int i) => Random.secure().nextInt(256)),
  );
  final encrypter = keyPair.publicKey!
      .createEncrypter(crypto_keys.algorithms.encryption.aes.gcm);
  final v = encrypter.encrypt(data, initializationVector: iv);

  final result = concatUint8List(
    <Uint8List>[v.initializationVector!, v.authenticationTag!, v.data],
  );
  return result;
}

Uint8List aesDecrypt(dynamic cipherText, dynamic key) {
  if (cipherText is! Uint8List && cipherText is! String) {
    throw "'cipherText' must be a string or Uint8List";
  }

  if (key is! Uint8List && key is! String) {
    throw "'key' must be a string or Uint8List";
  }

  if (cipherText is String) {
    if (isHex(cipherText)) {
      cipherText = Uint8List.fromList(hexToUint8List(cipherText));
    } else {
      throw "'cipherText' must be an hexadecimal string";
    }
  }

  if (key is String) {
    if (isHex(key)) {
      key = Uint8List.fromList(hexToUint8List(key));
    } else {
      throw "'key' must be an hexadecimal string";
    }
  }

  final keyPair = crypto_keys.KeyPair.symmetric(
    crypto_keys.SymmetricKey(keyValue: Uint8List.fromList(key)),
  );
  final Uint8List iv = cipherText.sublist(0, 12);
  final Uint8List tag = cipherText.sublist(12, 12 + 16);
  final Uint8List encrypted = cipherText.sublist(28, cipherText.length);
  final encrypter = keyPair.privateKey!
      .createEncrypter(crypto_keys.algorithms.encryption.aes.gcm);
  final decrypted = encrypter.decrypt(
    crypto_keys.EncryptionResult(
      encrypted,
      initializationVector: iv,
      authenticationTag: tag,
    ),
  );

  return decrypted;
}

Uint8List derivePrivateKey(dynamic seed, int index) {
  if (seed is String) {
    if (isHex(seed)) {
      seed = Uint8List.fromList(hexToUint8List(seed));
    } else {
      seed = Uint8List.fromList(utf8.encode(seed));
    }
  }

  /// Derive master keys
  final sha512 = Digest('SHA-512');
  final buf = sha512.process(seed);
  final masterKey = buf.sublist(0, 32);
  final masterEntropy = buf.sublist(32, 64);

  /// Derive the final seed
  final hmac = crypto.Hmac(crypto.sha512, masterEntropy);
  final indexBuf = toByteArray(index, length: 4);
  final extendedSeed = concatUint8List(<Uint8List>[masterKey, indexBuf]);
  final digest = hmac.convert(extendedSeed);

  final hmacBuf = Uint8List.fromList(digest.bytes.sublist(0, 32));

  return hmacBuf;
}

Secret deriveSecret(dynamic sharedKey) {
  if (sharedKey is! Uint8List && sharedKey is! String) {
    throw "'sharedKey' must be a string or Uint8List";
  }

  if (sharedKey is String) {
    if (isHex(sharedKey)) {
      sharedKey = Uint8List.fromList(hexToUint8List(sharedKey));
    } else {
      throw "'sharedKey' must be an hexadecimal string";
    }
  }

  final sha256 = Digest('SHA-256');
  final pseudoRandomKey = sha256.process(sharedKey);

  var hmac = crypto.Hmac(crypto.sha256, pseudoRandomKey);
  var digest = hmac.convert(utf8.encode('0'));
  final iv = Uint8List.fromList(digest.bytes.sublist(0, 32));

  hmac = crypto.Hmac(crypto.sha256, iv);
  digest = hmac.convert(utf8.encode('1'));
  final aesKey = Uint8List.fromList(digest.bytes.sublist(0, 32));

  return Secret(iv: iv, aesKey: aesKey);
}

AesAuthEncryptInfos aesAuthEncrypt(
  Uint8List data,
  Uint8List aesKey,
  Uint8List iv,
) {
  final keyPair =
      crypto_keys.KeyPair.symmetric(crypto_keys.SymmetricKey(keyValue: aesKey));

  final encrypter = keyPair.publicKey!
      .createEncrypter(crypto_keys.algorithms.encryption.aes.gcm);

  final v = encrypter.encrypt(data, initializationVector: iv);

  return AesAuthEncryptInfos(tag: v.authenticationTag, encrypted: v.data);
}

Uint8List aesAuthDecrypt(
  Uint8List encrypted,
  Uint8List aesKey,
  Uint8List iv,
  Uint8List tag,
) {
  final keyPair =
      crypto_keys.KeyPair.symmetric(crypto_keys.SymmetricKey(keyValue: aesKey));

  final encrypter = keyPair.publicKey!
      .createEncrypter(crypto_keys.algorithms.encryption.aes.gcm);

  final decrypted = encrypter.decrypt(
    crypto_keys.EncryptionResult(
      encrypted,
      initializationVector: iv,
      authenticationTag: tag,
    ),
  );

  return decrypted;
}
