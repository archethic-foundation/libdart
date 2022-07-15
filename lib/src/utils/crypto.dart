/// SPDX-License-Identifier: AGPL-3.0-or-later

// Dart imports:
import 'dart:math' show Random;

// Package imports:
import 'package:crypto/crypto.dart' as crypto show Hmac, sha256, sha512, Digest;
import 'package:elliptic/ecdh.dart' as ecdh show computeSecret;
import 'package:pinenacl/api.dart';
import 'package:pinenacl/tweetnacl.dart' as tweetnacl show TweetNaClExt;
import 'package:pointycastle/export.dart' show Digest;

// Project imports:
import 'package:archethic_lib_dart/src/model/crypto/aes_auth_encrypt_infos.dart';
import 'package:archethic_lib_dart/src/model/crypto/key_pair.dart';
import 'package:archethic_lib_dart/src/model/crypto/secret.dart';
import 'package:archethic_lib_dart/src/utils/utils.dart';

import 'package:crypto_keys/crypto_keys.dart' as crypto_keys
    show EncryptionResult, SymmetricKey, KeyPair, Encrypter, algorithms, Key;
import 'package:ecdsa/ecdsa.dart' as ecdsa
    show Signature, deterministicSign, verify;
import 'package:elliptic/elliptic.dart' as elliptic
    show EllipticCurve, PrivateKey, PublicKey, Curve, getSecp256k1, getP256;
import 'package:pinenacl/ed25519.dart' as ed25519
    show SigningKey, SignatureBase, VerifyKey, Signature;
import 'package:x25519/x25519.dart' as x25519
    show generateKeyPair, KeyPair, X25519;

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
String deriveAddress(String seed, int index,
    {String curve = 'ed25519', String hashAlgo = 'sha256'}) {
  final KeyPair keypair = deriveKeyPair(seed, index, curve: curve);

  final int curveID = curveToID(curve);
  final Uint8List hashedPublicKey = hash(keypair.publicKey, algo: hashAlgo);
  return uint8ListToHex(concatUint8List(<Uint8List>[
    Uint8List.fromList(<int>[curveID]),
    hashedPublicKey
  ]));
}

/// Create a hash digest from the data with an hash algorithm identification prepending the digest
/// @param {String | Uint8List} content Data to hash (string or buffer)
/// @param {String} algo Hash algorithm ("sha256", "sha512", "sha3-256", "sha3-512", "blake2b")
Uint8List hash(dynamic content, {String algo = 'sha256'}) {
  if (content is! Uint8List && content is! String) {
    throw "'content' must be a string or Uint8List";
  }

  if (content is String) {
    if (isHex(content)) {
      content = hexToUint8List(content);
    } else {
      content = Uint8List.fromList(content.codeUnits);
    }
  }

  final int algoID = hashAlgoToID(algo);
  final Uint8List digest = getHashDigest(content, algo);

  return concatUint8List(<Uint8List>[
    Uint8List.fromList(<int>[algoID]),
    digest
  ]);
}

Uint8List getHashDigest(dynamic content, dynamic algo) {
  switch (algo) {
    case 'sha256':
      final Digest sha256 = Digest('SHA-256');
      return sha256.process(content);
    case 'sha512':
      final Digest sha512 = Digest('SHA-512');
      return sha512.process(content);
    case 'sha3-256':
      final Digest sha3_256 = Digest('SHA3-256');
      return sha3_256.process(content);
    case 'sha3-512':
      final Digest sha3_512 = Digest('SHA3-512');
      return sha3_512.process(content);
    case 'blake2b':
      final Digest blake2b = Digest('Blake2b');
      return blake2b.process(content);
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

  final Uint8List pvBuf = derivePrivateKey(seed, index);
  return generateDeterministicKeyPair(pvBuf, curve, softwareId);
}

/// Generate a new keypair deterministically with a given private key, curve and origin id
/// @params {Uint8List} privateKey Private key
/// @params {String} curve Elliptic curve
/// @params {int} originID Origin identification
KeyPair generateDeterministicKeyPair(
    Uint8List pvKey, String curve, int originID) {
  final int curveID = curveToID(curve);
  final KeyPair keyPair = getKeypair(pvKey, curve);
  return KeyPair(
      privateKey: concatUint8List(<Uint8List>[
        Uint8List.fromList(<int>[curveID]),
        Uint8List.fromList(<int>[originID]),
        keyPair.privateKey
      ]),
      publicKey: concatUint8List(<Uint8List>[
        Uint8List.fromList(<int>[curveID]),
        Uint8List.fromList(<int>[originID]),
        keyPair.publicKey
      ]));
}

KeyPair getKeypair(Uint8List pvKey, String curve) {
  switch (curve) {
    case 'ed25519':
      final ed25519.SigningKey signingKey = ed25519.SigningKey(seed: pvKey);
      final Uint8List pubBuf = signingKey.publicKey.toUint8List();
      return KeyPair(privateKey: pvKey, publicKey: pubBuf);
    case 'P256':
      final elliptic.EllipticCurve ec = elliptic.getP256();
      final elliptic.PrivateKey privateKey =
          elliptic.PrivateKey.fromBytes(ec, pvKey);
      final elliptic.PublicKey publicKey = ec.privateToPublicKey(privateKey);
      return KeyPair(
          privateKey: pvKey, publicKey: hexToUint8List(publicKey.toHex()));
    case 'secp256k1':
      final elliptic.Curve ec = elliptic.getSecp256k1();
      final elliptic.PrivateKey privateKey =
          elliptic.PrivateKey.fromBytes(ec, pvKey);
      final elliptic.PublicKey publicKey = ec.privateToPublicKey(privateKey);
      return KeyPair(
          privateKey: pvKey, publicKey: hexToUint8List(publicKey.toHex()));
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

  if (privateKey is! Uint8List && privateKey is! String) {
    throw "'privateKey' must be a string or Uint8List";
  }

  if (data is String) {
    if (isHex(data)) {
      data = hexToUint8List(data);
    } else {
      data = Uint8List.fromList(data.codeUnits);
    }
  }

  if (privateKey is String) {
    if (isHex(privateKey)) {
      privateKey = hexToUint8List(privateKey);
    } else {
      privateKey = Uint8List.fromList(privateKey.codeUnits);
    }
  }

  final Uint8List curveBuf = privateKey.sublist(0, 1);
  final Uint8List pvBuf = privateKey.sublist(2, privateKey.length);

  switch (curveBuf[0]) {
    case 0:
      final ed25519.SigningKey signingKey = ed25519.SigningKey(seed: pvBuf);
      final ed25519.SignatureBase sm = signingKey.sign(data).signature;
      return Uint8List.fromList(sm);
    case 1:
      final Digest sha256 = Digest('SHA-256');
      final Uint8List msgHash = sha256.process(data);
      final elliptic.EllipticCurve ec = elliptic.getP256();
      final elliptic.PrivateKey privateKey =
          elliptic.PrivateKey.fromBytes(ec, pvBuf);
      final ecdsa.Signature sig = ecdsa.deterministicSign(privateKey, msgHash);
      return Uint8List.fromList(sig.toDER());
    case 2:
      final Digest sha256 = Digest('SHA-256');
      final Uint8List msgHash = sha256.process(data);

      final elliptic.Curve ec = elliptic.getSecp256k1();
      final elliptic.PrivateKey privateKey =
          elliptic.PrivateKey.fromBytes(ec, pvBuf);
      final ecdsa.Signature sig = ecdsa.deterministicSign(privateKey, msgHash);
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

  if (publicKey is! Uint8List && publicKey is! String) {
    throw "'publicKey' must be a string or Uint8List";
  }

  if (sig is String) {
    if (isHex(sig)) {
      sig = hexToUint8List(sig);
    } else {
      throw "'signature' must be an hexadecimal string";
    }
  }

  if (data is String) {
    if (isHex(data)) {
      data = hexToUint8List(data);
    } else {
      data = Uint8List.fromList(data.codeUnits);
    }
  }

  if (publicKey is String) {
    if (isHex(publicKey)) {
      publicKey = hexToUint8List(publicKey);
    } else {
      throw "'publicKey' must be an hexadecimal string";
    }
  }

  final Uint8List curveBuf = publicKey.sublist(0, 1);
  final Uint8List pubBuf = publicKey.sublist(2, publicKey.length);

  switch (curveBuf[0]) {
    case 0:
      final ed25519.VerifyKey verifyKey = ed25519.VerifyKey(pubBuf);
      return verifyKey.verify(signature: ed25519.Signature(sig), message: data);
    case 1:
      final Digest sha256 = Digest('SHA-256');
      final Uint8List msgHash = sha256.process(data);

      final elliptic.EllipticCurve ec = elliptic.getP256();
      final elliptic.PublicKey publicKey =
          elliptic.PublicKey.fromHex(ec, uint8ListToHex(pubBuf));
      final ecdsa.Signature signature = ecdsa.Signature.fromASN1(sig);
      return ecdsa.verify(publicKey, msgHash, signature);
    case 2:
      final Digest sha256 = Digest('SHA-256');
      final Uint8List msgHash = sha256.process(data);

      final elliptic.Curve ec = elliptic.getSecp256k1();
      final elliptic.PublicKey publicKey =
          elliptic.PublicKey.fromHex(ec, uint8ListToHex(pubBuf));
      final ecdsa.Signature signature = ecdsa.Signature.fromASN1(sig);
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

  if (publicKey is! Uint8List && publicKey is! String) {
    throw "'publicKey' must be a string or Uint8List";
  }

  if (data is String) {
    if (isHex(data)) {
      data = hexToUint8List(data);
    } else {
      data = Uint8List.fromList(data.codeUnits);
    }
  }

  if (publicKey is String) {
    if (isHex(publicKey)) {
      publicKey = hexToUint8List(publicKey);
    } else {
      throw "'publicKey' must be an hexadecimal string";
    }
  }

  final Uint8List curveBuf = publicKey.sublist(0, 1);
  final Uint8List pubBuf = publicKey.sublist(2, publicKey.length);

  switch (curveBuf[0]) {
    case 0:
      final x25519.KeyPair keyPair = x25519.generateKeyPair();
      final Uint8List ephemeralPrivateKey =
          Uint8List.fromList(keyPair.privateKey);
      final Uint8List ephemeralPublicKey =
          Uint8List.fromList(keyPair.publicKey);

      final Uint8List curve25519Pub = Uint8List(32);
      tweetnacl.TweetNaClExt.crypto_sign_ed25519_pk_to_x25519_pk(
          curve25519Pub, pubBuf);

      final Uint8List sharedKey =
          x25519.X25519(ephemeralPrivateKey, curve25519Pub);

      final Secret secret = deriveSecret(sharedKey);
      final AesAuthEncryptInfos aesAuthEncryptInfos =
          aesAuthEncrypt(data, secret.aesKey, secret.iv);

      return concatUint8List(<Uint8List>[
        ephemeralPublicKey,
        aesAuthEncryptInfos.tag,
        aesAuthEncryptInfos.encrypted
      ]);
    case 1:
      final elliptic.EllipticCurve ec = elliptic.getP256();
      final elliptic.PrivateKey privateKey = ec.generatePrivateKey();
      final elliptic.PublicKey publicKey =
          elliptic.PublicKey.fromHex(ec, uint8ListToHex(pubBuf));
      final Uint8List sharedKey =
          Uint8List.fromList(ecdh.computeSecret(privateKey, publicKey));
      final Secret secret = deriveSecret(sharedKey);
      final AesAuthEncryptInfos aesAuthEncryptInfos =
          aesAuthEncrypt(data, secret.aesKey, secret.iv);
      return concatUint8List(<Uint8List>[
        hexToUint8List(privateKey.publicKey.toHex()),
        aesAuthEncryptInfos.tag,
        aesAuthEncryptInfos.encrypted
      ]);

    case 2:
      final elliptic.Curve ec = elliptic.getSecp256k1();
      final elliptic.PrivateKey privateKey = ec.generatePrivateKey();
      final elliptic.PublicKey publicKey =
          elliptic.PublicKey.fromHex(ec, uint8ListToHex(pubBuf));
      final Uint8List sharedKey =
          Uint8List.fromList(ecdh.computeSecret(privateKey, publicKey));
      final Secret secret = deriveSecret(sharedKey);
      final AesAuthEncryptInfos aesAuthEncryptInfos =
          aesAuthEncrypt(data, secret.aesKey, secret.iv);
      return concatUint8List(<Uint8List>[
        hexToUint8List(privateKey.publicKey.toHex()),
        aesAuthEncryptInfos.tag,
        aesAuthEncryptInfos.encrypted
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

  if (privateKey is! Uint8List && privateKey is! String) {
    throw "'publicKey' must be a string or Uint8List";
  }

  if (cipherText is String) {
    if (isHex(cipherText)) {
      cipherText = hexToUint8List(cipherText);
    } else {
      cipherText = Uint8List.fromList(cipherText.codeUnits);
    }
  }

  if (privateKey is String) {
    if (isHex(privateKey)) {
      privateKey = hexToUint8List(privateKey);
    } else {
      throw "'privateKey' must be an hexadecimal string";
    }
  }

  final Uint8List curveBuf = privateKey.sublist(0, 1);
  final Uint8List pvBuf = privateKey.sublist(2, privateKey.length);

  switch (curveBuf[0]) {
    case 0:
      final Uint8List ephemeralPubKey = cipherText.sublist(0, 32);
      final Uint8List tag = cipherText.sublist(32, 32 + 16);
      final Uint8List encrypted =
          cipherText.sublist(32 + 16, cipherText.length);

      final Uint8List curve25519pv = Uint8List(32);
      tweetnacl.TweetNaClExt.crypto_sign_ed25519_sk_to_x25519_sk(
          curve25519pv, pvBuf);

      final Uint8List sharedKey = x25519.X25519(curve25519pv, ephemeralPubKey);
      final Secret secret = deriveSecret(sharedKey);

      return aesAuthDecrypt(encrypted, secret.aesKey, secret.iv, tag);
    case 1:
      final Uint8List ephemeralPubKey = cipherText.sublist(0, 65);
      final Uint8List tag = cipherText.sublist(65, 65 + 16);
      final Uint8List encrypted =
          cipherText.sublist(65 + 16, cipherText.length);
      final elliptic.EllipticCurve ec = elliptic.getP256();
      final elliptic.PrivateKey privateKey =
          elliptic.PrivateKey.fromBytes(ec, pvBuf);
      final elliptic.PublicKey publicKey =
          elliptic.PublicKey.fromHex(ec, uint8ListToHex(ephemeralPubKey));
      final Uint8List sharedKey =
          Uint8List.fromList(ecdh.computeSecret(privateKey, publicKey));
      final Secret secret = deriveSecret(sharedKey);

      return aesAuthDecrypt(encrypted, secret.aesKey, secret.iv, tag);

    case 2:
      final Uint8List ephemeralPubKey = cipherText.sublist(0, 65);
      final Uint8List tag = cipherText.sublist(65, 65 + 16);
      final Uint8List encrypted =
          cipherText.sublist(65 + 16, cipherText.length);

      final elliptic.Curve ec = elliptic.getSecp256k1();
      final elliptic.PrivateKey privateKey =
          elliptic.PrivateKey.fromBytes(ec, pvBuf);
      final elliptic.PublicKey publicKey =
          elliptic.PublicKey.fromHex(ec, uint8ListToHex(ephemeralPubKey));
      final Uint8List sharedKey =
          Uint8List.fromList(ecdh.computeSecret(privateKey, publicKey));
      final Secret secret = deriveSecret(sharedKey);

      return aesAuthDecrypt(encrypted, secret.aesKey, secret.iv, tag);

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
      data = hexToUint8List(data);
    } else {
      data = Uint8List.fromList(data.codeUnits);
    }
  }

  if (key is String) {
    if (isHex(key)) {
      key = hexToUint8List(key);
    } else {
      throw "'key' must be an hexadecimal string";
    }
  }

  final crypto_keys.KeyPair keyPair = crypto_keys.KeyPair.symmetric(
      crypto_keys.SymmetricKey(keyValue: Uint8List.fromList(key)));
  final Uint8List iv = Uint8List.fromList(
      List<int>.generate(12, (int i) => Random.secure().nextInt(256)));
  final crypto_keys.Encrypter<crypto_keys.Key> encrypter = keyPair.publicKey!
      .createEncrypter(crypto_keys.algorithms.encryption.aes.gcm);
  final crypto_keys.EncryptionResult v =
      encrypter.encrypt(data, initializationVector: iv);

  final Uint8List result = concatUint8List(
      <Uint8List>[v.initializationVector!, v.authenticationTag!, v.data]);
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
      cipherText = hexToUint8List(cipherText);
    } else {
      throw "'cipherText' must be an hexadecimal string";
    }
  }

  if (key is String) {
    if (isHex(key)) {
      key = hexToUint8List(key);
    } else {
      throw "'key' must be an hexadecimal string";
    }
  }

  final crypto_keys.KeyPair keyPair = crypto_keys.KeyPair.symmetric(
      crypto_keys.SymmetricKey(keyValue: Uint8List.fromList(key)));
  final Uint8List iv = cipherText.sublist(0, 12);
  final Uint8List tag = cipherText.sublist(12, 12 + 16);
  final Uint8List encrypted = cipherText.sublist(28, cipherText.length);
  final crypto_keys.Encrypter<crypto_keys.Key> encrypter = keyPair.privateKey!
      .createEncrypter(crypto_keys.algorithms.encryption.aes.gcm);
  final Uint8List decrypted = encrypter.decrypt(crypto_keys.EncryptionResult(
      encrypted,
      initializationVector: iv,
      authenticationTag: tag));

  return decrypted;
}

Uint8List derivePrivateKey(dynamic seed, int index) {
  if (seed is String) {
    if (isHex(seed)) {
      seed = hexToUint8List(seed);
    } else {
      seed = Uint8List.fromList(seed.codeUnits);
    }
  }

  /// Derive master keys
  final Digest sha512 = Digest('SHA-512');
  final Uint8List buf = sha512.process(seed);
  final Uint8List masterKey = buf.sublist(0, 32);
  final Uint8List masterEntropy = buf.sublist(32, 64);

  /// Derive the final seed
  final crypto.Hmac hmac = crypto.Hmac(crypto.sha512, masterEntropy);
  final Uint8List indexBuf = encodeInt32(index);
  final Uint8List extendedSeed =
      concatUint8List(<Uint8List>[masterKey, indexBuf]);
  final crypto.Digest digest = hmac.convert(extendedSeed);

  final Uint8List hmacBuf = Uint8List.fromList(digest.bytes.sublist(0, 32));

  return hmacBuf;
}

Secret deriveSecret(dynamic sharedKey) {
  if (sharedKey is! Uint8List && sharedKey is! String) {
    throw "'sharedKey' must be a string or Uint8List";
  }

  if (sharedKey is String) {
    if (isHex(sharedKey)) {
      sharedKey = hexToUint8List(sharedKey);
    } else {
      throw "'sharedKey' must be an hexadecimal string";
    }
  }

  final Digest sha256 = Digest('SHA-256');
  final Uint8List pseudoRandomKey = sha256.process(sharedKey);

  crypto.Hmac hmac = crypto.Hmac(crypto.sha256, pseudoRandomKey);
  crypto.Digest digest = hmac.convert('0'.codeUnits);
  final Uint8List iv = Uint8List.fromList(digest.bytes.sublist(0, 32));

  hmac = crypto.Hmac(crypto.sha256, iv);
  digest = hmac.convert('1'.codeUnits);
  final Uint8List aesKey = Uint8List.fromList(digest.bytes.sublist(0, 32));

  return Secret(iv: iv, aesKey: aesKey);
}

AesAuthEncryptInfos aesAuthEncrypt(
    Uint8List data, Uint8List aesKey, Uint8List iv) {
  final crypto_keys.KeyPair keyPair =
      crypto_keys.KeyPair.symmetric(crypto_keys.SymmetricKey(keyValue: aesKey));

  final crypto_keys.Encrypter<crypto_keys.Key> encrypter = keyPair.publicKey!
      .createEncrypter(crypto_keys.algorithms.encryption.aes.gcm);

  final crypto_keys.EncryptionResult v =
      encrypter.encrypt(data, initializationVector: iv);

  return AesAuthEncryptInfos(tag: v.authenticationTag!, encrypted: v.data);
}

Uint8List aesAuthDecrypt(
    Uint8List encrypted, Uint8List aesKey, Uint8List iv, Uint8List tag) {
  final crypto_keys.KeyPair keyPair =
      crypto_keys.KeyPair.symmetric(crypto_keys.SymmetricKey(keyValue: aesKey));

  final crypto_keys.Encrypter<crypto_keys.Key> encrypter = keyPair.publicKey!
      .createEncrypter(crypto_keys.algorithms.encryption.aes.gcm);

  final Uint8List decrypted = encrypter.decrypt(crypto_keys.EncryptionResult(
      encrypted,
      initializationVector: iv,
      authenticationTag: tag));

  return decrypted;
}

/// Verify the structure of an address
/// @param {String} address to control
bool addressFormatControl(String? address) {
  if (address != null && address.length > 1 && isHex(address)) {
    int digestSize = 0;
    switch (address.substring(2, 4)) {

      /// 00 = sha256
      case '00':
        digestSize = Digest('SHA-256').digestSize;
        break;

      /// 01 = sha512
      case '01':
        digestSize = Digest('SHA-512').digestSize;
        break;

      /// 02 = sha3-256
      case '02':
        digestSize = Digest('SHA3-256').digestSize;
        break;

      /// 03 = sha3-512
      case '03':
        digestSize = Digest('SHA3-512').digestSize;
        break;

      /// 04 = blake2b
      case '04':
        digestSize = Digest('Blake2b').digestSize;
        break;
      default:
        return false;
    }
    try {
      if (hexToUint8List(address.substring(4)).length != digestSize) {
        return false;
      } else {
        return true;
      }
    } catch (e) {
      return false;
    }
  } else {
    return false;
  }
}
