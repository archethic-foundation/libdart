/// SPDX-License-Identifier: AGPL-3.0-or-later

/// To parse this JSON data, do
///
///    final oracleUcoPrice = oracleUcoPriceFromJson(jsonString);
/// Example : Content={"1642347300":{"uco":{"eur":0.150324,"usd":0.1716}}

import 'dart:convert';
import 'package:archethic_lib_dart/src/model/uco.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'oracle_uco_price.freezed.dart';
part 'oracle_uco_price.g.dart';

OracleUcoPrice oracleUcoPriceFromJson(String str) =>
    OracleUcoPrice.fromJson(json.decode(str));

String oracleUcoPriceToJson(OracleUcoPrice data) => json.encode(data.toJson());

@freezed
class OracleUcoPrice with _$OracleUcoPrice {
  const factory OracleUcoPrice({
    Uco? uco,
    int? timestamp,
  }) = _OracleUcoPrice;
  const OracleUcoPrice._();

  factory OracleUcoPrice.fromJson(Map<String, dynamic> json) =>
      _$OracleUcoPriceFromJson(json);
}
