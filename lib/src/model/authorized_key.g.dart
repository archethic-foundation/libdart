// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'authorized_key.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AuthorizedKeyImpl _$$AuthorizedKeyImplFromJson(Map<String, dynamic> json) =>
    _$AuthorizedKeyImpl(
      publicKey: json['publicKey'] as String?,
      encryptedSecretKey: json['encryptedSecretKey'] as String?,
    );

Map<String, dynamic> _$$AuthorizedKeyImplToJson(_$AuthorizedKeyImpl instance) =>
    <String, dynamic>{
      'publicKey': instance.publicKey,
      'encryptedSecretKey': instance.encryptedSecretKey,
    };
