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
        uniris: Uniris.fromJson(json['uniris']),
      );

  Uniris? uniris;

  Map<String, dynamic> toJson() => {
        'uniris': uniris!.toJson(),
      };
}

class Uniris {
  Uniris({
    this.rub,
  });

  factory Uniris.fromJson(Map<String, dynamic> json) => Uniris(
        rub: json['rub'].toDouble(),
      );

  double? rub;

  Map<String, dynamic> toJson() => {
        'rub': rub,
      };
}
