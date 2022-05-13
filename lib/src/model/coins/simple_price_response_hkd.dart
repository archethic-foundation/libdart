/// SPDX-License-Identifier: AGPL-3.0-or-later

// To parse this JSON data, do
//
//     final simplePriceHkdResponse = simplePriceHkdResponseFromJson(jsonString);

// Dart imports:
import 'dart:convert';

SimplePriceHkdResponse simplePriceHkdResponseFromJson(String str) =>
    SimplePriceHkdResponse.fromJson(json.decode(str));

String simplePriceHkdResponseToJson(SimplePriceHkdResponse data) =>
    json.encode(data.toJson());

class SimplePriceHkdResponse {
  SimplePriceHkdResponse({
    this.archethic,
  });

  factory SimplePriceHkdResponse.fromJson(Map<String, dynamic> json) =>
      SimplePriceHkdResponse(
        archethic: Archethic.fromJson(json['archethic']),
      );

  Archethic? archethic;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'archethic': archethic!.toJson(),
      };
}

class Archethic {
  Archethic({
    this.hkd,
  });

  factory Archethic.fromJson(Map<String, dynamic> json) => Archethic(
        hkd: json['hkd']?.toDouble(),
      );

  double? hkd;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'hkd': hkd,
      };
}
