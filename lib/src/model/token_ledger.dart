import 'package:archethic_lib_dart/src/model/token_transfer.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'token_ledger.freezed.dart';
part 'token_ledger.g.dart';

/// [TokenLedger] represents the transfers to perform on the token ledger
@Freezed(makeCollectionsUnmodifiable: false)
class TokenLedger with _$TokenLedger {
  const factory TokenLedger({
    @Default([]) final List<TokenTransfer> transfers,
  }) = _TokenLedger;
  const TokenLedger._();

  factory TokenLedger.fromJson(Map<String, dynamic> json) =>
      _$TokenLedgerFromJson(json);
}
