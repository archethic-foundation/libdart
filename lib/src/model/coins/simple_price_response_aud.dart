// To parse this JSON data, do
//
//     final simplePriceAudResponse = simplePriceAudResponseFromJson(jsonString);

// Dart imports:
import 'dart:convert';

SimplePriceAudResponse simplePriceAudResponseFromJson(String str) =>
    SimplePriceAudResponse.fromJson(json.decode(str));

String simplePriceaudResponseToJson(SimplePriceAudResponse data) =>
    json.encode(data.toJson());

class SimplePriceAudResponse {
  SimplePriceAudResponse({
    this.archethic,
  });

  factory SimplePriceAudResponse.fromJson(Map<String, dynamic> json) =>
      SimplePriceAudResponse(
        archethic: Archethic.fromJson(json['archethic']),
      );

  Archethic? archethic;

  Map<String, dynamic> toJson() => {
        'archethic': archethic!.toJson(),
      };
}

class Archethic {
  Archethic({
    this.aud,
  });

  factory Archethic.fromJson(Map<String, dynamic> json) => Archethic(
        aud: json['aud']?.toDouble(),
      );

  double? aud;

  Map<String, dynamic> toJson() => {
        'aud': aud,
      };
}
