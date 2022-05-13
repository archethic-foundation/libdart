/// SPDX-License-Identifier: AGPL-3.0-or-later

// To parse this JSON data, do
//
//     final simplePriceArsResponse = simplePriceArsResponseFromJson(jsonString);

// Dart imports:
import 'dart:convert';

SimplePriceArsResponse simplePriceArsResponseFromJson(String str) =>
    SimplePriceArsResponse.fromJson(json.decode(str));

String simplePriceArsResponseToJson(SimplePriceArsResponse data) =>
    json.encode(data.toJson());

class SimplePriceArsResponse {
  SimplePriceArsResponse({
    this.archethic,
  });

  factory SimplePriceArsResponse.fromJson(Map<String, dynamic> json) =>
      SimplePriceArsResponse(
        archethic: Archethic.fromJson(json['archethic']),
      );

  Archethic? archethic;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'archethic': archethic!.toJson(),
      };
}

class Archethic {
  Archethic({
    this.ars,
  });

  factory Archethic.fromJson(Map<String, dynamic> json) => Archethic(
        ars: json['ars']?.toDouble(),
      );

  double? ars;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'ars': ars,
      };
}
