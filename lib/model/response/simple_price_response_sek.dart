// To parse this JSON data, do
//
//     final simplePriceSekResponse = simplePriceSekResponseFromJson(jsonString);

import 'dart:convert';

SimplePriceSekResponse simplePriceSekResponseFromJson(String str) =>
    SimplePriceSekResponse.fromJson(json.decode(str));

String simplePriceSekResponseToJson(SimplePriceSekResponse data) =>
    json.encode(data.toJson());

class SimplePriceSekResponse {
  SimplePriceSekResponse({
    this.uniris,
  });

  factory SimplePriceSekResponse.fromJson(Map<String, dynamic> json) =>
      SimplePriceSekResponse(
        uniris: Uniris.fromJson(json['uniris']),
      );

  Uniris? uniris;
  
  Map<String, dynamic> toJson() => {
        'uniris': uniris!.toJson(),
      };
}

class Uniris {
  Uniris({
    this.sek,
  });

  factory Uniris.fromJson(Map<String, dynamic> json) => Uniris(
        sek: json['sek'].toDouble(),
      );

  double? sek;

  Map<String, dynamic> toJson() => {
        'sek': sek,
      };
}
