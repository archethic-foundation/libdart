/// SPDX-License-Identifier: AGPL-3.0-or-later

// To parse this JSON data, do
//
//     final simplePriceTryResponse = simplePriceTryResponseFromJson(jsonString);

// Dart imports:
import 'dart:convert';

SimplePriceTryResponse simplePriceTryResponseFromJson(String str) =>
    SimplePriceTryResponse.fromJson(json.decode(str));

String simplePriceTryResponseToJson(SimplePriceTryResponse data) =>
    json.encode(data.toJson());

class SimplePriceTryResponse {
  SimplePriceTryResponse({
    this.archethic,
  });

  factory SimplePriceTryResponse.fromJson(Map<String, dynamic> json) =>
      SimplePriceTryResponse(
        archethic: Archethic.fromJson(json['archethic']),
      );

  Archethic? archethic;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'archethic': archethic!.toJson(),
      };
}

class Archethic {
  Archethic({
    this.tryl,
  });

  factory Archethic.fromJson(Map<String, dynamic> json) => Archethic(
        tryl: json['try']?.toDouble(),
      );

  double? tryl;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'try': tryl,
      };
}
