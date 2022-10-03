/// SPDX-License-Identifier: AGPL-3.0-or-later

// To parse this JSON data, do
//
//     final transactionContentResponse = transactionContentResponseFromJson(jsonString);

// Dart imports:
import 'dart:convert';

// Project imports:
import 'package:archethic_lib_dart/src/model/errors.dart';
import 'package:archethic_lib_dart/src/model/transaction.dart';

TransactionContentResponse transactionContentResponseFromJson(String str) =>
    TransactionContentResponse.fromJson(json.decode(str));

String transactionContentResponseToJson(TransactionContentResponse data) =>
    json.encode(data.toJson());

class TransactionContentResponse {
  TransactionContentResponse({
    this.data,
    this.errors,
  });

  factory TransactionContentResponse.fromJson(Map<String, dynamic> json) =>
      TransactionContentResponse(
        data: json['data'] == null
            ? null
            : TransactionContentResponseData.fromJson(json['data']),
        errors: json['errors'] == null
            ? null
            : List<Errors>.from(
                json['errors'].map(Errors.fromJson),),
      );

  TransactionContentResponseData? data;
  List<Errors>? errors;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'data': data!.toJson(),
        'errors': List<dynamic>.from(errors!.map((Errors x) => x.toJson())),
      };
}

class TransactionContentResponseData {
  TransactionContentResponseData({
    this.transaction,
  });

  factory TransactionContentResponseData.fromJson(Map<String, dynamic> json) =>
      TransactionContentResponseData(
        transaction: json['transaction'] == null
            ? null
            : Transaction.fromJson(json['transaction']),
      );

  Transaction? transaction;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'transaction': transaction!.toJson(),
      };
}
