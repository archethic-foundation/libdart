// Dart imports:
import 'dart:async';
import 'dart:convert';

// Package imports:
import 'package:http/http.dart' as http show Response, post;

// Project imports:
import 'package:archethic_lib_dart/model/response/balance_response.dart';
import 'package:archethic_lib_dart/model/response/shared_secrets_response.dart';
import 'package:archethic_lib_dart/model/response/transaction_chain_response.dart';
import 'package:archethic_lib_dart/model/response/transaction_last_response.dart';
import 'package:archethic_lib_dart/model/response/transaction_response.dart';
import 'package:archethic_lib_dart/transaction_builder.dart';

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

Future<int> getTransactionIndex(String address, String endpoint) async {
  Completer<int> _completer = new Completer<int>();
  int _chainLength = 0;
  TransactionLastResponse transactionLastResponse =
      new TransactionLastResponse();
  final Map<String, String> requestHeaders = {
    'Content-type': 'application/json',
    'Accept': 'application/json',
  };
  try {
    String _body =
        '{"query": "query {lastTransaction(address: \\"$address\\") {chainLength}}"}';
    print(_body);
    http.Response responseHttp = await http.post(Uri.parse(endpoint + '/api'),
        body: _body, headers: requestHeaders);
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
    print("error: " + e.toString());
  }

  _completer.complete(_chainLength);
  return _completer.future;
}

Future<String> getStorageNoncePublicKey(String endpoint) async {
  Completer<String> _completer = new Completer<String>();
  String _storageNoncePublicKey = "";
  SharedSecretsResponse sharedSecretsResponse = new SharedSecretsResponse();

  final Map<String, String> requestHeaders = {
    'Content-type': 'application/json',
    'Accept': 'application/json',
  };

  try {
    String _body = '{"query": "query {sharedSecrets {storageNoncePublicKey}}"}';
    print(_body);
    http.Response responseHttp = await http.post(Uri.parse(endpoint + '/api'),
        body: _body, headers: requestHeaders);
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
    print("error: " + e.toString());
  }

  _completer.complete(_storageNoncePublicKey);
  return _completer.future;
}

Future<BalanceResponse> fetchBalance(String address, String endpoint) async {
  final Completer<BalanceResponse> _completer = Completer<BalanceResponse>();
  BalanceResponse? balanceResponse;

  final Map<String, String> requestHeaders = {
    'Content-type': 'application/json',
    'Accept': 'application/json',
  };

  String _body =
      '{"query": "query {balance(address: \\"$address\\") {uco, nft {address, amount}}}"}';
  print(_body);

  try {
    http.Response responseHttp = await http.post(Uri.parse(endpoint + '/api'),
        body: _body, headers: requestHeaders);
    print(responseHttp.body);

    if (responseHttp.statusCode == 200) {
      balanceResponse = balanceResponseFromJson(responseHttp.body);
    }
  } catch (e) {
    print("error: " + e.toString());
  }

  _completer.complete(balanceResponse!);
  return _completer.future;
}

Future<String> getTransactionContent(String address, String endpoint) async {
  final Completer<String> _completer = Completer<String>();
  String _content = "";
  TransactionResponse? transactionResponse = new TransactionResponse();

  final Map<String, String> requestHeaders = {
    'Content-type': 'application/json',
    'Accept': 'application/json',
  };

  String _body =
      '{"query":"query { transaction(address: \\"$address\\") { data { content }} }"}';
  print(_body);

  try {
    http.Response responseHttp = await http.post(Uri.parse(endpoint + '/api'),
        body: _body, headers: requestHeaders);
    print(responseHttp.body);

    if (responseHttp.statusCode == 200) {
      transactionResponse = transactionResponseFromJson(responseHttp.body);
      if (transactionResponse.data != null &&
          transactionResponse.data!.transaction != null &&
          transactionResponse.data!.transaction!.data != null) {
        _content = transactionResponse.data!.transaction!.data!.content!;
      }
    }
  } catch (e) {
    print("error: " + e.toString());
  }

  _completer.complete(_content);
  return _completer.future;
}

Future<TransactionBuilder> getTransactions(
    String address, String endpoint) async {
  final Completer<TransactionBuilder> _completer =
      Completer<TransactionBuilder>();
  TransactionBuilder? transactionChainResponse =
      new TransactionBuilder("keychain_access");

  final Map<String, String> requestHeaders = {
    'Content-type': 'application/json',
    'Accept': 'application/json',
  };

  String _body =
      '{"query":"query { transactionChain(address: \\"$address\\") {address, type, data { ledger { uco { transfers { amount, to } }, nft { transfers { amount, to, nft } } } } } }"}';
  print(_body);

  try {
    http.Response responseHttp = await http.post(Uri.parse(endpoint + '/api'),
        body: _body, headers: requestHeaders);
    print(responseHttp.body);

    if (responseHttp.statusCode == 200) {
      transactionChainResponse = transactionBuilderFromJson(responseHttp.body);
      /* if (transactionResponse.data != null &&
      transactionResponse.data!.transaction != null &&
      transactionResponse.data!.transaction!.data != null) {
        _content = transactionResponse.data!.transaction!.data!.content!;
      }*/
    }
  } catch (e) {
    print("error: " + e.toString());
  }

  _completer.complete(transactionChainResponse);
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

   
    return new Promise((resolve, reject) => {
        withAbsintheSocket.observe(absintheSocket, notifier, {
            onAbort: console.log("abort"),
            onError: reject,
            onStart: console.log("open"),
            onResult: resolve
        })
    })*/
}
