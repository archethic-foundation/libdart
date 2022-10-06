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
    this.error,
  });

  factory CoinsPriceResponse.fromJson(Map<String, dynamic> json) =>
      CoinsPriceResponse(
        prices: json['prices'] == null
            ? null
            : List<List<double>>.from(
                json['prices'].map(
                  (dynamic x) =>
                      List<double>.from(x.map((dynamic x) => x.toDouble())),
                ),
              ),
        marketCaps: json['market_caps'] == null
            ? null
            : List<List<double>>.from(
                json['market_caps'].map(
                  (dynamic x) =>
                      List<double>.from(x.map((dynamic x) => x.toDouble())),
                ),
              ),
        totalVolumes: json['total_volumes'] == null
            ? null
            : List<List<double>>.from(
                json['total_volumes'].map(
                  (dynamic x) =>
                      List<double>.from(x.map((dynamic x) => x.toDouble())),
                ),
              ),
        error: json['error'],
      );

  List<List<double>>? prices;
  List<List<double>>? marketCaps;
  List<List<double>>? totalVolumes;
  String? error;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'prices': List<dynamic>.from(
          prices!.map(
            (List<double> x) => List<dynamic>.from(x.map((double x) => x)),
          ),
        ),
        'market_caps': List<dynamic>.from(
          marketCaps!.map(
            (List<double> x) => List<dynamic>.from(x.map((double x) => x)),
          ),
        ),
        'total_volumes': List<dynamic>.from(
          totalVolumes!.map(
            (List<double> x) => List<dynamic>.from(x.map((double x) => x)),
          ),
        ),
        'error': error,
      };
}
