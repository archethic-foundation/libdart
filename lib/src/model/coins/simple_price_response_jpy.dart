/// SPDX-License-Identifier: AGPL-3.0-or-later

// To parse this JSON data, do
//
//     final simplePriceJpyResponse = simplePriceJpyResponseFromJson(jsonString);

// Dart imports:
import 'dart:convert';

SimplePriceJpyResponse simplePriceJpyResponseFromJson(String str) =>
    SimplePriceJpyResponse.fromJson(json.decode(str));

String simplePriceJpyResponseToJson(SimplePriceJpyResponse data) =>
    json.encode(data.toJson());

class SimplePriceJpyResponse {
  SimplePriceJpyResponse({
    this.archethic,
  });

  factory SimplePriceJpyResponse.fromJson(Map<String, dynamic> json) =>
      SimplePriceJpyResponse(
        archethic: Archethic.fromJson(json['archethic']),
      );

  Archethic? archethic;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'archethic': archethic!.toJson(),
      };
}

class Archethic {
  Archethic({
    this.jpy,
  });

  factory Archethic.fromJson(Map<String, dynamic> json) => Archethic(
        jpy: json['jpy']?.toDouble(),
      );

  double? jpy;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'jpy': jpy,
      };
}
