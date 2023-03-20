/// SPDX-License-Identifier: AGPL-3.0-or-later
import 'dart:convert';
import 'package:archethic_lib_dart/src/model/ownership.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'token.freezed.dart';
part 'token.g.dart';

@freezed
class Token with _$Token {
  const factory Token({
    String? address,
    String? genesis,
    String? name,
    String? id,
    int? supply,
    String? type,
    String? symbol,
    @Default({}) final Map<String, dynamic> properties,
    @Default([]) final List<int>? aeip,
    @Default([]) final List<Ownership>? ownerships,
  }) = _Token;
  const Token._();

  factory Token.fromJson(Map<String, dynamic> json) => _$TokenFromJson(json);

  String tokenToJsonForTxDataContent() {
    return jsonEncode(toJsonForTxDataContent());
  }

  Map<String, dynamic> toJsonForTxDataContent() => <String, dynamic>{
        'name': name,
        'supply': supply,
        'type': type,
        'symbol': symbol,
        'properties': properties,
        'aeip': aeip,
        'ownerships':
            List<dynamic>.from(ownerships!.map((Ownership x) => x.toJson())),
      };
}
