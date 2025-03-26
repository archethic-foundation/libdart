import 'package:archethic_lib_dart/src/model/consumed_inputs.dart';
import 'package:archethic_lib_dart/src/model/transaction_movement.dart';
import 'package:archethic_lib_dart/src/model/unspent_outputs.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'ledger_operations.freezed.dart';
part 'ledger_operations.g.dart';

/// [LedgerOperations] represents the ledger operations performed by the transaction.
@freezed
class LedgerOperations with _$LedgerOperations {
  const factory LedgerOperations({
    /// Transaction fee (distributed over the node rewards)
    int? fee,

    /// Assets transfers
    @Default([]) final List<TransactionMovement> transactionMovements,

    /// Remaining unspent outputs
    @Default([]) final List<UnspentOutputs> unspentOutputs,

    /// Remaining unspent outputs
    @Default([]) final List<ConsumedInputs> consumedInputs,
  }) = _LedgerOperations;
  const LedgerOperations._();

  factory LedgerOperations.fromJson(Map<String, dynamic> json) =>
      _$LedgerOperationsFromJson(json);
}
