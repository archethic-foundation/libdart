/// SPDX-License-Identifier: AGPL-3.0-or-later

// To parse this JSON data, do
//
//     final transactionInputsResponse = transactionInputsResponseFromJson(jsonString);

// Dart imports:
import 'dart:convert';

// Project imports:
import 'package:archethic_lib_dart/src/model/transaction_input.dart';

TransactionInputsResponse transactionInputsResponseFromJson(String str) =>
    TransactionInputsResponse.fromJson(json.decode(str));

String transactionInputsResponseToJson(TransactionInputsResponse data) =>
    json.encode(data.toJson());

class TransactionInputsResponse {
  TransactionInputsResponse({
    this.data,
  });

  factory TransactionInputsResponse.fromJson(Map<String, dynamic> json) =>
      TransactionInputsResponse(
        data: Data.fromJson(json['data']),
      );

  Data? data;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'data': data!.toJson(),
      };
}

class Data {
  Data({
    this.transactionInputs,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        transactionInputs: List<TransactionInput>.from(json['transactionInputs']
            .map(TransactionInput.fromJson),),
      );

  List<TransactionInput>? transactionInputs;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'transactionInputs': List<dynamic>.from(
            transactionInputs!.map((TransactionInput x) => x.toJson()),),
      };
}
