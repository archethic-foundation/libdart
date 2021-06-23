// To parse this JSON data, do
//
//     final simplePriceHufResponse = simplePriceHufResponseFromJson(jsonString);

// Dart imports:
import 'dart:convert';

SimplePriceHufResponse simplePriceHufResponseFromJson(String str) =>
    SimplePriceHufResponse.fromJson(json.decode(str));

String simplePriceHufResponseToJson(SimplePriceHufResponse data) =>
    json.encode(data.toJson());

class SimplePriceHufResponse {
  SimplePriceHufResponse({
    this.uniris,
  });

  factory SimplePriceHufResponse.fromJson(Map<String, dynamic> json) =>
      SimplePriceHufResponse(
        uniris: Uniris.fromJson(json['uniris']),
      );

  Uniris? uniris;

  Map<String, dynamic> toJson() => {
        'uniris': uniris!.toJson(),
      };
}

class Uniris {
  Uniris({
    this.huf,
  });

  factory Uniris.fromJson(Map<String, dynamic> json) => Uniris(
        huf: json['huf'].toDouble(),
      );

  double? huf;

  Map<String, dynamic> toJson() => {
        'huf': huf,
      };
}
