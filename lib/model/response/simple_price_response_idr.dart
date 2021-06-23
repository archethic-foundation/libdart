// To parse this JSON data, do
//
//     final simplePriceIdrResponse = simplePriceIdrResponseFromJson(jsonString);

// Dart imports:
import 'dart:convert';

SimplePriceIdrResponse simplePriceIdrResponseFromJson(String str) =>
    SimplePriceIdrResponse.fromJson(json.decode(str));

String simplePriceIdrResponseToJson(SimplePriceIdrResponse data) =>
    json.encode(data.toJson());

class SimplePriceIdrResponse {
  SimplePriceIdrResponse({
    this.uniris,
  });

  factory SimplePriceIdrResponse.fromJson(Map<String, dynamic> json) =>
      SimplePriceIdrResponse(
        uniris: ArchEthic.fromJson(json['uniris']),
      );

  ArchEthic? uniris;

  Map<String, dynamic> toJson() => {
        'uniris': uniris!.toJson(),
      };
}

class ArchEthic {
  ArchEthic({
    this.idr,
  });

  factory ArchEthic.fromJson(Map<String, dynamic> json) => ArchEthic(
        idr: json['idr'].toDouble(),
      );

  double? idr;

  Map<String, dynamic> toJson() => {
        'idr': idr,
      };
}
