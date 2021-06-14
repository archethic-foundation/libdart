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
    this.uniris,
  });

  factory SimplePriceUsdResponse.fromJson(Map<String, dynamic> json) =>
      SimplePriceUsdResponse(
        uniris: Uniris.fromJson(json['uniris']),
      );

  Uniris? uniris;

  Map<String, dynamic> toJson() => {
        'uniris': uniris!.toJson(),
      };
}

class Uniris {
  Uniris({
    this.usd,
  });

  factory Uniris.fromJson(Map<String, dynamic> json) => Uniris(
        usd: json['usd'].toDouble(),
      );

  double? usd;

  Map<String, dynamic> toJson() => {
        'usd': usd,
      };
}
