/// SPDX-License-Identifier: AGPL-3.0-or-later

// To parse this JSON data, do
//
//     final originKeyResponse = originKeyResponseFromJson(jsonString);

// Dart imports:
import 'dart:convert';

OriginKeyResponse originKeyResponseFromJson(String str) =>
    OriginKeyResponse.fromJson(json.decode(str));

String originKeyResponseToJson(OriginKeyResponse data) =>
    json.encode(data.toJson());

class OriginKeyResponse {
  OriginKeyResponse({this.status, this.transactionAddress});

  factory OriginKeyResponse.fromJson(Map<String, dynamic> json) =>
      OriginKeyResponse(
          status: json['status'],
          transactionAddress: json['transaction_address'],);

  String? status;
  String? transactionAddress;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'status': status,
        'transaction_address': transactionAddress
      };
}
