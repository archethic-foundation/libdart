// To parse this JSON data, do
//
//     final simplePriceZarResponse = simplePriceZarResponseFromJson(jsonString);

// Dart imports:
import 'dart:convert';

SimplePriceZarResponse simplePriceZarResponseFromJson(String str) =>
    SimplePriceZarResponse.fromJson(json.decode(str));

String simplePriceZarResponseToJson(SimplePriceZarResponse data) =>
    json.encode(data.toJson());

class SimplePriceZarResponse {
  SimplePriceZarResponse({
    this.archethic,
  });

  factory SimplePriceZarResponse.fromJson(Map<String, dynamic> json) =>
      SimplePriceZarResponse(
        archethic: Archethic.fromJson(json['archethic']),
      );

  Archethic? archethic;

  Map<String, dynamic> toJson() => {
        'archethic': archethic!.toJson(),
      };
}

class Archethic {
  Archethic({
    this.zar,
  });

  factory Archethic.fromJson(Map<String, dynamic> json) => Archethic(
        zar: json['zar']?.toDouble(),
      );

  double? zar;

  Map<String, dynamic> toJson() => {
        'zar': zar,
      };
}
