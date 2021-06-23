// To parse this JSON data, do
//
//     final simplePriceGbpResponse = simplePriceGbpResponseFromJson(jsonString);

// Dart imports:
import 'dart:convert';

SimplePriceGbpResponse simplePriceGbpResponseFromJson(String str) =>
    SimplePriceGbpResponse.fromJson(json.decode(str));

String simplePriceGbpResponseToJson(SimplePriceGbpResponse data) =>
    json.encode(data.toJson());

class SimplePriceGbpResponse {
  SimplePriceGbpResponse({
    this.uniris,
  });

  factory SimplePriceGbpResponse.fromJson(Map<String, dynamic> json) =>
      SimplePriceGbpResponse(
        uniris: ArchEthic.fromJson(json['uniris']),
      );

  ArchEthic? uniris;

  Map<String, dynamic> toJson() => {
        'uniris': uniris!.toJson(),
      };
}

class ArchEthic {
  ArchEthic({
    this.gbp,
  });

  factory ArchEthic.fromJson(Map<String, dynamic> json) => ArchEthic(
        gbp: json['gbp'].toDouble(),
      );

  double? gbp;

  Map<String, dynamic> toJson() => {
        'gbp': gbp,
      };
}
