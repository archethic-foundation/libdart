/// SPDX-License-Identifier: AGPL-3.0-or-later

import 'package:archethic_lib_dart/src/model/token_balance.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

/// [Balance] represents a ledger balance.

part 'balance.freezed.dart';
part 'balance.g.dart';

@freezed
class Balance with _$Balance {
  const factory Balance({
    /// Token: Token balances
    @Default([]) final List<TokenBalance> token,

    /// UCO: uco balance
    @Default(0) final int uco,
  }) = _Balance;
  const Balance._();

  factory Balance.fromJson(Map<String, dynamic> json) =>
      _$BalanceFromJson(json);
}
