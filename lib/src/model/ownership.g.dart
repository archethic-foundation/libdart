// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ownership.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Ownership _$$_OwnershipFromJson(Map<String, dynamic> json) => _$_Ownership(
      authorizedPublicKeys: (json['authorizedPublicKeys'] as List<dynamic>?)
              ?.map((e) => AuthorizedKey.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      secret: json['secret'] as String?,
    );

Map<String, dynamic> _$$_OwnershipToJson(_$_Ownership instance) =>
    <String, dynamic>{
      'authorizedPublicKeys': instance.authorizedPublicKeys,
      'secret': instance.secret,
    };
