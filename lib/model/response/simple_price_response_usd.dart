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
        uniris: ArchEthic.fromJson(json['uniris']),
      );

  ArchEthic? uniris;

  Map<String, dynamic> toJson() => {
        'uniris': uniris!.toJson(),
      };
}

class ArchEthic {
  ArchEthic({
    this.usd,
  });

  factory ArchEthic.fromJson(Map<String, dynamic> json) => ArchEthic(
        usd: json['usd'].toDouble(),
      );

  double? usd;

  Map<String, dynamic> toJson() => {
        'usd': usd,
      };
}
