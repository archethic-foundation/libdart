// SPDX-License-Identifier: AGPL-3.0-or-later
import 'package:freezed_annotation/freezed_annotation.dart';

part 'unspent_outputs.freezed.dart';
part 'unspent_outputs.g.dart';

/// [UnspentOutputs] represents the remaining unspent output of the transaction.
@freezed
class UnspentOutputs with _$UnspentOutputs {
  const factory UnspentOutputs({
    /// Asset amount
    int? amount,

    /// Address of the token if the type is token
    String? tokenAddress,

    /// Type of the token: UCO/Token
    String? type,

    /// Transaction which send the amount of assets
    String? from,

    /// Id for a token which is allocated when the token is minted.
    int? tokenId,

    /// Date time when the UTXO created/manipulated
    int? timestamp,

    /// State of a smart contract
    Map<String, dynamic>? state,
  }) = _UnspentOutputs;
  const UnspentOutputs._();

  factory UnspentOutputs.fromJson(Map<String, dynamic> json) =>
      _$UnspentOutputsFromJson(json);
}
