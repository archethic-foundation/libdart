// To parse this JSON data, do
//
//     final simplePriceMyrResponse = simplePriceMyrResponseFromJson(jsonString);

import 'dart:convert';

SimplePriceMyrResponse simplePriceMyrResponseFromJson(String str) =>
    SimplePriceMyrResponse.fromJson(json.decode(str));

String simplePriceMyrResponseToJson(SimplePriceMyrResponse data) =>
    json.encode(data.toJson());

class SimplePriceMyrResponse {
  SimplePriceMyrResponse({
    this.uniris,
  });

  factory SimplePriceMyrResponse.fromJson(Map<String, dynamic> json) =>
      SimplePriceMyrResponse(
        uniris: Uniris.fromJson(json['uniris']),
      );

  Uniris? uniris;

  Map<String, dynamic> toJson() => {
        'uniris': uniris!.toJson(),
      };
}

class Uniris {
  Uniris({
    this.myr,
  });

  factory Uniris.fromJson(Map<String, dynamic> json) => Uniris(
        myr: json['myr'].toDouble(),
      );

  double? myr;

  Map<String, dynamic> toJson() => {
        'myr': myr,
      };
}
