// To parse this JSON data, do
//
//     final simplePricePkrResponse = simplePricePkrResponseFromJson(jsonString);

// Dart imports:
import 'dart:convert';

SimplePricePkrResponse simplePricePkrResponseFromJson(String str) =>
    SimplePricePkrResponse.fromJson(json.decode(str));

String simplePricePkrResponseToJson(SimplePricePkrResponse data) =>
    json.encode(data.toJson());

class SimplePricePkrResponse {
  SimplePricePkrResponse({
    this.archethic,
  });

  factory SimplePricePkrResponse.fromJson(Map<String, dynamic> json) =>
      SimplePricePkrResponse(
        archethic: Archethic.fromJson(json['archethic']),
      );

  Archethic? archethic;

  Map<String, dynamic> toJson() => {
        'archethic': archethic!.toJson(),
      };
}

class Archethic {
  Archethic({
    this.pkr,
  });

  factory Archethic.fromJson(Map<String, dynamic> json) => Archethic(
        pkr: json['pkr'].toDouble(),
      );

  double? pkr;

  Map<String, dynamic> toJson() => {
        'pkr': pkr,
      };
}
