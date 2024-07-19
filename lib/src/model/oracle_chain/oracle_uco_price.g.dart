// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'oracle_uco_price.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OracleUcoPriceImpl _$$OracleUcoPriceImplFromJson(Map<String, dynamic> json) =>
    _$OracleUcoPriceImpl(
      uco: json['uco'] == null
          ? null
          : Uco.fromJson(json['uco'] as Map<String, dynamic>),
      timestamp: (json['timestamp'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$OracleUcoPriceImplToJson(
        _$OracleUcoPriceImpl instance) =>
    <String, dynamic>{
      'uco': instance.uco,
      'timestamp': instance.timestamp,
    };
