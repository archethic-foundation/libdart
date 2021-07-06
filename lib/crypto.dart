/*
* Create a hash digest from the data with an hash algorithm identification prepending the digest
* @param {String | Uint8List} content Data to hash (string or buffer)
* @param {String} algo Hash algorithm ("sha256", "sha512", "sha3-256", "sha3-512", "blake2b")
*/

// Dart imports:
import 'dart:convert' show utf8;
import 'dart:math' show Random;
import 'dart:typed_data' show Uint8List;

// Package imports:
import 'package:crypto/crypto.dart' as crypto show Hmac, sha256, sha512, Digest;
import 'package:ecdsa/ecdsa.dart' as ecdsa;
import 'package:elliptic/elliptic.dart' as elliptic;

// Project imports:
import 'package:archethic_lib_dart/model/key_pair.dart';
import 'package:archethic_lib_dart/model/secret.dart';
import 'package:archethic_lib_dart/utils.dart';

import 'package:pointycastle/export.dart'
    show Digest, AEADParameters, AESFastEngine, KeyParameter, GCMBlockCipher;

Uint8List hash(content, {String algo = 'sha256'}) {
  if (!(content is Uint8List) && !(content is String)) {
    throw "'content' must be a string or Uint8List";
  }

  if (content is String) {
    if (isHex(content)) {
      content = hexToUint8List(content);
    } else {
      content = Uint8List.fromList(utf8.encode(content));
    }
  }

  switch (algo) {
    case 'sha256':
      final Digest sha256 = Digest('SHA-256');
      return concatUint8List([
        Uint8List.fromList([0]),
        sha256.process(content)
      ]);
    case 'sha512':
      final Digest sha512 = Digest('SHA-512');
      return concatUint8List([
        Uint8List.fromList([1]),
        sha512.process(content)
      ]);
    case 'sha3-256':
      final Digest sha3_256 = Digest('SHA3-256');
      return concatUint8List([
        Uint8List.fromList([2]),
        sha3_256.process(content)
      ]);
    case 'sha3-512':
      final Digest sha3_512 = Digest('SHA3-512');
      return concatUint8List([
        Uint8List.fromList([3]),
        sha3_512.process(content)
      ]);
    case 'blake2b':
      final Digest blake2b = Digest('Blake2b');
      return concatUint8List([
        Uint8List.fromList([4]),
        blake2b.process(content)
      ]);
    default:
      throw 'Hash algorithm not supported';
  }
}

/*
* Generate a keypair using a derivation function with a seed and an index. Each keys is prepending with a curve identification.
* @param {String} seed Keypair derivation seed
* @param {int} index Number to identify the order of keys to generate
* @param {String} curve Elliptic curve to use (P256", "secp256k1")
*/
KeyPair deriveKeyPair(String seed, int index, {String curve = 'P256'}) {
  if (!(seed is String)) {
    throw "'seed' must be a string";
  }

  if (!(index is int) || index < 0) {
    throw "index' must be a positive number";
  }

  final Uint8List pvBuf = derivePrivateKey(seed, index);

  final Uint8List softwareIdBuf = Uint8List.fromList([0]);

  switch (curve) {
    case 'P256':
      final Uint8List curveIdBuf = Uint8List.fromList([1]);
      var ec = elliptic.getP256();
      elliptic.PrivateKey privateKey = elliptic.PrivateKey.fromBytes(ec, pvBuf);
      elliptic.PublicKey publicKey = ec.privateToPublicKey(privateKey);
      return KeyPair(
          privateKey: concatUint8List([curveIdBuf, softwareIdBuf, pvBuf]),
          publicKey: concatUint8List(
              [curveIdBuf, softwareIdBuf, hexToUint8List(publicKey.toHex())]));

    case 'secp256k1':
      final Uint8List curveIdBuf = Uint8List.fromList([2]);
      var ec = elliptic.getSecp256k1();
      elliptic.PrivateKey privateKey = elliptic.PrivateKey.fromBytes(ec, pvBuf);
      elliptic.PublicKey publicKey = ec.privateToPublicKey(privateKey);
      return KeyPair(
          privateKey: concatUint8List([curveIdBuf, softwareIdBuf, pvBuf]),
          publicKey: concatUint8List(
              [curveIdBuf, softwareIdBuf, hexToUint8List(publicKey.toHex())]));

    default:
      throw 'Curve not supported';
  }
}

/*
* Sign the data 
* @param {String | Uint8List} data Data to sign
* @param {String | Uint8List} privateKey Private key to use to sign the data
*/
Uint8List sign(data, privateKey) {
  if (!(data is Uint8List) && !(data is String)) {
    throw "'data' must be a string or Uint8List";
  }

  if (!(privateKey is Uint8List) && !(privateKey is String)) {
    throw "'privateKey' must be a string or Uint8List";
  }

  if (data is String) {
    if (isHex(data)) {
      data = hexToUint8List(data);
    } else {
      data = Uint8List.fromList(utf8.encode(data));
    }
  }

  if (privateKey is String) {
    if (isHex(privateKey)) {
      privateKey = hexToUint8List(privateKey);
    } else {
      privateKey = Uint8List.fromList(utf8.encode(privateKey));
    }
  }

  final Uint8List curveBuf = privateKey.sublist(0, 1);
  final Uint8List softwareIdBuf = privateKey.sublist(1, 2);
  final Uint8List pvBuf = privateKey.sublist(2, privateKey.length);

  switch (curveBuf[0]) {
    case 1:
      final Digest sha256 = Digest('SHA-256');
      final Uint8List msgHash = sha256.process(data);

      var ec = elliptic.getP256();
      elliptic.PrivateKey privateKey = elliptic.PrivateKey.fromBytes(ec, pvBuf);
      var sig = ecdsa.signature(privateKey, msgHash);
      return Uint8List.fromList(sig.toDER());
    case 2:
      final Digest sha256 = Digest('SHA-256');
      final Uint8List msgHash = sha256.process(data);

      var ec = elliptic.getSecp256k1();
      elliptic.PrivateKey privateKey = elliptic.PrivateKey.fromBytes(ec, pvBuf);
      var sig = ecdsa.signature(privateKey, msgHash);
      return Uint8List.fromList(sig.toDER());
    default:
      throw 'Curve not supported';
  }
}

bool verify(sig, data, publicKey) {
  if (!(sig is Uint8List) && !(sig is String)) {
    throw "'sig' must be a string or Uint8List";
  }

  if (!(data is Uint8List) && !(data is String)) {
    throw "'data' must be a string or Uint8List";
  }

  if (!(publicKey is Uint8List) && !(publicKey is String)) {
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
      data = Uint8List.fromList(utf8.encode(data));
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
  final Uint8List softwareIdBuf = publicKey.sublist(1, 2);
  final Uint8List pubBuf = publicKey.sublist(2, publicKey.length);

  switch (curveBuf[0]) {
    case 1:
      final Digest sha256 = Digest('SHA-256');
      final Uint8List msgHash = sha256.process(data);

      var ec = elliptic.getP256();
      elliptic.PublicKey publicKey =
          elliptic.PublicKey.fromHex(ec, uint8ListToHex(pubBuf));
      ecdsa.Signature signature = ecdsa.Signature.fromASN1(sig);
      return ecdsa.verify(publicKey, msgHash, signature);
    case 2:
      final Digest sha256 = Digest('SHA-256');
      final Uint8List msgHash = sha256.process(data);

      var ec = elliptic.getSecp256k1();
      elliptic.PublicKey publicKey =
          elliptic.PublicKey.fromHex(ec, uint8ListToHex(pubBuf));
      ecdsa.Signature signature = ecdsa.Signature.fromASN1(sig);
      return ecdsa.verify(publicKey, msgHash, signature);

    default:
      throw 'Curve not supported';
  }
}

/*
* Encrypt a data for a given public key using ECIES algorithm
* @param {String | Uint8List} data Data to encrypt
* @param {String | Uint8List} publicKey Public key for the shared secret encryption
*/
Uint8List ecEncrypt(data, publicKey) {
  if (!(data is Uint8List) && !(data is String)) {
    throw "'data' must be a string or Uint8List";
  }

  if (!(publicKey is Uint8List) && !(publicKey is String)) {
    throw "'publicKey' must be a string or Uint8List";
  }

  if (data is String) {
    if (isHex(data)) {
      data = hexToUint8List(data);
    } else {
      data = Uint8List.fromList(utf8.encode(data));
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
  final Uint8List pubBuf = publicKey.sublist(1, publicKey.length);

  switch (curveBuf[0]) {
    case 1:

    case 2:

    default:
      throw 'Curve not supported';
  }
}

Secret deriveSecret(sharedKey) {
  if (!(sharedKey is Uint8List) && !(sharedKey is String)) {
    throw "'sharedKey' must be a string or Uint8List";
  }

  if (sharedKey is String) {
    if (isHex(sharedKey)) {
      sharedKey = hexToUint8List(sharedKey);
    } else {
      throw "'sharedKey' must be an hexadecimal string";
    }
  }

  // TODO: Verify hmac = hash("sha256", "") instead of hmac = createHmac("sha256", "")
  crypto.Hmac hmac = crypto.Hmac(crypto.sha256, (Uint8List(0)));
  crypto.Digest digest = hmac.convert(utf8.encode(sharedKey));
  final Uint8List pseudoRandomKey = Uint8List.fromList(digest.bytes);

  hmac = crypto.Hmac(crypto.sha256, pseudoRandomKey);
  digest = hmac.convert(utf8.encode('0'));
  final Uint8List iv = Uint8List.fromList(digest.bytes.sublist(0, 32));

  hmac = crypto.Hmac(crypto.sha256, iv);
  digest = hmac.convert(utf8.encode('1'));
  final Uint8List aesKey = Uint8List.fromList(digest.bytes.sublist(0, 32));

  return Secret(iv: iv, aesKey: aesKey);
}

/*
* Encrypt a data for a given public key using AES algorithm
* @param {String | Uint8List} data Data to encrypt
* @param {String | Uint8List} key Symmetric key
*/
Uint8List aesEncrypt(data, key) {
  if (!(data is Uint8List) && !(data is String)) {
    throw "'data' must be a string or Uint8List";
  }

  if (!(key is Uint8List) && !(key is String)) {
    throw "'key' must be a string or Uint8List";
  }

  if (data is String) {
    if (isHex(data)) {
      data = hexToUint8List(data);
    } else {
      data = Uint8List.fromList(utf8.encode(data));
    }
  }

  if (key is String) {
    if (isHex(key)) {
      key = hexToUint8List(key);
    } else {
      throw "'key' must be an hexadecimal string";
    }
  }

  final Uint8List aad = Uint8List.fromList(
      List<int>.generate(16, (int i) => Random.secure().nextInt(256)));
  final Uint8List iv = Uint8List.fromList(
      List<int>.generate(12, (int i) => Random.secure().nextInt(256)));

  final GCMBlockCipher encrypter = GCMBlockCipher(AESFastEngine());
  final AEADParameters<KeyParameter> params =
      AEADParameters(KeyParameter(key), 16 * 8, iv, aad);
  encrypter.init(true, params);
  final Uint8List cipherText = encrypter.process(data);

  final Uint8List result = concatUint8List([
    encrypter.nonce,
    encrypter.aad!,
    Uint8List.fromList(cipherText.sublist(0, 5))
  ]);
  return result;
}

Uint8List aesDecrypt(cipherText, key) {
  if (!(cipherText is Uint8List) && !(cipherText is String)) {
    throw "'cipherText' must be a string or Uint8List";
  }

  if (!(key is Uint8List) && !(key is String)) {
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

  // TODO
  /*
  Uint8List iv = cipherText.sublist(0, 12);
  Uint8List tag = cipherText.sublist(12, 12 + 16);
  Uint8List encrypted = cipherText.sublist(28, cipherText.length);

  final gcm = GCMBlockCipher(AESFastEngine())
    ..init(false, AEADParameters(KeyParameter(key), 8 * 16, iv, tag));

  final paddedPlainText = Uint8List(encrypted.length);

  var offset = 0;
  while (offset < encrypted.length) {
    offset += gcm.processBlock(encrypted, offset, paddedPlainText, offset);
  }
  */
  return Uint8List(0);
}

Uint8List derivePrivateKey(seed, int index) {
  if (isHex(seed)) {
    seed = hexToUint8List(seed);
  }

  //Derive master keys
  final Digest sha512 = Digest('SHA-512');
  Uint8List buf = sha512.process(seed);

  final Uint8List masterKey = buf.sublist(0, 32);
  final Uint8List masterEntropy = buf.sublist(32, 64);

  //Derive the final seed
  crypto.Hmac hmac = crypto.Hmac(crypto.sha512, masterEntropy);
  final Uint8List indexBuf = encodeInt32(index);
  final Uint8List extendedSeed = concatUint8List([masterKey, indexBuf]);
  crypto.Digest digest = hmac.convert(extendedSeed);

  final Uint8List hmacBuf = Uint8List.fromList(digest.bytes.sublist(0, 32));

  return hmacBuf;
}
