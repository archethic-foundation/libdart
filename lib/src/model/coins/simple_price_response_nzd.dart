// To parse this JSON data, do
//
//     final simplePriceNzdResponse = simplePriceNzdResponseFromJson(jsonString);

// Dart imports:
import 'dart:convert';

SimplePriceNzdResponse simplePriceNzdResponseFromJson(String str) =>
    SimplePriceNzdResponse.fromJson(json.decode(str));

String simplePriceNzdResponseToJson(SimplePriceNzdResponse data) =>
    json.encode(data.toJson());

class SimplePriceNzdResponse {
  SimplePriceNzdResponse({
    this.archethic,
  });

  factory SimplePriceNzdResponse.fromJson(Map<String, dynamic> json) =>
      SimplePriceNzdResponse(
        archethic: Archethic.fromJson(json['archethic']),
      );

  Archethic? archethic;

  Map<String, dynamic> toJson() => {
        'archethic': archethic!.toJson(),
      };
}

class Archethic {
  Archethic({
    this.nzd,
  });

  factory Archethic.fromJson(Map<String, dynamic> json) => Archethic(
        nzd: json['nzd']?.toDouble(),
      );

  double? nzd;

  Map<String, dynamic> toJson() => {
        'nzd': nzd,
      };
}
