// To parse this JSON data, do
//
//     final simplePriceChfResponse = simplePriceChfResponseFromJson(jsonString);

import 'dart:convert';

SimplePriceChfResponse simplePriceChfResponseFromJson(String str) =>
    SimplePriceChfResponse.fromJson(json.decode(str));

String simplePriceChfResponseToJson(SimplePriceChfResponse data) =>
    json.encode(data.toJson());

class SimplePriceChfResponse {
  SimplePriceChfResponse({
    this.uniris,
  });

  factory SimplePriceChfResponse.fromJson(Map<String, dynamic> json) =>
      SimplePriceChfResponse(
        uniris: Uniris.fromJson(json['uniris']),
      );

  Uniris? uniris;

  Map<String, dynamic> toJson() => {
        'uniris': uniris!.toJson(),
      };
}

class Uniris {
  Uniris({
    this.chf,
  });

  factory Uniris.fromJson(Map<String, dynamic> json) => Uniris(
        chf: json['chf'].toDouble(),
      );

  double? chf;
  
  Map<String, dynamic> toJson() => {
        'chf': chf,
      };
}
