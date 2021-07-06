// To parse this JSON data, do
//
//     final transactionLastResponse = transactionLastResponseFromJson(jsonString);

// Dart imports:
import 'dart:convert';

TransactionLastResponse transactionLastResponseFromJson(String str) =>
    TransactionLastResponse.fromJson(json.decode(str));

String transactionLastResponseToJson(TransactionLastResponse data) =>
    json.encode(data.toJson());

class TransactionLastResponse {
  TransactionLastResponse({
    this.data,
  });

  Data? data;

  factory TransactionLastResponse.fromJson(Map<String, dynamic> json) =>
      TransactionLastResponse(
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data!.toJson(),
      };
}

class Data {
  Data({
    this.lastTransaction,
  });

  LastTransaction? lastTransaction;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        lastTransaction: LastTransaction.fromJson(json["lastTransaction"]),
      );

  Map<String, dynamic> toJson() => {
        "lastTransaction": lastTransaction!.toJson(),
      };
}

class LastTransaction {
  LastTransaction({
    this.chainLength,
  });

  int? chainLength;

  factory LastTransaction.fromJson(Map<String, dynamic> json) =>
      LastTransaction(
        chainLength: json["chainLength"],
      );

  Map<String, dynamic> toJson() => {
        "chainLength": chainLength,
      };
}
