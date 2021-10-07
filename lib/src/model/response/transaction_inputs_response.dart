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

  Data? data;

  factory TransactionInputsResponse.fromJson(Map<String, dynamic> json) =>
      TransactionInputsResponse(
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data!.toJson(),
      };
}

class Data {
  Data({
    this.transactionInputs,
  });

  List<TransactionInput>? transactionInputs;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        transactionInputs: List<TransactionInput>.from(
            json["transactionInputs"].map((x) => TransactionInput.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "transactionInputs":
            List<dynamic>.from(transactionInputs!.map((x) => x.toJson())),
      };
}
