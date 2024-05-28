/// SPDX-License-Identifier: AGPL-3.0-or-later

import 'package:freezed_annotation/freezed_annotation.dart';

/// [ConsumedInputs] represents the inputs consumed by the transaction It includes.

part 'consumed_inputs.freezed.dart';
part 'consumed_inputs.g.dart';

@freezed
class ConsumedInputs with _$ConsumedInputs {
  const factory ConsumedInputs({
    /// Amount: asset amount
    int? amount,

    /// From: transaction which send the amount of assets
    String? from,

    /// token address: address of the token if the type is token
    String? tokenAddress,

    /// Timestamp: Date time when the UTXO created/manipulated
    int? timestamp,

    /// Type: UCO/token/state/call
    String? type,

    /// Token id: It is the id for a token which is allocated when the token is minted.
    int? tokenId,

    /// Protocol Version: Version of the UTXO data structure
    int? protocolVersion,

    /// State: It is the state of a smart contract
    String? state,
  }) = _ConsumedInputs;
  const ConsumedInputs._();

  factory ConsumedInputs.fromJson(Map<String, dynamic> json) =>
      _$ConsumedInputsFromJson(json);
}
