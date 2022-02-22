/// SPDX-License-Identifier: AGPL-3.0-or-later

// Project imports:
import 'package:archethic_lib_dart/src/model/ledger_operations.dart';

/// [ValidationStamp] represents the validation performs by the coordinator
class ValidationStamp {
  ValidationStamp({
    this.ledgerOperations,
    this.proofOfIntegrity,
    this.proofOfWork,
    this.signature,
    this.timestamp,
  });

  /// Ledger operations: All the operations performed by the transaction
  LedgerOperations? ledgerOperations;

  /// Proof of integrity: Hash of the previous proof of integrity and the transaction
  String? proofOfIntegrity;

  /// Proof of work: Public key matching the origin signature
  String? proofOfWork;

  /// Signature: Coordinator signature of the stamp
  String? signature;

  /// Timestamp
  int? timestamp;

  factory ValidationStamp.fromJson(Map<String, dynamic> json) =>
      ValidationStamp(
        ledgerOperations: json['ledgerOperations'] == null
            ? null
            : LedgerOperations.fromJson(json['ledgerOperations']),
        proofOfIntegrity: json['proofOfIntegrity'],
        proofOfWork: json['proofOfWork'],
        signature: json['signature'],
        timestamp: json['timestamp'],
      );

  Map<String, dynamic> toJson() => {
        'ledgerOperations': ledgerOperations!.toJson(),
        'proofOfIntegrity': proofOfIntegrity,
        'proofOfWork': proofOfWork,
        'signature': signature,
        'timestamp': timestamp,
      };
}
