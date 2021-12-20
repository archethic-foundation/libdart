// To parse this JSON data, do
//
//     final simplePriceTryResponse = simplePriceTryResponseFromJson(jsonString);

// Dart imports:
import 'dart:convert';

SimplePriceTryResponse simplePriceTryResponseFromJson(String str) =>
    SimplePriceTryResponse.fromJson(json.decode(str));

String simplePriceTryResponseToJson(SimplePriceTryResponse data) =>
    json.encode(data.toJson());

class SimplePriceTryResponse {
  SimplePriceTryResponse({
    this.archethic,
  });

  factory SimplePriceTryResponse.fromJson(Map<String, dynamic> json) =>
      SimplePriceTryResponse(
        archethic: Archethic.fromJson(json['archethic']),
      );

  Archethic? archethic;

  Map<String, dynamic> toJson() => {
        'archethic': archethic!.toJson(),
      };
}

class Archethic {
  Archethic({
    this.tryl,
  });

  factory Archethic.fromJson(Map<String, dynamic> json) => Archethic(
        tryl: json['try'].toDouble(),
      );

  double? tryl;

  Map<String, dynamic> toJson() => {
        'try': tryl,
      };
}
