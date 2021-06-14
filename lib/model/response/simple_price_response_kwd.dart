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
    this.uniris,
  });

  factory SimplePriceKwdResponse.fromJson(Map<String, dynamic> json) =>
      SimplePriceKwdResponse(
        uniris: Uniris.fromJson(json['uniris']),
      );

  Uniris? uniris;

  Map<String, dynamic> toJson() => {
        'uniris': uniris!.toJson(),
      };
}

class Uniris {
  Uniris({
    this.kwd,
  });

  factory Uniris.fromJson(Map<String, dynamic> json) => Uniris(
        kwd: json['kwd'].toDouble(),
      );

  double? kwd;

  Map<String, dynamic> toJson() => {
        'kwd': kwd,
      };
}
