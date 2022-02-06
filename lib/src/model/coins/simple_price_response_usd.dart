// To parse this JSON data, do
//
//     final simplePriceUsdResponse = simplePriceUsdResponseFromJson(jsonString);

// Dart imports:
import 'dart:convert';

SimplePriceUsdResponse simplePriceUsdResponseFromJson(String str) =>
    SimplePriceUsdResponse.fromJson(json.decode(str));

String simplePriceUsdResponseToJson(SimplePriceUsdResponse data) =>
    json.encode(data.toJson());

class SimplePriceUsdResponse {
  SimplePriceUsdResponse({
    this.archethic,
  });

  factory SimplePriceUsdResponse.fromJson(Map<String, dynamic> json) =>
      SimplePriceUsdResponse(
        archethic: Archethic.fromJson(json['archethic']),
      );

  Archethic? archethic;

  Map<String, dynamic> toJson() => {
        'archethic': archethic!.toJson(),
      };
}

class Archethic {
  Archethic({
    this.usd,
  });

  factory Archethic.fromJson(Map<String, dynamic> json) => Archethic(
        usd: json['usd']?.toDouble(),
      );

  double? usd;

  Map<String, dynamic> toJson() => {
        'usd': usd,
      };
}
