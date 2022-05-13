/// SPDX-License-Identifier: AGPL-3.0-or-later

// Project imports:
import 'package:archethic_lib_dart/src/model/node_movement.dart';
import 'package:archethic_lib_dart/src/model/transaction_movement.dart';
import 'package:archethic_lib_dart/src/model/unspent_outputs.dart';

/// [LedgerOperations] represents the ledger operations performed by the transaction.
class LedgerOperations {
  LedgerOperations({
    this.fee,
    this.nodeMovements,
    this.transactionMovements,
    this.unspentOutputs,
  });

  /// Fee: transaction fee (distributed over the node rewards)
  double? fee;

  /// Node movements: node rewards
  List<NodeMovement>? nodeMovements;

  /// Transaction movements: assets transfers
  List<TransactionMovement>? transactionMovements;

  /// Unspent outputs: remaining unspent outputs
  List<UnspentOutputs>? unspentOutputs;

  factory LedgerOperations.fromJson(Map<String, dynamic> json) =>
      LedgerOperations(
        fee: json['fee']?.toDouble(),
        nodeMovements: json['nodeMovements'] == null
            ? null
            : List<NodeMovement>.from(json['nodeMovements']
                .map((dynamic x) => NodeMovement.fromJson(x))),
        transactionMovements: json['transactionMovements'] == null
            ? null
            : List<TransactionMovement>.from(json['transactionMovements']
                .map((dynamic x) => TransactionMovement.fromJson(x))),
        unspentOutputs: json['unspentOutputs'] == null
            ? null
            : List<UnspentOutputs>.from(json['unspentOutputs']
                .map((dynamic x) => UnspentOutputs.fromJson(x))),
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'fee': fee,
        'nodeMovements': List<dynamic>.from(
            nodeMovements!.map((NodeMovement x) => x.toJson())),
        'transactionMovements': List<dynamic>.from(
            transactionMovements!.map((TransactionMovement x) => x.toJson())),
        'unspentOutputs': List<dynamic>.from(
            unspentOutputs!.map((UnspentOutputs x) => x.toJson())),
      };
}
