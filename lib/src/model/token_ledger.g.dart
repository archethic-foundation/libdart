// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'token_ledger.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TokenLedger _$$_TokenLedgerFromJson(Map<String, dynamic> json) =>
    _$_TokenLedger(
      transfers: (json['transfers'] as List<dynamic>?)
              ?.map((e) => TokenTransfer.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$_TokenLedgerToJson(_$_TokenLedger instance) =>
    <String, dynamic>{
      'transfers': instance.transfers,
    };
