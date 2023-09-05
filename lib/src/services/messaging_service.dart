/// SPDX-License-Identifier: AGPL-3.0-or-later
import 'package:archethic_lib_dart/src/model/address.dart';
import 'package:archethic_lib_dart/src/model/crypto/key_pair.dart';
import 'package:archethic_lib_dart/src/model/keychain.dart';
import 'package:archethic_lib_dart/src/model/messaging/ae_discussion.dart';
import 'package:archethic_lib_dart/src/model/messaging/ae_message.dart';
import 'package:archethic_lib_dart/src/model/transaction.dart';
import 'package:archethic_lib_dart/src/services/api_service.dart';
import 'package:archethic_lib_dart/src/utils/messenger_util.dart';

class MessagingService with MessengerMixin {
  MessagingService({
    this.logsActivation = true,
  });

  /// [logsActivation] manage log activation
  final bool logsActivation;

  /// Create a new discussion
  /// @param{Keychain} keychain used to send transaction to BC
  /// @param{ApiService} API with blockchain
  /// @param{List<String>} List of ALL members of the discussion (public key)
  /// @param{String} name of the discussion
  /// @param{List<String>} List of ALL admins of the discussion (public key)
  /// @param{String} Address of the admin who want to add members (this address will provision the SC's chain to manage fees)
  /// @param{String} Service name in the current keychain (= admin)
  Future<Transaction> createDiscussion({
    required Keychain keychain,
    required ApiService apiService,
    required List<String> membersPubKey,
    required String discussionName,
    required List<String> adminsPubKey,
    required String adminAddress,
    required String serviceName,
  }) async {
    return createTransactionSC(
      keychain: keychain,
      apiService: apiService,
      membersPubKey: membersPubKey,
      discussionName: discussionName,
      adminsPubKey: adminsPubKey,
      adminAddress: adminAddress,
      serviceName: serviceName,
    );
  }

  /// Update an existing discussion
  /// @param{Keychain} keychain used to send transaction to BC
  /// @param{ApiService} API with blockchain
  /// @param{String} Smart contract's address
  /// @param{List<String>} List of ALL members of the discussion (public key)
  /// @param{String} name of the discussion
  /// @param{List<String>} List of ALL admins of the discussion (public key)
  /// @param{String} Address of the admin who want to add members (this address will provision the SC's chain to manage fees)
  /// @param{String} Service name in the current keychain (= admin)
  Future<Transaction> updateDiscussion({
    required Keychain keychain,
    required ApiService apiService,
    required String discussionSCAddress,
    required List<String> membersPubKey,
    required String discussionName,
    required List<String> adminsPubKey,
    required String serviceName,
    required KeyPair adminKeyPair,
  }) async {
    return updateTransactionSC(
      keychain: keychain,
      apiService: apiService,
      discussionSCAddress: discussionSCAddress,
      discussionName: discussionName,
      adminsPubKey: adminsPubKey,
      serviceName: serviceName,
      adminKeyPair: adminKeyPair,
    );
  }

  /// Read messages in existing discussion
  /// @param{ApiService} API with blockchain
  /// @param{String} Smart contract's address
  /// @param{KeyPair} Keypair of the reader
  /// @param{limit}
  /// @param{pagingOffset}
  Future<List<AEMessage>> readMessages({
    required ApiService apiService,
    required String discussionSCAddress,
    required KeyPair readerKeyPair,
    int limit = 0,
    int pagingOffset = 0,
  }) async {
    return read(
      apiService: apiService,
      scAddress: discussionSCAddress,
      readerKeyPair: readerKeyPair,
      limit: limit,
      pagingOffset: pagingOffset,
    );
  }

  /// Read messages in existing discussion
  /// @param{Keychain} keychain used to send transaction to BC
  /// @param{ApiService} API with blockchain
  /// @param{String} Smart contract's address
  /// @param{String} Content of the message (no encrypt)
  /// @param{String} Address of the member who want to send message
  /// @param{String} Service name in the current keychain (= sender)
  /// @param{KeyPair} Keypair of the sender
  Future<({Address transactionAddress, int transactionIndex})> sendMessage({
    required Keychain keychain,
    required ApiService apiService,
    required String discussionSCAddress,
    required String messageContent,
    required String senderAddress,
    required String senderServiceName,
    required KeyPair senderKeyPair,
  }) async {
    return send(
      keychain: keychain,
      apiService: apiService,
      scAddress: discussionSCAddress,
      messageContent: messageContent,
      senderAddress: senderAddress,
      senderServiceName: senderServiceName,
      senderKeyPair: senderKeyPair,
    );
  }

  /// Get a discussion from an address
  /// @param{ApiService} API with blockchain
  /// @param{String} Smart contract's address
  /// @param{KeyPair} Keypair of the requester to check if discussion's content can be decrypt
  Future<AEDiscussion?> getDiscussion({
    required ApiService apiService,
    required String discussionSCAddress,
    required KeyPair keyPair,
  }) async {
    return getDiscussionFromSCAddress(
      apiService: apiService,
      scAddress: discussionSCAddress,
      keyPair: keyPair,
    );
  }

  /// Build a message
  /// @param{ApiService} API with blockchain
  /// @param{String} Smart contract's address
  /// @param{KeyPair} Keypair of the requester to check if discussion's content can be decrypt
  Future<({Transaction transaction, int transactionIndex})> buildMessage({
    required Keychain keychain,
    required ApiService apiService,
    required String discussionSCAddress,
    required String messageContent,
    required String senderAddress,
    required String senderServiceName,
    required KeyPair senderKeyPair,
  }) async {
    return buildMessageSendTransaction(
      keychain: keychain,
      apiService: apiService,
      scAddress: discussionSCAddress,
      messageContent: messageContent,
      senderAddress: senderAddress,
      senderServiceName: senderServiceName,
      senderKeyPair: senderKeyPair,
    );
  }
}
