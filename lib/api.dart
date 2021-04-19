import 'dart:convert';

import 'package:http/http.dart' as http;

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

  http.Response responseHttp = await http.post(
      Uri.parse(endpoint + "/api"),
      body: json.encode("{query: 'query {lastTransaction(address: "+address+") {chainLength}}'").toString(),
      headers: requestHeaders);

  return json.decode(responseHttp.body);
}

dynamic getStorageNoncePublicKey(String endpoint) async {
  final Map<String, String> requestHeaders = {
    'Content-type': 'application/json',
    'Accept': 'application/json',
  };

  http.Response responseHttp = await http.post(
      Uri.parse(endpoint + "/api"),
      body: json.encode("{query: 'query {sharedSecrets{storageNoncePublicKey}}'").toString(),
      headers: requestHeaders);

  return json.decode(responseHttp.body);
}