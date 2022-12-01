/// SPDX-License-Identifier: AGPL-3.0-or-later

// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

/// [TransactionInput] represents the inputs from the transaction.

part 'transaction_input.freezed.dart';
part 'transaction_input.g.dart';

@freezed
class TransactionInput with _$TransactionInput {
  const factory TransactionInput({
    /// Amount: asset amount
    int? amount,

    /// From: transaction which send the amount of assets
    String? from,

    /// token address: address of the token if the type is token
    String? tokenAddress,

    /// Spent: determines if the input has been spent
    bool? spent,

    /// Timestamp: Date time when the inputs was generated
    int? timestamp,

    /// Type: UCO/Token/Call
    String? type,

    /// Token id: It is the id for a token which is allocated when the token is minted.
    int? tokenId,
  }) = _TransactionInput;
  const TransactionInput._();

  factory TransactionInput.fromJson(Map<String, dynamic> json) =>
      _$TransactionInputFromJson(json);
}
