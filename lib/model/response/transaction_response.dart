// To parse this JSON data, do
//
//     final transactionResponse = transactionResponseFromJson(jsonString);

// Dart imports:
import 'dart:convert';

TransactionResponse transactionResponseFromJson(String str) =>
    TransactionResponse.fromJson(json.decode(str));

String transactionResponseToJson(TransactionResponse data) =>
    json.encode(data.toJson());

class TransactionResponse {
  TransactionResponse({
    this.data,
  });

  TransactionResponseData? data;

  factory TransactionResponse.fromJson(Map<String, dynamic> json) =>
      TransactionResponse(
        data: TransactionResponseData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data!.toJson(),
      };
}

class TransactionResponseData {
  TransactionResponseData({
    this.transaction,
  });

  Transaction? transaction;

  factory TransactionResponseData.fromJson(Map<String, dynamic> json) =>
      TransactionResponseData(
        transaction: Transaction.fromJson(json["transaction"]),
      );

  Map<String, dynamic> toJson() => {
        "transaction": transaction!.toJson(),
      };
}

class Transaction {
  Transaction({
    this.data,
  });

  TransactionData? data;

  factory Transaction.fromJson(Map<String, dynamic> json) => Transaction(
        data: TransactionData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data!.toJson(),
      };
}

class TransactionData {
  TransactionData({
    this.content,
  });

  String? content;

  factory TransactionData.fromJson(Map<String, dynamic> json) =>
      TransactionData(
        content: json["content"],
      );

  Map<String, dynamic> toJson() => {
        "content": content,
      };
}
