// To parse this JSON data, do
//
//     final simplePriceInrResponse = simplePriceInrResponseFromJson(jsonString);

// Dart imports:
import 'dart:convert';

SimplePriceInrResponse simplePriceInrResponseFromJson(String str) =>
    SimplePriceInrResponse.fromJson(json.decode(str));

String simplePriceInrResponseToJson(SimplePriceInrResponse data) =>
    json.encode(data.toJson());

class SimplePriceInrResponse {
  SimplePriceInrResponse({
    this.uniris,
  });

  factory SimplePriceInrResponse.fromJson(Map<String, dynamic> json) =>
      SimplePriceInrResponse(
        uniris: Uniris.fromJson(json['uniris']),
      );

  Uniris? uniris;

  Map<String, dynamic> toJson() => {
        'uniris': uniris!.toJson(),
      };
}

class Uniris {
  Uniris({
    this.inr,
  });

  factory Uniris.fromJson(Map<String, dynamic> json) => Uniris(
        inr: json['inr'].toDouble(),
      );

  double? inr;

  Map<String, dynamic> toJson() => {
        'inr': inr,
      };
}
