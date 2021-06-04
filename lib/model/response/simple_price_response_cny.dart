// To parse this JSON data, do
//
//     final simplePriceCnyResponse = simplePriceCnyResponseFromJson(jsonString);

import 'dart:convert';

SimplePriceCnyResponse simplePriceCnyResponseFromJson(String str) =>
    SimplePriceCnyResponse.fromJson(json.decode(str));

String simplePriceCnyResponseToJson(SimplePriceCnyResponse data) =>
    json.encode(data.toJson());

class SimplePriceCnyResponse {
  SimplePriceCnyResponse({
    this.uniris,
  });

  factory SimplePriceCnyResponse.fromJson(Map<String, dynamic> json) =>
      SimplePriceCnyResponse(
        uniris: Uniris.fromJson(json['uniris']),
      );

  Uniris? uniris;

  Map<String, dynamic> toJson() => {
        'uniris': uniris!.toJson(),
      };
}

class Uniris {
  Uniris({
    this.cny,
  });

  factory Uniris.fromJson(Map<String, dynamic> json) => Uniris(
        cny: json['cny'].toDouble(),
      );

  double? cny;

  Map<String, dynamic> toJson() => {
        'cny': cny,
      };
}
