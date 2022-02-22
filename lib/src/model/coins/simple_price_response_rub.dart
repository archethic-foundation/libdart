/// SPDX-License-Identifier: AGPL-3.0-or-later

// To parse this JSON data, do
//
//     final simplePriceRubResponse = simplePriceRubResponseFromJson(jsonString);

// Dart imports:
import 'dart:convert';

SimplePriceRubResponse simplePriceRubResponseFromJson(String str) =>
    SimplePriceRubResponse.fromJson(json.decode(str));

String simplePriceRubResponseToJson(SimplePriceRubResponse data) =>
    json.encode(data.toJson());

class SimplePriceRubResponse {
  SimplePriceRubResponse({
    this.archethic,
  });

  factory SimplePriceRubResponse.fromJson(Map<String, dynamic> json) =>
      SimplePriceRubResponse(
        archethic: Archethic.fromJson(json['archethic']),
      );

  Archethic? archethic;

  Map<String, dynamic> toJson() => {
        'archethic': archethic!.toJson(),
      };
}

class Archethic {
  Archethic({
    this.rub,
  });

  factory Archethic.fromJson(Map<String, dynamic> json) => Archethic(
        rub: json['rub']?.toDouble(),
      );

  double? rub;

  Map<String, dynamic> toJson() => {
        'rub': rub,
      };
}
