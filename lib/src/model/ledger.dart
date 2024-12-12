// SPDX-License-Identifier: AGPL-3.0-or-later

import 'package:archethic_lib_dart/src/model/token_ledger.dart';
import 'package:archethic_lib_dart/src/model/uco_ledger.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'ledger.freezed.dart';
part 'ledger.g.dart';

/// [Ledger] represents the ledger operations to perform
@freezed
class Ledger with _$Ledger {
  const factory Ledger({
    TokenLedger? token,
    UCOLedger? uco,
  }) = _Ledger;
  const Ledger._();

  factory Ledger.fromJson(Map<String, dynamic> json) => _$LedgerFromJson(json);
}
