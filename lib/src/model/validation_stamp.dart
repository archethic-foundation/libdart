/// SPDX-License-Identifier: AGPL-3.0-or-later
import 'package:archethic_lib_dart/src/model/ledger_operations.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

/// [ValidationStamp] represents the validation performs by the coordinator
part 'validation_stamp.freezed.dart';
part 'validation_stamp.g.dart';

@freezed
class ValidationStamp with _$ValidationStamp {
  const factory ValidationStamp({
    /// Ledger operations: All the operations performed by the transaction
    LedgerOperations? ledgerOperations,

    /// Proof of integrity: Hash of the previous proof of integrity and the transaction
    String? proofOfIntegrity,

    /// Proof of work: Public key matching the origin signature
    String? proofOfWork,

    /// Signature: Coordinator signature of the stamp
    String? signature,

    /// Timestamp
    int? timestamp,
  }) = _ValidationStamp;
  const ValidationStamp._();

  factory ValidationStamp.fromJson(Map<String, dynamic> json) =>
      _$ValidationStampFromJson(json);
}
