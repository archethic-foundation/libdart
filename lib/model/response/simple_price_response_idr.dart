// To parse this JSON data, do
//
//     final simplePriceIdrResponse = simplePriceIdrResponseFromJson(jsonString);

import 'dart:convert';

SimplePriceIdrResponse simplePriceIdrResponseFromJson(String str) =>
    SimplePriceIdrResponse.fromJson(json.decode(str));

String simplePriceIdrResponseToJson(SimplePriceIdrResponse data) =>
    json.encode(data.toJson());

class SimplePriceIdrResponse {
  SimplePriceIdrResponse({
    this.uniris,
  });

  factory SimplePriceIdrResponse.fromJson(Map<String, dynamic> json) =>
      SimplePriceIdrResponse(
        uniris: Uniris.fromJson(json['uniris']),
      );

  Uniris? uniris;

  Map<String, dynamic> toJson() => {
        'uniris': uniris!.toJson(),
      };
}

class Uniris {
  Uniris({
    this.idr,
  });

  factory Uniris.fromJson(Map<String, dynamic> json) => Uniris(
        idr: json['idr'].toDouble(),
      );

  double? idr;
  
  Map<String, dynamic> toJson() => {
        'idr': idr,
      };
}
