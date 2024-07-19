// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unspent_outputs.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UnspentOutputsImpl _$$UnspentOutputsImplFromJson(Map<String, dynamic> json) =>
    _$UnspentOutputsImpl(
      amount: (json['amount'] as num?)?.toInt(),
      tokenAddress: json['tokenAddress'] as String?,
      type: json['type'] as String?,
      from: json['from'] as String?,
      tokenId: (json['tokenId'] as num?)?.toInt(),
      timestamp: (json['timestamp'] as num?)?.toInt(),
      state: json['state'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$$UnspentOutputsImplToJson(
        _$UnspentOutputsImpl instance) =>
    <String, dynamic>{
      'amount': instance.amount,
      'tokenAddress': instance.tokenAddress,
      'type': instance.type,
      'from': instance.from,
      'tokenId': instance.tokenId,
      'timestamp': instance.timestamp,
      'state': instance.state,
    };
