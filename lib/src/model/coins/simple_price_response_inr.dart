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
    this.archethic,
  });

  factory SimplePriceInrResponse.fromJson(Map<String, dynamic> json) =>
      SimplePriceInrResponse(
        archethic: Archethic.fromJson(json['archethic']),
      );

  Archethic? archethic;

  Map<String, dynamic> toJson() => {
        'archethic': archethic!.toJson(),
      };
}

class Archethic {
  Archethic({
    this.inr,
  });

  factory Archethic.fromJson(Map<String, dynamic> json) => Archethic(
        inr: json['inr']?.toDouble(),
      );

  double? inr;

  Map<String, dynamic> toJson() => {
        'inr': inr,
      };
}
