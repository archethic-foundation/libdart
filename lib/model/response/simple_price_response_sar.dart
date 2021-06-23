// To parse this JSON data, do
//
//     final simplePriceSarResponse = simplePriceSarResponseFromJson(jsonString);

// Dart imports:
import 'dart:convert';

SimplePriceSarResponse simplePriceSarResponseFromJson(String str) =>
    SimplePriceSarResponse.fromJson(json.decode(str));

String simplePriceSarResponseToJson(SimplePriceSarResponse data) =>
    json.encode(data.toJson());

class SimplePriceSarResponse {
  SimplePriceSarResponse({
    this.uniris,
  });

  factory SimplePriceSarResponse.fromJson(Map<String, dynamic> json) =>
      SimplePriceSarResponse(
        uniris: ArchEthic.fromJson(json['uniris']),
      );

  ArchEthic? uniris;

  Map<String, dynamic> toJson() => {
        'uniris': uniris!.toJson(),
      };
}

class ArchEthic {
  ArchEthic({
    this.sar,
  });

  factory ArchEthic.fromJson(Map<String, dynamic> json) => ArchEthic(
        sar: json['sar'].toDouble(),
      );

  double? sar;

  Map<String, dynamic> toJson() => {
        'sar': sar,
      };
}
