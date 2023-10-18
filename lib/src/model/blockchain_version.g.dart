// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'blockchain_version.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BlockchainVersionModelImpl _$$BlockchainVersionModelImplFromJson(
        Map<String, dynamic> json) =>
    _$BlockchainVersionModelImpl(
      version:
          BlockchainVersion.fromJson(json['version'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$BlockchainVersionModelImplToJson(
        _$BlockchainVersionModelImpl instance) =>
    <String, dynamic>{
      'version': instance.version,
    };

_$BlockchainVersionImpl _$$BlockchainVersionImplFromJson(
        Map<String, dynamic> json) =>
    _$BlockchainVersionImpl(
      code: json['code'] as String?,
      protocol: json['protocol'] as String,
      transaction: json['transaction'] as String,
    );

Map<String, dynamic> _$$BlockchainVersionImplToJson(
        _$BlockchainVersionImpl instance) =>
    <String, dynamic>{
      'code': instance.code,
      'protocol': instance.protocol,
      'transaction': instance.transaction,
    };
