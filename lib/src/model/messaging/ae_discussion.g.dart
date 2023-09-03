// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ae_discussion.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AEDiscussion _$$_AEDiscussionFromJson(Map<String, dynamic> json) =>
    _$_AEDiscussion(
      discussionName: json['discussionName'] as String? ?? '',
      address: json['address'] as String? ?? '',
      usersPubKey: (json['usersPubKey'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      adminPublicKey: (json['adminPublicKey'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      timestampLastUpdate: json['timestampLastUpdate'] as int? ?? 0,
    );

Map<String, dynamic> _$$_AEDiscussionToJson(_$_AEDiscussion instance) =>
    <String, dynamic>{
      'discussionName': instance.discussionName,
      'address': instance.address,
      'usersPubKey': instance.usersPubKey,
      'adminPublicKey': instance.adminPublicKey,
      'timestampLastUpdate': instance.timestampLastUpdate,
    };
