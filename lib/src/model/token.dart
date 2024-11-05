/// SPDX-License-Identifier: AGPL-3.0-or-later
import 'dart:convert';
import 'package:archethic_lib_dart/src/model/ownership.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'token.freezed.dart';
part 'token.g.dart';

@freezed
class Token with _$Token {
  const Token._();

  const factory Token.uco({
    @Default('Archethic Universal Coin') String name,
    @Default(8) int decimals,
    @Default('UCO') symbol,
    // Unused properties but necessary to union class
    @Default(null) int? supply,
    @Default(null) String? type,
    @Default({}) Map<String, dynamic> properties,
    @Default([]) List<Map<String, dynamic>> collection,
    @Default(null) List<int>? aeip,
    @Default(null) List<Ownership>? ownerships,
  }) = UcoToken;

  const factory Token.withAddress({
    required String address,
    String? genesis,
    String? name,
    String? id,
    int? supply,
    String? type,
    int? decimals,
    String? symbol,
    @Default({}) Map<String, dynamic> properties,
    @Default([]) List<Map<String, dynamic>> collection,
    @Default([]) List<int>? aeip,
    @Default([]) List<Ownership>? ownerships,
  }) = TokenWithAddress;

  factory Token.fromJson(Map<String, dynamic> json) => _$TokenFromJson(json);

  bool get isFungibleType => type != null && type == 'fungible';
  bool get isNonFungibleType => type != null && type == 'non-fungible';

  String tokenToJsonForTxDataContent() {
    return jsonEncode(toJsonForTxDataContent());
  }

  Map<String, dynamic> toJsonForTxDataContent() {
    final json = <String, dynamic>{
      'name': name,
      if (supply != null) 'supply': supply,
      if (type != null) 'type': type,
      if (decimals != null) 'decimals': decimals,
      if (symbol != null) 'symbol': symbol,
      if (properties.isNotEmpty) 'properties': properties,
      if (collection.isNotEmpty) 'collection': collection,
      if (aeip != null && aeip!.isNotEmpty) 'aeip': aeip,
    };

    if (ownerships != null && ownerships!.isNotEmpty) {
      json['ownerships'] = ownerships!.map((x) => x.toJson()).toList();
    }

    return json;
  }
}
