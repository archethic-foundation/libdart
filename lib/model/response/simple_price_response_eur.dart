// To parse this JSON data, do
//
//     final simplePriceEurResponse = simplePriceEurResponseFromJson(jsonString);

import 'dart:convert';

SimplePriceEurResponse simplePriceEurResponseFromJson(String str) =>
    SimplePriceEurResponse.fromJson(json.decode(str));

String simplePriceEurResponseToJson(SimplePriceEurResponse data) =>
    json.encode(data.toJson());

class SimplePriceEurResponse {
  SimplePriceEurResponse({
    this.uniris,
  });

  factory SimplePriceEurResponse.fromJson(Map<String, dynamic> json) =>
      SimplePriceEurResponse(
        uniris: Uniris.fromJson(json['uniris']),
      );

  Uniris? uniris;

  Map<String, dynamic> toJson() => {
        'uniris': uniris!.toJson(),
      };
}

class Uniris {
  Uniris({
    this.eur,
  });

  factory Uniris.fromJson(Map<String, dynamic> json) => Uniris(
        eur: json['eur'].toDouble(),
      );

  double? eur;
  
  Map<String, dynamic> toJson() => {
        'eur': eur,
      };
}
