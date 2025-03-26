import 'package:freezed_annotation/freezed_annotation.dart';

part 'token_transfer.freezed.dart';
part 'token_transfer.g.dart';

/// [TokenTransfer] represents the an asset transfer
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
