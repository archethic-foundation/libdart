// To parse this JSON data, do
//
//     final simplePriceAedResponse = simplePriceAedResponseFromJson(jsonString);

// Dart imports:
import 'dart:convert';

SimplePriceAedResponse simplePriceAedResponseFromJson(String str) =>
    SimplePriceAedResponse.fromJson(json.decode(str));

String simplePriceAedResponseToJson(SimplePriceAedResponse data) =>
    json.encode(data.toJson());

class SimplePriceAedResponse {
  SimplePriceAedResponse({
    this.uniris,
  });

  factory SimplePriceAedResponse.fromJson(Map<String, dynamic> json) =>
      SimplePriceAedResponse(
        uniris: ArchEthic.fromJson(json['uniris']),
      );

  ArchEthic? uniris;

  Map<String, dynamic> toJson() => {
        'uniris': uniris!.toJson(),
      };
}

class ArchEthic {
  ArchEthic({
    this.aed,
  });

  factory ArchEthic.fromJson(Map<String, dynamic> json) => ArchEthic(
        aed: json['aed'].toDouble(),
      );

  double? aed;

  Map<String, dynamic> toJson() => {
        'aed': aed,
      };
}
