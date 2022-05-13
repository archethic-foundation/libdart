/// SPDX-License-Identifier: AGPL-3.0-or-later

// To parse this JSON data, do
//
//     final simplePriceCnyResponse = simplePriceCnyResponseFromJson(jsonString);

// Dart imports:
import 'dart:convert';

SimplePriceCnyResponse simplePriceCnyResponseFromJson(String str) =>
    SimplePriceCnyResponse.fromJson(json.decode(str));

String simplePriceCnyResponseToJson(SimplePriceCnyResponse data) =>
    json.encode(data.toJson());

class SimplePriceCnyResponse {
  SimplePriceCnyResponse({
    this.archethic,
  });

  factory SimplePriceCnyResponse.fromJson(Map<String, dynamic> json) =>
      SimplePriceCnyResponse(
        archethic: Archethic.fromJson(json['archethic']),
      );

  Archethic? archethic;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'archethic': archethic!.toJson(),
      };
}

class Archethic {
  Archethic({
    this.cny,
  });

  factory Archethic.fromJson(Map<String, dynamic> json) => Archethic(
        cny: json['cny']?.toDouble(),
      );

  double? cny;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'cny': cny,
      };
}
