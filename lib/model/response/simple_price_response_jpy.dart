// To parse this JSON data, do
//
//     final simplePriceJpyResponse = simplePriceJpyResponseFromJson(jsonString);

// Dart imports:
import 'dart:convert';

SimplePriceJpyResponse simplePriceJpyResponseFromJson(String str) =>
    SimplePriceJpyResponse.fromJson(json.decode(str));

String simplePriceJpyResponseToJson(SimplePriceJpyResponse data) =>
    json.encode(data.toJson());

class SimplePriceJpyResponse {
  SimplePriceJpyResponse({
    this.uniris,
  });

  factory SimplePriceJpyResponse.fromJson(Map<String, dynamic> json) =>
      SimplePriceJpyResponse(
        uniris: ArchEthic.fromJson(json['uniris']),
      );

  ArchEthic? uniris;

  Map<String, dynamic> toJson() => {
        'uniris': uniris!.toJson(),
      };
}

class ArchEthic {
  ArchEthic({
    this.jpy,
  });

  factory ArchEthic.fromJson(Map<String, dynamic> json) => ArchEthic(
        jpy: json['jpy'].toDouble(),
      );

  double? jpy;

  Map<String, dynamic> toJson() => {
        'jpy': jpy,
      };
}
