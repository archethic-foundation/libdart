/// SPDX-License-Identifier: AGPL-3.0-or-later

// To parse this JSON data, do
//
//     final simplePriceMyrResponse = simplePriceMyrResponseFromJson(jsonString);

// Dart imports:
import 'dart:convert';

SimplePriceMyrResponse simplePriceMyrResponseFromJson(String str) =>
    SimplePriceMyrResponse.fromJson(json.decode(str));

String simplePriceMyrResponseToJson(SimplePriceMyrResponse data) =>
    json.encode(data.toJson());

class SimplePriceMyrResponse {
  SimplePriceMyrResponse({
    this.archethic,
  });

  factory SimplePriceMyrResponse.fromJson(Map<String, dynamic> json) =>
      SimplePriceMyrResponse(
        archethic: Archethic.fromJson(json['archethic']),
      );

  Archethic? archethic;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'archethic': archethic!.toJson(),
      };
}

class Archethic {
  Archethic({
    this.myr,
  });

  factory Archethic.fromJson(Map<String, dynamic> json) => Archethic(
        myr: json['myr']?.toDouble(),
      );

  double? myr;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'myr': myr,
      };
}
