// To parse this JSON data, do
//
//     final simplePriceMyrResponse = simplePriceMyrResponseFromJson(jsonString);

// Dart imports:
import 'dart:convert';

SimplePriceMyrResponse simplePriceMyrResponseFromJson(String str) =>
    SimplePriceMyrResponse.fromJson(json.decode(str));

String simplePriceMyrResponseToJson(SimplePriceMyrResponse data) =>
    json.encode(data.toJson());

class SimplePriceMyrResponse {
  SimplePriceMyrResponse({
    this.uniris,
  });

  factory SimplePriceMyrResponse.fromJson(Map<String, dynamic> json) =>
      SimplePriceMyrResponse(
        uniris: ArchEthic.fromJson(json['uniris']),
      );

  ArchEthic? uniris;

  Map<String, dynamic> toJson() => {
        'uniris': uniris!.toJson(),
      };
}

class ArchEthic {
  ArchEthic({
    this.myr,
  });

  factory ArchEthic.fromJson(Map<String, dynamic> json) => ArchEthic(
        myr: json['myr'].toDouble(),
      );

  double? myr;

  Map<String, dynamic> toJson() => {
        'myr': myr,
      };
}
