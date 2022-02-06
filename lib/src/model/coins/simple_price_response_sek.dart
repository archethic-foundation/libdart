// To parse this JSON data, do
//
//     final simplePriceSekResponse = simplePriceSekResponseFromJson(jsonString);

// Dart imports:
import 'dart:convert';

SimplePriceSekResponse simplePriceSekResponseFromJson(String str) =>
    SimplePriceSekResponse.fromJson(json.decode(str));

String simplePriceSekResponseToJson(SimplePriceSekResponse data) =>
    json.encode(data.toJson());

class SimplePriceSekResponse {
  SimplePriceSekResponse({
    this.archethic,
  });

  factory SimplePriceSekResponse.fromJson(Map<String, dynamic> json) =>
      SimplePriceSekResponse(
        archethic: Archethic.fromJson(json['archethic']),
      );

  Archethic? archethic;

  Map<String, dynamic> toJson() => {
        'archethic': archethic!.toJson(),
      };
}

class Archethic {
  Archethic({
    this.sek,
  });

  factory Archethic.fromJson(Map<String, dynamic> json) => Archethic(
        sek: json['sek']?.toDouble(),
      );

  double? sek;

  Map<String, dynamic> toJson() => {
        'sek': sek,
      };
}
