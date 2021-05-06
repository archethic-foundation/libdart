library test.crypto_test;

import 'dart:convert';
import 'dart:math';
import 'dart:typed_data';

import 'package:flutter_test/flutter_test.dart';
import 'package:pointycastle/export.dart';
import 'package:uniris_lib_dart/src/crypto.dart' as crypto;
import 'package:uniris_lib_dart/src/model/key_pair.dart';
import 'package:uniris_lib_dart/src/utils.dart';
import 'package:flutter_sodium/flutter_sodium.dart' as sodium;

void main() {
  sodium.Sodium.init();

  group('Crypto', () {
    group('hash', () {
      test('should generate a sha256 hash with an algo id at the beginning',
          () {
        expect(uint8ListToHex(crypto.hash("myfakedata")),
            "004e89e81096eb09c74a29bdf66e41fc118b6d17ac547223ca6629a71724e69f23");
      });
      test('should generate a sha512 hash with an algo id at the beginning',
          () {
        expect(uint8ListToHex(crypto.hash("myfakedata", algo: "sha512")),
            "01c09b378f954c39f8e3c2cc4ed9108937c6e6dbfa9f754a344bd395d2ba55aba9f071987a2c014f9c54d47931b243088aa2dd6c6d90ec92a67f8a9dfdd83eba58");
      });
      test('should generate a sha3-256 hash with an algo id at the begining',
          () {
        expect(uint8ListToHex(crypto.hash("myfakedata", algo: "sha3-256")),
            "029ddb36eabafb047ad869b9e4d35e2c5e6893b6bd2d1cdbdaec13425779f0f9da");
      });
      test('should generate a sha3-512 hash with an algo id at the beginning',
          () {
        expect(uint8ListToHex(crypto.hash("myfakedata", algo: "sha3-512")),
            "03f64fe5d472619d235212f843c1ed8ae43598c3a5973eead66d70f88f147a0aaabcbcdc6aed160b0ae5cdf5d48871602827b242c479f999647c377698cb8b7d4f");
      });
      test('should generate a blake2b hash with an algo id at the beginning',
          () {
        expect(uint8ListToHex(crypto.hash("myfakedata", algo: "blake2b")),
            "04f4101890104371a4d673ed717e824c80634edf3cb39e3eeff555049c0a025e5f13a6aa938c7501a98471cad9c13870c13e8691e97229e4a4b4e1930221c02ab8");
      });
    });

    group('deriveKeyPair', () {
      test('should generate an EC keypair using Ed25519 curve', () {
        KeyPair keypair = crypto.deriveKeyPair("seed", 0);
        expect(uint8ListToHex(keypair.publicKey),
            "00462664092eea75241c889db84ab9732068d37c3d521e4890fecabe9c614a81fa");
      });
      test('should generate an EC keypair using P256 curve', () {
        KeyPair keypair = crypto.deriveKeyPair("seed", 0, curve: "P256");
        expect(uint8ListToHex(keypair.publicKey),
            "010488f546d68919bf9caf0eb172586a42824c67c07bc29d31cba27839a21f194cee88b59bd36a55870ec0b26a2cd39c84ec2efbce7329e573c5fd7109260f0d84e8");
      });
      test('should generate an EC keypair using secp256k1 curve', () {
        KeyPair keypair = crypto.deriveKeyPair("seed", 0, curve: "secp256k1");
        expect(uint8ListToHex(keypair.publicKey),
            "0204350d90092eeaaba2607ee2d307ce4e2130b5d9d567e20764b742c7133b0e1ad9af1d1e5d4a2e831bde9cbecd14864f5dd3e08bdf6621f36600ff3beeb0fdda8d");
      });

      test('should produce different key by changing the index', () {
        KeyPair keypair1 = crypto.deriveKeyPair("seed", 0);
        KeyPair keypair2 = crypto.deriveKeyPair("seed", 1);
        expect(keypair1, isNot(equals(keypair2)));
      });
    });

    group('sign/verify', () {
      test(
          'should sign a message with an ed25519 key and create valid signature',
          () {
        KeyPair keypair = crypto.deriveKeyPair("seed", 0, curve: "ed25519");
        Uint8List sig = crypto.sign("hello", keypair.privateKey);
        expect(crypto.verify(sig, "hello", keypair.publicKey), true);
      });
      test('should sign a message with an P256 key', () {
        // TODO
        /*
        KeyPair keypair = crypto.deriveKeyPair("seed", 0, curve: "P256");
        Uint8List sig = crypto.sign("hello", keypair.privateKey);
        expect(crypto.verify(sig, "hello", keypair.publicKey), true);
        */
      });
      test('should sign a message with an secp256k1 key', () {
        // TODO
        /*
        KeyPair keypair = crypto.deriveKeyPair("seed", 0, curve: "secp256k1");
        Uint8List sig = crypto.sign("hello", keypair.privateKey);
        expect(crypto.verify(sig, "hello", keypair.publicKey), true);
        */
      });
    });

    group('ecEncrypt', () {
      test('should encrypt a data using a ed25519 public key', () {
        KeyPair keypair = crypto.deriveKeyPair("seed", 0, curve: "ed25519");
        Uint8List secret = Uint8List.fromList([
          10,
          35,
          17,
          69,
          75,
          209,
          215,
          254,
          93,
          80,
          136,
          162,
          3,
          11,
          92,
          115,
          73,
          248,
          11,
          116,
          237,
          131,
          153,
          68,
          241,
          39,
          161,
          97,
          1,
          185,
          253,
          200
        ]);
        Uint8List ciphertext = crypto.ecEncrypt(secret, keypair.publicKey);
        expect(ciphertext.length, 80);

        Uint8List pvBuf = keypair.privateKey.sublist(1, 33);
        Uint8List pubBuf = keypair.publicKey.sublist(1, 33);

        Uint8List curve25519Pub =
            sodium.Sodium.cryptoSignEd25519PkToCurve25519(pubBuf);
        Uint8List curve25519Pv = sodium.Sodium.cryptoSignEd25519SkToCurve25519(
            concatUint8List([pvBuf, pubBuf]));
        expect(
            sodium.Sodium.cryptoBoxSealOpen(
                ciphertext, curve25519Pub, curve25519Pv),
            secret);
      });

      test('should encrypt a data using a P256 public key', () {
        // TODO
      });

      test('should encrypt a data using a secp256k1 public key', () {
        // TODO
        /*
        KeyPair keypair = crypto.deriveKeyPair("seed", 0, curve: "secp256k1");
        Uint8List ciphertext = crypto.ecEncrypt("hello", keypair.publicKey);

        Uint8List ephemeralPubKey = ciphertext.sublist(0, 65);
        Uint8List tag = ciphertext.sublist(65, 65 + 16);
        Uint8List encrypted = ciphertext.sublist(65 + 16, ciphertext.length);

        final gcm = GCMBlockCipher(AESFastEngine())
          ..init(false, AEADParameters(KeyParameter(key), 8 * 16, iv, tag));

        final paddedPlainText = Uint8List(encrypted.length);

        var offset = 0;
        while (offset < encrypted.length) {
          offset +=
              gcm.processBlock(encrypted, offset, paddedPlainText, offset);
        }*/
      });
    });

    group('aesEncrypt', () {
      test('should encrypt and decrypt data with a key', () {
        // TODO
        /*Uint8List key = Uint8List.fromList(
            List<int>.generate(32, (i) => Random.secure().nextInt(256)));
        Uint8List encrypted = crypto.aesEncrypt("hello", key);
        expect(crypto.aesDecrypt(encrypted, key), utf8.encode("hello"));*/
      });
    });
  });
}
