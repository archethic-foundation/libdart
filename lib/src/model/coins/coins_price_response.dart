/// SPDX-License-Identifier: AGPL-3.0-or-later

// To parse this JSON data, do
//
//     final coinsPriceResponse = coinsPriceResponseFromJson(jsonString);

// Dart imports:
import 'dart:convert';

CoinsPriceResponse coinsPriceResponseFromJson(String str) =>
    CoinsPriceResponse.fromJson(json.decode(str));

String coinsPriceResponseToJson(CoinsPriceResponse data) =>
    json.encode(data.toJson());

class CoinsPriceResponse {
  CoinsPriceResponse({
    this.prices,
    this.marketCaps,
    this.totalVolumes,
  });

  factory CoinsPriceResponse.fromJson(Map<String, dynamic> json) =>
      CoinsPriceResponse(
        prices: List<List<double>>.from(json['prices']
            .map((x) => List<double>.from(x.map((x) => x.toDouble())))),
        marketCaps: List<List<double>>.from(json['market_caps']
            .map((x) => List<double>.from(x.map((x) => x.toDouble())))),
        totalVolumes: List<List<double>>.from(json['total_volumes']
            .map((x) => List<double>.from(x.map((x) => x.toDouble())))),
      );

  List<List<double>>? prices;
  List<List<double>>? marketCaps;
  List<List<double>>? totalVolumes;

  Map<String, dynamic> toJson() => {
        'prices': List<dynamic>.from(
            prices!.map((x) => List<dynamic>.from(x.map((x) => x)))),
        'market_caps': List<dynamic>.from(
            marketCaps!.map((x) => List<dynamic>.from(x.map((x) => x)))),
        'total_volumes': List<dynamic>.from(
            totalVolumes!.map((x) => List<dynamic>.from(x.map((x) => x)))),
      };
}
