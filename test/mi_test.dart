library mi.api_test;

import 'dart:convert';
import 'dart:developer' as dev;
import 'dart:math';
import 'dart:typed_data';

import 'package:archethic_lib_dart/archethic_lib_dart.dart';
import 'package:archethic_lib_dart/util/transaction_util.dart';
import 'package:test/test.dart';

import 'ae_message.dart';
import 'transaction_content_im.dart';

Future<Transaction> _createNewSC({
  required String endpoint,
  required List<String> usersPubKey,
  required String groupName,
  required List<String> adminsPubKey,
  required String keychainSeed,
  required String adminAddress,
  required String serviceName,
}) async {
  final apiService = ApiService(endpoint);

  // Build SC Transaction
  final code = '''
              @version 1

              condition transaction: [
                
                previous_public_key: List.in?([
                ${adminsPubKey.map((key) => '"$key"').join(', ')}
               ], 
                Chain.get_genesis_public_key(transaction.previous_public_key)
                )
               
              ]

              actions triggered_by: transaction do

              end

            ''';
  final content = '''
	          "groupName": "$groupName",                             
            "adminPublicKey": [${adminsPubKey.map((key) => '"$key"').join(', ')}]  
            ''';

  final aesKey = uint8ListToHex(
    Uint8List.fromList(
      List<int>.generate(32, (int i) => Random.secure().nextInt(256)),
    ),
  );

  final messageGroupKeyAccess = uint8ListToHex(
    Uint8List.fromList(
      List<int>.generate(32, (int i) => Random.secure().nextInt(256)),
    ),
  );

  final authorizedPublicKeys = List<String>.empty(growable: true)
    ..addAll(usersPubKey);

  final contactsAuthorizedKeys = List<AuthorizedKey>.empty(growable: true);
  for (final key in authorizedPublicKeys) {
    contactsAuthorizedKeys.add(
      AuthorizedKey(
        encryptedSecretKey: uint8ListToHex(ecEncrypt(aesKey, key)),
        publicKey: key,
      ),
    );
  }

  final storageNoncePublicKey = await apiService.getStorageNoncePublicKey();
  var seedSC = '';
  const chars = 'abcdef0123456789';
  final rng = Random.secure();
  for (var i = 0; i < 64; i++) {
    seedSC += chars[rng.nextInt(chars.length)];
  }

  final scAuthorizedKeys = List<AuthorizedKey>.empty(growable: true);
  scAuthorizedKeys.add(
    AuthorizedKey(
      encryptedSecretKey:
          uint8ListToHex(ecEncrypt(aesKey, storageNoncePublicKey)),
      publicKey: storageNoncePublicKey,
    ),
  );

  final originPrivateKey = apiService.getOriginKey();

  final transactionSC =
      Transaction(type: 'contract', data: Transaction.initData())
          .setCode(code)
          .setContent(content)
          .addOwnership(
            uint8ListToHex(
              aesEncrypt(messageGroupKeyAccess, aesKey),
            ),
            contactsAuthorizedKeys,
          )
          .addOwnership(
            uint8ListToHex(
              aesEncrypt(seedSC, aesKey),
            ),
            scAuthorizedKeys,
          )
          .build(seedSC, 0)
          .originSign(originPrivateKey);

  // Estimation of fees
  const slippage = 1.01;
  final transactionFee = await apiService.getTransactionFee(transactionSC);
  final fees = fromBigInt(transactionFee.fee) * slippage;
  final genesisAddressSC = deriveAddress(seedSC, 0);
  final transactionTransfer =
      Transaction(type: 'transfer', data: Transaction.initData())
          .addUCOTransfer(genesisAddressSC, toBigInt(fees));

  final keychain = await apiService.getKeychain(
    keychainSeed,
  );

  final indexMap = await apiService.getTransactionIndex(
    [adminAddress],
  );

  final transactionTransferSigned = keychain
      .buildTransaction(
        transactionTransfer,
        serviceName,
        indexMap[adminAddress] ?? 0,
      )
      .originSign(originPrivateKey);

  try {
    await TestTransactionMixin().sendTransactions(
      transactions: [transactionTransferSigned, transactionSC],
      apiService: apiService,
    );
  } catch (e) {
    dev.log('error$e');
  }

  return transactionSC;
}

Future<void> _sendMessage({
  required String endpoint,
  required String scAddress,
  required String messageContent,
  required String keychainSeed,
  required String senderAddress,
  required String senderServiceName,
}) async {
  final apiService = ApiService(endpoint);

  final message = '''
      {
        "compressionAlgo": "gzip",
        "message": "$messageContent"
      }
    ''';

  final tx = Transaction(type: 'transfer', data: Transaction.initData())
      .setContent(message)
      .addRecipient(scAddress);

  final keychain = await apiService.getKeychain(
    keychainSeed,
  );

  final indexMap = await apiService.getTransactionIndex(
    [senderAddress],
  );

  final index = indexMap[senderAddress] ?? 0;
  final originPrivateKey = apiService.getOriginKey();

  final transactionSC = keychain
      .buildTransaction(tx, senderServiceName, index)
      .originSign(originPrivateKey);

  try {
    await TestTransactionMixin().sendTransactions(
      transactions: [transactionSC],
      apiService: apiService,
    );
  } catch (e) {
    dev.log('error$e');
  }
}

Future<void> _readMessages({
  required String endpoint,
  required String scAddress,
}) async {
  final apiService = ApiService(endpoint);

  final messagesList = await apiService.getTransactionInputs([scAddress]);
  final txContentMessagesList = messagesList[scAddress] ?? <TransactionInput>[];
  final txContentMessagesAddresses = <String>[];
  for (final txContentMessages in txContentMessagesList) {
    if (txContentMessages.from != null && txContentMessages.type == 'call') {
      txContentMessagesAddresses.add(txContentMessages.from!);
    }
  }

  try {
    final aeMessages = <AEMessage>[];
    final contents = await apiService.getTransaction(
      txContentMessagesAddresses,
      request: '  data { content }',
    );
    contents.forEach((key, value) {
      aeMessages.add(
        AEMessage(
          content:
              TransactionContentIM.fromJson(jsonDecode(value.data!.content!))
                  .message,
        ),
      );
    });

    for (final aeMessage in aeMessages) {
      dev.log(aeMessage.content);
    }
  } catch (e) {
    dev.log('error$e');
  }
}

void main() {
  group('mi', () {
    test('createNewSCTestnet', () async {
      final tx = await _createNewSC(
        endpoint: 'https://testnet.archethic.net',
        usersPubKey: [
          '0000A78DC064FAD98277B6B2FE0C2EB09B1292DE13DFFCE1AA3991F67803D14415F6',
          '0000FD5BCC80A8E7C689487597D3DE0FD9910B087910437E4D1AAB543E9CEDEF49F9',
          '0000C3B2EA5B16F1CF2791FA6F4536E90BFD00D3B5596575FEB5B2448A4C7DC2DEF0'
        ],
        groupName: 'testGroup',
        adminsPubKey: [
          '0000A78DC064FAD98277B6B2FE0C2EB09B1292DE13DFFCE1AA3991F67803D14415F6'
        ],
        keychainSeed:
            '8CAC8029F526FD4E4856E00161882F9F9F6B81B7C9221BB8529690FDCB642F03',
        adminAddress:
            '00008C64EE10053C34E7B5679D3BD935616B45D910FDBBC46A2516709CBB375DF703',
        serviceName: 'archethic-wallet-ALICE',
      );

      expect(
        tx.version,
        1,
      );
    });
  });

  test('sendMessageTestnet', () async {
    await _sendMessage(
      endpoint: 'https://testnet.archethic.net',
      keychainSeed:
          '8CAC8029F526FD4E4856E00161882F9F9F6B81B7C9221BB8529690FDCB642F03',
      messageContent: 'First message',
      scAddress:
          '00000162D81A8BADB078C430693DF1D8ED6A9F6FC9D484A0CCCD5935E353D2275362',
      senderAddress:
          '00008C64EE10053C34E7B5679D3BD935616B45D910FDBBC46A2516709CBB375DF703',
      senderServiceName: 'archethic-wallet-ALICE',
    );
  });

  test('createNewSCLocal', () async {
    final tx = await _createNewSC(
      endpoint: 'http://localhost:4000',
      usersPubKey: [
        '00008601B566BA8580B03D4AF47C96DD36686FC7BBB0309D4BB6B5C54C0E7B97736E'
      ],
      groupName: 'testGroup2',
      adminsPubKey: [
        '00008601B566BA8580B03D4AF47C96DD36686FC7BBB0309D4BB6B5C54C0E7B97736E'
      ],
      keychainSeed:
          '41DBFF0EFDBF47AF74FBEC260CB824C933B17344E68063A09B8F18981BE0CD60',
      adminAddress:
          '00000162D81A8BADB078C430693DF1D8ED6A9F6FC9D484A0CCCD5935E353D2275362',
      serviceName: 'archethic-wallet-TEST',
    );

    expect(
      tx.version,
      1,
    );
  });

  test('sendMessageLocal', () async {
    await _sendMessage(
      endpoint: 'http://localhost:4000',
      keychainSeed:
          '41DBFF0EFDBF47AF74FBEC260CB824C933B17344E68063A09B8F18981BE0CD60',
      messageContent: '2ème message',
      scAddress:
          '0000b10fc71eed07212d1a93646774b9e406c97fa0d9574cf22149815ab8cfc635d3',
      senderAddress:
          '00000162D81A8BADB078C430693DF1D8ED6A9F6FC9D484A0CCCD5935E353D2275362',
      senderServiceName: 'archethic-wallet-TEST',
    );
  });

  test('readMessagesLocal', () async {
    await _readMessages(
      endpoint: 'http://localhost:4000',
      scAddress:
          '0000b10fc71eed07212d1a93646774b9e406c97fa0d9574cf22149815ab8cfc635d3',
    );
  });
}

class TestTransactionMixin with TransactionMixin {}
