// To parse this JSON data, do
//
//     final simplePriceHkdResponse = simplePriceHkdResponseFromJson(jsonString);

import 'dart:convert';

SimplePriceHkdResponse simplePriceHkdResponseFromJson(String str) =>
    SimplePriceHkdResponse.fromJson(json.decode(str));

String simplePriceHkdResponseToJson(SimplePriceHkdResponse data) =>
    json.encode(data.toJson());

class SimplePriceHkdResponse {
  SimplePriceHkdResponse({
    this.uniris,
  });

  factory SimplePriceHkdResponse.fromJson(Map<String, dynamic> json) =>
      SimplePriceHkdResponse(
        uniris: Uniris.fromJson(json['uniris']),
      );

  Uniris? uniris;

  Map<String, dynamic> toJson() => {
        'uniris': uniris!.toJson(),
      };
}

class Uniris {
  Uniris({
    this.hkd,
  });

  factory Uniris.fromJson(Map<String, dynamic> json) => Uniris(
        hkd: json['hkd'].toDouble(),
      );

  double? hkd;

  Map<String, dynamic> toJson() => {
        'hkd': hkd,
      };
}
