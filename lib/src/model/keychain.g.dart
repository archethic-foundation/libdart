// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'keychain.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Keychain _$$_KeychainFromJson(Map<String, dynamic> json) => _$_Keychain(
      seed: const Uint8ListConverter().fromJson(json['seed'] as List<int>?),
      version: json['version'] as int? ?? 1,
      services: (json['services'] as Map<String, dynamic>?)?.map(
            (k, e) => MapEntry(k, Service.fromJson(e as Map<String, dynamic>)),
          ) ??
          const {},
    );

Map<String, dynamic> _$$_KeychainToJson(_$_Keychain instance) =>
    <String, dynamic>{
      'seed': const Uint8ListConverter().toJson(instance.seed),
      'version': instance.version,
      'services': instance.services,
    };
