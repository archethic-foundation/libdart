// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'token_transfer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TokenTransferImpl _$$TokenTransferImplFromJson(Map<String, dynamic> json) =>
    _$TokenTransferImpl(
      amount: json['amount'] as int?,
      to: json['to'] as String?,
      tokenAddress: json['tokenAddress'] as String?,
      tokenId: json['tokenId'] as int?,
    );

Map<String, dynamic> _$$TokenTransferImplToJson(_$TokenTransferImpl instance) =>
    <String, dynamic>{
      'amount': instance.amount,
      'to': instance.to,
      'tokenAddress': instance.tokenAddress,
      'tokenId': instance.tokenId,
    };
