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

  Data? data;

  factory TransactionResponse.fromJson(Map<String, dynamic> json) =>
      TransactionResponse(
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data!.toJson(),
      };
}

class Data {
  Data({
    this.content,
  });

  String? content;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        content: json["content"],
      );

  Map<String, dynamic> toJson() => {
        "content": content,
      };
}
