// To parse this JSON data, do
//
//     final simplePriceGbpResponse = simplePriceGbpResponseFromJson(jsonString);

import 'dart:convert';

SimplePriceGbpResponse simplePriceGbpResponseFromJson(String str) =>
    SimplePriceGbpResponse.fromJson(json.decode(str));

String simplePriceGbpResponseToJson(SimplePriceGbpResponse data) =>
    json.encode(data.toJson());

class SimplePriceGbpResponse {
  SimplePriceGbpResponse({
    this.uniris,
  });

  factory SimplePriceGbpResponse.fromJson(Map<String, dynamic> json) =>
      SimplePriceGbpResponse(
        uniris: Uniris.fromJson(json['uniris']),
      );

  Uniris? uniris;

  Map<String, dynamic> toJson() => {
        'uniris': uniris!.toJson(),
      };
}

class Uniris {
  Uniris({
    this.gbp,
  });

  factory Uniris.fromJson(Map<String, dynamic> json) => Uniris(
        gbp: json['gbp'].toDouble(),
      );

  double? gbp;

  Map<String, dynamic> toJson() => {
        'gbp': gbp,
      };
}
