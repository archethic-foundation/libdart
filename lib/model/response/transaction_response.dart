// To parse this JSON data, do
//
//     final transactionResponse = transactionResponseFromJson(jsonString);

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
    this.content,
  });

  String? content;

  factory TransactionResponseData.fromJson(Map<String, dynamic> json) => TransactionResponseData(
        content: json["content"],
      );

  Map<String, dynamic> toJson() => {
        "content": content,
      };
}
