/// SPDX-License-Identifier: AGPL-3.0-or-later

// Flutter imports:
import 'dart:convert';

import 'package:archethic_lib_dart/src/model/token.dart';

TokenFungible tokenFungibleFromJson(String str) =>
    TokenFungible.fromJson(json.decode(str));

String tokenFungibleToJson(TokenFungible data) => jsonEncode(data.toJson());

String tokenFungibleToJsonForTxDataContent(TokenFungible data) {
  return jsonEncode(data.toJsonForTxDataContent());
}

class TokenFungible extends Token {
  static const String kType = 'fungible';

  TokenFungible(
      {super.address,
      required super.name,
      required super.supply,
      super.type = kType,
      required super.symbol,
      super.tokenProperties});

  factory TokenFungible.fromJson(Map<String, dynamic> json) {
    return TokenFungible(
      address: json['address'],
      name: json['name'],
      supply: json['supply'] == null
          ? null
          : int.tryParse(json['supply'].toString()),
      type: kType,
      symbol: json['symbol'],
      tokenProperties: json['properties'] == null
          ? null
          : List<TokenProperty>.from(json['properties'].map((x) => x)),
    );
  }
}
