// To parse this JSON data, do
//
//     final transactionFee = transactionFeeFromJson(jsonString);

// Dart imports:
import 'dart:convert';

TransactionFee transactionFeeFromJson(String str) =>
    TransactionFee.fromJson(json.decode(str));

String transactionFeeToJson(TransactionFee data) => json.encode(data.toJson());

class TransactionFee {
  TransactionFee({
    this.fee,
    this.rates,
  });

  double? fee;
  Rates? rates;

  factory TransactionFee.fromJson(Map<String, dynamic> json) => TransactionFee(
        fee: json["fee"]?.toDouble(),
        rates: Rates.fromJson(json["rates"]),
      );

  Map<String, dynamic> toJson() => {
        "fee": fee,
        "rates": rates!.toJson(),
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
        eur: json["eur"]?.toDouble(),
        usd: json["usd"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "eur": eur,
        "usd": usd,
      };
}
