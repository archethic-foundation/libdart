// To parse this JSON data, do
//
//     final simplePriceSekResponse = simplePriceSekResponseFromJson(jsonString);

// Dart imports:
import 'dart:convert';

SimplePriceSekResponse simplePriceSekResponseFromJson(String str) =>
    SimplePriceSekResponse.fromJson(json.decode(str));

String simplePriceSekResponseToJson(SimplePriceSekResponse data) =>
    json.encode(data.toJson());

class SimplePriceSekResponse {
  SimplePriceSekResponse({
    this.uniris,
  });

  factory SimplePriceSekResponse.fromJson(Map<String, dynamic> json) =>
      SimplePriceSekResponse(
        uniris: ArchEthic.fromJson(json['uniris']),
      );

  ArchEthic? uniris;

  Map<String, dynamic> toJson() => {
        'uniris': uniris!.toJson(),
      };
}

class ArchEthic {
  ArchEthic({
    this.sek,
  });

  factory ArchEthic.fromJson(Map<String, dynamic> json) => ArchEthic(
        sek: json['sek'].toDouble(),
      );

  double? sek;

  Map<String, dynamic> toJson() => {
        'sek': sek,
      };
}
