// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'token_ledger.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TokenLedgerImpl _$$TokenLedgerImplFromJson(Map<String, dynamic> json) =>
    _$TokenLedgerImpl(
      transfers: (json['transfers'] as List<dynamic>?)
              ?.map((e) => TokenTransfer.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$TokenLedgerImplToJson(_$TokenLedgerImpl instance) =>
    <String, dynamic>{
      'transfers': instance.transfers,
    };
