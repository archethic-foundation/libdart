/// SPDX-License-Identifier: AGPL-3.0-or-later

// To parse this JSON data, do
//
//     final simplePriceAedResponse = simplePriceAedResponseFromJson(jsonString);

// Dart imports:
import 'dart:convert';

SimplePriceAedResponse simplePriceAedResponseFromJson(String str) =>
    SimplePriceAedResponse.fromJson(json.decode(str));

String simplePriceAedResponseToJson(SimplePriceAedResponse data) =>
    json.encode(data.toJson());

class SimplePriceAedResponse {
  SimplePriceAedResponse({
    this.archethic,
  });

  factory SimplePriceAedResponse.fromJson(Map<String, dynamic> json) =>
      SimplePriceAedResponse(
        archethic: Archethic.fromJson(json['archethic']),
      );

  Archethic? archethic;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'archethic': archethic!.toJson(),
      };
}

class Archethic {
  Archethic({
    this.aed,
  });

  factory Archethic.fromJson(Map<String, dynamic> json) => Archethic(
        aed: json['aed']?.toDouble(),
      );

  double? aed;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'aed': aed,
      };
}
