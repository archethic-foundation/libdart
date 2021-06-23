// To parse this JSON data, do
//
//     final simplePriceTwdResponse = simplePriceTwdResponseFromJson(jsonString);

// Dart imports:
import 'dart:convert';

SimplePriceTwdResponse simplePriceTwdResponseFromJson(String str) =>
    SimplePriceTwdResponse.fromJson(json.decode(str));

String simplePriceTwdResponseToJson(SimplePriceTwdResponse data) =>
    json.encode(data.toJson());

class SimplePriceTwdResponse {
  SimplePriceTwdResponse({
    this.uniris,
  });

  factory SimplePriceTwdResponse.fromJson(Map<String, dynamic> json) =>
      SimplePriceTwdResponse(
        uniris: ArchEthic.fromJson(json['uniris']),
      );

  ArchEthic? uniris;

  Map<String, dynamic> toJson() => {
        'uniris': uniris!.toJson(),
      };
}

class ArchEthic {
  ArchEthic({
    this.twd,
  });

  factory ArchEthic.fromJson(Map<String, dynamic> json) => ArchEthic(
        twd: json['twd'].toDouble(),
      );

  double? twd;

  Map<String, dynamic> toJson() => {
        'twd': twd,
      };
}
