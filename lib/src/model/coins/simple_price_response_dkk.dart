/// SPDX-License-Identifier: AGPL-3.0-or-later

// To parse this JSON data, do
//
//     final simplePriceDkkResponse = simplePriceDkkResponseFromJson(jsonString);

// Dart imports:
import 'dart:convert';

SimplePriceDkkResponse simplePriceDkkResponseFromJson(String str) =>
    SimplePriceDkkResponse.fromJson(json.decode(str));

String simplePriceDkkResponseToJson(SimplePriceDkkResponse data) =>
    json.encode(data.toJson());

class SimplePriceDkkResponse {
  SimplePriceDkkResponse({
    this.archethic,
  });

  factory SimplePriceDkkResponse.fromJson(Map<String, dynamic> json) =>
      SimplePriceDkkResponse(
        archethic: Archethic.fromJson(json['archethic']),
      );

  Archethic? archethic;

  Map<String, dynamic> toJson() => {
        'archethic': archethic!.toJson(),
      };
}

class Archethic {
  Archethic({
    this.dkk,
  });

  factory Archethic.fromJson(Map<String, dynamic> json) => Archethic(
        dkk: json['dkk']?.toDouble(),
      );

  double? dkk;

  Map<String, dynamic> toJson() => {
        'dkk': dkk,
      };
}
