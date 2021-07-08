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

  factory TransactionLastResponse.fromJson(Map<String, dynamic> json) =>
      TransactionLastResponse(
        data: Data.fromJson(json['data']),
      );

  Data? data;

  Map<String, dynamic> toJson() => {
        'data': data!.toJson(),
      };
}

class Data {
  Data({
    this.lastTransaction,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        lastTransaction: LastTransaction.fromJson(json['lastTransaction']),
      );

  LastTransaction? lastTransaction;

  Map<String, dynamic> toJson() => {
        'lastTransaction': lastTransaction!.toJson(),
      };
}

class LastTransaction {
  LastTransaction({
    this.chainLength,
  });

  factory LastTransaction.fromJson(Map<String, dynamic> json) =>
      LastTransaction(
        chainLength: json['chainLength'],
      );
      
  int? chainLength;

  Map<String, dynamic> toJson() => {
        'chainLength': chainLength,
      };
}
