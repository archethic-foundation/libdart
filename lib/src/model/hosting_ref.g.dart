// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hosting_ref.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$HostingRefImpl _$$HostingRefImplFromJson(Map<String, dynamic> json) =>
    _$HostingRefImpl(
      aewebVersion: json['aewebVersion'] as int? ?? 1,
      hashFunction: json['hashFunction'] as String? ?? 'sha1',
      metaData: (json['metaData'] as Map<String, dynamic>?)?.map(
            (k, e) => MapEntry(k,
                HostingRefContentMetaData.fromJson(e as Map<String, dynamic>)),
          ) ??
          const {},
      sslCertificate: json['sslCertificate'] as String? ?? '',
    );

Map<String, dynamic> _$$HostingRefImplToJson(_$HostingRefImpl instance) =>
    <String, dynamic>{
      'aewebVersion': instance.aewebVersion,
      'hashFunction': instance.hashFunction,
      'metaData': instance.metaData,
      'sslCertificate': instance.sslCertificate,
    };
