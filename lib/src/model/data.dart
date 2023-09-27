/// SPDX-License-Identifier: AGPL-3.0-or-later

// Project imports:
import 'package:archethic_lib_dart/src/model/ledger.dart';
import 'package:archethic_lib_dart/src/model/ownership.dart';
import 'package:archethic_lib_dart/src/model/recipient.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

/// TransactionData represents the data section for every transaction.

part 'data.freezed.dart';
part 'data.g.dart';

@Freezed(makeCollectionsUnmodifiable: false)
class Data with _$Data {
  const factory Data({
    /// Code: smart contract code (hexadecimal),
    String? code,

    /// Content: free zone for data hosting (string or hexadecimal)
    String? content,

    /// Ownership: authorization/delegations containing list of secrets and their authorized public keys to proof the ownership
    @Default([]) final List<Ownership> ownerships,

    /// Ledger: asset transfers
    Ledger? ledger,

    /// Recipients: For non asset transfers, the list of recipients of the transaction (e.g Smart contract interactions)
    @Default([]) final List<String> recipients,

    /// Recipients: For non asset transfers, the list of recipients of the transaction (e.g Smart contract interactions)
    @Default([]) final List<Recipient> actionRecipients,
  }) = _Data;
  const Data._();

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
}
