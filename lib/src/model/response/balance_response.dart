// To parse this JSON data, do
//
//     final balanceResponse = balanceResponseFromJson(jsonString);

// Dart imports:
import 'dart:convert';

// Project imports:
import 'package:archethic_lib_dart/src/model/balance.dart';
import 'package:archethic_lib_dart/src/model/errors.dart';

BalanceResponse balanceResponseFromJson(String str) =>
    BalanceResponse.fromJson(json.decode(str));

String balanceResponseToJson(BalanceResponse data) =>
    json.encode(data.toJson());

class BalanceResponse {
  BalanceResponse({
    this.data,
    this.errors,
  });

  factory BalanceResponse.fromJson(Map<String, dynamic> json) =>
      BalanceResponse(
        data: json['data'] == null
            ? null
            : BalanceResponseData.fromJson(json['data']),
        errors: json['errors'] == null
            ? null
            : List<Errors>.from(json['errors'].map((x) => Errors.fromJson(x))),
      );

  BalanceResponseData? data;
  List<Errors>? errors;

  Map<String, dynamic> toJson() => {
        'data': data!.toJson(),
        'errors': List<dynamic>.from(errors!.map((x) => x.toJson())),
      };
}

class BalanceResponseData {
  BalanceResponseData({
    this.balance,
  });

  factory BalanceResponseData.fromJson(Map<String, dynamic> json) =>
      BalanceResponseData(
        balance: Balance.fromJson(json['balance']),
      );

  Balance? balance;

  Map<String, dynamic> toJson() => {
        'balance': balance!.toJson(),
      };
}
