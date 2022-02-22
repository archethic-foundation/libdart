/// SPDX-License-Identifier: AGPL-3.0-or-later

// To parse this JSON data, do
//
//     final simplePriceBrlResponse = simplePriceBrlResponseFromJson(jsonString);

// Dart imports:
import 'dart:convert';

SimplePriceBrlResponse simplePriceBrlResponseFromJson(String str) =>
    SimplePriceBrlResponse.fromJson(json.decode(str));

String simplePriceBrlResponseToJson(SimplePriceBrlResponse data) =>
    json.encode(data.toJson());

class SimplePriceBrlResponse {
  SimplePriceBrlResponse({
    this.archethic,
  });

  factory SimplePriceBrlResponse.fromJson(Map<String, dynamic> json) =>
      SimplePriceBrlResponse(
        archethic: Archethic.fromJson(json['archethic']),
      );

  Archethic? archethic;

  Map<String, dynamic> toJson() => {
        'archethic': archethic!.toJson(),
      };
}

class Archethic {
  Archethic({
    this.brl,
  });

  factory Archethic.fromJson(Map<String, dynamic> json) => Archethic(
        brl: json['brl']?.toDouble(),
      );

  double? brl;

  Map<String, dynamic> toJson() => {
        'brl': brl,
      };
}
