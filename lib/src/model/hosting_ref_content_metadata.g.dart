// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hosting_ref_content_metadata.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$HostingRefContentMetaDataImpl _$$HostingRefContentMetaDataImplFromJson(
        Map<String, dynamic> json) =>
    _$HostingRefContentMetaDataImpl(
      hash: json['hash'] as String? ?? '',
      size: json['size'] as int? ?? 0,
      encoding: json['encoding'] as String? ?? '',
      addresses: (json['addresses'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$HostingRefContentMetaDataImplToJson(
        _$HostingRefContentMetaDataImpl instance) =>
    <String, dynamic>{
      'hash': instance.hash,
      'size': instance.size,
      'encoding': instance.encoding,
      'addresses': instance.addresses,
    };
