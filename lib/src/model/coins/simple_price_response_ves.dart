// To parse this JSON data, do
//
//     final simplePriceVesResponse = simplePriceVesResponseFromJson(jsonString);

// Dart imports:
import 'dart:convert';

SimplePriceVesResponse simplePriceVesResponseFromJson(String str) =>
    SimplePriceVesResponse.fromJson(json.decode(str));

String simplePriceVesResponseToJson(SimplePriceVesResponse data) =>
    json.encode(data.toJson());

class SimplePriceVesResponse {
  SimplePriceVesResponse({
    this.archethic,
  });

  factory SimplePriceVesResponse.fromJson(Map<String, dynamic> json) =>
      SimplePriceVesResponse(
        archethic: Archethic.fromJson(json['archethic']),
      );

  Archethic? archethic;

  Map<String, dynamic> toJson() => {
        'archethic': archethic!.toJson(),
      };
}

class Archethic {
  Archethic({
    this.ves,
  });

  factory Archethic.fromJson(Map<String, dynamic> json) => Archethic(
        ves: json['ves']?.toDouble(),
      );

  double? ves;

  Map<String, dynamic> toJson() => {
        'ves': ves,
      };
}
