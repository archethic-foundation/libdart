// To parse this JSON data, do
//
//     final simplePriceIlsResponse = simplePriceIlsResponseFromJson(jsonString);

// Dart imports:
import 'dart:convert';

SimplePriceIlsResponse simplePriceIlsResponseFromJson(String str) =>
    SimplePriceIlsResponse.fromJson(json.decode(str));

String simplePriceIlsResponseToJson(SimplePriceIlsResponse data) =>
    json.encode(data.toJson());

class SimplePriceIlsResponse {
  SimplePriceIlsResponse({
    this.uniris,
  });

  factory SimplePriceIlsResponse.fromJson(Map<String, dynamic> json) =>
      SimplePriceIlsResponse(
        uniris: ArchEthic.fromJson(json['uniris']),
      );

  ArchEthic? uniris;

  Map<String, dynamic> toJson() => {
        'uniris': uniris!.toJson(),
      };
}

class ArchEthic {
  ArchEthic({
    this.ils,
  });

  factory ArchEthic.fromJson(Map<String, dynamic> json) => ArchEthic(
        ils: json['ils'].toDouble(),
      );

  double? ils;

  Map<String, dynamic> toJson() => {
        'ils': ils,
      };
}
