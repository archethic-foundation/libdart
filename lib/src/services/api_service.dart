// Dart imports:
import 'dart:async';
import 'dart:convert';

// Package imports:
import 'package:http/http.dart' as http show Response, post;

// Project imports:
import 'package:archethic_lib_dart/src/model/balance.dart';
import 'package:archethic_lib_dart/src/model/node.dart';
import 'package:archethic_lib_dart/src/model/response/balance_response.dart';
import 'package:archethic_lib_dart/src/model/response/nodes_response.dart';
import 'package:archethic_lib_dart/src/model/response/shared_secrets_response.dart';
import 'package:archethic_lib_dart/src/model/response/transaction_chain_response.dart';
import 'package:archethic_lib_dart/src/model/response/transaction_content_response.dart';
import 'package:archethic_lib_dart/src/model/response/transaction_last_response.dart';
import 'package:archethic_lib_dart/src/model/transaction.dart';

class ApiService {
  ApiService(this.endpoint);

  /// [endpoint] is the HTTP URL to a ArchEthic node (acting as welcome node)
  String? endpoint;

  /// Send a transaction to the network
  /// @param {Object} tx Transaction to send
  dynamic sendTx(Transaction transaction) async {
    final Map<String, String> requestHeaders = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
    };

    final http.Response responseHttp = await http.post(
        Uri.parse(endpoint! + '/api/transaction'),
        body: transaction.convertToJSON(),
        headers: requestHeaders);
    print('sendTx: requestHttp.body=' + transaction.convertToJSON());
    print('sendTx: responseHttp.body=' + responseHttp.body);
    return json.decode(responseHttp.body);
  }

  /// Query the network to find the last transaction from an address
  /// @param {String} The address scalar type represents a cryptographic hash used in the ArchEthic network with an identification byte to specify from which algorithm the hash was generated. The Hash appears in a JSON response as Base16 formatted string. The parsed hash will be converted to a binary and any invalid hash with an invalid algorithm or invalid size will be rejected
  Future<int> getTransactionIndex(String address) async {
    final Completer<int> _completer = Completer<int>();
    int _chainLength = 0;
    TransactionLastResponse transactionLastResponse = TransactionLastResponse();
    final Map<String, String> requestHeaders = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
    };
    try {
      final String _body =
          '{"query": "query {lastTransaction(address: \\"$address\\") {chainLength}}"}';
      print('getTransactionIndex: requestHttp.body=' + _body);
      final http.Response responseHttp = await http.post(
          Uri.parse(endpoint! + '/api'),
          body: _body,
          headers: requestHeaders);
      print('getTransactionIndex: responseHttp.body=' + responseHttp.body);
      if (responseHttp.statusCode == 200) {
        transactionLastResponse =
            transactionLastResponseFromJson(responseHttp.body);
        if (transactionLastResponse.data != null && transactionLastResponse.data!.chainLength != null) {
          _chainLength = transactionLastResponse.data!.chainLength!;
        }
      }
    } catch (e) {
      print('getTransactionIndex: error=' + e.toString());
    }

    _completer.complete(_chainLength);
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
      print('getStorageNoncePublicKey: requestHttp.body=' + _body);
      final http.Response responseHttp = await http.post(
          Uri.parse(endpoint! + '/api'),
          body: _body,
          headers: requestHeaders);
      print('getStorageNoncePublicKey: responseHttp.body=' + responseHttp.body);
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
      print('getStorageNoncePublicKey: error=' + e.toString());
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
    Balance balance = Balance();

    final Map<String, String> requestHeaders = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
    };

    final String _body =
        '{"query": "query {balance(address: \\"$address\\") {uco, nft {address, amount}}}"}';
    print('fetchBalance: requestHttp.body=' + _body);

    try {
      final http.Response responseHttp = await http.post(
          Uri.parse(endpoint! + '/api'),
          body: _body,
          headers: requestHeaders);
      print('fetchBalance: responseHttp.body=' + responseHttp.body);

      if (responseHttp.statusCode == 200) {
        balanceResponse = balanceResponseFromJson(responseHttp.body);
        if (balanceResponse.data != null) {
          balance = balanceResponse.data!.balance!;
        }
      }
    } catch (e) {
      print('fetchBalance: error=' + e.toString());
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
    print('getTransactionContent: requestHttp.body=' + _body);

    try {
      final http.Response responseHttp = await http.post(
          Uri.parse(endpoint! + '/api'),
          body: _body,
          headers: requestHeaders);
      print('getTransactionContent: responseHttp.body=' + responseHttp.body);

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
      print('getTransactionContent: error=' + e.toString());
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
        '{"query":"query { transactionChain(address: \\"$address\\", page: $page) {address, type, data { ledger { uco { transfers { amount, to } }, nft { transfers { amount, to, nft } } } } } }"}';
    print('getTransactionChain: requestHttp.body=' + _body);

    try {
      final http.Response responseHttp = await http.post(
          Uri.parse(endpoint! + '/api'),
          body: _body,
          headers: requestHeaders);
      print('getTransactionChain: responseHttp.body=' + responseHttp.body);

      if (responseHttp.statusCode == 200) {
        transactionChainResponse =
            transactionChainResponseFromJson(responseHttp.body);
        if (transactionChainResponse.data != null) {
          transactionChain = transactionChainResponse.data!.transactionChain!;
        }
      }
    } catch (e) {
      print('getTransactionChain: error=' + e.toString());
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
      const String _body =
          '{"query": "query {nodes {authorized available averageAvailability firstPublicKey geoPatch ip lastPublicKey networkPatch port rewardAddress}}"}';
      print('getNodeList: requestHttp.body=' + _body);
      final http.Response responseHttp = await http.post(
          Uri.parse(endpoint! + '/api'),
          body: _body,
          headers: requestHeaders);
      print('getNodeList: responseHttp.body=' + responseHttp.body);
      if (responseHttp.statusCode == 200) {
        nodesResponse = nodesResponseFromJson(responseHttp.body);
        if (nodesResponse.data != null) {
          nodesList = nodesResponse.data!.nodes!;
        }
      }
    } catch (e) {
      print('getNodeList: error=' + e.toString());
    }

    _completer.complete(nodesList);
    return _completer.future;
  }
}
