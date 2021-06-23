// To parse this JSON data, do
//
//     final simplePriceCadResponse = simplePriceCadResponseFromJson(jsonString);

// Dart imports:
import 'dart:convert';

SimplePriceCadResponse simplePriceCadResponseFromJson(String str) =>
    SimplePriceCadResponse.fromJson(json.decode(str));

String simplePriceCadResponseToJson(SimplePriceCadResponse data) =>
    json.encode(data.toJson());

class SimplePriceCadResponse {
  SimplePriceCadResponse({
    this.uniris,
  });

  factory SimplePriceCadResponse.fromJson(Map<String, dynamic> json) =>
      SimplePriceCadResponse(
        uniris: ArchEthic.fromJson(json['uniris']),
      );

  ArchEthic? uniris;

  Map<String, dynamic> toJson() => {
        'uniris': uniris!.toJson(),
      };
}

class ArchEthic {
  ArchEthic({
    this.cad,
  });

  factory ArchEthic.fromJson(Map<String, dynamic> json) => ArchEthic(
        cad: json['cad'].toDouble(),
      );

  double? cad;

  Map<String, dynamic> toJson() => {
        'cad': cad,
      };
}
