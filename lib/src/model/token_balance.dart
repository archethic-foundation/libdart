/// SPDX-License-Identifier: AGPL-3.0-or-later

import 'package:freezed_annotation/freezed_annotation.dart';

/// [TokenBalance] represents a token ledger balance.

part 'token_balance.freezed.dart';
part 'token_balance.g.dart';

@freezed
class TokenBalance with _$TokenBalance {
  const factory TokenBalance({
    /// token: address of the token
    String? address,

    /// Amount: amount of token
    int? amount,

    /// Token ID: ID of the token
    int? tokenId,
  }) = _TokenBalance;
  const TokenBalance._();

  factory TokenBalance.fromJson(Map<String, dynamic> json) =>
      _$TokenBalanceFromJson(json);
}
