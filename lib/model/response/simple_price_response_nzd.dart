// To parse this JSON data, do
//
//     final simplePriceNzdResponse = simplePriceNzdResponseFromJson(jsonString);

// Dart imports:
import 'dart:convert';

SimplePriceNzdResponse simplePriceNzdResponseFromJson(String str) =>
    SimplePriceNzdResponse.fromJson(json.decode(str));

String simplePriceNzdResponseToJson(SimplePriceNzdResponse data) =>
    json.encode(data.toJson());

class SimplePriceNzdResponse {
  SimplePriceNzdResponse({
    this.uniris,
  });

  factory SimplePriceNzdResponse.fromJson(Map<String, dynamic> json) =>
      SimplePriceNzdResponse(
        uniris: ArchEthic.fromJson(json['uniris']),
      );

  ArchEthic? uniris;

  Map<String, dynamic> toJson() => {
        'uniris': uniris!.toJson(),
      };
}

class ArchEthic {
  ArchEthic({
    this.nzd,
  });

  factory ArchEthic.fromJson(Map<String, dynamic> json) => ArchEthic(
        nzd: json['nzd'].toDouble(),
      );

  double? nzd;

  Map<String, dynamic> toJson() => {
        'nzd': nzd,
      };
}
