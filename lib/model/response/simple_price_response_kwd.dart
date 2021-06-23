// To parse this JSON data, do
//
//     final simplePriceKwdResponse = simplePriceKwdResponseFromJson(jsonString);

// Dart imports:
import 'dart:convert';

SimplePriceKwdResponse simplePriceKwdResponseFromJson(String str) =>
    SimplePriceKwdResponse.fromJson(json.decode(str));

String simplePriceKwdResponseToJson(SimplePriceKwdResponse data) =>
    json.encode(data.toJson());

class SimplePriceKwdResponse {
  SimplePriceKwdResponse({
    this.uniris,
  });

  factory SimplePriceKwdResponse.fromJson(Map<String, dynamic> json) =>
      SimplePriceKwdResponse(
        uniris: ArchEthic.fromJson(json['uniris']),
      );

  ArchEthic? uniris;

  Map<String, dynamic> toJson() => {
        'uniris': uniris!.toJson(),
      };
}

class ArchEthic {
  ArchEthic({
    this.kwd,
  });

  factory ArchEthic.fromJson(Map<String, dynamic> json) => ArchEthic(
        kwd: json['kwd'].toDouble(),
      );

  double? kwd;

  Map<String, dynamic> toJson() => {
        'kwd': kwd,
      };
}
