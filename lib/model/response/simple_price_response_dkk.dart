// To parse this JSON data, do
//
//     final simplePriceDkkResponse = simplePriceDkkResponseFromJson(jsonString);

// Dart imports:
import 'dart:convert';

SimplePriceDkkResponse simplePriceDkkResponseFromJson(String str) =>
    SimplePriceDkkResponse.fromJson(json.decode(str));

String simplePriceDkkResponseToJson(SimplePriceDkkResponse data) =>
    json.encode(data.toJson());

class SimplePriceDkkResponse {
  SimplePriceDkkResponse({
    this.uniris,
  });

  factory SimplePriceDkkResponse.fromJson(Map<String, dynamic> json) =>
      SimplePriceDkkResponse(
        uniris: ArchEthic.fromJson(json['uniris']),
      );

  ArchEthic? uniris;

  Map<String, dynamic> toJson() => {
        'uniris': uniris!.toJson(),
      };
}

class ArchEthic {
  ArchEthic({
    this.dkk,
  });

  factory ArchEthic.fromJson(Map<String, dynamic> json) => ArchEthic(
        dkk: json['dkk'].toDouble(),
      );

  double? dkk;

  Map<String, dynamic> toJson() => {
        'dkk': dkk,
      };
}
