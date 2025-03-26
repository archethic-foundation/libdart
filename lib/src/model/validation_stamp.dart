import 'package:archethic_lib_dart/src/model/ledger_operations.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'validation_stamp.freezed.dart';
part 'validation_stamp.g.dart';

/// [ValidationStamp] represents the validation performs by the coordinator
@freezed
class ValidationStamp with _$ValidationStamp {
  const factory ValidationStamp({
    /// All the operations performed by the transaction
    LedgerOperations? ledgerOperations,

    /// Hash of the previous proof of integrity and the transaction
    String? proofOfIntegrity,

    /// Public key matching the origin signature
    String? proofOfWork,

    /// Coordinator signature of the stamp
    String? signature,

    /// Timestamp
    int? timestamp,

    /// Version of the transaction validation protocol
    int? protocolVersion,
  }) = _ValidationStamp;
  const ValidationStamp._();

  factory ValidationStamp.fromJson(Map<String, dynamic> json) =>
      _$ValidationStampFromJson(json);
}
