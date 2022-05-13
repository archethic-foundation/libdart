/// SPDX-License-Identifier: AGPL-3.0-or-later

// To parse this JSON data, do
//
//     final transactionsResponse = transactionsResponseFromJson(jsonString);

// Dart imports:
import 'dart:convert';

// Project imports:
import 'package:archethic_lib_dart/src/model/errors.dart';
import 'package:archethic_lib_dart/src/model/transaction.dart';

NetworkTransactionsResponse networkTransactionsResponseFromJson(String str) =>
    NetworkTransactionsResponse.fromJson(json.decode(str));

String transactionsResponseToJson(NetworkTransactionsResponse data) =>
    json.encode(data.toJson());

class NetworkTransactionsResponse {
  NetworkTransactionsResponse({this.data, this.errors});

  factory NetworkTransactionsResponse.fromJson(Map<String, dynamic> json) =>
      NetworkTransactionsResponse(
        data: json['data'] == null
            ? null
            : TransactionsResponseData.fromJson(json['data']),
        errors: json['errors'] == null
            ? null
            : List<Errors>.from(
                json['errors'].map((dynamic x) => Errors.fromJson(x))),
      );

  TransactionsResponseData? data;
  List<Errors>? errors;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'data': data!.toJson(),
        'errors': List<dynamic>.from(errors!.map((Errors x) => x.toJson())),
      };
}

class TransactionsResponseData {
  TransactionsResponseData({
    this.networkTransactions,
  });

  factory TransactionsResponseData.fromJson(Map<String, dynamic> json) =>
      TransactionsResponseData(
        networkTransactions: json['networkTransactions'] == null
            ? null
            : List<Transaction>.from(json['networkTransactions']
                .map((dynamic x) => Transaction.fromJson(x))),
      );

  List<Transaction>? networkTransactions;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'networkTransactions': List<Transaction>.from(
            networkTransactions!.map((Transaction x) => x.toJson())),
      };
}
