library test.crypto_test;

// Dart imports:
import 'dart:typed_data';

// Package imports:
import 'package:flutter_sodium/flutter_sodium.dart' as sodium;
import 'package:flutter_test/flutter_test.dart';

// Project imports:
import 'package:archethic_lib_dart/api.dart';
import 'package:archethic_lib_dart/crypto.dart' as crypto;
import 'package:archethic_lib_dart/model/key_pair.dart';
import 'package:archethic_lib_dart/utils.dart';

void main() {
  sodium.Sodium.init();

  group('Crypto', () {
    group('hash', () {
      test('should generate a sha256 hash with an algo id at the beginning',
          () {
        expect(uint8ListToHex(crypto.hash('myfakedata')),
            '004e89e81096eb09c74a29bdf66e41fc118b6d17ac547223ca6629a71724e69f23');
      });
      test('should generate a sha512 hash with an algo id at the beginning',
          () {
        expect(uint8ListToHex(crypto.hash('myfakedata', algo: 'sha512')),
            '01c09b378f954c39f8e3c2cc4ed9108937c6e6dbfa9f754a344bd395d2ba55aba9f071987a2c014f9c54d47931b243088aa2dd6c6d90ec92a67f8a9dfdd83eba58');
      });
      test('should generate a sha3-256 hash with an algo id at the begining',
          () {
        expect(uint8ListToHex(crypto.hash('myfakedata', algo: 'sha3-256')),
            '029ddb36eabafb047ad869b9e4d35e2c5e6893b6bd2d1cdbdaec13425779f0f9da');
      });
      test('should generate a sha3-512 hash with an algo id at the beginning',
          () {
        expect(uint8ListToHex(crypto.hash('myfakedata', algo: 'sha3-512')),
            '03f64fe5d472619d235212f843c1ed8ae43598c3a5973eead66d70f88f147a0aaabcbcdc6aed160b0ae5cdf5d48871602827b242c479f999647c377698cb8b7d4f');
      });
      test('should generate a blake2b hash with an algo id at the beginning',
          () {
        expect(uint8ListToHex(crypto.hash('myfakedata', algo: 'blake2b')),
            '04f4101890104371a4d673ed717e824c80634edf3cb39e3eeff555049c0a025e5f13a6aa938c7501a98471cad9c13870c13e8691e97229e4a4b4e1930221c02ab8');
      });
    });

    group('deriveKeyPair', () {
      /*test('should generate an EC keypair using Ed25519 curve', () {
        final KeyPair keypair = crypto.deriveKeyPair('52FC713FFC16C741EAFA5D4D2F85EC3374E8AE583CBC36590FE56F4F056C2159', 0);
        expect(uint8ListToHex(keypair.publicKey),
            '0100047b68f44c874d01ba650bbb39683d599385e54d1bdc8342409a328d3d8dcb6e3768f9d22a926fdab5753fadc2da42ef6b77fae65fd90b665d14456539e7e22ed0');
      });*/
      test('should generate an EC keypair using P256 curve', () {
        final KeyPair keypair = crypto.deriveKeyPair(
            '52FC713FFC16C741EAFA5D4D2F85EC3374E8AE583CBC36590FE56F4F056C2159',
            0,
            curve: 'P256');
        expect(uint8ListToHex(keypair.publicKey),
            '0100047b68f44c874d01ba650bbb39683d599385e54d1bdc8342409a328d3d8dcb6e3768f9d22a926fdab5753fadc2da42ef6b77fae65fd90b665d14456539e7e22ed0');
      });
      test('should generate an EC keypair using secp256k1 curve', () {
        final KeyPair keypair = crypto.deriveKeyPair(
            '52FC713FFC16C741EAFA5D4D2F85EC3374E8AE583CBC36590FE56F4F056C2159',
            0,
            curve: 'secp256k1');
        expect(uint8ListToHex(keypair.publicKey),
            '02000472dd7703ddbba8cbefc74f1d9cc26df2c2f1bc89124ac560572eb044351d0d02a939ae120e92ea2b536ddce5fe4cde08989855cf0d6ef6d5c892bccc8f144499');
      });

      test('should produce different key by changing the index', () {
        final KeyPair keypair1 = crypto.deriveKeyPair(
            '52FC713FFC16C741EAFA5D4D2F85EC3374E8AE583CBC36590FE56F4F056C2159',
            1);
        final KeyPair keypair2 = crypto.deriveKeyPair(
            '52FC713FFC16C741EAFA5D4D2F85EC3374E8AE583CBC36590FE56F4F056C2159',
            2);
        expect(keypair1, isNot(equals(keypair2)));
      });
    });

    group('sign/verify', () {
      /* test(
          'should sign a message with an ed25519 key and create valid signature',
          () {
        final KeyPair keypair =
            crypto.deriveKeyPair('52FC713FFC16C741EAFA5D4D2F85EC3374E8AE583CBC36590FE56F4F056C2159', 0, curve: 'ed25519');
        final Uint8List sig = crypto.sign('hello', keypair.privateKey);
        expect(crypto.verify(sig, 'hello', keypair.publicKey), true);
      });*/
      test('should sign a message with an P256 key', () {
        KeyPair keypair = crypto.deriveKeyPair(
            '52FC713FFC16C741EAFA5D4D2F85EC3374E8AE583CBC36590FE56F4F056C2159',
            0,
            curve: 'P256');
        Uint8List sig = crypto.sign('hello', keypair.privateKey);
        expect(crypto.verify(sig, 'hello', keypair.publicKey), true);
      });
      test('should sign a message with an secp256k1 key', () {
        KeyPair keypair = crypto.deriveKeyPair(
            '52FC713FFC16C741EAFA5D4D2F85EC3374E8AE583CBC36590FE56F4F056C2159',
            0,
            curve: 'secp256k1');
        Uint8List sig = crypto.sign("hello", keypair.privateKey);
        expect(crypto.verify(sig, "hello", keypair.publicKey), true);
      });
    });

    group('ecEncrypt', () {
      /*test('should encrypt a data using a ed25519 public key', () {
        final KeyPair keypair =
            crypto.deriveKeyPair('52FC713FFC16C741EAFA5D4D2F85EC3374E8AE583CBC36590FE56F4F056C2159', 0, curve: 'ed25519');
        final Uint8List secret = Uint8List.fromList([
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
        final Uint8List ciphertext =
            crypto.ecEncrypt(secret, keypair.publicKey);
        expect(ciphertext.length, 80);

        final Uint8List pvBuf = keypair.privateKey.sublist(1, 33);
        final Uint8List pubBuf = keypair.publicKey.sublist(1, 33);

        final Uint8List curve25519Pub =
            sodium.Sodium.cryptoSignEd25519PkToCurve25519(pubBuf);
        final Uint8List curve25519Pv =
            sodium.Sodium.cryptoSignEd25519SkToCurve25519(
                concatUint8List([pvBuf, pubBuf]));
        expect(
            sodium.Sodium.cryptoBoxSealOpen(
                ciphertext, curve25519Pub, curve25519Pv),
            secret);
      });*/

      test('should encrypt a data using a P256 public key', () {
        // TODO
      });

      test('should encrypt a data using a secp256k1 public key', () {
        /*KeyPair keypair = crypto.deriveKeyPair('52FC713FFC16C741EAFA5D4D2F85EC3374E8AE583CBC36590FE56F4F056C2159', 0, curve: "secp256k1");
        Uint8List ciphertext = crypto.ecEncrypt('hello', keypair.publicKey);

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
