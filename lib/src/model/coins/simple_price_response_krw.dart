// To parse this JSON data, do
//
//     final simplePriceKrwResponse = simplePriceKrwResponseFromJson(jsonString);

// Dart imports:
import 'dart:convert';

SimplePriceKrwResponse simplePriceKrwResponseFromJson(String str) =>
    SimplePriceKrwResponse.fromJson(json.decode(str));

String simplePriceKrwResponseToJson(SimplePriceKrwResponse data) =>
    json.encode(data.toJson());

class SimplePriceKrwResponse {
  SimplePriceKrwResponse({
    this.archethic,
  });

  factory SimplePriceKrwResponse.fromJson(Map<String, dynamic> json) =>
      SimplePriceKrwResponse(
        archethic: Archethic.fromJson(json['archethic']),
      );

  Archethic? archethic;

  Map<String, dynamic> toJson() => {
        'archethic': archethic!.toJson(),
      };
}

class Archethic {
  Archethic({
    this.krw,
  });

  factory Archethic.fromJson(Map<String, dynamic> json) => Archethic(
        krw: json['krw'].toDouble(),
      );

  double? krw;

  Map<String, dynamic> toJson() => {
        'krw': krw,
      };
}
