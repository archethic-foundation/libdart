library test.keychain_test;

import 'dart:convert';
import 'dart:math';
import 'dart:typed_data';
import 'package:archethic_lib_dart/src/model/authorized_key.dart';
import 'package:archethic_lib_dart/src/model/keychain.dart';
import 'package:archethic_lib_dart/src/model/transaction.dart';
import 'package:archethic_lib_dart/src/services/api_service.dart';
import 'package:archethic_lib_dart/src/utils/crypto.dart' as crypto;
import 'package:archethic_lib_dart/src/utils/logs.dart';
import 'package:archethic_lib_dart/src/utils/utils.dart';
import 'package:test/test.dart';

void main() {
  group('keychain to DID', () {
    test('should encode the key material metadata', () {
      final seed =
          Uint8List.fromList(utf8.encode('abcdefghijklmnopqrstuvwxyz'));

      final keychain =
          Keychain(seed: seed).copyWithService('uco', "m/650'/0/0");
      final keyPair = keychain.deriveKeypair('uco');

      final address =
          crypto.deriveAddress(utf8.decode(seed), 0, isSeedHexa: false);

      final json = keychain.toDID();
      final String id = json['id'];
      final List<Map<String, dynamic>> verificationMethod =
          json['verificationMethod'];

      expect(id, 'did:archethic:$address');

      final expected = <Map<String, dynamic>>[
        <String, dynamic>{
          'id': 'did:archethic:$address#uco',
          'type': 'JsonWebKey2020',
          'publicKeyJwk':
              keyToJWK(Uint8List.fromList(keyPair.publicKey!), 'uco').toJson(),
          'controller': 'did:archethic:$address',
        }
      ];

      expect(expected, verificationMethod);
    });
  });

  group('derivation', () {
    test('should derive keys for a given service with suffix', () {
      final seed =
          Uint8List.fromList(utf8.encode('abcdefghijklmnopqrstuvwxyz'));
      final keychain =
          Keychain(seed: seed).copyWithService('uco', "m/650'/0/0");
      final keyPair = keychain.deriveKeypair('uco');
      final extendedKeyPair =
          keychain.deriveKeypair('uco', pathSuffix: 'extended');
      expect(keyPair.publicKey, isNot(equals(extendedKeyPair.publicKey)));
    });
  });

  group('keychain encode', () {
    test('should encode the keychain into a binary', () {
      final seed = Uint8List.fromList(utf8.encode('myseed'));

      final keychain =
          Keychain(seed: seed).copyWithService('uco', "m/650'/0/0");

      final expectedBinary = concatUint8List(<Uint8List>[
        Uint8List.fromList(<int>[0, 0, 0, 1]), // Version
        Uint8List.fromList(<int>[6]), // Seed size
        Uint8List.fromList(utf8.encode('myseed')),
        Uint8List.fromList(<int>[1]), // Nb of services
        Uint8List.fromList(<int>[3]), // Service name length: "UCO",
        Uint8List.fromList(utf8.encode('uco')),
        Uint8List.fromList(<int>[10]), // Derivation path length,
        Uint8List.fromList(utf8.encode("m/650'/0/0")),
        Uint8List.fromList(<int>[0]), // Ed25519 curve
        Uint8List.fromList(<int>[0]), // SHA256 hash algo
      ]);

      expect(keychain.encode(), expectedBinary);
    });

    test('should decode keychain from a binary', () {
      final binary = concatUint8List(<Uint8List>[
        Uint8List.fromList(<int>[0, 0, 0, 1]), // Version
        Uint8List.fromList(<int>[6]), // Seed size
        Uint8List.fromList(utf8.encode('myseed')),
        Uint8List.fromList(<int>[1]), // Nb of services
        Uint8List.fromList(<int>[3]), // Service name length: "UCO",
        Uint8List.fromList(utf8.encode('uco')),
        Uint8List.fromList(<int>[10]), // Derivation path length,
        Uint8List.fromList(utf8.encode("m/650'/0/0")),
        Uint8List.fromList(<int>[0]), // Ed25519 curve
        Uint8List.fromList(<int>[0]), // SHA256 hash algo
      ]);

      final keychain = decodeKeychain(binary);

      expect(Uint8List.fromList(utf8.encode('myseed')), keychain.seed);
      expect(
        json.encode({
          'uco': {
            'derivationPath': "m/650'/0/0",
            'curve': 'ed25519',
            'hashAlgo': 'sha256',
          },
        }),
        json.encode(keychain.services),
      );
    });
  });

  group('buildTransaction', () {
    test(
      'should add service in a keychain',
      () async {
        /// Create keychain
        const walletSeed =
            '60A6418E261C715D9C5E897EC8E018B8BD6C022DE214201177DEBEFE6DE1ECA6';
        final walletKeyPair = crypto.deriveKeyPair(walletSeed, 0);

        /// Generate keyChain Seed from random value
        final keychainSeed = uint8ListToHex(
          Uint8List.fromList(
            List<int>.generate(32, (int i) => Random.secure().nextInt(256)),
          ),
        );
        log('keychainSeed: $keychainSeed');

        /// Default service for wallet
        const kServiceName = 'main-uco';
        const kDerivationPathWithoutIndex = "m/650'/$kServiceName/";
        const index = '0';
        const kDerivationPath = '$kDerivationPathWithoutIndex$index';
        log('kDerivationPath: $kDerivationPath');

        final originPrivateKey =
            ApiService('https://mainnet.archethic.net').getOriginKey();
        log('originPrivateKey: $originPrivateKey');

        /// Create Keychain from keyChain seed and wallet public key to encrypt secret
        final keychainTransaction =
            ApiService('https://mainnet.archethic.net').newKeychainTransaction(
          keychainSeed,
          <String>[
            uint8ListToHex(
              Uint8List.fromList(walletKeyPair.publicKey!),
            ),
          ],
          Uint8List.fromList(hexToUint8List(originPrivateKey)),
          serviceName: kServiceName,
          derivationPath: kDerivationPath,
        );
        log('keychainTransaction: ${keychainTransaction.convertToJSON()}');

        /// Create Keychain Access for wallet
        final accessKeychainTx = ApiService('https://mainnet.archethic.net')
            .newAccessKeychainTransaction(
          walletSeed,
          Uint8List.fromList(
            hexToUint8List(keychainTransaction.address!.address!),
          ),
          Uint8List.fromList(hexToUint8List(originPrivateKey)),
        );
        log('accessKeychainTx: ${accessKeychainTx.convertToJSON()}');

        // ignore: unused_local_variable
        final transactionStatusKeychain =
            await ApiService('https://mainnet.archethic.net')
                .sendTx(keychainTransaction);

        await Future<void>.delayed(const Duration(seconds: 2));

        // ignore: unused_local_variable
        final transactionStatusKeychainAccess =
            await ApiService('https://mainnet.archethic.net')
                .sendTx(accessKeychainTx);

        await Future<void>.delayed(const Duration(seconds: 2));

        /// Add service in keychain

        final keychainToUpdate =
            await ApiService('https://mainnet.archethic.net')
                .getKeychain(walletSeed);
        log('keychain seed (add Account) : ${uint8ListToHex(keychainToUpdate.seed!)}');

        final genesisAddressKeychain =
            crypto.deriveAddress(uint8ListToHex(keychainToUpdate.seed!), 0);

        const kServiceName2 = 'second-uco';
        const kDerivationPathWithoutIndex2 = "m/650'/$kServiceName2/";
        const index2 = '0';
        const kDerivationPath2 = '$kDerivationPathWithoutIndex2$index2';
        keychainToUpdate.copyWithService(kServiceName2, kDerivationPath2);

        final lastTransactionKeychainMap =
            await ApiService('https://mainnet.archethic.net')
                .getLastTransaction([genesisAddressKeychain]);

        final aesKey = uint8ListToHex(
          Uint8List.fromList(
            List<int>.generate(32, (int i) => Random.secure().nextInt(256)),
          ),
        );

        final keychainTransaction2 =
            Transaction(type: 'keychain', data: Transaction.initData())
                .setContent(jsonEncode(keychainToUpdate.toDID()));

        final authorizedKeys = List<AuthorizedKey>.empty(growable: true);
        final la = lastTransactionKeychainMap[genesisAddressKeychain]!
            .data!
            .ownerships[0]
            .authorizedPublicKeys;
        for (final ak in la) {
          authorizedKeys.add(
            AuthorizedKey(
              encryptedSecretKey:
                  uint8ListToHex(crypto.ecEncrypt(aesKey, ak.publicKey)),
              publicKey: ak.publicKey,
            ),
          );
        }

        keychainTransaction2.addOwnership(
          uint8ListToHex(crypto.aesEncrypt(keychainToUpdate.encode(), aesKey)),
          authorizedKeys,
        );

        keychainTransaction2
            .build(
              uint8ListToHex(keychainToUpdate.seed!),
              lastTransactionKeychainMap[genesisAddressKeychain]!.chainLength!,
            )
            .originSign(originPrivateKey);

        // ignore: unused_local_variable
        final transactionStatusKeychain2 =
            await ApiService('https://mainnet.archethic.net')
                .sendTx(keychainTransaction2);

        await Future<void>.delayed(const Duration(seconds: 2));
        await ApiService('https://mainnet.archethic.net')
            .getKeychain(walletSeed);

        expect(transactionStatusKeychain2.status, 'pending');
      },
      tags: <String>['noCI'],
    );

    test(
      'should create a keychain',
      () async {
        const walletSeed =
            '60A6418E261C715D9C5E897EC8E018B8BD6C022DE214201177DEBEFE6DE1ECA1';
        final walletKeyPair = crypto.deriveKeyPair(walletSeed, 0);

        /// Generate keyChain Seed from random value
        final keychainSeed = uint8ListToHex(
          Uint8List.fromList(
            List<int>.generate(32, (int i) => Random.secure().nextInt(256)),
          ),
        );
        log('keychainSeed: $keychainSeed');

        /// Default service for wallet
        const kServiceName = 'main-uco';
        const kDerivationPathWithoutIndex = "m/650'/$kServiceName/";
        const index = '0';
        const kDerivationPath = '$kDerivationPathWithoutIndex$index';
        log('kDerivationPath: $kDerivationPath');

        final originPrivateKey =
            ApiService('https://mainnet.archethic.net').getOriginKey();
        log('originPrivateKey: $originPrivateKey');

        /// Create Keychain from keyChain seed and wallet public key to encrypt secret
        final keychainTransaction =
            ApiService('https://mainnet.archethic.net').newKeychainTransaction(
          keychainSeed,
          <String>[
            uint8ListToHex(
              Uint8List.fromList(walletKeyPair.publicKey!),
            ),
          ],
          Uint8List.fromList(hexToUint8List(originPrivateKey)),
          serviceName: kServiceName,
          derivationPath: kDerivationPath,
        );
        log('keychainTransaction: ${keychainTransaction.convertToJSON()}');

        /// Create Keychain Access for wallet
        final accessKeychainTx = ApiService('https://mainnet.archethic.net')
            .newAccessKeychainTransaction(
          walletSeed,
          Uint8List.fromList(
            hexToUint8List(keychainTransaction.address!.address!),
          ),
          Uint8List.fromList(hexToUint8List(originPrivateKey)),
        );
        log('accessKeychainTx: ${accessKeychainTx.convertToJSON()}');

        // ignore: unused_local_variable
        final transactionStatusKeychain =
            await ApiService('https://mainnet.archethic.net')
                .sendTx(keychainTransaction);

        await Future<void>.delayed(const Duration(seconds: 2));

        // ignore: unused_local_variable
        final transactionStatusKeychainAccess =
            await ApiService('https://mainnet.archethic.net')
                .sendTx(accessKeychainTx);

        /// Get KeyChain Wallet
        final keychain = await ApiService('https://mainnet.archethic.net')
            .getKeychain(walletSeed);

        expect(keychain.services.keys.elementAt(0), 'main-uco');
      },
      tags: <String>['noCI'],
    );

    test('should build the transaction and the related signature', () {
      final seed = Uint8List.fromList(utf8.encode('seed'));

      final keychain =
          Keychain(seed: seed).copyWithService('uco', "m/650'/0/0");
      final tx = Transaction(type: 'transfer', data: Transaction.initData())
          .addUCOTransfer(
        '0000b1d3750edb9381c96b1a975a55b5b4e4fb37bfab104c10b0b6c9a00433ec4646',
        toBigInt(10.0),
      );

      final txBuilt = keychain.buildTransaction(tx, 'uco', 0);

      final keypair = keychain.deriveKeypair('uco');
      final address = keychain.deriveAddress('uco', index: 1);
      expect(txBuilt.address!.address, uint8ListToHex(address));
      expect(
        txBuilt.previousPublicKey,
        uint8ListToHex(Uint8List.fromList(keypair.publicKey!)),
      );

      expect(
        crypto.verify(
          txBuilt.previousSignature,
          txBuilt.previousSignaturePayload(),
          txBuilt.previousPublicKey,
        ),
        true,
      );
    });

    test('should decode keychain from a binary', () {
      final binary = concatUint8List(<Uint8List>[
        Uint8List.fromList(<int>[0, 0, 0, 1]), // Version
        Uint8List.fromList(<int>[6]), // Seed size
        Uint8List.fromList(utf8.encode('myseed')),
        Uint8List.fromList(<int>[1]), // Nb of services
        Uint8List.fromList(<int>[3]), // Service name length: "UCO",
        Uint8List.fromList(utf8.encode('uco')),
        Uint8List.fromList(<int>[10]), // Derivation path length,
        Uint8List.fromList(utf8.encode("m/650'/0/0")),
        Uint8List.fromList(<int>[0]), // Ed25519 curve
        Uint8List.fromList(<int>[0]), // SHA256 hash algo
      ]);

      final keychain = decodeKeychain(binary);

      expect(Uint8List.fromList(utf8.encode('myseed')), keychain.seed);
      expect(
        json.encode({
          'uco': {
            'derivationPath': "m/650'/0/0",
            'curve': 'ed25519',
            'hashAlgo': 'sha256',
          },
        }),
        json.encode(keychain.services),
      );
    });
  });
}
