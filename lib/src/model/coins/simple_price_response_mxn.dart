/// SPDX-License-Identifier: AGPL-3.0-or-later

// To parse this JSON data, do
//
//     final simplePriceMxnResponse = simplePriceMxnResponseFromJson(jsonString);

// Dart imports:
import 'dart:convert';

SimplePriceMxnResponse simplePriceMxnResponseFromJson(String str) =>
    SimplePriceMxnResponse.fromJson(json.decode(str));

String simplePriceMxnResponseToJson(SimplePriceMxnResponse data) =>
    json.encode(data.toJson());

class SimplePriceMxnResponse {
  SimplePriceMxnResponse({
    this.archethic,
  });

  factory SimplePriceMxnResponse.fromJson(Map<String, dynamic> json) =>
      SimplePriceMxnResponse(
        archethic: Archethic.fromJson(json['archethic']),
      );

  Archethic? archethic;

  Map<String, dynamic> toJson() => {
        'archethic': archethic!.toJson(),
      };
}

class Archethic {
  Archethic({
    this.mxn,
  });

  factory Archethic.fromJson(Map<String, dynamic> json) => Archethic(
        mxn: json['mxn']?.toDouble(),
      );

  double? mxn;

  Map<String, dynamic> toJson() => {
        'mxn': mxn,
      };
}
