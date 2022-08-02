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
      required this.name,
      required this.supply,
      required this.type,
      required this.symbol,
      this.tokenProperties});

  String? address;
  String? name;
  int? supply;
  String? type;
  String? symbol;
  List<TokenProperty>? tokenProperties = <TokenProperty>[];

  factory Token.fromJson(Map<String, dynamic> json) {
    return Token(
      address: json['address'],
      name: json['name'],
      supply: json['supply'] == null
          ? null
          : int.tryParse(json['supply'].toString()),
      type: json['type'],
      symbol: json['symbol'],
      tokenProperties: json['properties'] == null
          ? null
          : List<TokenProperty>.from(json['properties'].map((x) => x)),
    );
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'address': address,
        'name': name,
        'supply': supply,
        'type': type,
        'symbol': symbol,
        'properties': tokenProperties == null
            ? []
            : List<dynamic>.from(tokenProperties!.map((TokenProperty x) => x)),
      };

  Map<String, dynamic> toJsonForTxDataContent() => <String, dynamic>{
        'name': name,
        'supply': supply,
        'type': type,
        'symbol': symbol,
        'properties': tokenProperties == null
            ? []
            : List<dynamic>.from(tokenProperties!.map((TokenProperty x) => x)),
      };
}

class TokenProperty {
  String? name;
  String? value;
}
