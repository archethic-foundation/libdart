// To parse this JSON data, do
//
//     final simplePriceClpResponse = simplePriceClpResponseFromJson(jsonString);

// Dart imports:
import 'dart:convert';

SimplePriceClpResponse simplePriceClpResponseFromJson(String str) =>
    SimplePriceClpResponse.fromJson(json.decode(str));

String simplePriceClpResponseToJson(SimplePriceClpResponse data) =>
    json.encode(data.toJson());

class SimplePriceClpResponse {
  SimplePriceClpResponse({
    this.uniris,
  });

  factory SimplePriceClpResponse.fromJson(Map<String, dynamic> json) =>
      SimplePriceClpResponse(
        uniris: Uniris.fromJson(json['uniris']),
      );

  Uniris? uniris;

  Map<String, dynamic> toJson() => {
        'uniris': uniris!.toJson(),
      };
}

class Uniris {
  Uniris({
    this.clp,
  });

  factory Uniris.fromJson(Map<String, dynamic> json) => Uniris(
        clp: json['clp'].toDouble(),
      );

  double? clp;

  Map<String, dynamic> toJson() => {
        'clp': clp,
      };
}
