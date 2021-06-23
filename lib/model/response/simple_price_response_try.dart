// To parse this JSON data, do
//
//     final simplePriceTryResponse = simplePriceTryResponseFromJson(jsonString);

// Dart imports:
import 'dart:convert';

SimplePriceTryResponse simplePriceTryResponseFromJson(String str) =>
    SimplePriceTryResponse.fromJson(json.decode(str));

String simplePriceTryResponseToJson(SimplePriceTryResponse data) =>
    json.encode(data.toJson());

class SimplePriceTryResponse {
  SimplePriceTryResponse({
    this.uniris,
  });

  factory SimplePriceTryResponse.fromJson(Map<String, dynamic> json) =>
      SimplePriceTryResponse(
        uniris: ArchEthic.fromJson(json['uniris']),
      );

  ArchEthic? uniris;

  Map<String, dynamic> toJson() => {
        'uniris': uniris!.toJson(),
      };
}

class ArchEthic {
  ArchEthic({
    this.tryl,
  });

  factory ArchEthic.fromJson(Map<String, dynamic> json) => ArchEthic(
        tryl: json['try'].toDouble(),
      );

  double? tryl;

  Map<String, dynamic> toJson() => {
        'try': tryl,
      };
}
