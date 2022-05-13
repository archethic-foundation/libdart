/// SPDX-License-Identifier: AGPL-3.0-or-later

// To parse this JSON data, do
//
//     final transactionLastResponse = transactionLastResponseFromJson(jsonString);

// Dart imports:
import 'dart:convert';

// Project imports:
import 'package:archethic_lib_dart/src/model/errors.dart';
import 'package:archethic_lib_dart/src/model/transaction.dart';

TransactionLastResponse transactionLastResponseFromJson(String str) =>
    TransactionLastResponse.fromJson(json.decode(str));

String transactionLastResponseToJson(TransactionLastResponse data) =>
    json.encode(data.toJson());

class TransactionLastResponse {
  TransactionLastResponse({
    this.data,
    this.errors,
  });

  TransactionLastResponseData? data;
  List<Errors>? errors;

  factory TransactionLastResponse.fromJson(Map<String, dynamic> json) =>
      TransactionLastResponse(
        data: json['data'] == null
            ? null
            : TransactionLastResponseData.fromJson(json['data']),
        errors: json['errors'] == null
            ? null
            : List<Errors>.from(json['errors'].map((x) => Errors.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        'data': data!.toJson(),
        'errors': List<dynamic>.from(errors!.map((Errors x) => x.toJson())),
      };
}

class TransactionLastResponseData {
  TransactionLastResponseData({
    this.lastTransaction,
  });

  Transaction? lastTransaction;

  factory TransactionLastResponseData.fromJson(Map<String, dynamic> json) =>
      TransactionLastResponseData(
        lastTransaction: json['lastTransaction'] == null
            ? null
            : Transaction.fromJson(json['lastTransaction']),
      );

  Map<String, dynamic> toJson() => {
        'lastTransaction': lastTransaction!.toJson(),
      };
}
