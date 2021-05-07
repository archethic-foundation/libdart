import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http show Response, post;
import 'package:uniris_lib_dart/model/response/balance_response.dart';
import 'package:uniris_lib_dart/model/response/transaction_chain_response.dart';
import 'package:uniris_lib_dart/model/response/transaction_response.dart';

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

  http.Response responseHttp = await http.post(
      Uri.parse(endpoint + "/api/transaction"),
      body: json.encode(tx),
      headers: requestHeaders);

  return json.decode(responseHttp.body);
}

dynamic getTransactionIndex(String address, String endpoint) async {
  final Map<String, String> requestHeaders = {
    'Content-type': 'application/json',
    'Accept': 'application/json',
  };

  http.Response responseHttp = await http.post(Uri.parse(endpoint + "/api"),
      body: json.encode("{query: 'query {lastTransaction(address: " +
          address +
          ") {chainLength}}'"),
      headers: requestHeaders);

  return json.decode(responseHttp.body);
}

dynamic getStorageNoncePublicKey(String endpoint) async {
  final Map<String, String> requestHeaders = {
    'Content-type': 'application/json',
    'Accept': 'application/json',
  };

  http.Response responseHttp = await http.post(Uri.parse(endpoint + "/api"),
      body:
          json.encode("{query: 'query {sharedSecrets{storageNoncePublicKey}}'"),
      headers: requestHeaders);

  return json.decode(responseHttp.body);
}

Future<BalanceResponse> fetchBalance(String address, String endpoint) async {
  final Map<String, String> requestHeaders = {
    'Content-type': 'application/json',
    'Accept': 'application/json',
  };

  String _json = json.encode('query {' +
      ' balance(address: ' +
      address +
      '}) {' +
      ' uco,' +
      ' nft { ' +
      ' address, ' +
      ' amount ' +
      '} ' +
      '} ' +
      '}');

  http.Response responseHttp = await http.post(Uri.parse(endpoint + "/api"),
      body: _json, headers: requestHeaders);

  Completer<BalanceResponse> _completer = new Completer<BalanceResponse>();
  BalanceResponse? balanceResponse;
  if (responseHttp.statusCode == 200) {
    balanceResponse = balanceResponseFromJson(responseHttp.body);
  }
  _completer.complete(balanceResponse!);
  return _completer.future;
}

Future<TransactionResponse> getTransactionContent(
    String address, String endpoint) async {
  final Map<String, String> requestHeaders = {
    'Content-type': 'application/json',
    'Accept': 'application/json',
  };

  String _json = json.encode('query { ' +
      ' transaction(address: ' +
      address +
      '}) { ' +
      ' data { ' +
      ' content ' +
      ' } ' +
      ' } ' +
      ' } ');

  http.Response responseHttp = await http.post(Uri.parse(endpoint + "/api"),
      body: _json, headers: requestHeaders);

  Completer<TransactionResponse> _completer =
      new Completer<TransactionResponse>();
  TransactionResponse? transactionResponse;
  if (responseHttp.statusCode == 200) {
    transactionResponse = transactionResponseFromJson(responseHttp.body);
  }
  _completer.complete(transactionResponse!);
  return _completer.future;
}

Future<TransactionChainResponse> getTransactions(
    String address, String endpoint) async {
  final Map<String, String> requestHeaders = {
    'Content-type': 'application/json',
    'Accept': 'application/json',
  };

  String _json = json.encode('query {' +
      ' transactionChain(address: ' +
      address +
      ') {' +
      '     address,' +
      '     timestamp,' +
      '     type,' +
      '     data {' +
      '         ledger {' +
      '             uco {' +
      '                 transfers {' +
      '                     amount,' +
      '                     to' +
      '                 }' +
      '             },' +
      '             nft {' +
      '                 transfers {' +
      '                     amount,' +
      '                     to,' +
      '                     nft' +
      '                 }' +
      '             }' +
      '         }' +
      '     }' +
      ' }' +
      '}');

  http.Response responseHttp = await http.post(Uri.parse(endpoint + "/api"),
      body: _json, headers: requestHeaders);

  Completer<TransactionChainResponse> _completer =
      new Completer<TransactionChainResponse>();
  TransactionChainResponse? transactionChainResponse;
  if (responseHttp.statusCode == 200) {
    transactionChainResponse =
        transactionChainResponseFromJson(responseHttp.body);
  }
  _completer.complete(transactionChainResponse!);
  return _completer.future;
}
