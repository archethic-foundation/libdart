// To parse this JSON data, do
//
//     final simplePriceZarResponse = simplePriceZarResponseFromJson(jsonString);

import 'dart:convert';

SimplePriceZarResponse simplePriceZarResponseFromJson(String str) =>
    SimplePriceZarResponse.fromJson(json.decode(str));

String simplePriceZarResponseToJson(SimplePriceZarResponse data) =>
    json.encode(data.toJson());

class SimplePriceZarResponse {
  SimplePriceZarResponse({
    this.uniris,
  });

  factory SimplePriceZarResponse.fromJson(Map<String, dynamic> json) =>
      SimplePriceZarResponse(
        uniris: Uniris.fromJson(json['uniris']),
      );

  Uniris? uniris;
  
  Map<String, dynamic> toJson() => {
        'uniris': uniris!.toJson(),
      };
}

class Uniris {
  Uniris({
    this.zar,
  });

  factory Uniris.fromJson(Map<String, dynamic> json) => Uniris(
        zar: json['zar'].toDouble(),
      );

  double? zar;

  Map<String, dynamic> toJson() => {
        'zar': zar,
      };
}
