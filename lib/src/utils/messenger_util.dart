/// SPDX-License-Identifier: AGPL-3.0-or-later
import 'dart:convert';
import 'dart:math';
import 'dart:typed_data';

import 'package:archethic_lib_dart/archethic_lib_dart.dart';
import 'package:archive/archive_io.dart';

mixin MessengerMixin {
  Future<Transaction> createNewSC({
    required Keychain keychain,
    required ApiService apiService,
    required List<String> usersPubKey,
    required String groupName,
    required List<String> adminsPubKey,
    required String adminAddress,
    required String serviceName,
  }) async {
    // Build SC Transaction
    final code = '''
              @version 1

              condition transaction: [
                
                previous_public_key: List.in?([
                ${usersPubKey.map((key) => '"$key"').join(', ')}
               ], 
                Chain.get_genesis_public_key(transaction.previous_public_key)
                )
               
              ]

              actions triggered_by: transaction do

              end

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

    final content = '''
{
  "groupName": "$groupName",                             
  "adminPublicKey": [${adminsPubKey.map((key) => '"$key"').join(', ')}]  
}
    ''';

    final cryptedContent =
        aesEncrypt(utf8.encode(content), messageGroupKeyAccess);
    final cryptedContentBase64 = base64.encode(cryptedContent);

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
      // ignore: use_string_buffers
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
            .setContent(cryptedContentBase64)
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

    await TransactionUtil().sendTransactions(
      transactions: [transactionTransferSigned, transactionSC],
      apiService: apiService,
    );

    return transactionSC;
  }

  Future<Transaction> buildMessageSendTransaction({
    required Keychain keychain,
    required ApiService apiService,
    required String scAddress,
    required String messageContent,
    required String senderAddress,
    required String senderServiceName,
    required KeyPair senderKeyPair,
  }) async {
    final message = '''
      {
        "compressionAlgo": "gzip",
        "message": "${await encodeMessage(message: messageContent, apiService: apiService, scAddress: scAddress, senderKeyPair: senderKeyPair)}"
      }
    ''';

    final tx = Transaction(type: 'transfer', data: Transaction.initData())
        .setContent(message)
        .addRecipient(scAddress);

    final indexMap = await apiService.getTransactionIndex(
      [senderAddress],
    );

    final index = indexMap[senderAddress] ?? 0;
    final originPrivateKey = apiService.getOriginKey();

    return keychain
        .buildTransaction(tx, senderServiceName, index)
        .originSign(originPrivateKey);
  }

  Future<Address> sendMessage({
    required Keychain keychain,
    required ApiService apiService,
    required String scAddress,
    required String messageContent,
    required String senderAddress,
    required String senderServiceName,
    required KeyPair senderKeyPair,
  }) async {
    final transaction = await buildMessageSendTransaction(
      keychain: keychain,
      apiService: apiService,
      scAddress: scAddress,
      messageContent: messageContent,
      senderAddress: senderAddress,
      senderServiceName: senderServiceName,
      senderKeyPair: senderKeyPair,
    );

    await TransactionUtil().sendTransactions(
      transactions: [transaction],
      apiService: apiService,
    );
    return transaction.address!;
  }

  Future<Uint8List> getMessageGroupKeyAccess({
    required ApiService apiService,
    required String scAddress,
    required KeyPair keyPair,
  }) async {
    // Get message key from SC secret
    final mapTransactionOwnerships =
        await apiService.getTransactionOwnerships([scAddress]);
    final ownerships = mapTransactionOwnerships[scAddress];
    if (ownerships == null && ownerships!.isEmpty) {
      throw Exception();
    }

    final authorizedPublicKey = ownerships[0].authorizedPublicKeys.firstWhere(
          (AuthorizedKey authKey) =>
              authKey.publicKey!.toUpperCase() ==
              uint8ListToHex(Uint8List.fromList(keyPair.publicKey!))
                  .toUpperCase(),
          orElse: AuthorizedKey.new,
        );
    if (authorizedPublicKey.encryptedSecretKey == null) {
      throw Exception();
    }
    final aesKey = ecDecrypt(
      authorizedPublicKey.encryptedSecretKey,
      Uint8List.fromList(keyPair.privateKey!),
    );
    return aesDecrypt(ownerships[0].secret, aesKey);
  }

  Future<String> encodeMessage({
    required String message,
    required ApiService apiService,
    required String scAddress,
    required KeyPair senderKeyPair,
  }) async {
    final messageGroupKeyAccess = await getMessageGroupKeyAccess(
      apiService: apiService,
      scAddress: scAddress,
      keyPair: senderKeyPair,
    );

    // Encode message with message key
    final stringPayload = utf8.encode(message);
    final compressedPayload = GZipEncoder().encode(stringPayload);
    final cryptedPayload = aesEncrypt(compressedPayload, messageGroupKeyAccess);
    return base64.encode(cryptedPayload);
  }

  Uint8List _decodeMessage(
    String compressedData,
    String messageGroupKeyAccess, {
    String compressionAlgo = '',
  }) {
    final payload = base64.decode(compressedData);
    final decryptedPayload = aesDecrypt(
      payload,
      messageGroupKeyAccess,
    );
    late List<int> decompressedPayload;
    switch (compressionAlgo) {
      case 'gzip':
        decompressedPayload = GZipDecoder().decodeBytes(decryptedPayload);
        break;
      default:
        decompressedPayload = decryptedPayload;
    }

    return Uint8List.fromList(decompressedPayload);
  }

  Future<List<AEMessage>> readMessages({
    required ApiService apiService,
    required String scAddress,
    required KeyPair readerKeyPair,
    int limit = 0,
    int pagingOffset = 0,
  }) async {
    final messagesList = await apiService.getTransactionInputs(
      [scAddress],
      limit: limit,
      pagingOffset: pagingOffset,
    );
    final txContentMessagesList =
        messagesList[scAddress] ?? <TransactionInput>[];
    final txContentMessagesAddresses = txContentMessagesList
        .where((txContentMessage) =>
            txContentMessage.from != null && txContentMessage.type == 'call')
        .map((txContentMessage) => txContentMessage.from)
        .whereType<String>()
        .toList();

    final aeMessages = <AEMessage>[];
    final contents = await apiService.getTransaction(
      txContentMessagesAddresses,
      request:
          ' address, chainLength, data { content }, previousPublicKey, validationStamp { timestamp } ',
    );

    if (contents.isEmpty) return [];

    final messageGroupKeyAccess = uint8ListToHex(
      await getMessageGroupKeyAccess(
        apiService: apiService,
        scAddress: scAddress,
        keyPair: readerKeyPair,
      ),
    );

    for (final contentMessageAddress in txContentMessagesAddresses) {
      final contentMessageTransaction = contents[contentMessageAddress];
      if (contentMessageTransaction == null) continue;

      final transactionContentIM = TransactionContentMessaging.fromJson(
        jsonDecode(contentMessageTransaction.data!.content!),
      );
      final message = utf8.decode(
        _decodeMessage(
          transactionContentIM.message,
          messageGroupKeyAccess,
          compressionAlgo: transactionContentIM.compressionAlgo,
        ),
      );

      final genesisPublicKeyMap = await apiService.getTransactionChain(
        {contentMessageTransaction.address!.address!: ''},
        request: 'previousPublicKey',
      );
      var genesisPublicKey = '';
      if (genesisPublicKeyMap.isNotEmpty &&
          genesisPublicKeyMap[contentMessageTransaction.address!.address!] !=
              null &&
          genesisPublicKeyMap[contentMessageTransaction.address!.address!]!
              .isNotEmpty) {
        genesisPublicKey =
            genesisPublicKeyMap[contentMessageTransaction.address!.address!]?[0]
                    .previousPublicKey ??
                '';
      }

      final aeMEssage = AEMessage(
        genesisPublicKey: genesisPublicKey,
        address: contentMessageTransaction.address!.address!,
        sender: contentMessageTransaction.previousPublicKey!,
        timestamp: contentMessageTransaction.validationStamp!.timestamp!,
        content: message,
      );

      aeMessages.add(
        aeMEssage,
      );
    }

    return aeMessages;
  }
}

class TransactionUtil with TransactionMixin {}
