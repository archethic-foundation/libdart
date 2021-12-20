// To parse this JSON data, do
//
//     final simplePriceHkdResponse = simplePriceHkdResponseFromJson(jsonString);

// Dart imports:
import 'dart:convert';

SimplePriceHkdResponse simplePriceHkdResponseFromJson(String str) =>
    SimplePriceHkdResponse.fromJson(json.decode(str));

String simplePriceHkdResponseToJson(SimplePriceHkdResponse data) =>
    json.encode(data.toJson());

class SimplePriceHkdResponse {
  SimplePriceHkdResponse({
    this.archethic,
  });

  factory SimplePriceHkdResponse.fromJson(Map<String, dynamic> json) =>
      SimplePriceHkdResponse(
        archethic: Archethic.fromJson(json['archethic']),
      );

  Archethic? archethic;

  Map<String, dynamic> toJson() => {
        'archethic': archethic!.toJson(),
      };
}

class Archethic {
  Archethic({
    this.hkd,
  });

  factory Archethic.fromJson(Map<String, dynamic> json) => Archethic(
        hkd: json['hkd'].toDouble(),
      );

  double? hkd;

  Map<String, dynamic> toJson() => {
        'hkd': hkd,
      };
}
