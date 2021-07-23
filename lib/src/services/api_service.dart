// Dart imports:
import 'dart:async';
import 'dart:convert';

// Package imports:
import 'package:http/http.dart' as http show Response, post;

// Project imports:
import 'package:archethic_lib_dart/src/model/response/balance_response.dart';
import 'package:archethic_lib_dart/src/model/response/nodes_response.dart';
import 'package:archethic_lib_dart/src/model/response/shared_secrets_response.dart';
import 'package:archethic_lib_dart/src/model/response/transaction_content_response.dart';
import 'package:archethic_lib_dart/src/model/response/transaction_last_response.dart';
import 'package:archethic_lib_dart/src/model/response/transactions_response.dart';

class ApiService {
  ApiService(this.endpoint);

  /// [endpoint] is the HTTP URL to a ArchEthic node (acting as welcome node)
  String? endpoint;

  /// Send a transaction to the network
  /// @param {Object} tx Transaction to send
  dynamic sendTx(tx) async {
    final Map<String, String> requestHeaders = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
    };

    final http.Response responseHttp = await http.post(
        Uri.parse(this.endpoint! + '/api/transaction'),
        body: json.encode(tx),
        headers: requestHeaders);
    print('sendTx: requestHttp.body=' + json.encode(tx));
    print("sendTx: responseHttp.body=" + responseHttp.body);
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
          Uri.parse(this.endpoint! + '/api'),
          body: _body,
          headers: requestHeaders);
      print('getTransactionIndex: responseHttp.body=' + responseHttp.body);
      if (responseHttp.statusCode == 200) {
        transactionLastResponse =
            transactionLastResponseFromJson(responseHttp.body);
        if (transactionLastResponse.data != null &&
            transactionLastResponse.data!.lastTransaction != null) {
          _chainLength =
              transactionLastResponse.data!.lastTransaction!.chainLength!;
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
          Uri.parse(this.endpoint! + '/api'),
          body: _body,
          headers: requestHeaders);
      print('getStorageNoncePublicKey: responseHttp.body=' + responseHttp.body);
      if (responseHttp.statusCode == 200) {
        sharedSecretsResponse =
            sharedSecretsResponseFromJson(responseHttp.body);
        if (sharedSecretsResponse.data != null &&
            sharedSecretsResponse.data!.sharedSecrets != null) {
          _storageNoncePublicKey =
              sharedSecretsResponse.data!.sharedSecrets!.storageNoncePublicKey!;
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
  /// Returns [BalanceResponse] represents a ledger balance. It includes: UCO: uco balance & NFT: NFT balances
  Future<BalanceResponse> fetchBalance(String address) async {
    final Completer<BalanceResponse> _completer = Completer<BalanceResponse>();
    BalanceResponse? balanceResponse;

    final Map<String, String> requestHeaders = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
    };

    final String _body =
        '{"query": "query {balance(address: \\"$address\\") {uco, nft {address, amount}}}"}';
    print('fetchBalance: requestHttp.body=' + _body);

    try {
      final http.Response responseHttp = await http.post(
          Uri.parse(this.endpoint! + '/api'),
          body: _body,
          headers: requestHeaders);
      print('fetchBalance: responseHttp.body=' + responseHttp.body);

      if (responseHttp.statusCode == 200) {
        balanceResponse = balanceResponseFromJson(responseHttp.body);
      }
    } catch (e) {
      print('fetchBalance: error=' + e.toString());
    }

    _completer.complete(balanceResponse);
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
          Uri.parse(this.endpoint! + '/api'),
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
  /// Returns the content scalar type represents transaction content [TransactionsResponse]. Depending if the content can displayed it will be rendered as plain text otherwise in hexadecimal
  Future<TransactionsResponse> getTransactions(String address, int page) async {
    final Completer<TransactionsResponse> _completer =
        Completer<TransactionsResponse>();
    TransactionsResponse? transactionsResponse = TransactionsResponse();

    final Map<String, String> requestHeaders = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
    };

    final String _body =
        '{"query":"query { transactionChain(address: \\"$address\\", page: $page) {address, type, data { ledger { uco { transfers { amount, to } }, nft { transfers { amount, to, nft } } } } } }"}';
    print('getTransactions: requestHttp.body=' + _body);

    try {
      final http.Response responseHttp = await http.post(
          Uri.parse(this.endpoint! + '/api'),
          body: _body,
          headers: requestHeaders);
      print('getTransactions: responseHttp.body=' + responseHttp.body);

      if (responseHttp.statusCode == 200) {
        transactionsResponse = transactionsResponseFromJson(responseHttp.body);
      }
    } catch (e) {
      print('getTransactions: error=' + e.toString());
    }

    _completer.complete(transactionsResponse);
    return _completer.future;
  }

  /// Query the node infos
  /// Returns the [NodesResponse] infos
  Future<NodesResponse> getNodeList() async {
    final Completer<NodesResponse> _completer = Completer<NodesResponse>();
    NodesResponse nodesResponse = NodesResponse();

    final Map<String, String> requestHeaders = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
    };

    try {
      const String _body =
          '{"query": "query {nodes {authorized available averageAvailability firstPublicKey geoPatch ip lastPublicKey networkPatch port rewardAddress}}"}';
      print('getNodeList: requestHttp.body=' + _body);
      final http.Response responseHttp = await http.post(
          Uri.parse(this.endpoint! + '/api'),
          body: _body,
          headers: requestHeaders);
      print('getNodeList: responseHttp.body=' + responseHttp.body);
      if (responseHttp.statusCode == 200) {
        nodesResponse = nodesResponseFromJson(responseHttp.body);
      }
    } catch (e) {
      print('getNodeList: error=' + e.toString());
    }

    _completer.complete(nodesResponse);
    return _completer.future;
  }
}
