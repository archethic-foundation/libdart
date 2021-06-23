// To parse this JSON data, do
//
//     final simplePriceCnyResponse = simplePriceCnyResponseFromJson(jsonString);

// Dart imports:
import 'dart:convert';

SimplePriceCnyResponse simplePriceCnyResponseFromJson(String str) =>
    SimplePriceCnyResponse.fromJson(json.decode(str));

String simplePriceCnyResponseToJson(SimplePriceCnyResponse data) =>
    json.encode(data.toJson());

class SimplePriceCnyResponse {
  SimplePriceCnyResponse({
    this.uniris,
  });

  factory SimplePriceCnyResponse.fromJson(Map<String, dynamic> json) =>
      SimplePriceCnyResponse(
        uniris: ArchEthic.fromJson(json['uniris']),
      );

  ArchEthic? uniris;

  Map<String, dynamic> toJson() => {
        'uniris': uniris!.toJson(),
      };
}

class ArchEthic {
  ArchEthic({
    this.cny,
  });

  factory ArchEthic.fromJson(Map<String, dynamic> json) => ArchEthic(
        cny: json['cny'].toDouble(),
      );

  double? cny;

  Map<String, dynamic> toJson() => {
        'cny': cny,
      };
}
