/// SPDX-License-Identifier: AGPL-3.0-or-later

// To parse this JSON data, do
//
//     final simplePriceKwdResponse = simplePriceKwdResponseFromJson(jsonString);

// Dart imports:
import 'dart:convert';

SimplePriceKwdResponse simplePriceKwdResponseFromJson(String str) =>
    SimplePriceKwdResponse.fromJson(json.decode(str));

String simplePriceKwdResponseToJson(SimplePriceKwdResponse data) =>
    json.encode(data.toJson());

class SimplePriceKwdResponse {
  SimplePriceKwdResponse({
    this.archethic,
  });

  factory SimplePriceKwdResponse.fromJson(Map<String, dynamic> json) =>
      SimplePriceKwdResponse(
        archethic: Archethic.fromJson(json['archethic']),
      );

  Archethic? archethic;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'archethic': archethic!.toJson(),
      };
}

class Archethic {
  Archethic({
    this.kwd,
  });

  factory Archethic.fromJson(Map<String, dynamic> json) => Archethic(
        kwd: json['kwd']?.toDouble(),
      );

  double? kwd;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'kwd': kwd,
      };
}
