// To parse this JSON data, do
//
//     final simplePriceSgdResponse = simplePriceSgdResponseFromJson(jsonString);

// Dart imports:
import 'dart:convert';

SimplePriceSgdResponse simplePriceSgdResponseFromJson(String str) =>
    SimplePriceSgdResponse.fromJson(json.decode(str));

String simplePriceSgdResponseToJson(SimplePriceSgdResponse data) =>
    json.encode(data.toJson());

class SimplePriceSgdResponse {
  SimplePriceSgdResponse({
    this.archethic,
  });

  factory SimplePriceSgdResponse.fromJson(Map<String, dynamic> json) =>
      SimplePriceSgdResponse(
        archethic: Archethic.fromJson(json['archethic']),
      );

  Archethic? archethic;

  Map<String, dynamic> toJson() => {
        'archethic': archethic!.toJson(),
      };
}

class Archethic {
  Archethic({
    this.sgd,
  });

  factory Archethic.fromJson(Map<String, dynamic> json) => Archethic(
        sgd: json['sgd']?.toDouble(),
      );

  double? sgd;

  Map<String, dynamic> toJson() => {
        'sgd': sgd,
      };
}
