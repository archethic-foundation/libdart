import 'dart:convert';

import 'package:archethic_lib_dart/src/utils/utils.dart';

/// SPDX-License-Identifier: AGPL-3.0-or-later

// To parse this JSON data, do
//
//     final token = tokenFromJson(jsonString);

Token tokenFromJson(String str) => Token.fromJson(json.decode(str));

String tokenToJson(Token data) => json.encode(data.toJson());

String tokenToJsonForTxDataContent(Token data) {
  return '{"name": "${data.name!}", "supply": ${data.supply}, "type": "${data.type!}", "symbol": "${data.symbol!}", "properties":[]';
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
  BigInt? supply;
  String? type;
  String? symbol;
  List<TokenProperty>? tokenProperties = <TokenProperty>[];

  factory Token.fromJson(Map<String, dynamic> json) => Token(
        address: json['address'],
        name: json['name'],
        supply:
            json['supply'] == null ? null : toBigInt(json['supply'].toDouble()),
        type: json['type'],
        symbol: json['symbol'],
        tokenProperties: json['properties'] == null
            ? null
            : List<TokenProperty>.from(json['properties'].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        'address': address,
        'name': name,
        'supply': supply,
        'type': type,
        'symbol': symbol,
        'properties': tokenProperties == null
            ? []
            : List<dynamic>.from(tokenProperties!.map((x) => x)),
      };

  Map<String, dynamic> toJsonForTxDataContent() => {
        'name': name,
        'supply': supply,
        'type': type,
        'symbol': symbol,
        'properties': tokenProperties == null
            ? []
            : List<dynamic>.from(tokenProperties!.map((x) => x)),
      };
}

class TokenProperty {
  String? name;
  String? value;
}
