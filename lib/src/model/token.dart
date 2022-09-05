// Dart imports:
import 'dart:convert';

/// SPDX-License-Identifier: AGPL-3.0-or-later

// To parse this JSON data, do
//
//     final token = tokenFromJson(jsonString);

Token tokenFromJson(String str) => Token.fromJson(json.decode(str));

String tokenToJson(Token data) => jsonEncode(data.toJson());

String tokenToJsonForTxDataContent(Token data) {
  return jsonEncode(data.toJsonForTxDataContent());
}

class Token {
  Token(
      {this.address,
      this.genesis,
      this.name,
      this.id,
      this.supply,
      this.type,
      this.symbol,
      this.tokenProperties});

  String? address;
  String? genesis;
  String? name;
  String? id;
  int? supply;
  String? type;
  String? symbol;
  List<List<TokenProperty>>? tokenProperties;

  factory Token.fromJson(Map<String, dynamic> json) {
    return Token(
      address: json['address'],
      genesis: json['genesis'],
      name: json['name'],
      id: json['id'],
      supply: json['supply'] == null
          ? null
          : int.tryParse(json['supply'].toString()),
      type: json['type'],
      symbol: json['symbol'],
      tokenProperties: json['properties'] == null
          ? null
          : List<List<TokenProperty>>.from(json['properties'].map((x) =>
              List<TokenProperty>.from(
                  x.map((x) => TokenProperty.fromJson(x))))),
    );
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'address': address,
        'genesis': genesis,
        'name': name,
        'id': id,
        'supply': supply,
        'type': type,
        'symbol': symbol,
        'properties': tokenProperties == null
            ? []
            : List<dynamic>.from(tokenProperties!
                .map((x) => List<dynamic>.from(x.map((x) => x.toJson())))),
      };

  Map<String, dynamic> toJsonForTxDataContent() => <String, dynamic>{
        'name': name,
        'id': id,
        'supply': supply,
        'type': type,
        'symbol': symbol,
        'properties': tokenProperties == null
            ? []
            : List<dynamic>.from(tokenProperties!
                .map((x) => List<dynamic>.from(x.map((x) => x.toJson())))),
      };
}

class TokenProperty {
  TokenProperty({
    this.name,
    this.value,
  });

  String? name;
  String? value;

  factory TokenProperty.fromJson(Map<String, dynamic> json) => TokenProperty(
        name: json['name'],
        value: json['value'],
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'value': value,
      };
}
