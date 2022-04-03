/// SPDX-License-Identifier: AGPL-3.0-or-later

// Dart imports:
import 'dart:async';
import 'dart:developer' as dev;
import 'dart:math';
import 'dart:typed_data';

// Package imports:
import 'package:absinthe_socket/absinthe_socket.dart';
import 'package:http/http.dart' as http show Response, post;

// Project imports:
import 'package:archethic_lib_dart/src/model/authorized_key.dart';
import 'package:archethic_lib_dart/src/model/balance.dart';
import 'package:archethic_lib_dart/src/model/crypto/key_pair.dart';
import 'package:archethic_lib_dart/src/model/node.dart';
import 'package:archethic_lib_dart/src/model/response/balance_response.dart';
import 'package:archethic_lib_dart/src/model/response/network_transactions_response.dart';
import 'package:archethic_lib_dart/src/model/response/nodes_response.dart';
import 'package:archethic_lib_dart/src/model/response/shared_secrets_response.dart';
import 'package:archethic_lib_dart/src/model/response/transaction_chain_response.dart';
import 'package:archethic_lib_dart/src/model/response/transaction_content_response.dart';
import 'package:archethic_lib_dart/src/model/response/transaction_inputs_response.dart';
import 'package:archethic_lib_dart/src/model/response/transaction_last_response.dart';
import 'package:archethic_lib_dart/src/model/transaction.dart';
import 'package:archethic_lib_dart/src/model/transaction_fee.dart';
import 'package:archethic_lib_dart/src/model/transaction_input.dart';
import 'package:archethic_lib_dart/src/model/transaction_status.dart';
import 'package:archethic_lib_dart/src/utils/crypto.dart' as crypto;
import 'package:archethic_lib_dart/src/utils/utils.dart' as utils;

class ApiService {
  ApiService(this.endpoint);

  /// [endpoint] is the HTTP URL to a ArchEthic node (acting as welcome node)
  String? endpoint;

  /// Send a transaction to the network
  /// @param {Object} tx Transaction to send
  Future<TransactionStatus> sendTx(Transaction transaction) async {
    final Completer<TransactionStatus> _completer =
        Completer<TransactionStatus>();
    final Map<String, String> requestHeaders = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
    };
    TransactionStatus transactionStatus = TransactionStatus();
    dev.log('sendTx: requestHttp.body=' + transaction.convertToJSON());
    try {
      final http.Response responseHttp = await http.post(
          Uri.parse(endpoint! + '/api/transaction'),
          body: transaction.convertToJSON(),
          headers: requestHeaders);
      dev.log('sendTx: responseHttp.body=' + responseHttp.body);
      transactionStatus = transactionStatusFromJson(responseHttp.body);

      _completer.complete(transactionStatus);
    } catch (e) {
      dev.log(e.toString());
    }

    return _completer.future;
  }

  /// Query the network to find the last transaction from an address
  /// @param {String} The address scalar type represents a cryptographic hash used in the ArchEthic network with an identification byte to specify from which algorithm the hash was generated. The Hash appears in a JSON response as Base16 formatted string. The parsed hash will be converted to a binary and any invalid hash with an invalid algorithm or invalid size will be rejected
  Future<Transaction> getLastTransaction(String address) async {
    final Completer<Transaction> _completer = Completer<Transaction>();
    TransactionLastResponse transactionLastResponse = TransactionLastResponse();
    Transaction? lastTransaction = Transaction(
        type: '', chainLength: 0, data: Transaction.initData(), address: '');
    final Map<String, String> requestHeaders = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
    };
    try {
      final String _body =
          '{"query": "query {lastTransaction(address: \\"$address\\") { ' +
              Transaction.getQLFields() +
              ' } }"}';
      dev.log('getTransactionIndex: requestHttp.body=' + _body);
      final http.Response responseHttp = await http.post(
          Uri.parse(endpoint! + '/api'),
          body: _body,
          headers: requestHeaders);
      dev.log('getTransactionIndex: responseHttp.body=' + responseHttp.body);
      if (responseHttp.statusCode == 200) {
        transactionLastResponse =
            transactionLastResponseFromJson(responseHttp.body);
        if (transactionLastResponse.data != null &&
            transactionLastResponse.data!.lastTransaction != null) {
          lastTransaction = transactionLastResponse.data!.lastTransaction;
        }
      }
    } catch (e) {
      dev.log('getTransactionIndex: error=' + e.toString());
    }

    _completer.complete(lastTransaction);
    return _completer.future;
  }

  /// getStorageNoncePublicKey
  Future<String> getStorageNoncePublicKey() async {
    final Completer<String> _completer = Completer<String>();
    String _storageNoncePublicKey = '';
    SharedSecretsResponse sharedSecretsResponse = SharedSecretsResponse();

    final Map<String, String> requestHeaders = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
    };

    try {
      const String _body =
          '{"query": "query {sharedSecrets {storageNoncePublicKey}}"}';
      dev.log('getStorageNoncePublicKey: requestHttp.body=' + _body);
      final http.Response responseHttp = await http.post(
          Uri.parse(endpoint! + '/api'),
          body: _body,
          headers: requestHeaders);
      dev.log(
          'getStorageNoncePublicKey: responseHttp.body=' + responseHttp.body);
      if (responseHttp.statusCode == 200) {
        sharedSecretsResponse =
            sharedSecretsResponseFromJson(responseHttp.body);
        if (sharedSecretsResponse.data != null &&
            sharedSecretsResponse.data!.storageNoncePublicKey != null) {
          _storageNoncePublicKey =
              sharedSecretsResponse.data!.storageNoncePublicKey!;
        }
      }
    } catch (e) {
      dev.log('getStorageNoncePublicKey: error=' + e.toString());
    }

    _completer.complete(_storageNoncePublicKey);
    return _completer.future;
  }

  /// Query the network to find a balance from an address
  /// @param {String} The address scalar type represents a cryptographic hash used in the ArchEthic network with an identification byte to specify from which algorithm the hash was generated. The Hash appears in a JSON response as Base16 formatted string. The parsed hash will be converted to a binary and any invalid hash with an invalid algorithm or invalid size will be rejected
  /// Returns [Balance] represents a ledger balance. It includes: UCO: uco balance & NFT: NFT balances
  Future<Balance> fetchBalance(String address) async {
    final Completer<Balance> _completer = Completer<Balance>();
    BalanceResponse? balanceResponse;
    Balance? balance = Balance();

    final Map<String, String> requestHeaders = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
    };

    final String _body =
        '{"query": "query {balance(address: \\"$address\\") {uco, nft {address, amount}}}"}';
    dev.log('fetchBalance: requestHttp.body=' + _body);

    try {
      final http.Response responseHttp = await http.post(
          Uri.parse(endpoint! + '/api'),
          body: _body,
          headers: requestHeaders);
      dev.log('fetchBalance: responseHttp.body=' + responseHttp.body);

      if (responseHttp.statusCode == 200) {
        balanceResponse = balanceResponseFromJson(responseHttp.body);
        if (balanceResponse.data != null) {
          balance = balanceResponse.data!.balance;
        }
      }
    } catch (e) {
      dev.log('fetchBalance: error=' + e.toString());
    }

    _completer.complete(balance);
    return _completer.future;
  }

  /// Query the network to find a transaction
  /// @param {String} The address scalar type represents a cryptographic hash used in the ArchEthic network with an identification byte to specify from which algorithm the hash was generated. The Hash appears in a JSON response as Base16 formatted string. The parsed hash will be converted to a binary and any invalid hash with an invalid algorithm or invalid size will be rejected
  /// Returns the content scalar type represents transaction content. Depending if the content can displayed it will be rendered as plain text otherwise in hexadecimal
  Future<String> getTransactionContent(String address) async {
    final Completer<String> _completer = Completer<String>();
    String _content = '';
    TransactionContentResponse? transactionContentResponse =
        TransactionContentResponse();

    final Map<String, String> requestHeaders = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
    };

    final String _body =
        '{"query":"query { transaction(address: \\"$address\\") { data { content }} }"}';
    dev.log('getTransactionContent: requestHttp.body=' + _body);

    try {
      final http.Response responseHttp = await http.post(
          Uri.parse(endpoint! + '/api'),
          body: _body,
          headers: requestHeaders);
      dev.log('getTransactionContent: responseHttp.body=' + responseHttp.body);

      if (responseHttp.statusCode == 200) {
        transactionContentResponse =
            transactionContentResponseFromJson(responseHttp.body);
        if (transactionContentResponse.data != null &&
            transactionContentResponse.data!.transaction != null &&
            transactionContentResponse.data!.transaction!.data != null) {
          _content =
              transactionContentResponse.data!.transaction!.data!.content!;
        }
      }
    } catch (e) {
      dev.log('getTransactionContent: error=' + e.toString());
    }

    _completer.complete(_content);
    return _completer.future;
  }

  /// Query the network to find a transaction chain
  /// @param {String} The address scalar type represents a cryptographic hash used in the ArchEthic network with an identification byte to specify from which algorithm the hash was generated. The Hash appears in a JSON response as Base16 formatted string. The parsed hash will be converted to a binary and any invalid hash with an invalid algorithm or invalid size will be rejected
  /// @param {int} The page
  /// Returns the content scalar type represents transaction content [List<Transaction>]. Depending if the content can displayed it will be rendered as plain text otherwise in hexadecimal
  Future<List<Transaction>> getTransactionChain(
      String address, int page) async {
    final Completer<List<Transaction>> _completer =
        Completer<List<Transaction>>();
    TransactionChainResponse? transactionChainResponse =
        TransactionChainResponse();
    List<Transaction> transactionChain =
        List<Transaction>.empty(growable: true);
    final Map<String, String> requestHeaders = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
    };

    final String _body =
        '{"query":"query { transactionChain(address: \\"$address\\", page: $page) { ' +
            Transaction.getQLFields() +
            ' } }"}';
    dev.log('getTransactionChain: requestHttp.body=' + _body);

    try {
      final http.Response responseHttp = await http.post(
          Uri.parse(endpoint! + '/api'),
          body: _body,
          headers: requestHeaders);
      dev.log('getTransactionChain: responseHttp.body=' + responseHttp.body);

      if (responseHttp.statusCode == 200) {
        transactionChainResponse =
            transactionChainResponseFromJson(responseHttp.body);
        if (transactionChainResponse.data != null &&
            transactionChainResponse.data!.transactionChain != null) {
          transactionChain = transactionChainResponse.data!.transactionChain!;
        }
      }
    } catch (e) {
      dev.log('getTransactionChain: error=' + e.toString());
    }

    _completer.complete(transactionChain);
    return _completer.future;
  }

  /// Query the node infos
  /// Returns a [List<Node>] with infos
  Future<List<Node>> getNodeList() async {
    final Completer<List<Node>> _completer = Completer<List<Node>>();
    NodesResponse nodesResponse = NodesResponse();
    List<Node> nodesList = List<Node>.empty(growable: true);

    final Map<String, String> requestHeaders = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
    };

    try {
      const String _body =
          '{"query": "query {nodes {authorized available averageAvailability firstPublicKey geoPatch ip lastPublicKey networkPatch port rewardAddress authorizationDate enrollmentDate}}"}';
      dev.log('getNodeList: requestHttp.body=' + _body);
      final http.Response responseHttp = await http.post(
          Uri.parse(endpoint! + '/api'),
          body: _body,
          headers: requestHeaders);
      dev.log('getNodeList: responseHttp.body=' + responseHttp.body);
      if (responseHttp.statusCode == 200) {
        nodesResponse = nodesResponseFromJson(responseHttp.body);
        if (nodesResponse.data != null) {
          nodesList = nodesResponse.data!.nodes!;
        }
      }
    } catch (e) {
      dev.log('getNodeList: error=' + e.toString());
    }

    _completer.complete(nodesList);
    return _completer.future;
  }

  /// Query the network to list the transaction on the type
  /// @param {String} The type of transaction
  /// @param {int} The page
  /// Returns the content scalar type represents transaction content [List<Transaction>]. Depending if the content can displayed it will be rendered as plain text otherwise in hexadecimal
  Future<List<Transaction>> networkTransactions(String type, int page) async {
    final Completer<List<Transaction>> _completer =
        Completer<List<Transaction>>();
    NetworkTransactionsResponse? networkTransactionsResponse =
        NetworkTransactionsResponse();
    List<Transaction> transactionsList =
        List<Transaction>.empty(growable: true);
    final Map<String, String> requestHeaders = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
    };

    final String _body =
        '{"query":"query { networkTransactions(type: \\"$type\\", page: $page) { ' +
            Transaction.getQLFields() +
            ' } }"}';
    dev.log('networkTransactions: requestHttp.body=' + _body);

    try {
      final http.Response responseHttp = await http.post(
          Uri.parse(endpoint! + '/api'),
          body: _body,
          headers: requestHeaders);
      dev.log('networkTransactions: responseHttp.body=' + responseHttp.body);

      if (responseHttp.statusCode == 200) {
        networkTransactionsResponse =
            networkTransactionsResponseFromJson(responseHttp.body);
        if (networkTransactionsResponse.data != null) {
          transactionsList =
              networkTransactionsResponse.data!.networkTransactions!;
        }
      }
    } catch (e) {
      dev.log('networkTransactions: error=' + e.toString());
    }

    _completer.complete(transactionsList);
    return _completer.future;
  }

  /// Query the network to list the transaction inputs from an address
  /// @param {String} The address scalar type represents a cryptographic hash used in the ArchEthic network with an identification byte to specify from which algorithm the hash was generated. The Hash appears in a JSON response as Base16 formatted string. The parsed hash will be converted to a binary and any invalid hash with an invalid algorithm or invalid size will be rejected
  Future<List<TransactionInput>> getTransactionInputs(String address) async {
    final Completer<List<TransactionInput>> _completer =
        Completer<List<TransactionInput>>();
    List<TransactionInput> transactionInputs =
        List<TransactionInput>.empty(growable: true);
    TransactionInputsResponse transactionInputsResponse =
        TransactionInputsResponse();
    final Map<String, String> requestHeaders = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
    };
    try {
      final String _body =
          '{"query":"query { transactionInputs(address: \\"$address\\") { amount, from, nftAddress, spent, timestamp, type } }"}';
      dev.log('getTransactionInputs: requestHttp.body=' + _body);
      final http.Response responseHttp = await http.post(
          Uri.parse(endpoint! + '/api'),
          body: _body,
          headers: requestHeaders);
      dev.log('getTransactionInputs: responseHttp.body=' + responseHttp.body);
      if (responseHttp.statusCode == 200) {
        transactionInputsResponse =
            transactionInputsResponseFromJson(responseHttp.body);
        transactionInputs = transactionInputsResponse.data!.transactionInputs!;
      }
    } catch (e) {
      dev.log('getTransactionInputs: error=' + e.toString());
    }

    _completer.complete(transactionInputs);
    return _completer.future;
  }

  /// Create a keychain and an access keychain using the initial passphrase
  /// @param {String | Uint8List} passphrase Initial access passphrase
  /// @param {String} originPrivateKey Origin private key
  /// @returns Keychain transaction address

  Future<String?> createKeychain(passphrase, originPrivateKey) async {
    final Uint8List accessKeychainSeed = crypto.hash(passphrase);
    final KeyPair publicKey =
        crypto.deriveKeyPair(utils.uint8ListToHex(accessKeychainSeed), 0);

    final Uint8List keychainSeed = Uint8List.fromList(
        List<int>.generate(12, (int i) => Random.secure().nextInt(32)));
    final String keychainAddress =
        crypto.deriveAddress(utils.uint8ListToHex(keychainSeed), 0);

    final Uint8List accessKeychainAesKey = Uint8List.fromList(
        List<int>.generate(32, (int i) => Random.secure().nextInt(256)));

    Transaction accessKeychainTx = Transaction(
            type: 'keychain_access', data: Transaction.initData())
        .addOwnership(
            crypto.aesEncrypt(
                keychainAddress, utils.uint8ListToHex(accessKeychainAesKey)),
            [
              AuthorizedKey(
                  publicKey: utils.uint8ListToHex(publicKey.publicKey),
                  encryptedSecretKey: utils.uint8ListToHex(crypto.ecEncrypt(
                      publicKey.publicKey,
                      utils.concatUint8List(<Uint8List>[
                        Uint8List.fromList([0]),
                        accessKeychainAesKey
                      ]))))
            ])
        .build(utils.uint8ListToHex(accessKeychainSeed), 0, curve: 'P256')
        .originSign(originPrivateKey);

    KeyPair keyPair2 =
        crypto.deriveKeyPair(utils.uint8ListToHex(keychainSeed), 0);

    final Uint8List keychainAesKey = Uint8List.fromList(
        List<int>.generate(32, (int i) => Random.secure().nextInt(256)));

    Transaction keyChainTx =
        Transaction(type: 'keychain', data: Transaction.initData())
            .addOwnership(crypto.aesEncrypt(keychainSeed, keychainAesKey), [
              AuthorizedKey(
                  publicKey: utils.uint8ListToHex(publicKey.publicKey),
                  encryptedSecretKey: utils.uint8ListToHex(
                      crypto.ecEncrypt(keychainAesKey, publicKey.publicKey))),
              AuthorizedKey(
                  publicKey: utils.uint8ListToHex(keyPair2.publicKey),
                  encryptedSecretKey: utils.uint8ListToHex(
                      crypto.ecEncrypt(keychainAesKey, keyPair2.publicKey)))
            ])
            .build(utils.uint8ListToHex(keychainSeed), 0, curve: 'P256')
            .originSign(originPrivateKey);

    TransactionStatus ts1 = await sendTx(accessKeychainTx);
    TransactionStatus ts2 = await sendTx(keyChainTx);
    if (ts1.status == 'ok' && ts2.status == 'ok') {
      return keyChainTx.address;
    } else {
      throw ('Something goes wrong !');
    }
  }

  /// Query the network to find a transaction
  /// @param {String} The address scalar type represents a cryptographic hash used in the ArchEthic network with an identification byte to specify from which algorithm the hash was generated. The Hash appears in a JSON response as Base16 formatted string. The parsed hash will be converted to a binary and any invalid hash with an invalid algorithm or invalid size will be rejected
  /// Returns all informations represent transaction content.
  Future<Transaction> getTransactionAllInfos(String address) async {
    final Completer<Transaction> _completer = Completer<Transaction>();
    Transaction? transaction;

    final Map<String, String> requestHeaders = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
    };

    final String _body =
        '{"query":"query { transaction(address: \\"$address\\") {' +
            Transaction.getQLFields() +
            '} }"}';
    dev.log('getTransactionAllInfos: requestHttp.body=' + _body);

    try {
      final http.Response responseHttp = await http.post(
          Uri.parse(endpoint! + '/api'),
          body: _body,
          headers: requestHeaders);
      dev.log('getTransactionAllInfos: responseHttp.body=' + responseHttp.body);

      if (responseHttp.statusCode == 200) {
        TransactionContentResponse transactionResponse =
            transactionContentResponseFromJson(responseHttp.body);
        if (transactionResponse.data != null &&
            transactionResponse.data!.transaction != null) {
          transaction = transactionResponse.data!.transaction;
        }
      }
    } catch (e) {
      dev.log('getTransactionAllInfos: error=' + e.toString());
    }

    _completer.complete(transaction);
    return _completer.future;
  }

  /// Get transaction fees
  /// @param {Object} tx Transaction to estimate fees
  Future<TransactionFee> getTransactionFee(Transaction transaction) async {
    final Completer<TransactionFee> _completer = Completer<TransactionFee>();
    final Map<String, String> requestHeaders = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
    };
    TransactionFee transactionFee = TransactionFee();
    final http.Response responseHttp = await http.post(
        Uri.parse(endpoint! + '/api/transaction_fee'),
        body: transaction.convertToJSON(),
        headers: requestHeaders);
    dev.log(
        'getTransactionFees: requestHttp.body=' + transaction.convertToJSON());
    dev.log('getTransactionFees: responseHttp.body=' + responseHttp.body);
    transactionFee = transactionFeeFromJson(responseHttp.body);

    _completer.complete(transactionFee);
    return _completer.future;
  }

  /// Await the transaction confirmations
  /// @param {String} address Address to await
  /// @param {String} endpoint Node endpoint
  /// @param {Function} handler Success handler
  void waitConfirmations(
    String address, {
    onResult,
    onError,
    onCancel,
    onStart,
    onAbort,
  }) {
    String host =
        Uri.parse(endpoint!).host + ':' + Uri.parse(endpoint!).port.toString();

    AbsintheSocket _socket =
        AbsintheSocket('ws://' + host + '/socket/websocket');

    final String operation =
        """subscription { transactionConfirmed(address: "$address") { nbConfirmations } }""";

    Observer _observer = Observer(
      onAbort: onAbort,
      onCancel: onCancel,
      onError: onError,
      onResult: onResult,
      onStart: onStart,
    );

    Notifier notifier =
        _socket.send(GqlRequest(operation: operation), 'notifierKey');
    notifier.observe(_observer);
  }
}
