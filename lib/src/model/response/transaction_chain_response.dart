/// SPDX-License-Identifier: AGPL-3.0-or-later

// To parse this JSON data, do
//
//     final transactionsResponse = transactionsResponseFromJson(jsonString);

// Dart imports:
import 'dart:convert';

// Project imports:
import 'package:archethic_lib_dart/src/model/errors.dart';
import 'package:archethic_lib_dart/src/model/transaction.dart';

TransactionChainResponse transactionChainResponseFromJson(String str) =>
    TransactionChainResponse.fromJson(json.decode(str));

String transactionsResponseToJson(TransactionChainResponse data) =>
    json.encode(data.toJson());

class TransactionChainResponse {
  TransactionChainResponse({this.data, this.errors});

  factory TransactionChainResponse.fromJson(Map<String, dynamic> json) =>
      TransactionChainResponse(
        data: json['data'] == null
            ? null
            : TransactionsResponseData.fromJson(json['data']),
        errors: json['errors'] == null
            ? null
            : List<Errors>.from(
                json['errors'].map(Errors.fromJson),),
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
    this.transactionChain,
  });

  factory TransactionsResponseData.fromJson(Map<String, dynamic> json) =>
      TransactionsResponseData(
        transactionChain: json['transactionChain'] == null
            ? null
            : List<Transaction>.from(json['transactionChain']
                .map(Transaction.fromJson),),
      );

  List<Transaction>? transactionChain;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'transactionChain': List<Transaction>.from(
            transactionChain!.map((Transaction x) => x.toJson()),),
      };
}
