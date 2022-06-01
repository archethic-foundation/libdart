library test.keychain_test;

// Dart imports:
import 'dart:convert';
import 'dart:developer' as dev;
import 'dart:math';
import 'dart:typed_data';

// Package imports:
import 'package:test/test.dart';

// Project imports:
import 'package:archethic_lib_dart/src/model/crypto/key_pair.dart';
import 'package:archethic_lib_dart/src/model/keychain.dart';
import 'package:archethic_lib_dart/src/model/transaction.dart';
import 'package:archethic_lib_dart/src/model/transaction_status.dart';
import 'package:archethic_lib_dart/src/services/api_service.dart';
import 'package:archethic_lib_dart/src/utils/crypto.dart' as crypto;
import 'package:archethic_lib_dart/src/utils/utils.dart';

void main() {
  group('keychain to DID', () {
    test('should encode the key material metadata', () {
      final Uint8List seed =
          Uint8List.fromList(utf8.encode('abcdefghijklmnopqrstuvwxyz'));

      final Keychain keychain = Keychain.serviceUCO(seed);
      final KeyPair keyPair = keychain.deriveKeypair('uco');

      final String address = crypto.deriveAddress(utf8.decode(seed), 0);

      final Map<String, dynamic> json = keychain.toDID();
      final String id = json['id'];
      final List<Map<String, dynamic>> verificationMethod =
          json['verificationMethod'];

      expect(id, 'did:archethic:$address');

      final List<Map<String, dynamic>> expected = <Map<String, dynamic>>[
        <String, dynamic>{
          'id': 'did:archethic:$address#uco',
          'type': 'JsonWebKey2020',
          'publicKeyJwk': keyToJWK(keyPair.publicKey, 'uco').toJson(),
          'controller': 'did:archethic:$address'
        }
      ];

      expect(expected, verificationMethod);
    });
  });

  group('keychain encode', () {
    test('should encode the keychain into a binary', () {
      final Uint8List seed = Uint8List.fromList(utf8.encode('myseed'));

      final Keychain keychain = Keychain.serviceUCO(seed);

      final Uint8List expectedBinary = concatUint8List(<Uint8List>[
        Uint8List.fromList(<int>[0, 0, 0, 1]), // Version
        Uint8List.fromList(<int>[6]), // Seed size
        Uint8List.fromList(utf8.encode('myseed')),
        Uint8List.fromList(<int>[1]), // Nb of services
        Uint8List.fromList(<int>[3]), // Service name length: "UCO",
        Uint8List.fromList(utf8.encode('uco')),
        Uint8List.fromList(<int>[10]), // Derivation path length,
        Uint8List.fromList(utf8.encode('m/650\'/0/0')),
        Uint8List.fromList(<int>[0]), // Ed25519 curve
        Uint8List.fromList(<int>[0]) // SHA256 hash algo
      ]);

      expect(keychain.encode(), expectedBinary);
    });

    test('should decode keychain from a binary', () {
      final Uint8List binary = concatUint8List(<Uint8List>[
        Uint8List.fromList(<int>[0, 0, 0, 1]), // Version
        Uint8List.fromList(<int>[6]), // Seed size
        Uint8List.fromList(utf8.encode('myseed')),
        Uint8List.fromList(<int>[1]), // Nb of services
        Uint8List.fromList(<int>[3]), // Service name length: "UCO",
        Uint8List.fromList(utf8.encode('uco')),
        Uint8List.fromList(<int>[10]), // Derivation path length,
        Uint8List.fromList(utf8.encode('m/650\'/0/0')),
        Uint8List.fromList(<int>[0]), // Ed25519 curve
        Uint8List.fromList(<int>[0]) // SHA256 hash algo
      ]);

      final Keychain keychain = decodeKeychain(binary);

      expect(Uint8List.fromList(utf8.encode('myseed')), keychain.seed);
      expect(
          json.encode({
            'uco': {
              'derivationPath': 'm/650\'/0/0',
              'curve': 'ed25519',
              'hashAlgo': 'sha256'
            }
          }),
          json.encode(keychain.services!));
    });
  });

  group('buildTransaction', () {
    test('should create a keychain', () async {
      const String walletSeed =
          '60A6418E261C715D9C5E897EC8E018B8BD6C022DE214201177DEBEFE6DE1ECA1';
      final KeyPair walletKeyPair = crypto.deriveKeyPair(walletSeed, 0);

      /// Generate keyChain Seed from random value
      final String keychainSeed = uint8ListToHex(Uint8List.fromList(
          List<int>.generate(32, (int i) => Random.secure().nextInt(256))));
      dev.log('keychainSeed: $keychainSeed');

      /// Default service for wallet
      const String kServiceName = 'main-uco';
      const String kDerivationPathWithoutIndex = 'm/650/$kServiceName/';
      const String index = '0';
      const String kDerivationPath = '$kDerivationPathWithoutIndex$index';
      dev.log('kDerivationPath: $kDerivationPath');

      final String originPrivateKey =
          await ApiService('http://localhost:4000').getOriginKey();
      dev.log('originPrivateKey: $originPrivateKey');

      /// Create Keychain from keyChain seed and wallet public key to encrypt secret
      final Transaction keychainTransaction =
          ApiService('http://localhost:4000').newKeychainTransaction(
              keychainSeed,
              <String>[uint8ListToHex(walletKeyPair.publicKey)],
              hexToUint8List(originPrivateKey),
              serviceName: kServiceName,
              derivationPath: kDerivationPath);
      dev.log('keychainTransaction: ${keychainTransaction.convertToJSON()}');

      /// Create Keychain Access for wallet
      final Transaction accessKeychainTx = ApiService('http://localhost:4000')
          .newAccessKeychainTransaction(
              walletSeed,
              hexToUint8List(keychainTransaction.address!),
              hexToUint8List(originPrivateKey));
      dev.log('accessKeychainTx: ${accessKeychainTx.convertToJSON()}');

      // ignore: unused_local_variable
      final TransactionStatus transactionStatusKeychain =
          await ApiService('http://localhost:4000').sendTx(keychainTransaction);

      //await Future<void>.delayed(const Duration(seconds: 5));

      // ignore: unused_local_variable
      final TransactionStatus transactionStatusKeychainAccess =
          await ApiService('http://localhost:4000').sendTx(accessKeychainTx);

      /// Get KeyChain Wallet
      final Keychain keychain =
          await ApiService('http://localhost:4000').getKeychain(walletSeed);

      expect(keychain.services!.keys.elementAt(0), 'main-uco');
    }, tags: <String>['noCI']);

    test('should build the transaction and the related signature', () {
      final Uint8List seed = Uint8List.fromList(utf8.encode('seed'));

      final Keychain keychain = Keychain.serviceUCO(seed);
      final Transaction tx = Transaction(
              type: 'transfer', data: Transaction.initData())
          .addUCOTransfer(
              '0000b1d3750edb9381c96b1a975a55b5b4e4fb37bfab104c10b0b6c9a00433ec4646',
              toBigInt(10.0));

      keychain.buildTransaction(tx, 'uco', 0);

      final KeyPair keypair = keychain.deriveKeypair('uco');
      final Uint8List address = keychain.deriveAddress('uco', index: 1);
      expect(tx.address, uint8ListToHex(address));
      expect(tx.previousPublicKey, uint8ListToHex(keypair.publicKey));

      expect(
          crypto.verify(tx.previousSignature, tx.previousSignaturePayload(),
              tx.previousPublicKey),
          true);
    });

    test('should decode keychain from a binary', () {
      final Uint8List binary = concatUint8List(<Uint8List>[
        Uint8List.fromList(<int>[0, 0, 0, 1]), // Version
        Uint8List.fromList(<int>[6]), // Seed size
        Uint8List.fromList(utf8.encode('myseed')),
        Uint8List.fromList(<int>[1]), // Nb of services
        Uint8List.fromList(<int>[3]), // Service name length: "UCO",
        Uint8List.fromList(utf8.encode('uco')),
        Uint8List.fromList(<int>[10]), // Derivation path length,
        Uint8List.fromList(utf8.encode('m/650\'/0/0')),
        Uint8List.fromList(<int>[0]), // Ed25519 curve
        Uint8List.fromList(<int>[0]) // SHA256 hash algo
      ]);

      final Keychain keychain = decodeKeychain(binary);

      expect(Uint8List.fromList(utf8.encode('myseed')), keychain.seed);
      expect(
          json.encode({
            'uco': {
              'derivationPath': 'm/650\'/0/0',
              'curve': 'ed25519',
              'hashAlgo': 'sha256'
            }
          }),
          json.encode(keychain.services!));
    });
  });
}
