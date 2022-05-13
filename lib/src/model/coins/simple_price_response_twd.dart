/// SPDX-License-Identifier: AGPL-3.0-or-later

// To parse this JSON data, do
//
//     final simplePriceTwdResponse = simplePriceTwdResponseFromJson(jsonString);

// Dart imports:
import 'dart:convert';

SimplePriceTwdResponse simplePriceTwdResponseFromJson(String str) =>
    SimplePriceTwdResponse.fromJson(json.decode(str));

String simplePriceTwdResponseToJson(SimplePriceTwdResponse data) =>
    json.encode(data.toJson());

class SimplePriceTwdResponse {
  SimplePriceTwdResponse({
    this.archethic,
  });

  factory SimplePriceTwdResponse.fromJson(Map<String, dynamic> json) =>
      SimplePriceTwdResponse(
        archethic: Archethic.fromJson(json['archethic']),
      );

  Archethic? archethic;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'archethic': archethic!.toJson(),
      };
}

class Archethic {
  Archethic({
    this.twd,
  });

  factory Archethic.fromJson(Map<String, dynamic> json) => Archethic(
        twd: json['twd']?.toDouble(),
      );

  double? twd;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'twd': twd,
      };
}
