/// SPDX-License-Identifier: AGPL-3.0-or-later

// Project imports:
import 'package:archethic_lib_dart/src/model/transaction_movement.dart';
import 'package:archethic_lib_dart/src/model/unspent_outputs.dart';

/// [LedgerOperations] represents the ledger operations performed by the transaction.
class LedgerOperations {
  LedgerOperations({
    this.fee,
    this.transactionMovements,
    this.unspentOutputs,
  });

  factory LedgerOperations.fromJson(Map<String, dynamic> json) =>
      LedgerOperations(
        fee: json['fee']?.toInt(),
        transactionMovements: json['transactionMovements'] == null
            ? null
            : List<TransactionMovement>.from(json['transactionMovements']
                .map((dynamic x) => TransactionMovement.fromJson(x)),),
        unspentOutputs: json['unspentOutputs'] == null
            ? null
            : List<UnspentOutputs>.from(json['unspentOutputs']
                .map((dynamic x) => UnspentOutputs.fromJson(x)),),
      );

  /// Fee: transaction fee (distributed over the node rewards)
  int? fee;

  /// Transaction movements: assets transfers
  List<TransactionMovement>? transactionMovements;

  /// Unspent outputs: remaining unspent outputs
  List<UnspentOutputs>? unspentOutputs;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'fee': fee,
        'transactionMovements': List<dynamic>.from(
            transactionMovements!.map((TransactionMovement x) => x.toJson()),),
        'unspentOutputs': List<dynamic>.from(
            unspentOutputs!.map((UnspentOutputs x) => x.toJson()),),
      };
}
