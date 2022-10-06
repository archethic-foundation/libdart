// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'uco_ledger.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UCOLedger _$$_UCOLedgerFromJson(Map<String, dynamic> json) => _$_UCOLedger(
      transfers: (json['transfers'] as List<dynamic>?)
              ?.map((e) => UCOTransfer.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$_UCOLedgerToJson(_$_UCOLedger instance) =>
    <String, dynamic>{
      'transfers': instance.transfers,
    };
