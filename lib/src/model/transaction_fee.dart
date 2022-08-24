/// SPDX-License-Identifier: AGPL-3.0-or-later

// To parse this JSON data, do
//
//     final transactionFee = transactionFeeFromJson(jsonString);

// Dart imports:
import 'dart:convert';

// Project imports:
import 'package:archethic_lib_dart/src/model/data.dart';

TransactionFee transactionFeeFromJson(String str) =>
    TransactionFee.fromJson(json.decode(str));

String transactionFeeToJson(TransactionFee data) => json.encode(data.toJson());

class TransactionFee {
  TransactionFee({this.fee, this.rates, this.errors});

  double? fee;
  Rates? rates;
  TransactionFeeErrors? errors;

  factory TransactionFee.fromJson(Map<String, dynamic> json) => TransactionFee(
        fee: json['fee']?.toDouble(),
        rates: json['rates'] == null ? null : Rates.fromJson(json['rates']),
        errors: json['errors'] == null
            ? null
            : TransactionFeeErrors.fromJson(json['errors']),
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'fee': fee,
        'rates': rates!.toJson(),
        'errors': errors!.toJson()
      };
}

class Rates {
  Rates({
    this.eur,
    this.usd,
  });

  double? eur;
  double? usd;

  factory Rates.fromJson(Map<String, dynamic> json) => Rates(
        eur: json['eur']?.toDouble(),
        usd: json['usd']?.toDouble(),
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'eur': eur,
        'usd': usd,
      };
}

class TransactionFeeErrors {
  TransactionFeeErrors({
    this.data,
  });

  Data? data;

  factory TransactionFeeErrors.fromJson(Map<String, dynamic> json) =>
      TransactionFeeErrors(
        data: Data.fromJson(json['data']),
      );

  Map<String, dynamic> toJson() => {
        'data': data!.toJson(),
      };
}
