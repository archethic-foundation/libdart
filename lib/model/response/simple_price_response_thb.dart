// To parse this JSON data, do
//
//     final simplePriceThbResponse = simplePriceThbResponseFromJson(jsonString);

import 'dart:convert';

SimplePriceThbResponse simplePriceThbResponseFromJson(String str) =>
    SimplePriceThbResponse.fromJson(json.decode(str));

String simplePriceThbResponseToJson(SimplePriceThbResponse data) =>
    json.encode(data.toJson());

class SimplePriceThbResponse {
  SimplePriceThbResponse({
    this.uniris,
  });

  factory SimplePriceThbResponse.fromJson(Map<String, dynamic> json) =>
      SimplePriceThbResponse(
        uniris: Uniris.fromJson(json['uniris']),
      );

  Uniris? uniris;

  Map<String, dynamic> toJson() => {
        'uniris': uniris!.toJson(),
      };
}

class Uniris {
  Uniris({
    this.thb,
  });

  factory Uniris.fromJson(Map<String, dynamic> json) => Uniris(
        thb: json['thb'].toDouble(),
      );

  double? thb;

  Map<String, dynamic> toJson() => {
        'thb': thb,
      };
}
