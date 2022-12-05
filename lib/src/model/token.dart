// Dart imports:
import 'dart:convert';

import 'package:archethic_lib_dart/src/model/ownership.dart';

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
  Token({
    this.address,
    this.genesis,
    this.name,
    this.id,
    this.supply,
    this.type,
    this.symbol,
    this.tokenProperties,
    this.aeip,
    this.ownerships,
  });

  String? address;
  String? genesis;
  String? name;
  String? id;
  int? supply;
  String? type;
  String? symbol;
  TokenProperty? tokenProperties;
  List<int>? aeip;
  List<Ownership>? ownerships;

  factory Token.fromJson(Map<String, dynamic> map) {
    return Token(
        address: map['address'],
        genesis: map['genesis'],
        name: map['name'],
        id: map['id'],
        supply: map['supply'] == null
            ? null
            : int.tryParse(map['supply'].toString()),
        type: map['type'],
        symbol: map['symbol'],
        aeip: map['aeip'],
        ownerships: map['ownerships'],
        tokenProperties: map['properties']);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'address': address,
        'genesis': genesis,
        'name': name,
        'id': id,
        'supply': supply,
        'type': type,
        'symbol': symbol,
        'aeip': aeip,
        'ownerships': ownerships,
        'properties': tokenProperties,
      };

  Map<String, dynamic> toJsonForTxDataContent() => <String, dynamic>{
        'name': name,
        'supply': supply,
        'type': type,
        'symbol': symbol,
        'aeip': aeip,
        'ownerships': ownerships,
        'properties': tokenProperties,
      };
}

class TokenProperty {
  TokenProperty({
    this.typeMime,
    this.content,
    this.name,
    this.description,
  });

  final String? typeMime;
  final TokenPropertyContent? content;
  final String? name;
  final String? description;

  factory TokenProperty.fromMap(Map<String, dynamic> json) => TokenProperty(
        typeMime: json['type_mime'],
        content: TokenPropertyContent.fromMap(json['content']),
        name: json['name'],
        description: json['description'],
      );

  Map<String, dynamic> toMap() => {
        'type_mime': typeMime,
        'content': content == null ? null : content!.toMap(),
        'name': name,
        'description': description,
      };
}

class TokenPropertyContent {
  TokenPropertyContent({
    this.raw,
    this.ipfsUrl,
    this.httpUrl,
    this.aeweb,
  });

  final String? raw;
  final String? ipfsUrl;
  final String? httpUrl;
  final String? aeweb;

  factory TokenPropertyContent.fromMap(Map<String, dynamic> json) =>
      TokenPropertyContent(
        raw: json['raw'],
        ipfsUrl: json['ipfs_url'],
        httpUrl: json['http_url'],
        aeweb: json['aeweb'],
      );

  Map<String, dynamic> toMap() => {
        'raw': raw,
        'ipfs_url': ipfsUrl,
        'http_url': httpUrl,
        'aeweb': aeweb,
      };
}
