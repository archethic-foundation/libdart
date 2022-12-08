// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'token_balance.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TokenBalance _$$_TokenBalanceFromJson(Map<String, dynamic> json) =>
    _$_TokenBalance(
      address: json['address'] as String?,
      amount: json['amount'] as int?,
      tokenId: json['tokenId'] as int?,
    );

Map<String, dynamic> _$$_TokenBalanceToJson(_$_TokenBalance instance) =>
    <String, dynamic>{
      'address': instance.address,
      'amount': instance.amount,
      'tokenId': instance.tokenId,
    };
