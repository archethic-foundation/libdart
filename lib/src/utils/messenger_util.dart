/// SPDX-License-Identifier: AGPL-3.0-or-later
import 'dart:convert';
import 'dart:developer' as dev;
import 'dart:typed_data';

import 'package:archethic_lib_dart/archethic_lib_dart.dart';
import 'package:archive/archive_io.dart';

/// For group discussions, a dedicated transaction chain will contain a smart contract and its updates, as well as the discussion's rules and description.
/// The messages will be contained in the inputs of the smart contracts in the chain.
/// A general public key for accessing messages is made available.
mixin MessengerMixin {
  Future<Transaction> createTransactionSC({
    required Keychain keychain,
    required ApiService apiService,
    required List<String> membersPubKey,
    required String discussionName,
    required List<String> adminsPubKey,
    required String adminAddress,
    required String serviceName,
    int indexSCTransaction = 0,
  }) async {
    /// AESKey (32-byte (256-bit) random key) manages message access (encryption/decryption)
    final discussionKeyAccess = generateRandomAESKey();

    /// AESKey (32-byte (256-bit) random key) manages SC secrets
    final aesKey = generateRandomAESKey();

    final membersAuthorizedKeys = _addMembersInAuthorized(
      aesKey: aesKey,
      membersPubKey: membersPubKey,
    );

    /// Seed of the Smart Contract
    final storageNoncePublicKey = await apiService.getStorageNoncePublicKey();
    final seedSC = generateRandomSeed();

    final scAuthorizedKeys = List<AuthorizedKey>.empty(growable: true);
    scAuthorizedKeys.add(
      AuthorizedKey(
        publicKey: storageNoncePublicKey,
        encryptedSecretKey:
            uint8ListToHex(ecEncrypt(aesKey, storageNoncePublicKey)),
      ),
    );

    final originPrivateKey = apiService.getOriginKey();

    /// Create a new transaction typed Smart Contract to manage a discussion
    final transactionSC = Transaction(
      type: 'contract',
      data: Transaction.initData(),
    )
        .setCode(_getDiscussionSCCode(membersPubKey: membersPubKey))
        .setContent(
          _getDiscussionSCContent(
            discussionName: discussionName,
            adminsPubKey: adminsPubKey,
            discussionKeyAccess: discussionKeyAccess,
          ),
        )

        /// Secret 1 : DiscussionKeyAccess only accessible by the discussion's members
        .addOwnership(
          uint8ListToHex(
            aesEncrypt(discussionKeyAccess, aesKey),
          ),
          membersAuthorizedKeys,
        )

        /// Secret 2 : Seed of the SC only accessible by nodes
        .addOwnership(
          uint8ListToHex(
            aesEncrypt(seedSC, aesKey),
          ),
          scAuthorizedKeys,
        )
        .build(seedSC, indexSCTransaction)
        .originSign(originPrivateKey);

    // Estimation of fees and send to SC's transaction chain
    final transactionTransferSigned = await _provisionSC(
      apiService: apiService,
      issuerAddress: adminAddress,
      keychain: keychain,
      originPrivateKey: originPrivateKey,
      seedSC: seedSC,
      serviceName: serviceName,
      transactionSC: transactionSC,
    );

    await TransactionUtil().sendTransactions(
      transactions: [transactionTransferSigned, transactionSC],
      apiService: apiService,
    );

    return transactionSC;
  }

  String _getDiscussionSCCode({
    required List<String> membersPubKey,
  }) {
    /// A discussion is represented and managed by a smart contract.
    /// This smart contract contains a code that lists the public keys authorized to send transactions to the smart contract
    /// This prevents messages from unauthorized persons from being integrated as contract inputs into the smart contract.
    return '''
@version 1

condition transaction: [             
  previous_public_key: List.in?([
    ${membersPubKey.map((key) => '"$key"').join(', ')}
    ], 
    Chain.get_genesis_public_key(transaction.previous_public_key)
  )               
]

actions triggered_by: transaction do

end

''';
  }

  /// A discussion is represented and managed by a smart contract.
  /// This smart contract contains a content that descrives discussion's properties:
  /// - Name of the discussion
  /// - lists the public keys of the admin
  String _getDiscussionSCContent({
    required String discussionName,
    required List<String> adminsPubKey,
    required String discussionKeyAccess,
  }) {
    final content = '''
{
  "discussionName": "$discussionName",                             
  "adminPublicKey": [${adminsPubKey.map((key) => '"$key"').join(', ')}]  
}
    ''';

    /// Only members of the discussion could decrypted discussion's properties
    /// We encrypt content with discussionKeyAccess + encode in Base64
    final cryptedContent =
        aesEncrypt(utf8.encode(content), discussionKeyAccess);
    final cryptedContentBase64 = base64.encode(cryptedContent);
    return cryptedContentBase64;
  }

  List<AuthorizedKey> _addMembersInAuthorized({
    required String aesKey,
    required List<String> membersPubKey,
  }) {
    final membersAuthorizedKeys = <AuthorizedKey>[];
    for (final key in membersPubKey) {
      membersAuthorizedKeys.add(
        AuthorizedKey(
          encryptedSecretKey: uint8ListToHex(ecEncrypt(aesKey, key)),
          publicKey: key,
        ),
      );
    }
    return membersAuthorizedKeys;
  }

  Future<Transaction> _provisionSC({
    required Keychain keychain,
    required ApiService apiService,
    required Transaction transactionSC,
    required String seedSC,
    required String issuerAddress,
    required String serviceName,
    required String originPrivateKey,
  }) async {
    // Estimation of fees and send to SC's transaction chain
    const slippage = 1.01;
    final transactionFee = await apiService.getTransactionFee(transactionSC);
    final fees = fromBigInt(transactionFee.fee) * slippage;
    final genesisAddressSC = deriveAddress(seedSC, 0);
    final transactionTransfer =
        Transaction(type: 'transfer', data: Transaction.initData())
            .addUCOTransfer(genesisAddressSC, toBigInt(fees));

    final indexMap = await apiService.getTransactionIndex(
      [issuerAddress],
    );

    return keychain
        .buildTransaction(
          transactionTransfer,
          serviceName,
          indexMap[issuerAddress] ?? 0,
        )
        .originSign(originPrivateKey);
  }

  Future<({Transaction transaction, int transactionIndex})>
      buildMessageSendTransaction({
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
        "message": "${await _encodeMessage(message: messageContent, apiService: apiService, scAddress: scAddress, senderKeyPair: senderKeyPair)}"
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

    return (
      transaction: keychain
          .buildTransaction(tx, senderServiceName, index)
          .originSign(originPrivateKey),
      transactionIndex: index + 1,
    );
  }

  Future<({Address transactionAddress, int transactionIndex})> send({
    required Keychain keychain,
    required ApiService apiService,
    required String scAddress,
    required String messageContent,
    required String senderAddress,
    required String senderServiceName,
    required KeyPair senderKeyPair,
  }) async {
    final result = await buildMessageSendTransaction(
      keychain: keychain,
      apiService: apiService,
      scAddress: scAddress,
      messageContent: messageContent,
      senderAddress: senderAddress,
      senderServiceName: senderServiceName,
      senderKeyPair: senderKeyPair,
    );

    final transaction = result.transaction;
    await TransactionUtil().sendTransactions(
      transactions: [transaction],
      apiService: apiService,
    );
    return (
      transactionAddress: transaction.address!,
      transactionIndex: result.transactionIndex,
    );
  }

  Future<AEDiscussion?> getDiscussionFromSCAddress({
    required ApiService apiService,
    required String scAddress,
    required KeyPair keyPair,
  }) async {
    final smartContractMap = await apiService.getTransaction([scAddress]);
    if (smartContractMap[scAddress] == null) {
      return null;
    }

    try {
      final discussionKeyAccess = await _getDiscussionKeyAccess(
        apiService: apiService,
        scAddress: scAddress,
        keyPair: keyPair,
      );

      final smartContract = smartContractMap[scAddress];

      final cryptedContent = base64.decode(smartContract!.data!.content!);

      final content = utf8.decode(
        aesDecrypt(cryptedContent, discussionKeyAccess),
      );
      final jsonContentMap = jsonDecode(content);

      final usersPubKey = <String>[];
      for (final authorizedPublicKey
          in smartContract.data!.ownerships[0].authorizedPublicKeys) {
        usersPubKey.add(authorizedPublicKey.publicKey!);
      }

      final aeDiscussion = AEDiscussion(
        address: smartContract.address!.address!,
        discussionName: jsonContentMap['discussionName'],
        usersPubKey: usersPubKey,
        adminPublicKey: List<String>.from(jsonContentMap['adminPublicKey']),
        timestampLastUpdate: smartContract.validationStamp!.timestamp!,
      );

      return aeDiscussion;
    } catch (e) {
      dev.log(e.toString());
      return null;
    }
  }

  /// This method get the AES Key used to encrypt and decrypt informations in the discussion (messages, discussion's properties)
  Future<Uint8List> _getDiscussionKeyAccess({
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

  /// This method encrypt a message with the AES Key ()
  Future<String> _encodeMessage({
    required String message,
    required ApiService apiService,
    required String scAddress,
    required KeyPair senderKeyPair,
  }) async {
    final discussionKeyAccess = await _getDiscussionKeyAccess(
      apiService: apiService,
      scAddress: scAddress,
      keyPair: senderKeyPair,
    );

    // Encode message with message key
    final stringPayload = utf8.encode(message);
    final compressedPayload = GZipEncoder().encode(stringPayload);
    final cryptedPayload = aesEncrypt(compressedPayload, discussionKeyAccess);
    return base64.encode(cryptedPayload);
  }

  Uint8List _decodeMessage(
    String compressedData,
    String discussionKeyAccess, {
    String compressionAlgo = '',
  }) {
    final payload = base64.decode(compressedData);
    final decryptedPayload = aesDecrypt(
      payload,
      discussionKeyAccess,
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

  Future<List<AEMessage>> read({
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
        .where(
          (txContentMessage) =>
              txContentMessage.from != null && txContentMessage.type == 'call',
        )
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

    final discussionKeyAccess = uint8ListToHex(
      await _getDiscussionKeyAccess(
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
          discussionKeyAccess,
          compressionAlgo: transactionContentIM.compressionAlgo,
        ),
      );

      final senderGenesisPublicKeyMap = await apiService.getTransactionChain(
        {contentMessageTransaction.address!.address!: ''},
        request: 'previousPublicKey',
      );
      var senderGenesisPublicKey = '';
      if (senderGenesisPublicKeyMap.isNotEmpty &&
          senderGenesisPublicKeyMap[
                  contentMessageTransaction.address!.address!] !=
              null &&
          senderGenesisPublicKeyMap[
                  contentMessageTransaction.address!.address!]!
              .isNotEmpty) {
        senderGenesisPublicKey = senderGenesisPublicKeyMap[
                    contentMessageTransaction.address!.address!]?[0]
                .previousPublicKey ??
            '';
      }

      final aeMEssage = AEMessage(
        senderGenesisPublicKey: senderGenesisPublicKey,
        address: contentMessageTransaction.address!.address!,
        sender: contentMessageTransaction.previousPublicKey!,
        timestampCreation:
            contentMessageTransaction.validationStamp!.timestamp!,
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
