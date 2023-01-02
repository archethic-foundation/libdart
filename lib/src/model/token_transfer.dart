/// SPDX-License-Identifier: AGPL-3.0-or-later
import 'package:freezed_annotation/freezed_annotation.dart';

/// [TokenTransfer] represents the an asset transfer
part 'token_transfer.freezed.dart';
part 'token_transfer.g.dart';

@freezed
class TokenTransfer with _$TokenTransfer {
  const factory TokenTransfer({
    int? amount,
    String? to,
    String? tokenAddress,
    int? tokenId,
  }) = _TokenTransfer;
  const TokenTransfer._();

  factory TokenTransfer.fromJson(Map<String, dynamic> json) =>
      _$TokenTransferFromJson(json);
}
