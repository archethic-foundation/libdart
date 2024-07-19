// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ledger_operations.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LedgerOperationsImpl _$$LedgerOperationsImplFromJson(
        Map<String, dynamic> json) =>
    _$LedgerOperationsImpl(
      fee: (json['fee'] as num?)?.toInt(),
      transactionMovements: (json['transactionMovements'] as List<dynamic>?)
              ?.map((e) =>
                  TransactionMovement.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      unspentOutputs: (json['unspentOutputs'] as List<dynamic>?)
              ?.map((e) => UnspentOutputs.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      consumedInputs: (json['consumedInputs'] as List<dynamic>?)
              ?.map((e) => ConsumedInputs.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$LedgerOperationsImplToJson(
        _$LedgerOperationsImpl instance) =>
    <String, dynamic>{
      'fee': instance.fee,
      'transactionMovements': instance.transactionMovements,
      'unspentOutputs': instance.unspentOutputs,
      'consumedInputs': instance.consumedInputs,
    };
