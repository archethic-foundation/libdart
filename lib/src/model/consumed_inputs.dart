// SPDX-License-Identifier: AGPL-3.0-or-later

import 'package:freezed_annotation/freezed_annotation.dart';

part 'consumed_inputs.freezed.dart';
part 'consumed_inputs.g.dart';

/// [ConsumedInputs] represents the inputs consumed by the transaction It includes.
@freezed
class ConsumedInputs with _$ConsumedInputs {
  const factory ConsumedInputs({
    /// Asset amount
    int? amount,

    /// Transaction which send the amount of assets
    String? from,

    /// Address of the token if the type is token
    String? tokenAddress,

    /// Date time when the UTXO created/manipulated
    int? timestamp,

    /// Type of input : UCO/token/state/call
    String? type,

    /// Id for a token which is allocated when the token is minted.
    int? tokenId,

    /// Version of the UTXO data structure
    int? protocolVersion,

    /// State of a smart contract
    String? state,
  }) = _ConsumedInputs;
  const ConsumedInputs._();

  factory ConsumedInputs.fromJson(Map<String, dynamic> json) =>
      _$ConsumedInputsFromJson(json);
}
