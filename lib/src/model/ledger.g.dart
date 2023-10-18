// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ledger.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LedgerImpl _$$LedgerImplFromJson(Map<String, dynamic> json) => _$LedgerImpl(
      token: json['token'] == null
          ? null
          : TokenLedger.fromJson(json['token'] as Map<String, dynamic>),
      uco: json['uco'] == null
          ? null
          : UCOLedger.fromJson(json['uco'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$LedgerImplToJson(_$LedgerImpl instance) =>
    <String, dynamic>{
      'token': instance.token,
      'uco': instance.uco,
    };
