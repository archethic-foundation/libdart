// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'consumed_inputs.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ConsumedInputsImpl _$$ConsumedInputsImplFromJson(Map<String, dynamic> json) =>
    _$ConsumedInputsImpl(
      amount: json['amount'] as int?,
      from: json['from'] as String?,
      tokenAddress: json['tokenAddress'] as String?,
      timestamp: json['timestamp'] as int?,
      type: json['type'] as String?,
      tokenId: json['tokenId'] as int?,
      protocolVersion: json['protocolVersion'] as int?,
      state: json['state'] as String?,
    );

Map<String, dynamic> _$$ConsumedInputsImplToJson(
        _$ConsumedInputsImpl instance) =>
    <String, dynamic>{
      'amount': instance.amount,
      'from': instance.from,
      'tokenAddress': instance.tokenAddress,
      'timestamp': instance.timestamp,
      'type': instance.type,
      'tokenId': instance.tokenId,
      'protocolVersion': instance.protocolVersion,
      'state': instance.state,
    };
