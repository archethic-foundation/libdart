// SPDX-License-Identifier: AGPL-3.0-or-later

import 'package:archethic_lib_dart/src/model/ledger.dart';
import 'package:archethic_lib_dart/src/model/ownership.dart';
import 'package:archethic_lib_dart/src/model/recipient.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'data.freezed.dart';
part 'data.g.dart';

/// [Data] represents the data section for every transaction.
@Freezed(makeCollectionsUnmodifiable: false)
class Data with _$Data {
  const factory Data({
    /// Smart contract code (hexadecimal),
    String? code,

    /// Rree zone for data hosting (string or hexadecimal)
    String? content,

    /// Authorization/Delegations containing list of secrets and their authorized public keys to proof the ownership
    @Default([]) final List<Ownership> ownerships,

    /// Asset transfers
    Ledger? ledger,

    /// For non asset transfers, the list of recipients of the transaction (e.g Smart contract interactions)
    @Default([]) final List<Recipient> recipients,
  }) = _Data;
  const Data._();

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
}
