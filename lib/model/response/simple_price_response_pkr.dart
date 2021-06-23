// To parse this JSON data, do
//
//     final simplePricePkrResponse = simplePricePkrResponseFromJson(jsonString);

// Dart imports:
import 'dart:convert';

SimplePricePkrResponse simplePricePkrResponseFromJson(String str) =>
    SimplePricePkrResponse.fromJson(json.decode(str));

String simplePricePkrResponseToJson(SimplePricePkrResponse data) =>
    json.encode(data.toJson());

class SimplePricePkrResponse {
  SimplePricePkrResponse({
    this.uniris,
  });

  factory SimplePricePkrResponse.fromJson(Map<String, dynamic> json) =>
      SimplePricePkrResponse(
        uniris: ArchEthic.fromJson(json['uniris']),
      );

  ArchEthic? uniris;

  Map<String, dynamic> toJson() => {
        'uniris': uniris!.toJson(),
      };
}

class ArchEthic {
  ArchEthic({
    this.pkr,
  });

  factory ArchEthic.fromJson(Map<String, dynamic> json) => ArchEthic(
        pkr: json['pkr'].toDouble(),
      );

  double? pkr;

  Map<String, dynamic> toJson() => {
        'pkr': pkr,
      };
}
