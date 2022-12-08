/// SPDX-License-Identifier: AGPL-3.0-or-later

import 'package:freezed_annotation/freezed_annotation.dart';

/// [TransactionMovement] represents ledger transaction movement.
part 'transaction_movement.freezed.dart';
part 'transaction_movement.g.dart';

@freezed
class TransactionMovement with _$TransactionMovement {
  const factory TransactionMovement({
    /// Amount: asset amount
    int? amount,

    /// Token address: address of the token if the type is token
    String? tokenAddress,

    /// To: asset transfer recipient
    String? to,

    /// Type: UCO/Token
    String? type,

    /// Token id: It is the id for a token which is allocated when the token is minted.
    int? tokenId,
  }) = _TransactionMovement;
  const TransactionMovement._();

  factory TransactionMovement.fromJson(Map<String, dynamic> json) =>
      _$TransactionMovementFromJson(json);
}
