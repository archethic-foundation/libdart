/// SPDX-License-Identifier: AGPL-3.0-or-later

// To parse this JSON data, do
//
//     final simplePriceCadResponse = simplePriceCadResponseFromJson(jsonString);

// Dart imports:
import 'dart:convert';

SimplePriceCadResponse simplePriceCadResponseFromJson(String str) =>
    SimplePriceCadResponse.fromJson(json.decode(str));

String simplePriceCadResponseToJson(SimplePriceCadResponse data) =>
    json.encode(data.toJson());

class SimplePriceCadResponse {
  SimplePriceCadResponse({
    this.archethic,
  });

  factory SimplePriceCadResponse.fromJson(Map<String, dynamic> json) =>
      SimplePriceCadResponse(
        archethic: Archethic.fromJson(json['archethic']),
      );

  Archethic? archethic;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'archethic': archethic!.toJson(),
      };
}

class Archethic {
  Archethic({
    this.cad,
  });

  factory Archethic.fromJson(Map<String, dynamic> json) => Archethic(
        cad: json['cad']?.toDouble(),
      );

  double? cad;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'cad': cad,
      };
}
