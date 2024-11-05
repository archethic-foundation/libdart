// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'token.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UcoTokenImpl _$$UcoTokenImplFromJson(Map<String, dynamic> json) =>
    _$UcoTokenImpl(
      name: json['name'] as String? ?? 'Archethic Universal Coin',
      decimals: (json['decimals'] as num?)?.toInt() ?? 8,
      symbol: json['symbol'] ?? 'UCO',
      supply: (json['supply'] as num?)?.toInt() ?? null,
      type: json['type'] as String? ?? null,
      properties: json['properties'] as Map<String, dynamic>? ?? const {},
      collection: (json['collection'] as List<dynamic>?)
              ?.map((e) => e as Map<String, dynamic>)
              .toList() ??
          const [],
      aeip: (json['aeip'] as List<dynamic>?)
              ?.map((e) => (e as num).toInt())
              .toList() ??
          null,
      ownerships: (json['ownerships'] as List<dynamic>?)
              ?.map((e) => Ownership.fromJson(e as Map<String, dynamic>))
              .toList() ??
          null,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$UcoTokenImplToJson(_$UcoTokenImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'decimals': instance.decimals,
      'symbol': instance.symbol,
      'supply': instance.supply,
      'type': instance.type,
      'properties': instance.properties,
      'collection': instance.collection,
      'aeip': instance.aeip,
      'ownerships': instance.ownerships,
      'runtimeType': instance.$type,
    };

_$TokenWithAddressImpl _$$TokenWithAddressImplFromJson(
        Map<String, dynamic> json) =>
    _$TokenWithAddressImpl(
      address: json['address'] as String,
      genesis: json['genesis'] as String?,
      name: json['name'] as String?,
      id: json['id'] as String?,
      supply: (json['supply'] as num?)?.toInt(),
      type: json['type'] as String?,
      decimals: (json['decimals'] as num?)?.toInt(),
      symbol: json['symbol'] as String?,
      properties: json['properties'] as Map<String, dynamic>? ?? const {},
      collection: (json['collection'] as List<dynamic>?)
              ?.map((e) => e as Map<String, dynamic>)
              .toList() ??
          const [],
      aeip: (json['aeip'] as List<dynamic>?)
              ?.map((e) => (e as num).toInt())
              .toList() ??
          const [],
      ownerships: (json['ownerships'] as List<dynamic>?)
              ?.map((e) => Ownership.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$TokenWithAddressImplToJson(
        _$TokenWithAddressImpl instance) =>
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
      'runtimeType': instance.$type,
    };
