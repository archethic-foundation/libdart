// To parse this JSON data, do
//
//     final simplePriceThbResponse = simplePriceThbResponseFromJson(jsonString);

// Dart imports:
import 'dart:convert';

SimplePriceThbResponse simplePriceThbResponseFromJson(String str) =>
    SimplePriceThbResponse.fromJson(json.decode(str));

String simplePriceThbResponseToJson(SimplePriceThbResponse data) =>
    json.encode(data.toJson());

class SimplePriceThbResponse {
  SimplePriceThbResponse({
    this.archethic,
  });

  factory SimplePriceThbResponse.fromJson(Map<String, dynamic> json) =>
      SimplePriceThbResponse(
        archethic: Archethic.fromJson(json['archethic']),
      );

  Archethic? archethic;

  Map<String, dynamic> toJson() => {
        'archethic': archethic!.toJson(),
      };
}

class Archethic {
  Archethic({
    this.thb,
  });

  factory Archethic.fromJson(Map<String, dynamic> json) => Archethic(
        thb: json['thb'].toDouble(),
      );

  double? thb;

  Map<String, dynamic> toJson() => {
        'thb': thb,
      };
}
