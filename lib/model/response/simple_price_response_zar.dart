// To parse this JSON data, do
//
//     final simplePriceZarResponse = simplePriceZarResponseFromJson(jsonString);

// Dart imports:
import 'dart:convert';

SimplePriceZarResponse simplePriceZarResponseFromJson(String str) =>
    SimplePriceZarResponse.fromJson(json.decode(str));

String simplePriceZarResponseToJson(SimplePriceZarResponse data) =>
    json.encode(data.toJson());

class SimplePriceZarResponse {
  SimplePriceZarResponse({
    this.uniris,
  });

  factory SimplePriceZarResponse.fromJson(Map<String, dynamic> json) =>
      SimplePriceZarResponse(
        uniris: ArchEthic.fromJson(json['uniris']),
      );

  ArchEthic? uniris;

  Map<String, dynamic> toJson() => {
        'uniris': uniris!.toJson(),
      };
}

class ArchEthic {
  ArchEthic({
    this.zar,
  });

  factory ArchEthic.fromJson(Map<String, dynamic> json) => ArchEthic(
        zar: json['zar'].toDouble(),
      );

  double? zar;

  Map<String, dynamic> toJson() => {
        'zar': zar,
      };
}
