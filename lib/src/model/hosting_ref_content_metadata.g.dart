// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hosting_ref_content_metadata.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_HostingRefContentMetaData _$$_HostingRefContentMetaDataFromJson(
        Map<String, dynamic> json) =>
    _$_HostingRefContentMetaData(
      hash: json['hash'] as String? ?? '',
      size: json['size'] as int? ?? 0,
      encoding: json['encoding'] as String? ?? '',
      addresses: (json['addresses'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$_HostingRefContentMetaDataToJson(
        _$_HostingRefContentMetaData instance) =>
    <String, dynamic>{
      'hash': instance.hash,
      'size': instance.size,
      'encoding': instance.encoding,
      'addresses': instance.addresses,
    };
