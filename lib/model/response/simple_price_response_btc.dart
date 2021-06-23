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
    this.uniris,
  });

  factory SimplePriceBtcResponse.fromJson(Map<String, dynamic> json) =>
      SimplePriceBtcResponse(
        uniris: ArchEthic.fromJson(json['uniris']),
      );

  ArchEthic? uniris;

  Map<String, dynamic> toJson() => {
        'uniris': uniris!.toJson(),
      };
}

class ArchEthic {
  ArchEthic({
    this.btc,
  });

  factory ArchEthic.fromJson(Map<String, dynamic> json) => ArchEthic(
        btc: json['btc'].toDouble(),
      );

  double? btc;

  Map<String, dynamic> toJson() => {
        'btc': btc,
      };
}
