/// SPDX-License-Identifier: AGPL-3.0-or-later

// To parse this JSON data, do
//
//     final simplePriceNokResponse = simplePriceNokResponseFromJson(jsonString);

// Dart imports:
import 'dart:convert';

SimplePriceNokResponse simplePriceNokResponseFromJson(String str) =>
    SimplePriceNokResponse.fromJson(json.decode(str));

String simplePriceNokResponseToJson(SimplePriceNokResponse data) =>
    json.encode(data.toJson());

class SimplePriceNokResponse {
  SimplePriceNokResponse({
    this.archethic,
  });

  factory SimplePriceNokResponse.fromJson(Map<String, dynamic> json) =>
      SimplePriceNokResponse(
        archethic: Archethic.fromJson(json['archethic']),
      );

  Archethic? archethic;

  Map<String, dynamic> toJson() => {
        'archethic': archethic!.toJson(),
      };
}

class Archethic {
  Archethic({
    this.nok,
  });

  factory Archethic.fromJson(Map<String, dynamic> json) => Archethic(
        nok: json['nok']?.toDouble(),
      );

  double? nok;

  Map<String, dynamic> toJson() => {
        'nok': nok,
      };
}
