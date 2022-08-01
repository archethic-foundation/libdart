import 'dart:convert';

/// SPDX-License-Identifier: AGPL-3.0-or-later

// To parse this JSON data, do
//
//     final token = tokenFromJson(jsonString);

Token tokenFromJson(String str) => Token.fromJson(json.decode(str));

String tokenToJson(Token data) => jsonEncode(data.toJson())
    .replaceAll('supply":"', 'supply":')
    .replaceAll('","type"', ',"type"');

String tokenToJsonForTxDataContent(Token data) {
  // Sorry for that....
  return jsonEncode(data.toJsonForTxDataContent())
      .replaceAll('supply":"', 'supply":')
      .replaceAll('","type"', ',"type"');
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

  factory Token.fromJson(Map<String, dynamic> json) {
    return Token(
      address: json['address'],
      name: json['name'],
      supply: _BigIntSerializer.deserialize(json['supply']),
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
        'supply': _BigIntSerializer.serialize(supply!),
        'type': type,
        'symbol': symbol,
        'properties': tokenProperties == null
            ? []
            : List<dynamic>.from(tokenProperties!.map((TokenProperty x) => x)),
      };

  Map<String, dynamic> toJsonForTxDataContent() => <String, dynamic>{
        'name': name,
        'supply': _BigIntSerializer.serialize(supply!),
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

class _BigIntSerializer {
  static BigInt deserialize(Object? value) {
    final String json = value as String;
    return BigInt.parse(json);
  }

  static String? serialize(BigInt value) {
    return value.toString();
  }
}
