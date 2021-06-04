// To parse this JSON data, do
//
//     final simplePricePlnResponse = simplePricePlnResponseFromJson(jsonString);

import 'dart:convert';

SimplePricePlnResponse simplePricePlnResponseFromJson(String str) =>
    SimplePricePlnResponse.fromJson(json.decode(str));

String simplePricePlnResponseToJson(SimplePricePlnResponse data) =>
    json.encode(data.toJson());

class SimplePricePlnResponse {
  SimplePricePlnResponse({
    this.uniris,
  });

  factory SimplePricePlnResponse.fromJson(Map<String, dynamic> json) =>
      SimplePricePlnResponse(
        uniris: Uniris.fromJson(json['uniris']),
      );

  Uniris? uniris;

  Map<String, dynamic> toJson() => {
        'uniris': uniris!.toJson(),
      };
}

class Uniris {
  Uniris({
    this.pln,
  });

  factory Uniris.fromJson(Map<String, dynamic> json) => Uniris(
        pln: json['pln'].toDouble(),
      );

  double? pln;
  
  Map<String, dynamic> toJson() => {
        'pln': pln,
      };
}
