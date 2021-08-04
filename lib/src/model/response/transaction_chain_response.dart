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
            : List<Errors>.from(json['errors'].map((x) => Errors.fromJson(x))),
      );

  TransactionsResponseData? data;
  List<Errors>? errors;

  Map<String, dynamic> toJson() => {
        'data': data!.toJson(),
        'errors': List<dynamic>.from(errors!.map((x) => x.toJson())),
      };
}

class TransactionsResponseData {
  TransactionsResponseData({
    this.transactionChain,
  });

  factory TransactionsResponseData.fromJson(Map<String, dynamic> json) =>
      TransactionsResponseData(
        transactionChain:  json['transactionChain'] == null ? null : List<Transaction>.from(
            json['transactionChain'].map((x) => Transaction.fromJson(x))),
      );

  List<Transaction>? transactionChain;

  Map<String, dynamic> toJson() => {
        'transactionChain':
            List<Transaction>.from(transactionChain!.map((x) => x.toJson())),
      };
}
