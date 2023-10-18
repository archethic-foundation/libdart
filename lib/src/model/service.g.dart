// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'service.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ServiceImpl _$$ServiceImplFromJson(Map<String, dynamic> json) =>
    _$ServiceImpl(
      derivationPath: json['derivationPath'] as String,
      curve: json['curve'] as String? ?? 'ed25519',
      hashAlgo: json['hashAlgo'] as String? ?? 'sha256',
    );

Map<String, dynamic> _$$ServiceImplToJson(_$ServiceImpl instance) =>
    <String, dynamic>{
      'derivationPath': instance.derivationPath,
      'curve': instance.curve,
      'hashAlgo': instance.hashAlgo,
    };
