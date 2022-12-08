// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ledger_operations.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_LedgerOperations _$$_LedgerOperationsFromJson(Map<String, dynamic> json) =>
    _$_LedgerOperations(
      fee: json['fee'] as int?,
      transactionMovements: (json['transactionMovements'] as List<dynamic>?)
              ?.map((e) =>
                  TransactionMovement.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      unspentOutputs: (json['unspentOutputs'] as List<dynamic>?)
              ?.map((e) => UnspentOutputs.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$_LedgerOperationsToJson(_$_LedgerOperations instance) =>
    <String, dynamic>{
      'fee': instance.fee,
      'transactionMovements': instance.transactionMovements,
      'unspentOutputs': instance.unspentOutputs,
    };
