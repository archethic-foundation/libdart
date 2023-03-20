// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hosting_content_metadata.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_HostingContentMetaData _$$_HostingContentMetaDataFromJson(
        Map<String, dynamic> json) =>
    _$_HostingContentMetaData(
      hash: json['hash'] as String? ?? '',
      size: json['size'] as int? ?? 0,
      encoding: json['encoding'] as String? ?? '',
      addresses: (json['addresses'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$_HostingContentMetaDataToJson(
        _$_HostingContentMetaData instance) =>
    <String, dynamic>{
      'hash': instance.hash,
      'size': instance.size,
      'encoding': instance.encoding,
      'addresses': instance.addresses,
    };
