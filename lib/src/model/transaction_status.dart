// To parse this JSON data, do
//
//     final transactionStatus = transactionStatusFromJson(jsonString);

// Dart imports:
import 'dart:convert';

TransactionStatus transactionStatusFromJson(String str) =>
    TransactionStatus.fromJson(json.decode(str));

String transactionStatusToJson(TransactionStatus data) =>
    json.encode(data.toJson());

class TransactionStatus {
  TransactionStatus({
    this.status,
  });

  String? status;

  factory TransactionStatus.fromJson(Map<String, dynamic> json) =>
      TransactionStatus(
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
      };
}
