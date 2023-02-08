// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'token.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Token _$$_TokenFromJson(Map<String, dynamic> json) => _$_Token(
      address: json['address'] as String?,
      genesis: json['genesis'] as String?,
      name: json['name'] as String?,
      id: json['id'] as String?,
      supply: json['supply'] as int?,
      type: json['type'] as String?,
      symbol: json['symbol'] as String?,
      tokenProperties:
          json['tokenProperties'] as Map<String, dynamic>? ?? const {},
      aeip: (json['aeip'] as List<dynamic>?)?.map((e) => e as int).toList() ??
          const [],
      ownerships: (json['ownerships'] as List<dynamic>?)
              ?.map((e) => Ownership.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$_TokenToJson(_$_Token instance) => <String, dynamic>{
      'address': instance.address,
      'genesis': instance.genesis,
      'name': instance.name,
      'id': instance.id,
      'supply': instance.supply,
      'type': instance.type,
      'symbol': instance.symbol,
      'tokenProperties': instance.tokenProperties,
      'aeip': instance.aeip,
      'ownerships': instance.ownerships,
    };
