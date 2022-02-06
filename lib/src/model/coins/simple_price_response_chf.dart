// To parse this JSON data, do
//
//     final simplePriceChfResponse = simplePriceChfResponseFromJson(jsonString);

// Dart imports:
import 'dart:convert';

SimplePriceChfResponse simplePriceChfResponseFromJson(String str) =>
    SimplePriceChfResponse.fromJson(json.decode(str));

String simplePriceChfResponseToJson(SimplePriceChfResponse data) =>
    json.encode(data.toJson());

class SimplePriceChfResponse {
  SimplePriceChfResponse({
    this.archethic,
  });

  factory SimplePriceChfResponse.fromJson(Map<String, dynamic> json) =>
      SimplePriceChfResponse(
        archethic: Archethic.fromJson(json['archethic']),
      );

  Archethic? archethic;

  Map<String, dynamic> toJson() => {
        'archethic': archethic!.toJson(),
      };
}

class Archethic {
  Archethic({
    this.chf,
  });

  factory Archethic.fromJson(Map<String, dynamic> json) => Archethic(
        chf: json['chf']?.toDouble(),
      );

  double? chf;

  Map<String, dynamic> toJson() => {
        'chf': chf,
      };
}
