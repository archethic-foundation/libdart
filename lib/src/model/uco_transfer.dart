/// SPDX-License-Identifier: AGPL-3.0-or-later

import 'package:freezed_annotation/freezed_annotation.dart';

/// [UCOTransfer] represents the an asset transfer
part 'uco_transfer.freezed.dart';
part 'uco_transfer.g.dart';

@Freezed(makeCollectionsUnmodifiable: false)
class UCOTransfer with _$UCOTransfer {
  const factory UCOTransfer({
    int? amount,
    String? to,
  }) = _UCOTransfer;
  const UCOTransfer._();

  factory UCOTransfer.fromJson(Map<String, dynamic> json) =>
      _$UCOTransferFromJson(json);
}
