// To parse this JSON data, do
//
//     final transactionContentResponse = transactionContentResponseFromJson(jsonString);

// Dart imports:
import 'dart:convert';

TransactionContentResponse transactionContentResponseFromJson(String str) =>
    TransactionContentResponse.fromJson(json.decode(str));

String transactionContentResponseToJson(TransactionContentResponse data) =>
    json.encode(data.toJson());

class TransactionContentResponse {
  TransactionContentResponse({
    this.data,
  });

  factory TransactionContentResponse.fromJson(Map<String, dynamic> json) =>
      TransactionContentResponse(
        data: TransactionContentResponseData.fromJson(json['data']),
      );

  TransactionContentResponseData? data;

  Map<String, dynamic> toJson() => {
        'data': data!.toJson(),
      };
}

class TransactionContentResponseData {
  TransactionContentResponseData({
    this.transaction,
  });

  factory TransactionContentResponseData.fromJson(Map<String, dynamic> json) =>
      TransactionContentResponseData(
        transaction: Transaction.fromJson(json['transaction']),
      );

  Transaction? transaction;

  Map<String, dynamic> toJson() => {
        'transaction': transaction!.toJson(),
      };
}

class Transaction {
  Transaction({
    this.data,
  });

  factory Transaction.fromJson(Map<String, dynamic> json) => Transaction(
        data: TransactionData.fromJson(json['data']),
      );

  TransactionData? data;

  Map<String, dynamic> toJson() => {
        'data': data!.toJson(),
      };
}

class TransactionData {
  TransactionData({
    this.content,
  });

  factory TransactionData.fromJson(Map<String, dynamic> json) =>
      TransactionData(
        content: json['content'],
      );

  String? content;

  Map<String, dynamic> toJson() => {
        'content': content,
      };
}
