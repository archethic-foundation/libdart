// Dart imports:
import 'dart:async';
import 'dart:convert';

// Package imports:
import 'package:http/http.dart' as http show Response, post;

// Project imports:
import 'package:archethic_lib_dart/model/response/balance_response.dart';
import 'package:archethic_lib_dart/model/response/shared_secrets_response.dart';
import 'package:archethic_lib_dart/model/response/transaction_content_response.dart';
import 'package:archethic_lib_dart/model/response/transaction_last_response.dart';
import 'package:archethic_lib_dart/model/response/transactions_response.dart';

//import 'package:pinenacl/api.dart';
//import 'package:archethic_lib_dart/services/absinthe_socket.dart';

/*
 * Send a transaction to the network
 * @param {Object} tx Transaction to send
 * @param {String} endpoint Node endpoint
 */
dynamic sendTx(tx, String endpoint) async {
  final Map<String, String> requestHeaders = {
    'Content-type': 'application/json',
    'Accept': 'application/json',
  };

  final http.Response responseHttp = await http.post(
      Uri.parse(endpoint + '/api/transaction'),
      body: json.encode(tx),
      headers: requestHeaders);

  return json.decode(responseHttp.body);
}

/*
 * Query the network to find the last transaction from an address
 * @param {String} The [Address] scalar type represents a cryptographic hash used in the ArchEthic network with an identification byte to specify from which algorithm the hash was generated. The Hash appears in a JSON response as Base16 formatted string. The parsed hash will be converted to a binary and any invalid hash with an invalid algorithm or invalid size will be rejected
 * @param {String} The endpoint
 */
Future<int> getTransactionIndex(String address, String endpoint) async {
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
    print(_body);
    final http.Response responseHttp = await http.post(
        Uri.parse(endpoint + '/api'),
        body: _body,
        headers: requestHeaders);
    print(responseHttp.body);
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
    print('error: ' + e.toString());
  }

  _completer.complete(_chainLength);
  return _completer.future;
}

/*
 * getStorageNoncePublicKey
 * @param {String} The endpoint
 */
Future<String> getStorageNoncePublicKey(String endpoint) async {
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
    print(_body);
    final http.Response responseHttp = await http.post(
        Uri.parse(endpoint + '/api'),
        body: _body,
        headers: requestHeaders);
    print(responseHttp.body);
    if (responseHttp.statusCode == 200) {
      sharedSecretsResponse = sharedSecretsResponseFromJson(responseHttp.body);
      if (sharedSecretsResponse.data != null &&
          sharedSecretsResponse.data!.sharedSecrets != null) {
        _storageNoncePublicKey =
            sharedSecretsResponse.data!.sharedSecrets!.storageNoncePublicKey!;
      }
    }
  } catch (e) {
    print('error: ' + e.toString());
  }

  _completer.complete(_storageNoncePublicKey);
  return _completer.future;
}

/*
 * Query the network to find a balance from an address
 * @param {String} The [Address] scalar type represents a cryptographic hash used in the ArchEthic network with an identification byte to specify from which algorithm the hash was generated. The Hash appears in a JSON response as Base16 formatted string. The parsed hash will be converted to a binary and any invalid hash with an invalid algorithm or invalid size will be rejected
 * @param {String} The endpoint
 * Returns [BalanceResponse] represents a ledger balance. It includes: UCO: uco balance & NFT: NFT balances
 */
Future<BalanceResponse> fetchBalance(String address, String endpoint) async {
  final Completer<BalanceResponse> _completer = Completer<BalanceResponse>();
  BalanceResponse? balanceResponse;

  final Map<String, String> requestHeaders = {
    'Content-type': 'application/json',
    'Accept': 'application/json',
  };

  final String _body =
      '{"query": "query {balance(address: \\"$address\\") {uco, nft {address, amount}}}"}';
  print(_body);

  try {
    final http.Response responseHttp = await http.post(
        Uri.parse(endpoint + '/api'),
        body: _body,
        headers: requestHeaders);
    print(responseHttp.body);

    if (responseHttp.statusCode == 200) {
      balanceResponse = balanceResponseFromJson(responseHttp.body);
    }
  } catch (e) {
    print('error: ' + e.toString());
  }

  _completer.complete(balanceResponse!);
  return _completer.future;
}

/*
 * Query the network to find a transaction
 * @param {String} The [Address] scalar type represents a cryptographic hash used in the ArchEthic network with an identification byte to specify from which algorithm the hash was generated. The Hash appears in a JSON response as Base16 formatted string. The parsed hash will be converted to a binary and any invalid hash with an invalid algorithm or invalid size will be rejected
 * @param {String} The endpoint
 * Returns the [Content] scalar type represents transaction content. Depending if the content can displayed it will be rendered as plain text otherwise in hexadecimal
 */
Future<String> getTransactionContent(String address, String endpoint) async {
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
  print(_body);

  try {
    final http.Response responseHttp = await http.post(
        Uri.parse(endpoint + '/api'),
        body: _body,
        headers: requestHeaders);
    print(responseHttp.body);

    if (responseHttp.statusCode == 200) {
      transactionContentResponse =
          transactionContentResponseFromJson(responseHttp.body);
      if (transactionContentResponse.data != null &&
          transactionContentResponse.data!.transaction != null &&
          transactionContentResponse.data!.transaction!.data != null) {
        _content = transactionContentResponse.data!.transaction!.data!.content!;
      }
    }
  } catch (e) {
    print('error: ' + e.toString());
  }

  _completer.complete(_content);
  return _completer.future;
}

/*
 * Query the network to find a transaction chain
 * @param {String} The [Address] scalar type represents a cryptographic hash used in the ArchEthic network with an identification byte to specify from which algorithm the hash was generated. The Hash appears in a JSON response as Base16 formatted string. The parsed hash will be converted to a binary and any invalid hash with an invalid algorithm or invalid size will be rejected
 * @param {int} The page
 * @param {String} The endpoint
 * Returns the [Content] scalar type represents transaction content. Depending if the content can displayed it will be rendered as plain text otherwise in hexadecimal
 */
Future<TransactionsResponse> getTransactions(
    String address, int page, String endpoint) async {
  final Completer<TransactionsResponse> _completer =
      Completer<TransactionsResponse>();
  TransactionsResponse? transactionsResponse = TransactionsResponse();

  final Map<String, String> requestHeaders = {
    'Content-type': 'application/json',
    'Accept': 'application/json',
  };

  final String _body =
      '{"query":"query { transactionChain(address: \\"$address\\", page: $page) {address, type, data { ledger { uco { transfers { amount, to } }, nft { transfers { amount, to, nft } } } } } }"}';
  print(_body);

  try {
    final http.Response responseHttp = await http.post(
        Uri.parse(endpoint + '/api'),
        body: _body,
        headers: requestHeaders);
    print(responseHttp.body);

    if (responseHttp.statusCode == 200) {
      transactionsResponse = transactionsResponseFromJson(responseHttp.body);
    }
  } catch (e) {
    print('error: ' + e.toString());
  }

  _completer.complete(transactionsResponse);
  return _completer.future;
}

void notifyAddressReplication(String address, String endpoint) {
  //final AbsintheSocket _socket = AbsintheSocket('ws://' + endpoint + '/socket');
  // TODO: in progress
  /*Observer _categoryObserver = Observer(
        onError: reject,
        onResult: resolve,
        onStart: print("open"));

  Notifier notifier = _socket.send(GqlRequest(operation: "subscription { acknowledgeStorage(address: "+address+") { address } }"));
  notifier.observe(_categoryObserver);

   
    return Promise((resolve, reject) => {
        withAbsintheSocket.observe(absintheSocket, notifier, {
            onAbort: console.log("abort"),
            onError: reject,
            onStart: console.log("open"),
            onResult: resolve
        })
    })*/
}

/*
 * Query the node infos
 * @param {String} The endpoint
 * Returns the [Node] infos
 */
Future<String> getNodeList(String endpoint) async {
  final Completer<String> _completer = Completer<String>();
  const String _storageNoncePublicKey = '';
  SharedSecretsResponse sharedSecretsResponse = SharedSecretsResponse();

  final Map<String, String> requestHeaders = {
    'Content-type': 'application/json',
    'Accept': 'application/json',
  };

  try {
    const String _body = '{"query": "query {nodes}"}';
    print(_body);
    final http.Response responseHttp = await http.post(
        Uri.parse(endpoint + '/api'),
        body: _body,
        headers: requestHeaders);
    print(responseHttp.body);
    if (responseHttp.statusCode == 200) {
      sharedSecretsResponse = sharedSecretsResponseFromJson(responseHttp.body);
    }
  } catch (e) {
    print('error: ' + e.toString());
  }

  _completer.complete(_storageNoncePublicKey);
  return _completer.future;
}
