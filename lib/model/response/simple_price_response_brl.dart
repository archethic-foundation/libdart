// To parse this JSON data, do
//
//     final simplePriceBrlResponse = simplePriceBrlResponseFromJson(jsonString);

import 'dart:convert';

SimplePriceBrlResponse simplePriceBrlResponseFromJson(String str) =>
    SimplePriceBrlResponse.fromJson(json.decode(str));

String simplePriceBrlResponseToJson(SimplePriceBrlResponse data) =>
    json.encode(data.toJson());

class SimplePriceBrlResponse {
  SimplePriceBrlResponse({
    this.uniris,
  });

  factory SimplePriceBrlResponse.fromJson(Map<String, dynamic> json) =>
      SimplePriceBrlResponse(
        uniris: Uniris.fromJson(json['uniris']),
      );

  Uniris? uniris;

  Map<String, dynamic> toJson() => {
        'uniris': uniris!.toJson(),
      };
}

class Uniris {
  Uniris({
    this.brl,
  });

  factory Uniris.fromJson(Map<String, dynamic> json) => Uniris(
        brl: json['brl'].toDouble(),
      );

  double? brl;

  Map<String, dynamic> toJson() => {
        'brl': brl,
      };
}
