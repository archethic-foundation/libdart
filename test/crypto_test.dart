library test.crypto_test;

// Dart imports:
import 'dart:convert';
import 'dart:math';
import 'dart:typed_data';

// Package imports:
import 'package:test/test.dart';

// Project imports:
import 'package:archethic_lib_dart/src/model/crypto/key_pair.dart';
import 'package:archethic_lib_dart/src/model/on_chain_wallet_data.dart';
import 'package:archethic_lib_dart/src/utils/crypto.dart' as crypto;
import 'package:archethic_lib_dart/src/utils/utils.dart';
import 'package:archethic_lib_dart/src/utils/wallet_encoder.dart';
import 'package:archethic_lib_dart/src/utils/wallet_encoder_test_case.dart';

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

      test('should generate a blake2b hash with an algo id at the beginning',
          () {
        print(uint8ListToHex(crypto.hash(
            'archethic://transfer/0000430994d68cbeb13529d25421f6537d6528ce9cc1c6fb7a8dd29ed7bf6a87e85f,00006B06736E2BA5875EF9D9442AAD7C4D9E16CE97B71D1419302B63BBCB482DC4FD/100/',
            algo: 'blake2b')));
      });
    });

    group('deriveKeyPair', () {
      test('should generate an EC keypair using Ed25519 curve', () {
        final KeyPair keypair =
            crypto.deriveKeyPair('seed', 0, curve: 'ed25519');
        expect(uint8ListToHex(keypair.publicKey),
            '000161d6cd8da68207bd01198909c139c130a3df3a8bd20f4bacb123c46354ccd52c');
      });
      test('should generate an EC keypair using P256 curve', () {
        final KeyPair keypair = crypto.deriveKeyPair('seed', 0, curve: 'P256');
        expect(uint8ListToHex(keypair.publicKey),
            '0101044d91a0a1a7cf06a2902d3842f82d2791bcbf3ee6f6dc8de0f90e53e9991c3cb33684b7b9e66f26e7c9f5302f73c69897be5f301de9a63521a08ac4ef34c18728');
      });
      test('should generate an EC keypair using secp256k1 curve', () {
        final KeyPair keypair =
            crypto.deriveKeyPair('seed', 0, curve: 'secp256k1');
        expect(uint8ListToHex(keypair.publicKey),
            '0201044d02d071e7e24348fc24951bded20c08409b075c7956348fef89e118370f382cf99c064b17ad950aaeb1ae04971afdc6a44d68e731b8d0a01a8f56eade92875a');
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
      test('should encrypt blob', () {
        final Uint8List blob = Uint8List.fromList(<int>[1, 2, 3, 4, 5]);
        final KeyPair keypair =
            crypto.deriveKeyPair('seed', 0, curve: 'secp256k1');
        final Uint8List cipherText = crypto.ecEncrypt(blob, keypair.publicKey);
        expect(crypto.ecDecrypt(cipherText, keypair.privateKey), blob);
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

  group('addressFormatControl', () {
    test('should control the format of an address', () {
      // Valid address
      expect(
          crypto.addressFormatControl(
              '0100035910490caa7e3d48b8f80b82a1d02102baa5fd5491dd97534f4af458638362'),
          true);
      // Wrong address (too short)
      expect(
          crypto.addressFormatControl(
              '0100035910490caa7e3d48b8f80b82a1d02102baa5fd5491dd97534f4af4586383'),
          false);
      // Not hex
      expect(
          crypto.addressFormatControl(
              '0100035910490caa7e3d48b8f80b82a1d02102baa5fd5491dd97534f4af458638M'),
          false);
      // Hash ko
      expect(
          crypto.addressFormatControl(
              '0109035910490caa7e3d48b8f80b82a1d02102baa5fd5491dd97534f4af458638362'),
          false);
    });
  });

  group('onchainWalletGenerator', () {
    test('should control the Onchain Wallet', () {
      final OnChainWalletData onChainWalletData = walletEncoder(
          '04523f9d4068555b8c30bd03507f8c4e454a399b39885555dba91477b3640047cbfb8201d11567faa7956b41bb4b7f207a0fd1641d77f32f53ed9f38b7ecff12fb');
      expect(onChainWalletData.encodedWalletKey,
          onChainWalletData.encodedWalletKey);
    });
  }, tags: <String>['noCI']);

  group('Address', () {
    group('deriveAddress', () {
      test('should derive a address by using a seed and index with default',
          () {
        expect(crypto.deriveAddress('mysuperseed', 0),
            '0000b0c17f85ca19e3db670992e79adb94fb560bd750fda06d45bc0a42912c89d31e');
      });
      test(
          'should derive a address by using a seed and index with Nist P256 curve and SHA256 hash algo',
          () {
        expect(crypto.deriveAddress('mysuperseed', 0, curve: 'P256'),
            '01001b35aff40ceaa9e77cb4411cf229b9bab90fab7ad23c955b52bc6dc0c8f7198c');
      });
      test(
          'should derive a address by using a seed and index with secp256k1 curve and SHA256 hash algo',
          () {
        expect(crypto.deriveAddress('mysuperseed', 0, curve: 'secp256k1'),
            '02007b17c3962a41519c7745d6c16bcbc7f869df0458b563d500467319d6712b8659');
      });
      test(
          'should derive a address by using a seed and index with secp256k1 curve and SHA512 hash algo',
          () {
        expect(
            crypto.deriveAddress('mysuperseed', 0,
                curve: 'secp256k1', hashAlgo: 'sha512'),
            '020181d1b48dc728b15284db73f316bfd2be12a122d287c5334708dc8785340dc240b86b2bd9b0f642a4e01541107950ad996ff472b4f122f14f59646c2034da9ed9');
      });
      test(
          'should derive a address by using a seed and index with secp256k1 curve and SHA3-256 hash algo',
          () {
        expect(
            crypto.deriveAddress('mysuperseed', 0,
                curve: 'secp256k1', hashAlgo: 'sha3-256'),
            '02022b6066277eda08508d51a447158659825630e479f8f9438d9a6fee60ed673276');
      });
      test(
          'should derive a address by using a seed and index with secp256k1 curve and SHA3-512 hash algo',
          () {
        expect(
            crypto.deriveAddress('mysuperseed', 0,
                curve: 'secp256k1', hashAlgo: 'sha3-512'),
            '020393fcff75b372d3a3f787add485285449d68193d02d4f5bb02459a3c6671d7d2a2bd21a06c10a58d7d8e0ee03a1cddbaea86224890e3b99935f2019ca99612634');
      });
      test(
          'should derive a address by using a seed and index with secp256k1 curve and Blake2b hash algo',
          () {
        expect(
            crypto.deriveAddress('mysuperseed', 0,
                curve: 'secp256k1', hashAlgo: 'blake2b'),
            '0204ca0f111a48aae4a1920f9f23c5ac6c80e8531efafac8e6cd2ab3f0846c3d2a2d153c79dfe8c690c223d7d9aec7fd341009bbcad4b63c75bd6e20b0a7e4deacf4');
      });
    });
    group('deriveKeyPair', () {
      test(
          'should derive a keypair by using a seed and index using default curve i.e ed25519',
          () {
        expect(
            uint8ListToHex(crypto
                .deriveKeyPair('mysuperseed', 0, curve: 'ed25519')
                .publicKey),
            '0001c184571c9329a3affd6b5cf7c4eb1bcf56774475d554468382c37d932c7a03f1');
      });
      test(
          'should derive a keypair by using a seed and index using Nist P256 curve',
          () {
        expect(
            uint8ListToHex(crypto
                .deriveKeyPair('mysuperseed', 0, curve: 'P256')
                .publicKey),
            '010104494a63b66df5442657affbc8c76b95ea1a19a756d1d9feb4b7a06f8373aff3f1666067d0c2082fe2dad8c77fa28010043608db7ab8a11479fb31056de3d1afbc');
      });
      test('should derive a keypair by using a seed and index using secp256k1',
          () {
        expect(
            uint8ListToHex(crypto
                .deriveKeyPair('mysuperseed', 0, curve: 'secp256k1')
                .publicKey),
            '02010478d2cc0c37955b3765e9c9553e8dbcd71925253fdc9d63389acc417438838720d709de3e514b1f0bd50353545e834b2fe03d764958a65045f5f4d33416ddde04');
      });
    });
  });

  group('onchainWalletGeneratorTest', () {
    test('should control the Onchain Wallet (Test)', () {
      final OnChainWalletData onChainWalletData = walletEncoderTest(
          '04523f9d4068555b8c30bd03507f8c4e454a399b39885555dba91477b3640047cbfb8201d11567faa7956b41bb4b7f207a0fd1641d77f32f53ed9f38b7ecff12fb');
      expect(onChainWalletData.encodedWalletKey,
          onChainWalletData.encodedWalletKey);
    });
  }, tags: <String>['noCI']);
}
