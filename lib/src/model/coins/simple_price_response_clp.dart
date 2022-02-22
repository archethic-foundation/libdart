/// SPDX-License-Identifier: AGPL-3.0-or-later

// To parse this JSON data, do
//
//     final simplePriceClpResponse = simplePriceClpResponseFromJson(jsonString);

// Dart imports:
import 'dart:convert';

SimplePriceClpResponse simplePriceClpResponseFromJson(String str) =>
    SimplePriceClpResponse.fromJson(json.decode(str));

String simplePriceClpResponseToJson(SimplePriceClpResponse data) =>
    json.encode(data.toJson());

class SimplePriceClpResponse {
  SimplePriceClpResponse({
    this.archethic,
  });

  factory SimplePriceClpResponse.fromJson(Map<String, dynamic> json) =>
      SimplePriceClpResponse(
        archethic: Archethic.fromJson(json['archethic']),
      );

  Archethic? archethic;

  Map<String, dynamic> toJson() => {
        'archethic': archethic!.toJson(),
      };
}

class Archethic {
  Archethic({
    this.clp,
  });

  factory Archethic.fromJson(Map<String, dynamic> json) => Archethic(
        clp: json['clp']?.toDouble(),
      );

  double? clp;

  Map<String, dynamic> toJson() => {
        'clp': clp,
      };
}
