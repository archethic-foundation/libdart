// To parse this JSON data, do
//
//     final simplePriceCadResponse = simplePriceCadResponseFromJson(jsonString);

import 'dart:convert';

SimplePriceCadResponse simplePriceCadResponseFromJson(String str) =>
    SimplePriceCadResponse.fromJson(json.decode(str));

String simplePriceCadResponseToJson(SimplePriceCadResponse data) =>
    json.encode(data.toJson());

class SimplePriceCadResponse {
  SimplePriceCadResponse({
    this.uniris,
  });

  factory SimplePriceCadResponse.fromJson(Map<String, dynamic> json) =>
      SimplePriceCadResponse(
        uniris: Uniris.fromJson(json['uniris']),
      );

  Uniris? uniris;

  Map<String, dynamic> toJson() => {
        'uniris': uniris!.toJson(),
      };
}

class Uniris {
  Uniris({
    this.cad,
  });

  factory Uniris.fromJson(Map<String, dynamic> json) => Uniris(
        cad: json['cad'].toDouble(),
      );

  double? cad;
  
  Map<String, dynamic> toJson() => {
        'cad': cad,
      };
}
