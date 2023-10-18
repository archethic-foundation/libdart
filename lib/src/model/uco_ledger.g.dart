// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'uco_ledger.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UCOLedgerImpl _$$UCOLedgerImplFromJson(Map<String, dynamic> json) =>
    _$UCOLedgerImpl(
      transfers: (json['transfers'] as List<dynamic>?)
              ?.map((e) => UCOTransfer.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$UCOLedgerImplToJson(_$UCOLedgerImpl instance) =>
    <String, dynamic>{
      'transfers': instance.transfers,
    };
