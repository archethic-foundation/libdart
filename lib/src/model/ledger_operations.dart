/// SPDX-License-Identifier: AGPL-3.0-or-later
import 'package:archethic_lib_dart/src/model/transaction_movement.dart';
import 'package:archethic_lib_dart/src/model/unspent_outputs.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

/// [LedgerOperations] represents the ledger operations performed by the transaction.

part 'ledger_operations.freezed.dart';
part 'ledger_operations.g.dart';

@freezed
class LedgerOperations with _$LedgerOperations {
  const factory LedgerOperations({
    /// Fee: transaction fee (distributed over the node rewards)
    int? fee,

    /// Transaction movements: assets transfers
    @Default([]) final List<TransactionMovement> transactionMovements,

    /// Unspent outputs: remaining unspent outputs
    @Default([]) final List<UnspentOutputs> unspentOutputs,
  }) = _LedgerOperations;
  const LedgerOperations._();

  factory LedgerOperations.fromJson(Map<String, dynamic> json) =>
      _$LedgerOperationsFromJson(json);
}
