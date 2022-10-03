/// SPDX-License-Identifier: AGPL-3.0-or-later

// To parse this JSON data, do
//
//     final transactionsResponse = transactionsResponseFromJson(jsonString);

// Dart imports:
import 'dart:convert';

// Project imports:
import 'package:archethic_lib_dart/src/model/errors.dart';
import 'package:archethic_lib_dart/src/model/ledger.dart';

TransactionsResponse transactionsResponseFromJson(String str) =>
    TransactionsResponse.fromJson(json.decode(str));

String transactionsResponseToJson(TransactionsResponse data) =>
    json.encode(data.toJson());

class TransactionsResponse {
  TransactionsResponse({this.data, this.errors});

  factory TransactionsResponse.fromJson(Map<String, dynamic> json) =>
      TransactionsResponse(
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
        transactionChain: List<TransactionChain>.from(json['transactionChain']
            .map(TransactionChain.fromJson),),
      );

  List<TransactionChain>? transactionChain;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'transactionChain': List<dynamic>.from(
            transactionChain!.map((TransactionChain x) => x.toJson()),),
      };
}

class TransactionChain {
  TransactionChain({
    this.address,
    this.data,
    this.type,
  });

  factory TransactionChain.fromJson(Map<String, dynamic> json) =>
      TransactionChain(
        address: json['address'],
        data: json['data'] == null
            ? null
            : TransactionChainData.fromJson(json['data']),
        type: json['type'],
      );

  String? address;
  TransactionChainData? data;
  String? type;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'address': address,
        'data': data!.toJson(),
        'type': type,
      };
}

class TransactionChainData {
  TransactionChainData({
    this.ledger,
  });

  factory TransactionChainData.fromJson(Map<String, dynamic> json) =>
      TransactionChainData(
        ledger: Ledger.fromJson(json['ledger']),
      );

  Ledger? ledger;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'ledger': ledger!.toJson(),
      };
}
