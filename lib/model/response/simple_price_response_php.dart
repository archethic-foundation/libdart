// To parse this JSON data, do
//
//     final simplePricePhpResponse = simplePricePhpResponseFromJson(jsonString);

// Dart imports:
import 'dart:convert';

SimplePricePhpResponse simplePricePhpResponseFromJson(String str) =>
    SimplePricePhpResponse.fromJson(json.decode(str));

String simplePricePhpResponseToJson(SimplePricePhpResponse data) =>
    json.encode(data.toJson());

class SimplePricePhpResponse {
  SimplePricePhpResponse({
    this.uniris,
  });

  factory SimplePricePhpResponse.fromJson(Map<String, dynamic> json) =>
      SimplePricePhpResponse(
        uniris: Uniris.fromJson(json['uniris']),
      );

  Uniris? uniris;

  Map<String, dynamic> toJson() => {
        'uniris': uniris!.toJson(),
      };
}

class Uniris {
  Uniris({
    this.php,
  });

  factory Uniris.fromJson(Map<String, dynamic> json) => Uniris(
        php: json['php'].toDouble(),
      );

  double? php;

  Map<String, dynamic> toJson() => {
        'php': php,
      };
}
