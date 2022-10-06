/// SPDX-License-Identifier: AGPL-3.0-or-later

// Project imports:
import 'package:archethic_lib_dart/src/model/uco_transfer.dart';

import 'package:freezed_annotation/freezed_annotation.dart';

/// [UCOLedger] represents the transfers to perform on the UCO ledger
part 'uco_ledger.freezed.dart';
part 'uco_ledger.g.dart';

@Freezed(makeCollectionsUnmodifiable: false)
class UCOLedger with _$UCOLedger {
  const factory UCOLedger({
    @Default([]) final List<UCOTransfer> transfers,
  }) = _UCOLedger;
  const UCOLedger._();

  factory UCOLedger.fromJson(Map<String, dynamic> json) =>
      _$UCOLedgerFromJson(json);
}
