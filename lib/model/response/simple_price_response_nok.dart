// To parse this JSON data, do
//
//     final simplePriceNokResponse = simplePriceNokResponseFromJson(jsonString);

// Dart imports:
import 'dart:convert';

SimplePriceNokResponse simplePriceNokResponseFromJson(String str) =>
    SimplePriceNokResponse.fromJson(json.decode(str));

String simplePriceNokResponseToJson(SimplePriceNokResponse data) =>
    json.encode(data.toJson());

class SimplePriceNokResponse {
  SimplePriceNokResponse({
    this.uniris,
  });

  factory SimplePriceNokResponse.fromJson(Map<String, dynamic> json) =>
      SimplePriceNokResponse(
        uniris: Uniris.fromJson(json['uniris']),
      );

  Uniris? uniris;

  Map<String, dynamic> toJson() => {
        'uniris': uniris!.toJson(),
      };
}

class Uniris {
  Uniris({
    this.nok,
  });

  factory Uniris.fromJson(Map<String, dynamic> json) => Uniris(
        nok: json['nok'].toDouble(),
      );

  double? nok;

  Map<String, dynamic> toJson() => {
        'nok': nok,
      };
}
