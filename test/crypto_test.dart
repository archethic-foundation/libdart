library test.crypto_test;

// Dart imports:
import 'dart:convert';
import 'dart:math';
import 'dart:typed_data';

// Package imports:
import 'package:test/test.dart';

// Project imports:
import 'package:archethic_lib_dart/crypto.dart' as crypto;
import 'package:archethic_lib_dart/model/key_pair.dart';
import 'package:archethic_lib_dart/utils.dart';

void main() {
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
      test('should generate an EC keypair using Ed25519 curve', () {
        final KeyPair keypair =
            crypto.deriveKeyPair('seed', 0, curve: 'ed25519');
        expect(uint8ListToHex(keypair.publicKey),
            '000061d6cd8da68207bd01198909c139c130a3df3a8bd20f4bacb123c46354ccd52c');
      });
      test('should generate an EC keypair using P256 curve', () {
        final KeyPair keypair = crypto.deriveKeyPair('seed', 0, curve: 'P256');
        expect(uint8ListToHex(keypair.publicKey),
            '0100044d91a0a1a7cf06a2902d3842f82d2791bcbf3ee6f6dc8de0f90e53e9991c3cb33684b7b9e66f26e7c9f5302f73c69897be5f301de9a63521a08ac4ef34c18728');
      });
      test('should generate an EC keypair using secp256k1 curve', () {
        final KeyPair keypair =
            crypto.deriveKeyPair('seed', 0, curve: 'secp256k1');
        expect(uint8ListToHex(keypair.publicKey),
            '0200044d02d071e7e24348fc24951bded20c08409b075c7956348fef89e118370f382cf99c064b17ad950aaeb1ae04971afdc6a44d68e731b8d0a01a8f56eade92875a');
      });

      test('should produce different key by changing the index', () {
        final KeyPair keypair1 = crypto.deriveKeyPair('seed', 0);
        final KeyPair keypair2 = crypto.deriveKeyPair('seed', 1);
        expect(keypair1, isNot(equals(keypair2)));
      });
    });

    group('sign/verify', () {
      test(
          'should sign a message with an ed25519 key and create valid signature',
          () {
        final KeyPair keypair =
            crypto.deriveKeyPair('seed', 0, curve: 'ed25519');
        final Uint8List sig = crypto.sign('hello', keypair.privateKey);
        expect(crypto.verify(sig, 'hello', keypair.publicKey), true);
      });
      test('should sign a message with an P256 key', () {
        final KeyPair keypair = crypto.deriveKeyPair('seed', 0, curve: 'P256');
        final Uint8List sig = crypto.sign('hello', keypair.privateKey);
        expect(crypto.verify(sig, 'hello', keypair.publicKey), true);
      });
      test('should sign a message with an secp256k1 key', () {
        final KeyPair keypair =
            crypto.deriveKeyPair('seed', 0, curve: 'secp256k1');
        final Uint8List sig = crypto.sign('hello', keypair.privateKey);
        expect(crypto.verify(sig, 'hello', keypair.publicKey), true);
      });
    });

    group('ecEncrypt', () {
      test('should encrypt a data using a ed25519 public key', () {
        final KeyPair keypair =
            crypto.deriveKeyPair('seed', 0, curve: 'ed25519');
        final Uint8List cipherText =
            crypto.ecEncrypt('hello', keypair.publicKey);
        expect(crypto.ecDecrypt(cipherText, keypair.privateKey),
            'hello'.codeUnits);
      });
      test('should encrypt a data using a P256 public key', () {
        final KeyPair keypair = crypto.deriveKeyPair('seed', 0, curve: 'P256');
        final Uint8List cipherText =
            crypto.ecEncrypt('hello', keypair.publicKey);
        expect(crypto.ecDecrypt(cipherText, keypair.privateKey),
            'hello'.codeUnits);
      });
      test('should encrypt a data using a secp256k1 public key', () {
        final KeyPair keypair =
            crypto.deriveKeyPair('seed', 0, curve: 'secp256k1');
        final Uint8List cipherText =
            crypto.ecEncrypt('hello', keypair.publicKey);
        expect(crypto.ecDecrypt(cipherText, keypair.privateKey),
            'hello'.codeUnits);
      });
    });
  });

  group('aesEncrypt', () {
    test('should encrypt and decrypt data with a key', () {
      final Uint8List key = Uint8List.fromList(
          List<int>.generate(32, (int i) => Random.secure().nextInt(256)));
      final Uint8List encrypted = crypto.aesEncrypt('hello', key);
      expect(crypto.aesDecrypt(encrypted, key),
          Uint8List.fromList(utf8.encode('hello')));
    });
  });
}
