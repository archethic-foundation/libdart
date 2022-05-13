/// SPDX-License-Identifier: AGPL-3.0-or-later

/// To parse this JSON data, do
///
///    final oracleUcoPrice = oracleUcoPriceFromJson(jsonString);
/// Example : Content={"1642347300":{"uco":{"eur":0.150324,"usd":0.1716}}

// Dart imports:
import 'dart:convert';

// Project imports:
import 'package:archethic_lib_dart/src/model/uco.dart';

OracleUcoPrice oracleUcoPriceFromJson(String str) =>
    OracleUcoPrice.fromJson(json.decode(str));

String oracleUcoPriceToJson(OracleUcoPrice data) => json.encode(data.toJson());

class OracleUcoPrice {
  OracleUcoPrice({
    this.uco,
  });

  Uco? uco;

  factory OracleUcoPrice.fromJson(Map<String, dynamic> json) => OracleUcoPrice(
        uco: Uco.fromJson(json['uco']),
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'uco': uco!.toJson(),
      };
}
