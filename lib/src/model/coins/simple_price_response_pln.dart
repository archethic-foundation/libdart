/// SPDX-License-Identifier: AGPL-3.0-or-later

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
    this.archethic,
  });

  factory SimplePricePlnResponse.fromJson(Map<String, dynamic> json) =>
      SimplePricePlnResponse(
        archethic: Archethic.fromJson(json['archethic']),
      );

  Archethic? archethic;

  Map<String, dynamic> toJson() => {
        'archethic': archethic!.toJson(),
      };
}

class Archethic {
  Archethic({
    this.pln,
  });

  factory Archethic.fromJson(Map<String, dynamic> json) => Archethic(
        pln: json['pln']?.toDouble(),
      );

  double? pln;

  Map<String, dynamic> toJson() => {
        'pln': pln,
      };
}
