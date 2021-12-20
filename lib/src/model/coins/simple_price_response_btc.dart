// To parse this JSON data, do
//
//     final simplePriceBtcResponse = simplePriceBtcResponseFromJson(jsonString);

// Dart imports:
import 'dart:convert';

SimplePriceBtcResponse simplePriceBtcResponseFromJson(String str) =>
    SimplePriceBtcResponse.fromJson(json.decode(str));

String simplePriceBtcResponseToJson(SimplePriceBtcResponse data) =>
    json.encode(data.toJson());

class SimplePriceBtcResponse {
  SimplePriceBtcResponse({
    this.archethic,
  });

  factory SimplePriceBtcResponse.fromJson(Map<String, dynamic> json) =>
      SimplePriceBtcResponse(
        archethic: Archethic.fromJson(json['archethic']),
      );

  Archethic? archethic;

  Map<String, dynamic> toJson() => {
        'archethic': archethic!.toJson(),
      };
}

class Archethic {
  Archethic({
    this.btc,
  });

  factory Archethic.fromJson(Map<String, dynamic> json) => Archethic(
        btc: json['btc'].toDouble(),
      );

  double? btc;

  Map<String, dynamic> toJson() => {
        'btc': btc,
      };
}
