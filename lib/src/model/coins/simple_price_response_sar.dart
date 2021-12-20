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
    this.archethic,
  });

  factory SimplePriceSarResponse.fromJson(Map<String, dynamic> json) =>
      SimplePriceSarResponse(
        archethic: Archethic.fromJson(json['archethic']),
      );

  Archethic? archethic;

  Map<String, dynamic> toJson() => {
        'archethic': archethic!.toJson(),
      };
}

class Archethic {
  Archethic({
    this.sar,
  });

  factory Archethic.fromJson(Map<String, dynamic> json) => Archethic(
        sar: json['sar'].toDouble(),
      );

  double? sar;

  Map<String, dynamic> toJson() => {
        'sar': sar,
      };
}
