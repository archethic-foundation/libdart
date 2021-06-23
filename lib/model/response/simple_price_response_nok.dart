// To parse this JSON data, do
//
//     final simplePriceNokResponse = simplePriceNokResponseFromJson(jsonString);

// Dart imports:
import 'dart:convert';

SimplePriceNokResponse simplePriceNokResponseFromJson(String str) =>
    SimplePriceNokResponse.fromJson(json.decode(str));

String simplePriceNokResponseToJson(SimplePriceNokResponse data) =>
    json.encode(data.toJson());

class SimplePriceNokResponse {
  SimplePriceNokResponse({
    this.uniris,
  });

  factory SimplePriceNokResponse.fromJson(Map<String, dynamic> json) =>
      SimplePriceNokResponse(
        uniris: ArchEthic.fromJson(json['uniris']),
      );

  ArchEthic? uniris;

  Map<String, dynamic> toJson() => {
        'uniris': uniris!.toJson(),
      };
}

class ArchEthic {
  ArchEthic({
    this.nok,
  });

  factory ArchEthic.fromJson(Map<String, dynamic> json) => ArchEthic(
        nok: json['nok'].toDouble(),
      );

  double? nok;

  Map<String, dynamic> toJson() => {
        'nok': nok,
      };
}
