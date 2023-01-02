/// SPDX-License-Identifier: AGPL-3.0-or-later
import 'package:freezed_annotation/freezed_annotation.dart';

/// UnspentOutput represents the remaining unspent output of the transaction.
part 'unspent_outputs.freezed.dart';
part 'unspent_outputs.g.dart';

@freezed
class UnspentOutputs with _$UnspentOutputs {
  const factory UnspentOutputs({
    /// Amount: asset amount
    int? amount,

    /// Token address: address of the token if the type is token
    String? tokenAddress,

    /// Type: UCO/Token
    String? type,

    /// From: transaction which send the amount of assets
    String? from,

    /// Token id: It is the id for a token which is allocated when the token is minted.
    int? tokenId,

    /// Date time when the UTXO created/manipulated
    int? timestamp,

    /// Version of the UTXO data structure
    int? version,
  }) = _UnspentOutputs;
  const UnspentOutputs._();

  factory UnspentOutputs.fromJson(Map<String, dynamic> json) =>
      _$UnspentOutputsFromJson(json);
}
