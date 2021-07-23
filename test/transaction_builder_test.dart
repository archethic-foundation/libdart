library test.transaction_builder_test;

// Dart imports:
import 'dart:convert';
import 'dart:typed_data';

// Package imports:
import 'package:archethic_lib_dart/src/model/data.dart';
import 'package:test/test.dart';

// Project imports:
import 'package:archethic_lib_dart/src/crypto.dart' as crypto;
import 'package:archethic_lib_dart/src/model/balance.dart';
import 'package:archethic_lib_dart/src/model/crypto/key_pair.dart';
import 'package:archethic_lib_dart/src/model/node.dart';
import 'package:archethic_lib_dart/src/model/transaction.dart';
import 'package:archethic_lib_dart/src/services/api_service.dart';
import 'package:archethic_lib_dart/src/transaction_builder.dart';
import 'package:archethic_lib_dart/src/utils.dart';

Data initData = Data.fromJson({
  'content': '',
  'code': '',
  'keys': {
    'secret': '',
    'authorizedKeys': [
      {'encryptedKey': '', 'publicKey': ''}
    ]
  },
  'ledger': {
    'uco': {'transfers': []},
    'nft': {'transfers': []}
  },
  'recipients': []
});

void main() {
  group('Transaction builder', () {
    test('should assign type when create a new transaction instance', () {
      final Transaction tx = Transaction(type: 'transfer', data: initData);
      expect(tx.type, 'transfer');
    });

    group('setCode', () {
      test('should insert the code into the transaction data', () {
        final Transaction tx = Transaction(type: 'transfer', data: initData)
            .setCode('my smart contract code');
        expect(tx.data!.code!, 'my smart contract code');
      });
    });

    group('setContent', () {
      test('should insert the content into the transaction data', () {
        final Transaction tx = Transaction(type: 'transfer', data: initData)
            .setContent('my super content');
        expect(tx.data!.content!, 'my super content');
      });
    });
    group('setSecret', () {
      test('should insert the secret into the transaction data', () {
        final Transaction tx = Transaction(type: 'transfer', data: initData)
            .setSecret(
                '00501fa2db78bcf8ceca129e6139d7e38bf0d61eb905441056b9ebe6f1d1feaf88');
        expect(tx.data!.keys!.secret!,
            '00501fa2db78bcf8ceca129e6139d7e38bf0d61eb905441056b9ebe6f1d1feaf88');
      });
    });

    group('addAuthorizedKey', () {
      test('should add an authorized key to the transaction data', () {
        const String publicKey =
            '00b1d3750edb9381c96b1a975a55b5b4e4fb37bfab104c10b0b6c9a00433ec4646';
        const String encryptedKey =
            '00501fa2db78bcf8ceca129e6139d7e38bf0d61eb905441056b9ebe6f1d1feaf88';
        final Transaction tx = Transaction(type: 'transfer', data: initData)
            .addAuthorizedKey(publicKey, encryptedKey);

        expect(tx.data!.keys!.authorizedKeys![0].encryptedKey, encryptedKey);
      });
    });

    group('addUCOTransfer', () {
      test('should add an uco transfer to the transaction data', () {
        final Transaction tx = Transaction(type: 'transfer', data: initData)
            .addUCOTransfer(
                '00b1d3750edb9381c96b1a975a55b5b4e4fb37bfab104c10b0b6c9a00433ec4646',
                10.03);
        expect(tx.data!.ledger!.uco!.transfers!.length, 1);
        expect(
            tx.data!.ledger!.uco!.transfers![0].to,
            hexToUint8List(
                '00b1d3750edb9381c96b1a975a55b5b4e4fb37bfab104c10b0b6c9a00433ec4646'));
        expect(tx.data!.ledger!.uco!.transfers![0].amount, 10.03);
      });
    });
    group('addNFTTransfer', () {
      test('should add an nft transfer to the transaction data', () {
        final Transaction tx = Transaction(type: 'transfer', data: initData)
            .addNFTTransfer(
                '00b1d3750edb9381c96b1a975a55b5b4e4fb37bfab104c10b0b6c9a00433ec4646',
                10.03,
                '00b1d3750edb9381c96b1a975a55b5b4e4fb37bfab104c10b0b6c9a00433ec4646');
        expect(tx.data!.ledger!.nft!.transfers!.length, 1);
        expect(
            tx.data!.ledger!.nft!.transfers![0].to,
            hexToUint8List(
                '00b1d3750edb9381c96b1a975a55b5b4e4fb37bfab104c10b0b6c9a00433ec4646'));
        expect(tx.data!.ledger!.nft!.transfers![0].amount, 10.03);
        expect(
            tx.data!.ledger!.nft!.transfers![0].nft,
            hexToUint8List(
                '00b1d3750edb9381c96b1a975a55b5b4e4fb37bfab104c10b0b6c9a00433ec4646'));
      });
    });

    group('previousSignaturePayload', () {
      test('should generate binary encoding of the transaction before signing',
          () {
        const String code = '''
              condition inherit: [
                uco_transferred: 0.020
              ]

              actions triggered by: transaction do
                  set_type transfer
                  add_uco_ledger to: "0056E763190B28B4CF9AAF3324CF379F27DE9EF7850209FB59AA002D71BA09788A", amount: 0.020
              end
            ''';
        const String content =
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec sit amet leo egestas, lobortis lectus a, dignissim orci.';
        const String secret = 'mysecret';
        final Transaction tx = Transaction(type: 'transfer', data: initData)
            .addAuthorizedKey(
                '0000b1d3750edb9381c96b1a975a55b5b4e4fb37bfab104c10b0b6c9a00433ec4646',
                '00501fa2db78bcf8ceca129e6139d7e38bf0d61eb905441056b9ebe6f1d1feaf88')
            .setSecret(secret)
            .addUCOTransfer(
                '00b1d3750edb9381c96b1a975a55b5b4e4fb37bfab104c10b0b6c9a00433ec4646',
                0.2020)
            .addNFTTransfer(
                '00b1d3750edb9381c96b1a975a55b5b4e4fb37bfab104c10b0b6c9a00433ec4646',
                100,
                '00501fa2db78bcf8ceca129e6139d7e38bf0d61eb905441056b9ebe6f1d1feaf88')
            .setCode(code)
            .setContent(content)
            .addRecipient(
                '00501fa2db78bcf8ceca129e6139d7e38bf0d61eb905441056b9ebe6f1d1feaf88');

        final KeyPair keypair = crypto.deriveKeyPair('seed', 0);
        final KeyPair nextKeypair = crypto.deriveKeyPair('seed', 1);
        final Uint8List address = crypto.hash(nextKeypair.publicKey);

        tx.address = uint8ListToHex(address);
        tx.previousPublicKey = uint8ListToHex(keypair.publicKey);
        final Uint8List payload = tx.previousSignaturePayload();
        final Uint8List expectedBinary = concatUint8List(<Uint8List>[
          encodeInt32(1),
          hexToUint8List(tx.address!),
          Uint8List.fromList(<int>[253]),
          //Code size
          encodeInt32(code.length),
          Uint8List.fromList(utf8.encode(code)),
          //Content size
          encodeInt32(content.length),
          Uint8List.fromList(utf8.encode(content)),
          //Secret size
          encodeInt32(secret.length),
          Uint8List.fromList(utf8.encode(secret)),
          // Nb of authorized keys
          Uint8List.fromList(<int>[1]),
          // Authorized keys encoding
          concatUint8List(<Uint8List>[
            hexToUint8List(
                '0000b1d3750edb9381c96b1a975a55b5b4e4fb37bfab104c10b0b6c9a00433ec4646'),
            hexToUint8List(
                '00501fa2db78bcf8ceca129e6139d7e38bf0d61eb905441056b9ebe6f1d1feaf88')
          ]),
          // Nb of uco transfers
          Uint8List.fromList(<int>[1]),
          concatUint8List(<Uint8List>[
            hexToUint8List(
                '00b1d3750edb9381c96b1a975a55b5b4e4fb37bfab104c10b0b6c9a00433ec4646'),
            encodeFloat64(0.2020)
          ]),
          // Nb of NFT transfers
          Uint8List.fromList(<int>[1]),
          concatUint8List(<Uint8List>[
            hexToUint8List(
                '00501fa2db78bcf8ceca129e6139d7e38bf0d61eb905441056b9ebe6f1d1feaf88'),
            hexToUint8List(
                '00b1d3750edb9381c96b1a975a55b5b4e4fb37bfab104c10b0b6c9a00433ec4646'),
            encodeFloat64(100)
          ]),
          // Nb of recipients
          Uint8List.fromList(<int>[1]),
          hexToUint8List(
              '00501fa2db78bcf8ceca129e6139d7e38bf0d61eb905441056b9ebe6f1d1feaf88')
        ]);
        expect(payload, expectedBinary);
      });
    });

    group('build', () {
      test('should build the transaction and the related signature', () {
        final Transaction tx = Transaction(type: 'transfer', data: initData)
            .addAuthorizedKey(
                '0000b1d3750edb9381c96b1a975a55b5b4e4fb37bfab104c10b0b6c9a00433ec4646',
                '00501fa2db78bcf8ceca129e6139d7e38bf0d61eb905441056b9ebe6f1d1feaf88')
            .build('seed', 0, 'P256');
        expect(
            tx.address,
            hexToUint8List(
                '001680dab710eca8bc6b6c8025e57ebaf2d30c03d8d23a21ba7f8a157c365c5d49'));
        expect(
            tx.previousPublicKey,
            hexToUint8List(
                '0100044d91a0a1a7cf06a2902d3842f82d2791bcbf3ee6f6dc8de0f90e53e9991c3cb33684b7b9e66f26e7c9f5302f73c69897be5f301de9a63521a08ac4ef34c18728'));
        expect(
            crypto.verify(tx.previousSignature, tx.previousSignaturePayload(),
                tx.previousPublicKey),
            true);
      });
    });

    group('originSignaturePayload', () {
      test('should generate binary encoding of the transaction before signing',
          () {
        const String code = '''condition inherit: [
                            uco_transferred: 0.020
                          ]
                          
                          actions triggered by: transaction do
                              set_type transfer
                              add_uco_ledger to: "0056E763190B28B4CF9AAF3324CF379F27DE9EF7850209FB59AA002D71BA09788A", amount: 0.020
                          end
      ''';
        const String content =
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec sit amet leo egestas, lobortis lectus a, dignissim orci.';
        const String secret = 'mysecret';
        final Transaction tx = Transaction(type: 'transfer', data: initData)
            .addAuthorizedKey(
                '0000b1d3750edb9381c96b1a975a55b5b4e4fb37bfab104c10b0b6c9a00433ec4646',
                '00501fa2db78bcf8ceca129e6139d7e38bf0d61eb905441056b9ebe6f1d1feaf88')
            .setSecret('mysecret')
            .addUCOTransfer(
                '00b1d3750edb9381c96b1a975a55b5b4e4fb37bfab104c10b0b6c9a00433ec4646',
                0.2020)
            .addNFTTransfer(
                '00b1d3750edb9381c96b1a975a55b5b4e4fb37bfab104c10b0b6c9a00433ec4646',
                100,
                '00501fa2db78bcf8ceca129e6139d7e38bf0d61eb905441056b9ebe6f1d1feaf88')
            .setCode(code)
            .setContent(content)
            .addRecipient(
                '00501fa2db78bcf8ceca129e6139d7e38bf0d61eb905441056b9ebe6f1d1feaf88')
            .build('seed', 0, 'P256');

        final KeyPair transactionKeyPair = crypto.deriveKeyPair('seed', 0);
        final Uint8List previousSig = crypto.sign(
            tx.previousSignaturePayload(), transactionKeyPair.privateKey);
        final Uint8List payload = tx.originSignaturePayload();
        final Uint8List expectedBinary = concatUint8List(<Uint8List>[
          // Version
          encodeInt32(1),
          hexToUint8List(tx.address!),
          Uint8List.fromList(<int>[253]),
          //Code size
          encodeInt32(code.length),
          Uint8List.fromList(utf8.encode(code)),
          //Content size
          encodeInt32(content.length),
          Uint8List.fromList(utf8.encode(content)),
          //Secret size
          encodeInt32(secret.length),
          Uint8List.fromList(utf8.encode(secret)),
          // Nb of authorized keys
          Uint8List.fromList(<int>[1]),
          // Authorized keys encoding
          concatUint8List(<Uint8List>[
            hexToUint8List(
                '0000b1d3750edb9381c96b1a975a55b5b4e4fb37bfab104c10b0b6c9a00433ec4646'),
            hexToUint8List(
                '00501fa2db78bcf8ceca129e6139d7e38bf0d61eb905441056b9ebe6f1d1feaf88')
          ]),
          // Nb of uco transfers
          Uint8List.fromList(<int>[1]),
          concatUint8List(<Uint8List>[
            hexToUint8List(
                '00b1d3750edb9381c96b1a975a55b5b4e4fb37bfab104c10b0b6c9a00433ec4646'),
            encodeFloat64(0.2020)
          ]),
          // Nb of NFT transfers
          Uint8List.fromList(<int>[1]),
          concatUint8List(<Uint8List>[
            hexToUint8List(
                '00501fa2db78bcf8ceca129e6139d7e38bf0d61eb905441056b9ebe6f1d1feaf88'),
            hexToUint8List(
                '00b1d3750edb9381c96b1a975a55b5b4e4fb37bfab104c10b0b6c9a00433ec4646'),
            encodeFloat64(100)
          ]),
          // Nb of recipients
          Uint8List.fromList(<int>[1]),
          hexToUint8List(
              '00501fa2db78bcf8ceca129e6139d7e38bf0d61eb905441056b9ebe6f1d1feaf88'),
          transactionKeyPair.publicKey,
          Uint8List.fromList(<int>[previousSig.length]),
          previousSig
        ]);
        expect(payload, expectedBinary);
      });
    });

    group('originSign', () {
      test('should sign the transaction with a origin private key', () {
        final KeyPair originKeypair = crypto.deriveKeyPair('origin_seed', 0);

        final Transaction tx = Transaction(type: 'transfer', data: initData)
            .build('seed', 0, 'P256')
            .originSign(originKeypair.privateKey);
        expect(
            crypto.verify(tx.originSignature, tx.originSignaturePayload(),
                originKeypair.publicKey),
            true);
      });
    });

    group('toJSON', () {
      test('should return a JSON from the transaction', () {
        final KeyPair originKeypair = crypto.deriveKeyPair('origin_seed', 0);
        final KeyPair transactionKeyPair = crypto.deriveKeyPair('seed', 0);
        final KeyPair nextTransactionKeyPair = crypto.deriveKeyPair('seed', 1);

        final Transaction tx = Transaction(type: 'transfer', data: initData)
            .addAuthorizedKey(
                '0000b1d3750edb9381c96b1a975a55b5b4e4fb37bfab104c10b0b6c9a00433ec4646',
                '00501fa2db78bcf8ceca129e6139d7e38bf0d61eb905441056b9ebe6f1d1feaf88')
            .addUCOTransfer(
                '00b1d3750edb9381c96b1a975a55b5b4e4fb37bfab104c10b0b6c9a00433ec4646',
                0.2193)
            .build('seed', 0, 'P256')
            .originSign(originKeypair.privateKey);

        final parsedTx = json.decode(TransactionBuilder.toJSON(tx));

        final Uint8List previousSig = crypto.sign(
            tx.previousSignaturePayload(), transactionKeyPair.privateKey);
        final Uint8List originSig =
            crypto.sign(tx.originSignaturePayload(), originKeypair.privateKey);

        expect(parsedTx['address'],
            uint8ListToHex(crypto.hash(nextTransactionKeyPair.publicKey)));
        expect(parsedTx['type'], 'transfer');
        expect(parsedTx['previousPublicKey'],
            uint8ListToHex(transactionKeyPair.publicKey));
        expect(parsedTx['previousSignature'], uint8ListToHex(previousSig));
        expect(parsedTx['originSignature'], uint8ListToHex(originSig));
        expect(
            parsedTx['data']['keys']['authorizedKeys'][
                '0000b1d3750edb9381c96b1a975a55b5b4e4fb37bfab104c10b0b6c9a00433ec4646'],
            '00501fa2db78bcf8ceca129e6139d7e38bf0d61eb905441056b9ebe6f1d1feaf88');
        expect(parsedTx['data']['ledger']['uco']['transfers'][0], {
          'to':
              '00b1d3750edb9381c96b1a975a55b5b4e4fb37bfab104c10b0b6c9a00433ec4646',
          'amount': 0.2193
        });
      });
    });
  });

  /*
  group('api', () {
    test('getTransactionIndex', () async {
      final int chainLength = await ApiService('http://localhost:4000')
          .getTransactionIndex(
              '009D337E3557833E116750524738E07063256F27ECA993AF8011DAFE4E69A37A7D');
      expect(chainLength, 1);
    });

    test('getStorageNoncePublicKey', () async {
      final String storageNoncePublicKey =
          await ApiService('http://localhost:4000').getStorageNoncePublicKey();

      expect(
        storageNoncePublicKey,
        '00004BA72C106818CC3A75961559CA03B10ECCFFCD6684062F4BE0355C153055595D',
      );
    });

    test('fetchBalance', () async {
      final Balance balance = await ApiService('http://localhost:4000')
          .fetchBalance(
              '00AE1C7EABBB5282B1DFEA4A330947D5D9A954F942700C28A06BCA8F2A1CDF800D');

      expect(
        balance.uco,
        0,
      );
    });

    test('getTransactionContent', () async {
      final String content = await ApiService('http://localhost:4000')
          .getTransactionContent(
              '00AE1C7EABBB5282B1DFEA4A330947D5D9A954F942700C28A06BCA8F2A1CDF800D');

      expect(
        content,
        'B0B116A90BBA010076A5A8A4B33AE08D325CD509D6DBEBD336364999D5357D6DD6392B07AD64E0EE0047304502207A6663334659C8FFB7695433B93D18EC5ECF487AB1CF2324573974028E5DBE71022100AB52E547E945B59EB850E586A0CFD2F1378938E8EAFFF8C9F283A607DC517B75',
      );
    });

    test('getTransactions', () async {
      final List<Transaction> transactionChain =
          await ApiService('http://localhost:4000').getTransactionChain(
              '009D337E3557833E116750524738E07063256F27ECA993AF8011DAFE4E69A37A7D',
              0);

      expect(
        transactionChain[0].address,
        '009D337E3557833E116750524738E07063256F27ECA993AF8011DAFE4E69A37A7D',
      );
    });

    test('getNodeList', () async {
      List<Node> nodes =
          await ApiService('http://localhost:4000').getNodeList();

      expect(
        nodes![0].ip,
        '127.0.0.1',
      );
    });
  });*/
}
