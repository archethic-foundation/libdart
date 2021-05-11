import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http show Response, post;
import 'package:uniris_lib_dart/model/response/balance_response.dart';
import 'package:uniris_lib_dart/model/response/transaction_chain_response.dart';
import 'package:uniris_lib_dart/model/response/transaction_response.dart';
import 'package:uniris_lib_dart/services/absinthe_socket.dart';

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


void notifyAddressReplication(String address, String endpoint) {
  AbsintheSocket _socket = AbsintheSocket("ws://"+endpoint+"/socket");
  // TODO: in progress
  /*Observer _categoryObserver = Observer(
        onError: reject,
        onResult: resolve,
        onStart: print("open"));

  Notifier notifier = _socket.send(GqlRequest(operation: "subscription { acknowledgeStorage(address: "+address+") { address } }"));
  notifier.observe(_categoryObserver);

   
    return new Promise((resolve, reject) => {
        withAbsintheSocket.observe(absintheSocket, notifier, {
            onAbort: console.log("abort"),
            onError: reject,
            onStart: console.log("open"),
            onResult: resolve
        })
    })*/
}
