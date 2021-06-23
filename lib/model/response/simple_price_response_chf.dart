// To parse this JSON data, do
//
//     final simplePriceChfResponse = simplePriceChfResponseFromJson(jsonString);

// Dart imports:
import 'dart:convert';

SimplePriceChfResponse simplePriceChfResponseFromJson(String str) =>
    SimplePriceChfResponse.fromJson(json.decode(str));

String simplePriceChfResponseToJson(SimplePriceChfResponse data) =>
    json.encode(data.toJson());

class SimplePriceChfResponse {
  SimplePriceChfResponse({
    this.uniris,
  });

  factory SimplePriceChfResponse.fromJson(Map<String, dynamic> json) =>
      SimplePriceChfResponse(
        uniris: ArchEthic.fromJson(json['uniris']),
      );

  ArchEthic? uniris;

  Map<String, dynamic> toJson() => {
        'uniris': uniris!.toJson(),
      };
}

class ArchEthic {
  ArchEthic({
    this.chf,
  });

  factory ArchEthic.fromJson(Map<String, dynamic> json) => ArchEthic(
        chf: json['chf'].toDouble(),
      );

  double? chf;

  Map<String, dynamic> toJson() => {
        'chf': chf,
      };
}
