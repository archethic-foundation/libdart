// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hosting_ref.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_HostingRef _$$_HostingRefFromJson(Map<String, dynamic> json) =>
    _$_HostingRef(
      aewebVersion: json['aewebVersion'] as int? ?? 1,
      hashFunction: json['hashFunction'] as String? ?? 'sha1',
      metaData: (json['metaData'] as Map<String, dynamic>?)?.map(
            (k, e) => MapEntry(k,
                HostingRefContentMetaData.fromJson(e as Map<String, dynamic>)),
          ) ??
          const {},
    );

Map<String, dynamic> _$$_HostingRefToJson(_$_HostingRef instance) =>
    <String, dynamic>{
      'aewebVersion': instance.aewebVersion,
      'hashFunction': instance.hashFunction,
      'metaData': instance.metaData,
    };
