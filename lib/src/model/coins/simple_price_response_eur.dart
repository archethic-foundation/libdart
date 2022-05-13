/// SPDX-License-Identifier: AGPL-3.0-or-later

// To parse this JSON data, do
//
//     final simplePriceEurResponse = simplePriceEurResponseFromJson(jsonString);

// Dart imports:
import 'dart:convert';

SimplePriceEurResponse simplePriceEurResponseFromJson(String str) =>
    SimplePriceEurResponse.fromJson(json.decode(str));

String simplePriceEurResponseToJson(SimplePriceEurResponse data) =>
    json.encode(data.toJson());

class SimplePriceEurResponse {
  SimplePriceEurResponse({
    this.archethic,
  });

  factory SimplePriceEurResponse.fromJson(Map<String, dynamic> json) =>
      SimplePriceEurResponse(
        archethic: Archethic.fromJson(json['archethic']),
      );

  Archethic? archethic;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'archethic': archethic!.toJson(),
      };
}

class Archethic {
  Archethic({
    this.eur,
  });

  factory Archethic.fromJson(Map<String, dynamic> json) => Archethic(
        eur: json['eur']?.toDouble(),
      );

  double? eur;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'eur': eur,
      };
}
