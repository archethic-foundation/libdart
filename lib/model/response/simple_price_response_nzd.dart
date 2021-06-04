// To parse this JSON data, do
//
//     final simplePriceNzdResponse = simplePriceNzdResponseFromJson(jsonString);

import 'dart:convert';

SimplePriceNzdResponse simplePriceNzdResponseFromJson(String str) =>
    SimplePriceNzdResponse.fromJson(json.decode(str));

String simplePriceNzdResponseToJson(SimplePriceNzdResponse data) =>
    json.encode(data.toJson());

class SimplePriceNzdResponse {
  SimplePriceNzdResponse({
    this.uniris,
  });

  factory SimplePriceNzdResponse.fromJson(Map<String, dynamic> json) =>
      SimplePriceNzdResponse(
        uniris: Uniris.fromJson(json['uniris']),
      );

  Uniris? uniris;

  Map<String, dynamic> toJson() => {
        'uniris': uniris!.toJson(),
      };
}

class Uniris {
  Uniris({
    this.nzd,
  });

  factory Uniris.fromJson(Map<String, dynamic> json) => Uniris(
        nzd: json['nzd'].toDouble(),
      );

  double? nzd;

  Map<String, dynamic> toJson() => {
        'nzd': nzd,
      };
}
