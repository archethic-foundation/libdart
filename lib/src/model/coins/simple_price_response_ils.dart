/// SPDX-License-Identifier: AGPL-3.0-or-later

// To parse this JSON data, do
//
//     final simplePriceIlsResponse = simplePriceIlsResponseFromJson(jsonString);

// Dart imports:
import 'dart:convert';

SimplePriceIlsResponse simplePriceIlsResponseFromJson(String str) =>
    SimplePriceIlsResponse.fromJson(json.decode(str));

String simplePriceIlsResponseToJson(SimplePriceIlsResponse data) =>
    json.encode(data.toJson());

class SimplePriceIlsResponse {
  SimplePriceIlsResponse({
    this.archethic,
  });

  factory SimplePriceIlsResponse.fromJson(Map<String, dynamic> json) =>
      SimplePriceIlsResponse(
        archethic: Archethic.fromJson(json['archethic']),
      );

  Archethic? archethic;

  Map<String, dynamic> toJson() => {
        'archethic': archethic!.toJson(),
      };
}

class Archethic {
  Archethic({
    this.ils,
  });

  factory Archethic.fromJson(Map<String, dynamic> json) => Archethic(
        ils: json['ils']?.toDouble(),
      );

  double? ils;

  Map<String, dynamic> toJson() => {
        'ils': ils,
      };
}
