// Dart imports:
import 'dart:async';
import 'dart:math';
import 'dart:typed_data';

// Package imports:
import 'package:http/http.dart' as http show Response, post;
import 'package:logger/logger.dart';

// Project imports:
import 'package:archethic_lib_dart/src/crypto.dart' as crypto;
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
import 'package:archethic_lib_dart/src/model/response/transactions_response.dart';
import 'package:archethic_lib_dart/src/model/transaction.dart';
import 'package:archethic_lib_dart/src/model/transaction_input.dart';
import 'package:archethic_lib_dart/src/model/transaction_status.dart';
import 'package:archethic_lib_dart/src/services/address_service.dart';
import 'package:archethic_lib_dart/src/utils.dart' as utils;

class ApiService {
  Logger logger = Logger();

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
    final http.Response responseHttp = await http.post(
        Uri.parse(endpoint! + '/api/transaction'),
        body: transaction.convertToJSON(),
        headers: requestHeaders);
    logger.d('sendTx: requestHttp.body=' + transaction.convertToJSON());
    logger.d('sendTx: responseHttp.body=' + responseHttp.body);
    transactionStatus = transactionStatusFromJson(responseHttp.body);

    _completer.complete(transactionStatus);
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
      logger.d('getTransactionIndex: requestHttp.body=' + _body);
      final http.Response responseHttp = await http.post(
          Uri.parse(endpoint! + '/api'),
          body: _body,
          headers: requestHeaders);
      logger.d('getTransactionIndex: responseHttp.body=' + responseHttp.body);
      if (responseHttp.statusCode == 200) {
        transactionLastResponse =
            transactionLastResponseFromJson(responseHttp.body);
        if (transactionLastResponse.data != null &&
            transactionLastResponse.data!.lastTransaction != null) {
          lastTransaction = transactionLastResponse.data!.lastTransaction;
        }
      }
    } catch (e) {
      logger.d('getTransactionIndex: error=' + e.toString());
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
      logger.d('getStorageNoncePublicKey: requestHttp.body=' + _body);
      final http.Response responseHttp = await http.post(
          Uri.parse(endpoint! + '/api'),
          body: _body,
          headers: requestHeaders);
      logger.d(
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
      logger.d('getStorageNoncePublicKey: error=' + e.toString());
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
    logger.d('fetchBalance: requestHttp.body=' + _body);

    try {
      final http.Response responseHttp = await http.post(
          Uri.parse(endpoint! + '/api'),
          body: _body,
          headers: requestHeaders);
      logger.d('fetchBalance: responseHttp.body=' + responseHttp.body);

      if (responseHttp.statusCode == 200) {
        balanceResponse = balanceResponseFromJson(responseHttp.body);
        if (balanceResponse.data != null) {
          balance = balanceResponse.data!.balance;
        }
      }
    } catch (e) {
      logger.d('fetchBalance: error=' + e.toString());
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
    logger.d('getTransactionContent: requestHttp.body=' + _body);

    try {
      final http.Response responseHttp = await http.post(
          Uri.parse(endpoint! + '/api'),
          body: _body,
          headers: requestHeaders);
      logger.d('getTransactionContent: responseHttp.body=' + responseHttp.body);

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
      logger.d('getTransactionContent: error=' + e.toString());
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
    logger.d('getTransactionChain: requestHttp.body=' + _body);

    try {
      final http.Response responseHttp = await http.post(
          Uri.parse(endpoint! + '/api'),
          body: _body,
          headers: requestHeaders);
      logger.d('getTransactionChain: responseHttp.body=' + responseHttp.body);

      if (responseHttp.statusCode == 200) {
        transactionChainResponse =
            transactionChainResponseFromJson(responseHttp.body);
        if (transactionChainResponse.data != null &&
            transactionChainResponse.data!.transactionChain != null) {
          transactionChain = transactionChainResponse.data!.transactionChain!;
        }
      }
    } catch (e) {
      logger.d('getTransactionChain: error=' + e.toString());
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
    ;
    final Map<String, String> requestHeaders = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
    };

    try {
      // TODO: Wait for update node
      //const String _body =
      //    '{"query": "query {nodes {authorized available averageAvailability firstPublicKey geoPatch ip lastPublicKey networkPatch port rewardAddress authorizationDate enrollmentDate}}"}';
      const String _body =
          '{"query": "query {nodes {authorized available averageAvailability firstPublicKey geoPatch ip lastPublicKey networkPatch port rewardAddress}}"}';
      logger.d('getNodeList: requestHttp.body=' + _body);
      final http.Response responseHttp = await http.post(
          Uri.parse(endpoint! + '/api'),
          body: _body,
          headers: requestHeaders);
      logger.d('getNodeList: responseHttp.body=' + responseHttp.body);
      if (responseHttp.statusCode == 200) {
        nodesResponse = nodesResponseFromJson(responseHttp.body);
        if (nodesResponse.data != null) {
          nodesList = nodesResponse.data!.nodes!;
        }
      }
    } catch (e) {
      logger.d('getNodeList: error=' + e.toString());
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
    logger.d('networkTransactions: requestHttp.body=' + _body);

    try {
      final http.Response responseHttp = await http.post(
          Uri.parse(endpoint! + '/api'),
          body: _body,
          headers: requestHeaders);
      logger.d('networkTransactions: responseHttp.body=' + responseHttp.body);

      if (responseHttp.statusCode == 200) {
        networkTransactionsResponse =
            networkTransactionsResponseFromJson(responseHttp.body);
        if (networkTransactionsResponse.data != null) {
          transactionsList =
              networkTransactionsResponse.data!.networkTransactions!;
        }
      }
    } catch (e) {
      logger.d('networkTransactions: error=' + e.toString());
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
      logger.d('getTransactionInputs: requestHttp.body=' + _body);
      final http.Response responseHttp = await http.post(
          Uri.parse(endpoint! + '/api'),
          body: _body,
          headers: requestHeaders);
      logger.d('getTransactionInputs: responseHttp.body=' + responseHttp.body);
      if (responseHttp.statusCode == 200) {
        transactionInputsResponse =
            transactionInputsResponseFromJson(responseHttp.body);
        transactionInputs = transactionInputsResponse.data!.transactionInputs!;
      }
    } catch (e) {
      logger.d('getTransactionInputs: error=' + e.toString());
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
    final String keychainAddress = AddressService(endpoint)
        .deriveAddress(utils.uint8ListToHex(keychainSeed), 0);

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
        .build(accessKeychainSeed, 0, 'P256')
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
            .build(keychainSeed, 0, 'P256')
            .originSign(originPrivateKey);

    TransactionStatus ts1 = await this.sendTx(accessKeychainTx);
    TransactionStatus ts2 = await this.sendTx(keyChainTx);
    if (ts1.status == 'ok' && ts2.status == 'ok') {
      return keyChainTx.address;
    } else {
      throw ('Something goes wrong !');
    }
  }

  /// Query the network to find a transaction
  /// @param {String} The address scalar type represents a cryptographic hash used in the ArchEthic network with an identification byte to specify from which algorithm the hash was generated. The Hash appears in a JSON response as Base16 formatted string. The parsed hash will be converted to a binary and any invalid hash with an invalid algorithm or invalid size will be rejected
  /// Returns all informations represent transaction content.
  Future<TransactionsResponse> getTransactionAllInfos(String address) async {
    final Completer<TransactionsResponse> _completer =
        Completer<TransactionsResponse>();
    TransactionsResponse? transactionResponse = TransactionsResponse();

    final Map<String, String> requestHeaders = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
    };

    final String _body =
        '{"query":"query { transaction(address: \\"$address\\") {' +
            Transaction.getQLFields() +
            '} }"}';
    logger.d('getTransactionAllInfos: requestHttp.body=' + _body);

    try {
      final http.Response responseHttp = await http.post(
          Uri.parse(endpoint! + '/api'),
          body: _body,
          headers: requestHeaders);
      logger
          .d('getTransactionAllInfos: responseHttp.body=' + responseHttp.body);

      if (responseHttp.statusCode == 200) {
        transactionResponse = transactionsResponseFromJson(responseHttp.body);
      }
    } catch (e) {
      logger.d('getTransactionAllInfos: error=' + e.toString());
    }

    _completer.complete(transactionResponse);
    return _completer.future;
  }
}
