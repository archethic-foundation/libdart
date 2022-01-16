/// To parse this JSON data, do
///
///    final oracleUcoPrice = oracleUcoPriceFromJson(jsonString);
/// Example : Content={"1642347300":{"uco":{"eur":0.150324,"usd":0.1716}}

import 'dart:convert';

OracleUcoPrice oracleUcoPriceFromJson(String str) =>
    OracleUcoPrice.fromJson(json.decode(str));

String oracleUcoPriceToJson(OracleUcoPrice data) => json.encode(data.toJson());

class OracleUcoPrice {
  OracleUcoPrice({
    this.uco,
  });

  Uco? uco;

  factory OracleUcoPrice.fromJson(Map<String, dynamic> json) => OracleUcoPrice(
        uco: Uco.fromJson(json["uco"]),
      );

  Map<String, dynamic> toJson() => {
        "uco": uco!.toJson(),
      };
}

class Uco {
  Uco({
    this.eur,
    this.usd,
  });

  double? eur;
  double? usd;

  factory Uco.fromJson(Map<String, dynamic> json) => Uco(
        eur: json["eur"]?.toDouble(),
        usd: json["usd"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "eur": eur,
        "usd": usd,
      };
}
