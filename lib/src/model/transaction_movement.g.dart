// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_movement.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TransactionMovementImpl _$$TransactionMovementImplFromJson(
        Map<String, dynamic> json) =>
    _$TransactionMovementImpl(
      amount: json['amount'] as int?,
      tokenAddress: json['tokenAddress'] as String?,
      to: json['to'] as String?,
      type: json['type'] as String?,
      tokenId: json['tokenId'] as int?,
    );

Map<String, dynamic> _$$TransactionMovementImplToJson(
        _$TransactionMovementImpl instance) =>
    <String, dynamic>{
      'amount': instance.amount,
      'tokenAddress': instance.tokenAddress,
      'to': instance.to,
      'type': instance.type,
      'tokenId': instance.tokenId,
    };
