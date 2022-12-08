// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'balance.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Balance _$$_BalanceFromJson(Map<String, dynamic> json) => _$_Balance(
      token: (json['token'] as List<dynamic>?)
              ?.map((e) => TokenBalance.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      uco: json['uco'] as int? ?? 0,
    );

Map<String, dynamic> _$$_BalanceToJson(_$_Balance instance) =>
    <String, dynamic>{
      'token': instance.token,
      'uco': instance.uco,
    };
