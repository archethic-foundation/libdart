// To parse this JSON data, do
//
//     final simplePriceKrwResponse = simplePriceKrwResponseFromJson(jsonString);

// Dart imports:
import 'dart:convert';

SimplePriceKrwResponse simplePriceKrwResponseFromJson(String str) =>
    SimplePriceKrwResponse.fromJson(json.decode(str));

String simplePriceKrwResponseToJson(SimplePriceKrwResponse data) =>
    json.encode(data.toJson());

class SimplePriceKrwResponse {
  SimplePriceKrwResponse({
    this.uniris,
  });

  factory SimplePriceKrwResponse.fromJson(Map<String, dynamic> json) =>
      SimplePriceKrwResponse(
        uniris: ArchEthic.fromJson(json['uniris']),
      );

  ArchEthic? uniris;

  Map<String, dynamic> toJson() => {
        'uniris': uniris!.toJson(),
      };
}

class ArchEthic {
  ArchEthic({
    this.krw,
  });

  factory ArchEthic.fromJson(Map<String, dynamic> json) => ArchEthic(
        krw: json['krw'].toDouble(),
      );

  double? krw;

  Map<String, dynamic> toJson() => {
        'krw': krw,
      };
}
