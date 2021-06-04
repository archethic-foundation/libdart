// To parse this JSON data, do
//
//     final simplePriceTwdResponse = simplePriceTwdResponseFromJson(jsonString);

import 'dart:convert';

SimplePriceTwdResponse simplePriceTwdResponseFromJson(String str) =>
    SimplePriceTwdResponse.fromJson(json.decode(str));

String simplePriceTwdResponseToJson(SimplePriceTwdResponse data) =>
    json.encode(data.toJson());

class SimplePriceTwdResponse {
  SimplePriceTwdResponse({
    this.uniris,
  });

  factory SimplePriceTwdResponse.fromJson(Map<String, dynamic> json) =>
      SimplePriceTwdResponse(
        uniris: Uniris.fromJson(json['uniris']),
      );

  Uniris? uniris;

  Map<String, dynamic> toJson() => {
        'uniris': uniris!.toJson(),
      };
}

class Uniris {
  Uniris({
    this.twd,
  });

  factory Uniris.fromJson(Map<String, dynamic> json) => Uniris(
        twd: json['twd'].toDouble(),
      );

  double? twd;

  Map<String, dynamic> toJson() => {
        'twd': twd,
      };
}
