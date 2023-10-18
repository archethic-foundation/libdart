// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'balance.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BalanceImpl _$$BalanceImplFromJson(Map<String, dynamic> json) =>
    _$BalanceImpl(
      token: (json['token'] as List<dynamic>?)
              ?.map((e) => TokenBalance.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      uco: json['uco'] as int? ?? 0,
    );

Map<String, dynamic> _$$BalanceImplToJson(_$BalanceImpl instance) =>
    <String, dynamic>{
      'token': instance.token,
      'uco': instance.uco,
    };
