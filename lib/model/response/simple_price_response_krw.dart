// To parse this JSON data, do
//
//     final simplePriceKrwResponse = simplePriceKrwResponseFromJson(jsonString);

import 'dart:convert';

SimplePriceKrwResponse simplePriceKrwResponseFromJson(String str) =>
    SimplePriceKrwResponse.fromJson(json.decode(str));

String simplePriceKrwResponseToJson(SimplePriceKrwResponse data) =>
    json.encode(data.toJson());

class SimplePriceKrwResponse {
  SimplePriceKrwResponse({
    this.uniris,
  });

  factory SimplePriceKrwResponse.fromJson(Map<String, dynamic> json) =>
      SimplePriceKrwResponse(
        uniris: Uniris.fromJson(json['uniris']),
      );

  Uniris? uniris;

  Map<String, dynamic> toJson() => {
        'uniris': uniris!.toJson(),
      };
}

class Uniris {
  Uniris({
    this.krw,
  });

  factory Uniris.fromJson(Map<String, dynamic> json) => Uniris(
        krw: json['krw'].toDouble(),
      );

  double? krw;

  Map<String, dynamic> toJson() => {
        'krw': krw,
      };
}
