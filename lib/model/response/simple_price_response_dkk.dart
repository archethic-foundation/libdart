// To parse this JSON data, do
//
//     final simplePriceDkkResponse = simplePriceDkkResponseFromJson(jsonString);

import 'dart:convert';

SimplePriceDkkResponse simplePriceDkkResponseFromJson(String str) =>
    SimplePriceDkkResponse.fromJson(json.decode(str));

String simplePriceDkkResponseToJson(SimplePriceDkkResponse data) =>
    json.encode(data.toJson());

class SimplePriceDkkResponse {
  SimplePriceDkkResponse({
    this.uniris,
  });

  factory SimplePriceDkkResponse.fromJson(Map<String, dynamic> json) =>
      SimplePriceDkkResponse(
        uniris: Uniris.fromJson(json['uniris']),
      );

  Uniris? uniris;

  Map<String, dynamic> toJson() => {
        'uniris': uniris!.toJson(),
      };
}

class Uniris {
  Uniris({
    this.dkk,
  });

  factory Uniris.fromJson(Map<String, dynamic> json) => Uniris(
        dkk: json['dkk'].toDouble(),
      );

  double? dkk;

  Map<String, dynamic> toJson() => {
        'dkk': dkk,
      };
}
