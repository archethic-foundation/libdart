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

  factory TransactionLastResponse.fromJson(Map<String, dynamic> json) =>
      TransactionLastResponse(
        data: json['data'] == null ? null : Transaction.fromJson(json['data']),
        errors: json['errors'] == null
            ? null
            : List<Errors>.from(json['errors'].map((x) => Errors.fromJson(x))),
      );

  Transaction? data;
  List<Errors>? errors;

  Map<String, dynamic> toJson() => {
        'data': data!.toJson(),
        'errors': List<dynamic>.from(errors!.map((x) => x.toJson())),
      };
}
