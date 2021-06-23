// To parse this JSON data, do
//
//     final simplePriceArsResponse = simplePriceArsResponseFromJson(jsonString);

// Dart imports:
import 'dart:convert';

SimplePriceArsResponse simplePriceArsResponseFromJson(String str) =>
    SimplePriceArsResponse.fromJson(json.decode(str));

String simplePriceArsResponseToJson(SimplePriceArsResponse data) =>
    json.encode(data.toJson());

class SimplePriceArsResponse {
  SimplePriceArsResponse({
    this.uniris,
  });

  factory SimplePriceArsResponse.fromJson(Map<String, dynamic> json) =>
      SimplePriceArsResponse(
        uniris: ArchEthic.fromJson(json['uniris']),
      );

  ArchEthic? uniris;

  Map<String, dynamic> toJson() => {
        'uniris': uniris!.toJson(),
      };
}

class ArchEthic {
  ArchEthic({
    this.ars,
  });

  factory ArchEthic.fromJson(Map<String, dynamic> json) => ArchEthic(
        ars: json['ars'].toDouble(),
      );

  double? ars;

  Map<String, dynamic> toJson() => {
        'ars': ars,
      };
}
