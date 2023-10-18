// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'endpoint.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EndpointImpl _$$EndpointImplFromJson(Map<String, dynamic> json) =>
    _$EndpointImpl(
      ip: json['ip'] as String? ?? '',
      port: json['port'] as int? ?? 0,
    );

Map<String, dynamic> _$$EndpointImplToJson(_$EndpointImpl instance) =>
    <String, dynamic>{
      'ip': instance.ip,
      'port': instance.port,
    };
