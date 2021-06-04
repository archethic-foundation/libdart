// To parse this JSON data, do
//
//     final simplePriceCzkResponse = simplePriceCzkResponseFromJson(jsonString);

import 'dart:convert';

SimplePriceCzkResponse simplePriceCzkResponseFromJson(String str) =>
    SimplePriceCzkResponse.fromJson(json.decode(str));

String simplePriceCzkResponseToJson(SimplePriceCzkResponse data) =>
    json.encode(data.toJson());

class SimplePriceCzkResponse {
  SimplePriceCzkResponse({
    this.uniris,
  });

  factory SimplePriceCzkResponse.fromJson(Map<String, dynamic> json) =>
      SimplePriceCzkResponse(
        uniris: Uniris.fromJson(json['uniris']),
      );

  Uniris? uniris;

  Map<String, dynamic> toJson() => {
        'uniris': uniris!.toJson(),
      };
}

class Uniris {
  Uniris({
    this.czk,
  });

  factory Uniris.fromJson(Map<String, dynamic> json) => Uniris(
        czk: json['czk'].toDouble(),
      );

  double? czk;

  Map<String, dynamic> toJson() => {
        'czk': czk,
      };
}
