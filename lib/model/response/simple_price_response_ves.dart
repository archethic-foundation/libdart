// To parse this JSON data, do
//
//     final simplePriceVesResponse = simplePriceVesResponseFromJson(jsonString);

// Dart imports:
import 'dart:convert';

SimplePriceVesResponse simplePriceVesResponseFromJson(String str) =>
    SimplePriceVesResponse.fromJson(json.decode(str));

String simplePriceVesResponseToJson(SimplePriceVesResponse data) =>
    json.encode(data.toJson());

class SimplePriceVesResponse {
  SimplePriceVesResponse({
    this.uniris,
  });

  factory SimplePriceVesResponse.fromJson(Map<String, dynamic> json) =>
      SimplePriceVesResponse(
        uniris: ArchEthic.fromJson(json['uniris']),
      );

  ArchEthic? uniris;

  Map<String, dynamic> toJson() => {
        'uniris': uniris!.toJson(),
      };
}

class ArchEthic {
  ArchEthic({
    this.ves,
  });

  factory ArchEthic.fromJson(Map<String, dynamic> json) => ArchEthic(
        ves: json['ves'].toDouble(),
      );

  double? ves;

  Map<String, dynamic> toJson() => {
        'ves': ves,
      };
}
