// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'balance_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_BalanceResponse _$$_BalanceResponseFromJson(Map<String, dynamic> json) =>
    _$_BalanceResponse(
      data: (json['data'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, Balance.fromJson(e as Map<String, dynamic>)),
      ),
      error: json['error'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$$_BalanceResponseToJson(_$_BalanceResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
      'error': instance.error,
    };
