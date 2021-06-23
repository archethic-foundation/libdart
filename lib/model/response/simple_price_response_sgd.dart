// To parse this JSON data, do
//
//     final simplePriceSgdResponse = simplePriceSgdResponseFromJson(jsonString);

// Dart imports:
import 'dart:convert';

SimplePriceSgdResponse simplePriceSgdResponseFromJson(String str) =>
    SimplePriceSgdResponse.fromJson(json.decode(str));

String simplePriceSgdResponseToJson(SimplePriceSgdResponse data) =>
    json.encode(data.toJson());

class SimplePriceSgdResponse {
  SimplePriceSgdResponse({
    this.uniris,
  });

  factory SimplePriceSgdResponse.fromJson(Map<String, dynamic> json) =>
      SimplePriceSgdResponse(
        uniris: ArchEthic.fromJson(json['uniris']),
      );

  ArchEthic? uniris;

  Map<String, dynamic> toJson() => {
        'uniris': uniris!.toJson(),
      };
}

class ArchEthic {
  ArchEthic({
    this.sgd,
  });

  factory ArchEthic.fromJson(Map<String, dynamic> json) => ArchEthic(
        sgd: json['sgd'].toDouble(),
      );

  double? sgd;

  Map<String, dynamic> toJson() => {
        'sgd': sgd,
      };
}
