// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hosting.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Hosting _$$_HostingFromJson(Map<String, dynamic> json) => _$_Hosting(
      aewebVersion: json['aewebVersion'] as int? ?? 1,
      hashFunction: json['hashFunction'] as String? ?? 'sha1',
      metaData: (json['metaData'] as Map<String, dynamic>?)?.map(
            (k, e) => MapEntry(
                k, HostingContentMetaData.fromJson(e as Map<String, dynamic>)),
          ) ??
          const {},
    );

Map<String, dynamic> _$$_HostingToJson(_$_Hosting instance) =>
    <String, dynamic>{
      'aewebVersion': instance.aewebVersion,
      'hashFunction': instance.hashFunction,
      'metaData': instance.metaData,
    };
