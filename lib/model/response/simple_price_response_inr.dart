// To parse this JSON data, do
//
//     final simplePriceInrResponse = simplePriceInrResponseFromJson(jsonString);

// Dart imports:
import 'dart:convert';

SimplePriceInrResponse simplePriceInrResponseFromJson(String str) =>
    SimplePriceInrResponse.fromJson(json.decode(str));

String simplePriceInrResponseToJson(SimplePriceInrResponse data) =>
    json.encode(data.toJson());

class SimplePriceInrResponse {
  SimplePriceInrResponse({
    this.uniris,
  });

  factory SimplePriceInrResponse.fromJson(Map<String, dynamic> json) =>
      SimplePriceInrResponse(
        uniris: ArchEthic.fromJson(json['uniris']),
      );

  ArchEthic? uniris;

  Map<String, dynamic> toJson() => {
        'uniris': uniris!.toJson(),
      };
}

class ArchEthic {
  ArchEthic({
    this.inr,
  });

  factory ArchEthic.fromJson(Map<String, dynamic> json) => ArchEthic(
        inr: json['inr'].toDouble(),
      );

  double? inr;

  Map<String, dynamic> toJson() => {
        'inr': inr,
      };
}
