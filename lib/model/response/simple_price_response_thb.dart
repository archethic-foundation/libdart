// To parse this JSON data, do
//
//     final simplePriceThbResponse = simplePriceThbResponseFromJson(jsonString);

// Dart imports:
import 'dart:convert';

SimplePriceThbResponse simplePriceThbResponseFromJson(String str) =>
    SimplePriceThbResponse.fromJson(json.decode(str));

String simplePriceThbResponseToJson(SimplePriceThbResponse data) =>
    json.encode(data.toJson());

class SimplePriceThbResponse {
  SimplePriceThbResponse({
    this.uniris,
  });

  factory SimplePriceThbResponse.fromJson(Map<String, dynamic> json) =>
      SimplePriceThbResponse(
        uniris: ArchEthic.fromJson(json['uniris']),
      );

  ArchEthic? uniris;

  Map<String, dynamic> toJson() => {
        'uniris': uniris!.toJson(),
      };
}

class ArchEthic {
  ArchEthic({
    this.thb,
  });

  factory ArchEthic.fromJson(Map<String, dynamic> json) => ArchEthic(
        thb: json['thb'].toDouble(),
      );

  double? thb;

  Map<String, dynamic> toJson() => {
        'thb': thb,
      };
}
