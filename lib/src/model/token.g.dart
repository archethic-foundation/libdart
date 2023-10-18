// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'token.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TokenImpl _$$TokenImplFromJson(Map<String, dynamic> json) => _$TokenImpl(
      address: json['address'] as String?,
      genesis: json['genesis'] as String?,
      name: json['name'] as String?,
      id: json['id'] as String?,
      supply: json['supply'] as int?,
      type: json['type'] as String?,
      decimals: json['decimals'] as int?,
      symbol: json['symbol'] as String?,
      properties: json['properties'] as Map<String, dynamic>? ?? const {},
      collection: (json['collection'] as List<dynamic>?)
              ?.map((e) => e as Map<String, dynamic>)
              .toList() ??
          const [],
      aeip: (json['aeip'] as List<dynamic>?)?.map((e) => e as int).toList() ??
          const [],
      ownerships: (json['ownerships'] as List<dynamic>?)
              ?.map((e) => Ownership.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$TokenImplToJson(_$TokenImpl instance) =>
    <String, dynamic>{
      'address': instance.address,
      'genesis': instance.genesis,
      'name': instance.name,
      'id': instance.id,
      'supply': instance.supply,
      'type': instance.type,
      'decimals': instance.decimals,
      'symbol': instance.symbol,
      'properties': instance.properties,
      'collection': instance.collection,
      'aeip': instance.aeip,
      'ownerships': instance.ownerships,
    };
