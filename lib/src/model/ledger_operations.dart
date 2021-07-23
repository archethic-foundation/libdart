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
        fee: json['fee'] == null ? null : json['fee'].toDouble(),
        nodeMovements: List<NodeMovement>.from(
            json['nodeMovements'].map((x) => NodeMovement.fromJson(x))),
        transactionMovements: List<TransactionMovement>.from(
            json['transactionMovements']
                .map((x) => TransactionMovement.fromJson(x))),
        unspentOutputs: List<UnspentOutputs>.from(
            json['unspentOutputs'].map((x) => UnspentOutputs.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        'fee': fee,
        'nodeMovements':
            List<dynamic>.from(nodeMovements!.map((x) => x.toJson())),
        'transactionMovements':
            List<dynamic>.from(transactionMovements!.map((x) => x.toJson())),
        'unspentOutputs':
            List<dynamic>.from(unspentOutputs!.map((x) => x.toJson())),
      };
}
