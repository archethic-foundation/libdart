// To parse this JSON data, do
//
//     final simplePriceHkdResponse = simplePriceHkdResponseFromJson(jsonString);

// Dart imports:
import 'dart:convert';

SimplePriceHkdResponse simplePriceHkdResponseFromJson(String str) =>
    SimplePriceHkdResponse.fromJson(json.decode(str));

String simplePriceHkdResponseToJson(SimplePriceHkdResponse data) =>
    json.encode(data.toJson());

class SimplePriceHkdResponse {
  SimplePriceHkdResponse({
    this.uniris,
  });

  factory SimplePriceHkdResponse.fromJson(Map<String, dynamic> json) =>
      SimplePriceHkdResponse(
        uniris: ArchEthic.fromJson(json['uniris']),
      );

  ArchEthic? uniris;

  Map<String, dynamic> toJson() => {
        'uniris': uniris!.toJson(),
      };
}

class ArchEthic {
  ArchEthic({
    this.hkd,
  });

  factory ArchEthic.fromJson(Map<String, dynamic> json) => ArchEthic(
        hkd: json['hkd'].toDouble(),
      );

  double? hkd;

  Map<String, dynamic> toJson() => {
        'hkd': hkd,
      };
}
