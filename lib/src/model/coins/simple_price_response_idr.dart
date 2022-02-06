// To parse this JSON data, do
//
//     final simplePriceIdrResponse = simplePriceIdrResponseFromJson(jsonString);

// Dart imports:
import 'dart:convert';

SimplePriceIdrResponse simplePriceIdrResponseFromJson(String str) =>
    SimplePriceIdrResponse.fromJson(json.decode(str));

String simplePriceIdrResponseToJson(SimplePriceIdrResponse data) =>
    json.encode(data.toJson());

class SimplePriceIdrResponse {
  SimplePriceIdrResponse({
    this.archethic,
  });

  factory SimplePriceIdrResponse.fromJson(Map<String, dynamic> json) =>
      SimplePriceIdrResponse(
        archethic: Archethic.fromJson(json['archethic']),
      );

  Archethic? archethic;

  Map<String, dynamic> toJson() => {
        'archethic': archethic!.toJson(),
      };
}

class Archethic {
  Archethic({
    this.idr,
  });

  factory Archethic.fromJson(Map<String, dynamic> json) => Archethic(
        idr: json['idr']?.toDouble(),
      );

  double? idr;

  Map<String, dynamic> toJson() => {
        'idr': idr,
      };
}
