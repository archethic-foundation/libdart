/// SPDX-License-Identifier: AGPL-3.0-or-later

// To parse this JSON data, do
//
//     final simplePriceGbpResponse = simplePriceGbpResponseFromJson(jsonString);

// Dart imports:
import 'dart:convert';

SimplePriceGbpResponse simplePriceGbpResponseFromJson(String str) =>
    SimplePriceGbpResponse.fromJson(json.decode(str));

String simplePriceGbpResponseToJson(SimplePriceGbpResponse data) =>
    json.encode(data.toJson());

class SimplePriceGbpResponse {
  SimplePriceGbpResponse({
    this.archethic,
  });

  factory SimplePriceGbpResponse.fromJson(Map<String, dynamic> json) =>
      SimplePriceGbpResponse(
        archethic: Archethic.fromJson(json['archethic']),
      );

  Archethic? archethic;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'archethic': archethic!.toJson(),
      };
}

class Archethic {
  Archethic({
    this.gbp,
  });

  factory Archethic.fromJson(Map<String, dynamic> json) => Archethic(
        gbp: json['gbp']?.toDouble(),
      );

  double? gbp;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'gbp': gbp,
      };
}
