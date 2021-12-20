// To parse this JSON data, do
//
//     final simplePriceHufResponse = simplePriceHufResponseFromJson(jsonString);

// Dart imports:
import 'dart:convert';

SimplePriceHufResponse simplePriceHufResponseFromJson(String str) =>
    SimplePriceHufResponse.fromJson(json.decode(str));

String simplePriceHufResponseToJson(SimplePriceHufResponse data) =>
    json.encode(data.toJson());

class SimplePriceHufResponse {
  SimplePriceHufResponse({
    this.archethic,
  });

  factory SimplePriceHufResponse.fromJson(Map<String, dynamic> json) =>
      SimplePriceHufResponse(
        archethic: Archethic.fromJson(json['archethic']),
      );

  Archethic? archethic;

  Map<String, dynamic> toJson() => {
        'archethic': archethic!.toJson(),
      };
}

class Archethic {
  Archethic({
    this.huf,
  });

  factory Archethic.fromJson(Map<String, dynamic> json) => Archethic(
        huf: json['huf'].toDouble(),
      );

  double? huf;

  Map<String, dynamic> toJson() => {
        'huf': huf,
      };
}
