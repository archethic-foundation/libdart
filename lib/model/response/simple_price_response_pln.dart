// To parse this JSON data, do
//
//     final simplePricePlnResponse = simplePricePlnResponseFromJson(jsonString);

// Dart imports:
import 'dart:convert';

SimplePricePlnResponse simplePricePlnResponseFromJson(String str) =>
    SimplePricePlnResponse.fromJson(json.decode(str));

String simplePricePlnResponseToJson(SimplePricePlnResponse data) =>
    json.encode(data.toJson());

class SimplePricePlnResponse {
  SimplePricePlnResponse({
    this.uniris,
  });

  factory SimplePricePlnResponse.fromJson(Map<String, dynamic> json) =>
      SimplePricePlnResponse(
        uniris: ArchEthic.fromJson(json['uniris']),
      );

  ArchEthic? uniris;

  Map<String, dynamic> toJson() => {
        'uniris': uniris!.toJson(),
      };
}

class ArchEthic {
  ArchEthic({
    this.pln,
  });

  factory ArchEthic.fromJson(Map<String, dynamic> json) => ArchEthic(
        pln: json['pln'].toDouble(),
      );

  double? pln;

  Map<String, dynamic> toJson() => {
        'pln': pln,
      };
}
