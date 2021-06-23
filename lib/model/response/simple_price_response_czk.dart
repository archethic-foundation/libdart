// To parse this JSON data, do
//
//     final simplePriceCzkResponse = simplePriceCzkResponseFromJson(jsonString);

// Dart imports:
import 'dart:convert';

SimplePriceCzkResponse simplePriceCzkResponseFromJson(String str) =>
    SimplePriceCzkResponse.fromJson(json.decode(str));

String simplePriceCzkResponseToJson(SimplePriceCzkResponse data) =>
    json.encode(data.toJson());

class SimplePriceCzkResponse {
  SimplePriceCzkResponse({
    this.uniris,
  });

  factory SimplePriceCzkResponse.fromJson(Map<String, dynamic> json) =>
      SimplePriceCzkResponse(
        uniris: ArchEthic.fromJson(json['uniris']),
      );

  ArchEthic? uniris;

  Map<String, dynamic> toJson() => {
        'uniris': uniris!.toJson(),
      };
}

class ArchEthic {
  ArchEthic({
    this.czk,
  });

  factory ArchEthic.fromJson(Map<String, dynamic> json) => ArchEthic(
        czk: json['czk'].toDouble(),
      );

  double? czk;

  Map<String, dynamic> toJson() => {
        'czk': czk,
      };
}
