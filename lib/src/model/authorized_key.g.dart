// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'authorized_key.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AuthorizedKey _$$_AuthorizedKeyFromJson(Map<String, dynamic> json) =>
    _$_AuthorizedKey(
      publicKey: json['publicKey'] as String?,
      encryptedSecretKey: json['encryptedSecretKey'] as String?,
    );

Map<String, dynamic> _$$_AuthorizedKeyToJson(_$_AuthorizedKey instance) =>
    <String, dynamic>{
      'publicKey': instance.publicKey,
      'encryptedSecretKey': instance.encryptedSecretKey,
    };
