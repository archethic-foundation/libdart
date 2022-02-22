/// SPDX-License-Identifier: AGPL-3.0-or-later

// To parse this JSON data, do
//
//     final simplePriceCzkResponse = simplePriceCzkResponseFromJson(jsonString);

// Dart imports:
import 'dart:convert';

SimplePriceCzkResponse simplePriceCzkResponseFromJson(String str) =>
    SimplePriceCzkResponse.fromJson(json.decode(str));

String simplePriceCzkResponseToJson(SimplePriceCzkResponse data) =>
    json.encode(data.toJson());

class SimplePriceCzkResponse {
  SimplePriceCzkResponse({
    this.archethic,
  });

  factory SimplePriceCzkResponse.fromJson(Map<String, dynamic> json) =>
      SimplePriceCzkResponse(
        archethic: Archethic.fromJson(json['archethic']),
      );

  Archethic? archethic;

  Map<String, dynamic> toJson() => {
        'archethic': archethic!.toJson(),
      };
}

class Archethic {
  Archethic({
    this.czk,
  });

  factory Archethic.fromJson(Map<String, dynamic> json) => Archethic(
        czk: json['czk']?.toDouble(),
      );

  double? czk;

  Map<String, dynamic> toJson() => {
        'czk': czk,
      };
}
