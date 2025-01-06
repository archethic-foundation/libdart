import 'dart:convert';
import 'dart:developer' as dev;
import 'dart:math';
import 'dart:typed_data';

import 'package:archethic_lib_dart/src/model/authorized_key.dart';
import 'package:archethic_lib_dart/src/model/keychain.dart';
import 'package:archethic_lib_dart/src/model/transaction.dart';
import 'package:archethic_lib_dart/src/services/api_service.dart';
import 'package:archethic_lib_dart/src/utils/confirmations/archethic_transaction_sender.dart';
import 'package:archethic_lib_dart/src/utils/crypto.dart' as crypto;
import 'package:archethic_lib_dart/src/utils/utils.dart';
import 'package:crypto/crypto.dart' as crypto_lib show Hmac, sha512;
import 'package:pointycastle/api.dart';
import 'package:test/test.dart';

import 'utils.dart';

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

    test('should derive key with derivation path without index', () {
      final seed =
          Uint8List.fromList(utf8.encode('abcdefghijklmnopqrstuvwxyz'));
      final keychainWithIndex =
          Keychain(seed: seed).copyWithService('uco', "m/650'/0/0");
      final keyPairWithIndex = keychainWithIndex.deriveKeypair('uco');

      final keychainWithoutIndex =
          Keychain(seed: seed).copyWithService('uco', "m/650'/0");
      final keyPairWithoutIndex = keychainWithoutIndex.deriveKeypair('uco');

      expect(
        keyPairWithIndex.publicKey,
        isNot(equals(keyPairWithoutIndex.publicKey)),
      );

      final keychainSeed = generateRandomSeed();
      final sha256 = Digest('SHA-256');
      final hashedPath =
          sha256.process(Uint8List.fromList(utf8.encode("m/650'/0")));

      final hmac = crypto_lib.Hmac(
        crypto_lib.sha512,
        hexToUint8List(keychainSeed).toList(),
      );
      final digest = hmac.convert(hashedPath);
      final serviceSeed = Uint8List.fromList(digest.bytes.sublist(0, 32));

      final normalDerivationKeyPair =
          crypto.deriveKeyPair(uint8ListToHex(serviceSeed), 0);

      expect(
        normalDerivationKeyPair.publicKey,
        normalDerivationKeyPair.publicKey,
      );
    });
  });

  group('keychain encode', () {
    test('should encode the keychain into a binary', () {
      final seed = Uint8List.fromList(utf8.encode('myseed'));

      final keychain =
          Keychain(seed: seed).copyWithService('uco', "m/650'/0/0");

      final expectedBinary = concatUint8List(<Uint8List>[
        Uint8List.fromList(<int>[0, 0, 0, 3]), // Version
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
        Uint8List.fromList(<int>[0, 0, 0, 3]), // Version
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

  group(
    'buildTransaction',
    tags: <String>[TestTags.integration],
    () {
      test(
        'should add service in a keychain',
        () async {
          /// Create keychain
          final walletSeed = generateRandomSeed();
          const endpoint = 'https://testnet.archethic.net';
          final apiService = ApiService(endpoint);
          final walletKeyPair = crypto.deriveKeyPair(walletSeed, 0);

          /// Generate keyChain Seed from random value
          final keychainSeed = generateRandomSeed();
          dev.log('keychainSeed: $keychainSeed');

          /// Default service for wallet
          const kServiceName = 'main-uco';
          const kDerivationPathWithoutIndex = "m/650'/$kServiceName/";
          const index = '0';
          const kDerivationPath = '$kDerivationPathWithoutIndex$index';
          dev.log('kDerivationPath: $kDerivationPath');

          final originPrivateKey = apiService.getOriginKey();
          dev.log('originPrivateKey: $originPrivateKey');

          final blockchainTxVersion = int.parse(
            (await apiService.getBlockchainVersion()).version.transaction,
          );

          /// Create Keychain from keyChain seed and wallet public key to encrypt secret
          final keychainTransaction = apiService.newKeychainTransaction(
            keychainSeed,
            <String>[
              uint8ListToHex(
                Uint8List.fromList(walletKeyPair.publicKey!),
              ),
            ],
            Uint8List.fromList(hexToUint8List(originPrivateKey)),
            blockchainTxVersion,
            servicesMap: {kServiceName: kDerivationPath},
          );
          dev.log(
            'keychainTransaction: ${keychainTransaction.toNodeRPC()}',
          );

          /// Create Keychain Access for wallet
          final accessKeychainTx = apiService.newAccessKeychainTransaction(
            walletSeed,
            Uint8List.fromList(
              hexToUint8List(keychainTransaction.address!.address!),
            ),
            Uint8List.fromList(hexToUint8List(originPrivateKey)),
            blockchainTxVersion,
          );
          dev.log('accessKeychainTx: ${accessKeychainTx.toNodeRPC()}');

          await ArchethicTransactionSender(
            apiService: apiService,
          ).send(
            transaction: keychainTransaction,
          );

          await ArchethicTransactionSender(
            apiService: apiService,
          ).send(
            transaction: accessKeychainTx,
          );

          /// Add service in keychain
          var keychainToUpdate = await apiService.getKeychain(walletSeed);
          dev.log(
            'keychain seed (add Account) : ${uint8ListToHex(keychainToUpdate.seed!)}',
          );

          final genesisAddressKeychain =
              crypto.deriveAddress(uint8ListToHex(keychainToUpdate.seed!), 0);

          const kServiceName2 = 'second-uco';
          const kDerivationPathWithoutIndex2 = "m/650'/$kServiceName2/";
          const index2 = '0';
          const kDerivationPath2 = '$kDerivationPathWithoutIndex2$index2';
          keychainToUpdate =
              keychainToUpdate.copyWithService(kServiceName2, kDerivationPath2);

          final lastTransactionKeychainMap =
              await apiService.getLastTransaction([genesisAddressKeychain]);

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
            uint8ListToHex(
              crypto.aesEncrypt(keychainToUpdate.encode(), aesKey),
            ),
            authorizedKeys,
          );

          await ArchethicTransactionSender(
            apiService: apiService,
          ).send(
            transaction: keychainTransaction2
                .build(
                  uint8ListToHex(keychainToUpdate.seed!),
                  lastTransactionKeychainMap[genesisAddressKeychain]!
                      .chainLength!,
                )
                .transaction
                .originSign(originPrivateKey),
          );

          final keychain = await apiService.getKeychain(walletSeed);

          expect(keychain.services.keys.elementAt(1), 'second-uco');
        },
      );

      test(
        'should create a keychain',
        tags: <String>[TestTags.integration],
        () async {
          final walletSeed = generateRandomSeed();
          const endpoint = 'https://testnet.archethic.net';
          final apiService = ApiService(endpoint);
          final walletKeyPair = crypto.deriveKeyPair(walletSeed, 0);

          /// Generate keyChain Seed from random value
          final keychainSeed = uint8ListToHex(
            Uint8List.fromList(
              List<int>.generate(32, (int i) => Random.secure().nextInt(256)),
            ),
          );
          dev.log('keychainSeed: $keychainSeed');

          /// Default service for wallet
          const kServiceName = 'main-uco';
          const kDerivationPathWithoutIndex = "m/650'/$kServiceName/";
          const index = '0';
          const kDerivationPath = '$kDerivationPathWithoutIndex$index';
          dev.log('kDerivationPath: $kDerivationPath');

          final originPrivateKey = apiService.getOriginKey();
          dev.log('originPrivateKey: $originPrivateKey');

          final blockchainTxVersion = int.parse(
            (await apiService.getBlockchainVersion()).version.transaction,
          );

          /// Create Keychain from keyChain seed and wallet public key to encrypt secret
          final keychainTransaction = apiService.newKeychainTransaction(
            keychainSeed,
            <String>[
              uint8ListToHex(
                Uint8List.fromList(walletKeyPair.publicKey!),
              ),
            ],
            Uint8List.fromList(hexToUint8List(originPrivateKey)),
            blockchainTxVersion,
            servicesMap: {kServiceName: kDerivationPath},
          );
          dev.log(
            'keychainTransaction: ${keychainTransaction.toNodeRPC()}',
          );

          /// Create Keychain Access for wallet
          final accessKeychainTx = apiService.newAccessKeychainTransaction(
            walletSeed,
            Uint8List.fromList(
              hexToUint8List(keychainTransaction.address!.address!),
            ),
            Uint8List.fromList(hexToUint8List(originPrivateKey)),
            blockchainTxVersion,
          );
          dev.log('accessKeychainTx: ${accessKeychainTx.toNodeRPC()}');

          await ArchethicTransactionSender(
            apiService: apiService,
          ).send(
            transaction: keychainTransaction,
          );

          await ArchethicTransactionSender(
            apiService: apiService,
          ).send(
            transaction: accessKeychainTx,
          );

          /// Get KeyChain Wallet
          final keychain = await apiService.getKeychain(walletSeed);

          expect(keychain.services.keys.elementAt(0), 'main-uco');
        },
      );

      test(
        'should create a keychain with many services',
        tags: <String>[TestTags.integration],
        () async {
          final walletSeed = generateRandomSeed();
          const endpoint = 'https://testnet.archethic.net';
          final apiService = ApiService(endpoint);
          final walletKeyPair = crypto.deriveKeyPair(walletSeed, 0);

          /// Generate keyChain Seed from random value
          final keychainSeed = uint8ListToHex(
            Uint8List.fromList(
              List<int>.generate(32, (int i) => Random.secure().nextInt(256)),
            ),
          );
          dev.log('keychainSeed: $keychainSeed');

          /// Many services for wallet
          const kServiceName1 = 'main-uco-1';
          const kDerivationPathWithoutIndex1 = "m/650'/$kServiceName1/";
          const index = '0';
          const kDerivationPath1 = '$kDerivationPathWithoutIndex1$index';
          dev.log('kDerivationPath1: $kDerivationPath1');

          const kServiceName2 = 'main-uco-2';
          const kDerivationPathWithoutIndex2 = "m/650'/$kServiceName2/";
          const kDerivationPath2 = '$kDerivationPathWithoutIndex2$index';
          dev.log('kDerivationPath2: $kDerivationPath2');

          const kServiceName3 = 'main-uco-3';
          const kDerivationPathWithoutIndex3 = "m/650'/$kServiceName3/";
          const kDerivationPath3 = '$kDerivationPathWithoutIndex3$index';
          dev.log('kDerivationPath3: $kDerivationPath3');

          final originPrivateKey = apiService.getOriginKey();
          dev.log('originPrivateKey: $originPrivateKey');

          final blockchainTxVersion = int.parse(
            (await apiService.getBlockchainVersion()).version.transaction,
          );

          /// Create Keychain from keyChain seed and wallet public key to encrypt secret
          final keychainTransaction = apiService.newKeychainTransaction(
            keychainSeed,
            <String>[
              uint8ListToHex(
                Uint8List.fromList(walletKeyPair.publicKey!),
              ),
            ],
            Uint8List.fromList(hexToUint8List(originPrivateKey)),
            blockchainTxVersion,
            servicesMap: {
              kServiceName1: kDerivationPath1,
              kServiceName2: kDerivationPath2,
              kServiceName3: kDerivationPath3,
            },
          );
          dev.log(
            'keychainTransaction: ${keychainTransaction.toNodeRPC()}',
          );

          /// Create Keychain Access for wallet
          final accessKeychainTx = apiService.newAccessKeychainTransaction(
            walletSeed,
            Uint8List.fromList(
              hexToUint8List(keychainTransaction.address!.address!),
            ),
            Uint8List.fromList(hexToUint8List(originPrivateKey)),
            blockchainTxVersion,
          );
          dev.log('accessKeychainTx: ${accessKeychainTx.toNodeRPC()}');

          await ArchethicTransactionSender(
            apiService: apiService,
          ).send(
            transaction: keychainTransaction,
          );

          await ArchethicTransactionSender(
            apiService: apiService,
          ).send(
            transaction: accessKeychainTx,
          );

          /// Get KeyChain Wallet
          final keychain = await apiService.getKeychain(walletSeed);

          expect(keychain.services.keys.elementAt(0), 'main-uco-1');
          expect(keychain.services.keys.elementAt(1), 'main-uco-2');
          expect(keychain.services.keys.elementAt(2), 'main-uco-3');
        },
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

        final txBuilt = keychain.buildTransaction(tx, 'uco', 0).transaction;

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
    },
  );

  test(
    'should create a keychain with version forced to 3',
    tags: <String>[TestTags.integration],
    () async {
      final walletSeed = generateRandomSeed();
      const endpoint = 'https://testnet.archethic.net';
      final apiService = ApiService(endpoint);
      final walletKeyPair = crypto.deriveKeyPair(walletSeed, 0);

      /// Generate keyChain Seed from random value
      final keychainSeed = uint8ListToHex(
        Uint8List.fromList(
          List<int>.generate(32, (int i) => Random.secure().nextInt(256)),
        ),
      );
      dev.log('keychainSeed: $keychainSeed');

      /// Many services for wallet
      const kServiceName1 = 'main-uco-1';
      const kDerivationPathWithoutIndex1 = "m/650'/$kServiceName1/";
      const index = '0';
      const kDerivationPath1 = '$kDerivationPathWithoutIndex1$index';
      dev.log('kDerivationPath1: $kDerivationPath1');

      const kServiceName2 = 'main-uco-2';
      const kDerivationPathWithoutIndex2 = "m/650'/$kServiceName2/";
      const kDerivationPath2 = '$kDerivationPathWithoutIndex2$index';
      dev.log('kDerivationPath2: $kDerivationPath2');

      const kServiceName3 = 'main-uco-3';
      const kDerivationPathWithoutIndex3 = "m/650'/$kServiceName3/";
      const kDerivationPath3 = '$kDerivationPathWithoutIndex3$index';
      dev.log('kDerivationPath3: $kDerivationPath3');

      final originPrivateKey = apiService.getOriginKey();
      dev.log('originPrivateKey: $originPrivateKey');

      // We simulate version 4
      const blockchainTxVersion = 4;

      /// Create Keychain from keyChain seed and wallet public key to encrypt secret
      final keychainTransaction = apiService.newKeychainTransaction(
        keychainSeed,
        <String>[
          uint8ListToHex(
            Uint8List.fromList(walletKeyPair.publicKey!),
          ),
        ],
        Uint8List.fromList(hexToUint8List(originPrivateKey)),
        blockchainTxVersion,
        servicesMap: {
          kServiceName1: kDerivationPath1,
          kServiceName2: kDerivationPath2,
          kServiceName3: kDerivationPath3,
        },
      );
      dev.log(
        'keychainTransaction: ${keychainTransaction.toNodeRPC()}',
      );

      /// Create Keychain Access for wallet
      final accessKeychainTx = apiService.newAccessKeychainTransaction(
        walletSeed,
        Uint8List.fromList(
          hexToUint8List(keychainTransaction.address!.address!),
        ),
        Uint8List.fromList(hexToUint8List(originPrivateKey)),
        blockchainTxVersion,
      );
      dev.log('accessKeychainTx: ${accessKeychainTx.toNodeRPC()}');

      await ArchethicTransactionSender(
        apiService: apiService,
      ).send(
        transaction: keychainTransaction,
      );

      await ArchethicTransactionSender(
        apiService: apiService,
      ).send(
        transaction: accessKeychainTx,
      );

      /// Get KeyChain Wallet
      final keychain = await apiService.getKeychain(walletSeed);

      expect(keychain.services.keys.elementAt(0), 'main-uco-1');
      expect(keychain.services.keys.elementAt(1), 'main-uco-2');
      expect(keychain.services.keys.elementAt(2), 'main-uco-3');
    },
  );
}
