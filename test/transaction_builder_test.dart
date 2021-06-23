library test.transaction_builder_test;

// Dart imports:
import 'dart:convert';
import 'dart:typed_data';

// Package imports:
import 'package:flutter_test/flutter_test.dart';

// Project imports:
import 'package:archethic_lib_dart/crypto.dart' as crypto;
import 'package:archethic_lib_dart/model/key_pair.dart';
import 'package:archethic_lib_dart/transaction_builder.dart';
import 'package:archethic_lib_dart/utils.dart';

void main() {
  group('Transaction builder', () {
    test('should assign type when create a new transaction instance', () {
      final TransactionBuilder tx = TransactionBuilder('transfer');
      expect(tx.type, 'transfer');
    });

    group('setCode', () {
      test('should insert the code into the transaction data', () {
        final TransactionBuilder tx =
            TransactionBuilder('transfer').setCode('my smart contract code');
        expect(utf8.decode(tx.data!.code!), 'my smart contract code');
      });
    });

    group('setContent', () {
      test('should insert the content into the transaction data', () {
        final TransactionBuilder tx =
            TransactionBuilder('transfer').setContent('my super content');
        expect(utf8.decode(tx.data!.content!), 'my super content');
      });
    });
    group('setSecret', () {
      test('should insert the secret into the transaction data', () {
        final TransactionBuilder tx = TransactionBuilder('transfer').setSecret(
            '00501fa2db78bcf8ceca129e6139d7e38bf0d61eb905441056b9ebe6f1d1feaf88');
        expect(
            tx.data!.keys!.secret!,
            hexToUint8List(
                '00501fa2db78bcf8ceca129e6139d7e38bf0d61eb905441056b9ebe6f1d1feaf88'));
      });
    });

    group('addAuthorizedKey', () {
      test('should add an authorized key to the transaction data', () {
        const String publicKey =
            '00b1d3750edb9381c96b1a975a55b5b4e4fb37bfab104c10b0b6c9a00433ec4646';
        const String encryptedKey =
            '00501fa2db78bcf8ceca129e6139d7e38bf0d61eb905441056b9ebe6f1d1feaf88';
        final TransactionBuilder tx = TransactionBuilder('transfer')
            .addAuthorizedKey(publicKey, encryptedKey);
        expect(tx.data!.keys!.authorizedKeys![publicKey],
            hexToUint8List(encryptedKey));
      });
    });

    group('addUCOTransfer', () {
      test('should add an uco transfer to the transaction data', () {
        final TransactionBuilder tx = TransactionBuilder('transfer').addUCOTransfer(
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
        final TransactionBuilder tx = TransactionBuilder('transfer').addNFTTransfer(
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
        final TransactionBuilder tx = TransactionBuilder('transfer')
            .addAuthorizedKey(
                '00b1d3750edb9381c96b1a975a55b5b4e4fb37bfab104c10b0b6c9a00433ec4646',
                '00501fa2db78bcf8ceca129e6139d7e38bf0d61eb905441056b9ebe6f1d1feaf88')
            .setSecret('mysecret')
            .addUCOTransfer(
                '00b1d3750edb9381c96b1a975a55b5b4e4fb37bfab104c10b0b6c9a00433ec4646',
                0.2020)
            .addNFTTransfer(
                '00b1d3750edb9381c96b1a975a55b5b4e4fb37bfab104c10b0b6c9a00433ec4646',
                100,
                '00501fa2db78bcf8ceca129e6139d7e38bf0d61eb905441056b9ebe6f1d1feaf88')
            .setCode('condition inherit: next_transaction.uco_transfered == 0.020' +
                '  actions triggered by: transaction do' +
                '      set_type transfer' +
                '      add_uco_ledger to: "0056E763190B28B4CF9AAF3324CF379F27DE9EF7850209FB59AA002D71BA09788A", amount: 0.020' +
                ' end')
            .setContent(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec sit amet leo egestas, lobortis lectus a, dignissim orci.')
            .addRecipient(
                '00501fa2db78bcf8ceca129e6139d7e38bf0d61eb905441056b9ebe6f1d1feaf88');

        final KeyPair keypair = crypto.deriveKeyPair('seed', 0);
        final KeyPair nextKeypair = crypto.deriveKeyPair('seed', 1);
        final Uint8List address = crypto.hash(nextKeypair.publicKey);

        tx.address = address;
        tx.previousPublicKey = keypair.publicKey;
        tx.timestamp = DateTime.now().millisecondsSinceEpoch;
        final Uint8List payload = tx.previousSignaturePayload();
        final Uint8List expectedBinary = concatUint8List([
          tx.address!,
          Uint8List.fromList([2]),
          encodeBigInt(BigInt.from(tx.timestamp!)),
          //Code size
          encodeInt32(232),
          Uint8List.fromList(utf8.encode(
              'condition inherit: next_transaction.uco_transfered == 0.020' +
                  '  actions triggered by: transaction do' +
                  '      set_type transfer' +
                  '      add_uco_ledger to: "0056E763190B28B4CF9AAF3324CF379F27DE9EF7850209FB59AA002D71BA09788A", amount: 0.020' +
                  ' end')),
          //Content size
          encodeInt32(119),
          Uint8List.fromList(utf8.encode(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec sit amet leo egestas, lobortis lectus a, dignissim orci.')),
          //Secret size
          encodeInt32(8),
          Uint8List.fromList(utf8.encode('mysecret')),
          // Nb of authorized keys
          Uint8List.fromList([1]),
          // Authorized keys encoding
          concatUint8List([
            hexToUint8List(
                '00b1d3750edb9381c96b1a975a55b5b4e4fb37bfab104c10b0b6c9a00433ec4646'),
            hexToUint8List(
                '00501fa2db78bcf8ceca129e6139d7e38bf0d61eb905441056b9ebe6f1d1feaf88')
          ]),
          // Nb of uco transfers
          Uint8List.fromList([1]),
          concatUint8List([
            hexToUint8List(
                '00b1d3750edb9381c96b1a975a55b5b4e4fb37bfab104c10b0b6c9a00433ec4646'),
            encodeFloat64(0.2020)
          ]),
          // Nb of NFT transfers
          Uint8List.fromList([1]),
          concatUint8List([
            hexToUint8List(
                '00501fa2db78bcf8ceca129e6139d7e38bf0d61eb905441056b9ebe6f1d1feaf88'),
            hexToUint8List(
                '00b1d3750edb9381c96b1a975a55b5b4e4fb37bfab104c10b0b6c9a00433ec4646'),
            encodeFloat64(100)
          ]),
          // Nb of recipients
          Uint8List.fromList([1]),
          hexToUint8List(
              '00501fa2db78bcf8ceca129e6139d7e38bf0d61eb905441056b9ebe6f1d1feaf88')
        ]);
        print('payload       : ' + payload.toString());
        print('expectedBinary: ' + expectedBinary.toString());
        expect(payload, expectedBinary);
      });
    });

    group('build', () {
      test('should build the transaction and the related signature', () {
        final TransactionBuilder tx = TransactionBuilder('transfer')
            .addAuthorizedKey(
                '00b1d3750edb9381c96b1a975a55b5b4e4fb37bfab104c10b0b6c9a00433ec4646',
                '00501fa2db78bcf8ceca129e6139d7e38bf0d61eb905441056b9ebe6f1d1feaf88')
            .build('seed', 0);

        expect(
            tx.address,
            hexToUint8List(
                '008bddf96c474c096b818386c9a515ad376cca38a19bfbcfafb802a4cd9753dea8'));
        expect(
            tx.previousPublicKey,
            hexToUint8List(
                '00462664092eea75241c889db84ab9732068d37c3d521e4890fecabe9c614a81fa'));
        expect(
            crypto.verify(tx.previousSignature, tx.previousSignaturePayload(),
                tx.previousPublicKey),
            true);
      });
    });

    group('originSignaturePayload', () {
      test('should generate binary encoding of the transaction before signing',
          () {
        final TransactionBuilder tx = TransactionBuilder('transfer')
            .addAuthorizedKey(
                '00b1d3750edb9381c96b1a975a55b5b4e4fb37bfab104c10b0b6c9a00433ec4646',
                '00501fa2db78bcf8ceca129e6139d7e38bf0d61eb905441056b9ebe6f1d1feaf88')
            .setSecret('mysecret')
            .addUCOTransfer(
                '00b1d3750edb9381c96b1a975a55b5b4e4fb37bfab104c10b0b6c9a00433ec4646',
                0.2020)
            .addNFTTransfer(
                '00b1d3750edb9381c96b1a975a55b5b4e4fb37bfab104c10b0b6c9a00433ec4646',
                100,
                '00501fa2db78bcf8ceca129e6139d7e38bf0d61eb905441056b9ebe6f1d1feaf88')
            .setCode('condition inherit: next_transaction.uco_transfered == 0.020' +
                '  actions triggered by: transaction do' +
                '      set_type transfer' +
                '      add_uco_ledger to: "0056E763190B28B4CF9AAF3324CF379F27DE9EF7850209FB59AA002D71BA09788A", amount: 0.020' +
                ' end')
            .setContent(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec sit amet leo egestas, lobortis lectus a, dignissim orci.')
            .addRecipient(
                '00501fa2db78bcf8ceca129e6139d7e38bf0d61eb905441056b9ebe6f1d1feaf88')
            .build('seed', 0);

        final KeyPair transactionKeyPair = crypto.deriveKeyPair('seed', 0);
        final Uint8List previousSig = crypto.sign(
            tx.previousSignaturePayload(), transactionKeyPair.privateKey);

        final Uint8List payload = tx.originSignaturePayload();

        final Uint8List expectedBinary = concatUint8List([
          tx.address!,
          Uint8List.fromList([2]),
          encodeBigInt(BigInt.from(tx.timestamp!)),
          //Code size
          encodeInt32(232),
          Uint8List.fromList(utf8.encode(
              'condition inherit: next_transaction.uco_transfered == 0.020' +
                  '  actions triggered by: transaction do' +
                  '      set_type transfer' +
                  '      add_uco_ledger to: "0056E763190B28B4CF9AAF3324CF379F27DE9EF7850209FB59AA002D71BA09788A", amount: 0.020' +
                  ' end')),
          //Content size
          encodeInt32(119),
          Uint8List.fromList(utf8.encode(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec sit amet leo egestas, lobortis lectus a, dignissim orci.')),
          //Secret size
          encodeInt32(8),
          Uint8List.fromList(utf8.encode('mysecret')),
          // Nb of authorized keys
          Uint8List.fromList([1]),
          // Authorized keys encoding
          concatUint8List([
            hexToUint8List(
                '00b1d3750edb9381c96b1a975a55b5b4e4fb37bfab104c10b0b6c9a00433ec4646'),
            hexToUint8List(
                '00501fa2db78bcf8ceca129e6139d7e38bf0d61eb905441056b9ebe6f1d1feaf88')
          ]),
          // Nb of uco transfers
          Uint8List.fromList([1]),
          concatUint8List([
            hexToUint8List(
                '00b1d3750edb9381c96b1a975a55b5b4e4fb37bfab104c10b0b6c9a00433ec4646'),
            encodeFloat64(0.2020)
          ]),
          // Nb of NFT transfers
          Uint8List.fromList([1]),
          concatUint8List([
            hexToUint8List(
                '00501fa2db78bcf8ceca129e6139d7e38bf0d61eb905441056b9ebe6f1d1feaf88'),
            hexToUint8List(
                '00b1d3750edb9381c96b1a975a55b5b4e4fb37bfab104c10b0b6c9a00433ec4646'),
            encodeFloat64(100)
          ]),
          // Nb of recipients
          Uint8List.fromList([1]),
          hexToUint8List(
              '00501fa2db78bcf8ceca129e6139d7e38bf0d61eb905441056b9ebe6f1d1feaf88'),
          transactionKeyPair.publicKey,
          Uint8List.fromList([previousSig.length]),
          previousSig
        ]);
        expect(payload, expectedBinary);
      });
    });

    group('originSign', () {
      test('should sign the transaction with a origin private key', () {
        final KeyPair originKeypair = crypto.deriveKeyPair('origin_seed', 0);

        final TransactionBuilder tx = TransactionBuilder('transfer')
            .build('seed', 0)
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

        final TransactionBuilder tx = TransactionBuilder('transfer')
            .addAuthorizedKey(
                '00b1d3750edb9381c96b1a975a55b5b4e4fb37bfab104c10b0b6c9a00433ec4646',
                '00501fa2db78bcf8ceca129e6139d7e38bf0d61eb905441056b9ebe6f1d1feaf88')
            .addUCOTransfer(
                '00b1d3750edb9381c96b1a975a55b5b4e4fb37bfab104c10b0b6c9a00433ec4646',
                0.2193)
            .build('seed', 0)
            .originSign(originKeypair.privateKey);

        final parsedTx = json.decode(tx.toJSON());

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
                '00b1d3750edb9381c96b1a975a55b5b4e4fb37bfab104c10b0b6c9a00433ec4646'],
            '00501fa2db78bcf8ceca129e6139d7e38bf0d61eb905441056b9ebe6f1d1feaf88');
        expect(parsedTx['data']['ledger']['uco']['transfers'][0], {
          'to':
              '00b1d3750edb9381c96b1a975a55b5b4e4fb37bfab104c10b0b6c9a00433ec4646',
          'amount': 0.2193
        });
      });
    });
  });
}
