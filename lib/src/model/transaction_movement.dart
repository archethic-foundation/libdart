// SPDX-License-Identifier: AGPL-3.0-or-later

import 'package:freezed_annotation/freezed_annotation.dart';

part 'transaction_movement.freezed.dart';
part 'transaction_movement.g.dart';

/// [TransactionMovement] represents ledger transaction movement.
@freezed
class TransactionMovement with _$TransactionMovement {
  const factory TransactionMovement({
    /// Asset amount
    int? amount,

    /// Address of the token if the type is token
    String? tokenAddress,

    /// Asset transfer recipient
    String? to,

    /// Type of the asset: UCO/Token
    String? type,

    /// Id for a token which is allocated when the token is minted.
    int? tokenId,
  }) = _TransactionMovement;
  const TransactionMovement._();

  factory TransactionMovement.fromJson(Map<String, dynamic> json) =>
      _$TransactionMovementFromJson(json);
}
