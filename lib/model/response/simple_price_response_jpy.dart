// To parse this JSON data, do
//
//     final simplePriceJpyResponse = simplePriceJpyResponseFromJson(jsonString);

import 'dart:convert';

SimplePriceJpyResponse simplePriceJpyResponseFromJson(String str) =>
    SimplePriceJpyResponse.fromJson(json.decode(str));

String simplePriceJpyResponseToJson(SimplePriceJpyResponse data) =>
    json.encode(data.toJson());

class SimplePriceJpyResponse {
  SimplePriceJpyResponse({
    this.uniris,
  });

  factory SimplePriceJpyResponse.fromJson(Map<String, dynamic> json) =>
      SimplePriceJpyResponse(
        uniris: Uniris.fromJson(json['uniris']),
      );

  Uniris? uniris;

  Map<String, dynamic> toJson() => {
        'uniris': uniris!.toJson(),
      };
}

class Uniris {
  Uniris({
    this.jpy,
  });

  factory Uniris.fromJson(Map<String, dynamic> json) => Uniris(
        jpy: json['jpy'].toDouble(),
      );

  double? jpy;

  Map<String, dynamic> toJson() => {
        'jpy': jpy,
      };
}
