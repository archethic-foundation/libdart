/// SPDX-License-Identifier: AGPL-3.0-or-later

// To parse this JSON data, do
//
//     final simplePricePhpResponse = simplePricePhpResponseFromJson(jsonString);

// Dart imports:
import 'dart:convert';

SimplePricePhpResponse simplePricePhpResponseFromJson(String str) =>
    SimplePricePhpResponse.fromJson(json.decode(str));

String simplePricePhpResponseToJson(SimplePricePhpResponse data) =>
    json.encode(data.toJson());

class SimplePricePhpResponse {
  SimplePricePhpResponse({
    this.archethic,
  });

  factory SimplePricePhpResponse.fromJson(Map<String, dynamic> json) =>
      SimplePricePhpResponse(
        archethic: Archethic.fromJson(json['archethic']),
      );

  Archethic? archethic;

  Map<String, dynamic> toJson() => {
        'archethic': archethic!.toJson(),
      };
}

class Archethic {
  Archethic({
    this.php,
  });

  factory Archethic.fromJson(Map<String, dynamic> json) => Archethic(
        php: json['php']?.toDouble(),
      );

  double? php;

  Map<String, dynamic> toJson() => {
        'php': php,
      };
}
