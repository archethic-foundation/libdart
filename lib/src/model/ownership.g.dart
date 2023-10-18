// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ownership.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OwnershipImpl _$$OwnershipImplFromJson(Map<String, dynamic> json) =>
    _$OwnershipImpl(
      authorizedPublicKeys: (json['authorizedPublicKeys'] as List<dynamic>?)
              ?.map((e) => AuthorizedKey.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      secret: json['secret'] as String?,
    );

Map<String, dynamic> _$$OwnershipImplToJson(_$OwnershipImpl instance) =>
    <String, dynamic>{
      'authorizedPublicKeys': instance.authorizedPublicKeys,
      'secret': instance.secret,
    };
