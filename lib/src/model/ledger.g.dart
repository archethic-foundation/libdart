// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ledger.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Ledger _$$_LedgerFromJson(Map<String, dynamic> json) => _$_Ledger(
      token: json['token'] == null
          ? null
          : TokenLedger.fromJson(json['token'] as Map<String, dynamic>),
      uco: json['uco'] == null
          ? null
          : UCOLedger.fromJson(json['uco'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_LedgerToJson(_$_Ledger instance) => <String, dynamic>{
      'token': instance.token,
      'uco': instance.uco,
    };
