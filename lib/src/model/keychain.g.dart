// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'keychain.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$KeychainImpl _$$KeychainImplFromJson(Map<String, dynamic> json) =>
    _$KeychainImpl(
      seed: const Uint8ListConverter().fromJson(json['seed'] as List<int>?),
      version: (json['version'] as num?)?.toInt() ?? 1,
      services: (json['services'] as Map<String, dynamic>?)?.map(
            (k, e) => MapEntry(k, Service.fromJson(e as Map<String, dynamic>)),
          ) ??
          const {},
    );

Map<String, dynamic> _$$KeychainImplToJson(_$KeychainImpl instance) =>
    <String, dynamic>{
      'seed': const Uint8ListConverter().toJson(instance.seed),
      'version': instance.version,
      'services': instance.services,
    };
