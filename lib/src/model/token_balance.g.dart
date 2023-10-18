// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'token_balance.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TokenBalanceImpl _$$TokenBalanceImplFromJson(Map<String, dynamic> json) =>
    _$TokenBalanceImpl(
      address: json['address'] as String?,
      amount: json['amount'] as int?,
      tokenId: json['tokenId'] as int?,
    );

Map<String, dynamic> _$$TokenBalanceImplToJson(_$TokenBalanceImpl instance) =>
    <String, dynamic>{
      'address': instance.address,
      'amount': instance.amount,
      'tokenId': instance.tokenId,
    };
