// To parse this JSON data, do
//
//     final simplePriceRubResponse = simplePriceRubResponseFromJson(jsonString);

// Dart imports:
import 'dart:convert';

SimplePriceRubResponse simplePriceRubResponseFromJson(String str) =>
    SimplePriceRubResponse.fromJson(json.decode(str));

String simplePriceRubResponseToJson(SimplePriceRubResponse data) =>
    json.encode(data.toJson());

class SimplePriceRubResponse {
  SimplePriceRubResponse({
    this.uniris,
  });

  factory SimplePriceRubResponse.fromJson(Map<String, dynamic> json) =>
      SimplePriceRubResponse(
        uniris: ArchEthic.fromJson(json['uniris']),
      );

  ArchEthic? uniris;

  Map<String, dynamic> toJson() => {
        'uniris': uniris!.toJson(),
      };
}

class ArchEthic {
  ArchEthic({
    this.rub,
  });

  factory ArchEthic.fromJson(Map<String, dynamic> json) => ArchEthic(
        rub: json['rub'].toDouble(),
      );

  double? rub;

  Map<String, dynamic> toJson() => {
        'rub': rub,
      };
}
