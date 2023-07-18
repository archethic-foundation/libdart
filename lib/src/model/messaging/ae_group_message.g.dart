// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ae_group_message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AEGroupMessage _$$_AEGroupMessageFromJson(Map<String, dynamic> json) =>
    _$_AEGroupMessage(
      groupName: json['groupName'] as String? ?? '',
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

Map<String, dynamic> _$$_AEGroupMessageToJson(_$_AEGroupMessage instance) =>
    <String, dynamic>{
      'groupName': instance.groupName,
      'address': instance.address,
      'usersPubKey': instance.usersPubKey,
      'adminPublicKey': instance.adminPublicKey,
      'timestampLastUpdate': instance.timestampLastUpdate,
    };
