// To parse this JSON data, do
//
//     final simplePriceBrlResponse = simplePriceBrlResponseFromJson(jsonString);

// Dart imports:
import 'dart:convert';

SimplePriceBrlResponse simplePriceBrlResponseFromJson(String str) =>
    SimplePriceBrlResponse.fromJson(json.decode(str));

String simplePriceBrlResponseToJson(SimplePriceBrlResponse data) =>
    json.encode(data.toJson());

class SimplePriceBrlResponse {
  SimplePriceBrlResponse({
    this.uniris,
  });

  factory SimplePriceBrlResponse.fromJson(Map<String, dynamic> json) =>
      SimplePriceBrlResponse(
        uniris: ArchEthic.fromJson(json['uniris']),
      );

  ArchEthic? uniris;

  Map<String, dynamic> toJson() => {
        'uniris': uniris!.toJson(),
      };
}

class ArchEthic {
  ArchEthic({
    this.brl,
  });

  factory ArchEthic.fromJson(Map<String, dynamic> json) => ArchEthic(
        brl: json['brl'].toDouble(),
      );

  double? brl;

  Map<String, dynamic> toJson() => {
        'brl': brl,
      };
}
