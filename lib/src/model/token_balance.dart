// SPDX-License-Identifier: AGPL-3.0-or-later

import 'package:freezed_annotation/freezed_annotation.dart';

part 'token_balance.freezed.dart';
part 'token_balance.g.dart';

/// [TokenBalance] represents a token ledger balance.
@freezed
class TokenBalance with _$TokenBalance {
  const factory TokenBalance({
    /// Address of the token
    String? address,

    /// Amount of token
    int? amount,

    /// ID of the token
    int? tokenId,
  }) = _TokenBalance;
  const TokenBalance._();

  factory TokenBalance.fromJson(Map<String, dynamic> json) =>
      _$TokenBalanceFromJson(json);
}
