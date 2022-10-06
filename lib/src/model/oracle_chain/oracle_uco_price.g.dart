// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'oracle_uco_price.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_OracleUcoPrice _$$_OracleUcoPriceFromJson(Map<String, dynamic> json) =>
    _$_OracleUcoPrice(
      uco: json['uco'] == null
          ? null
          : Uco.fromJson(json['uco'] as Map<String, dynamic>),
      timestamp: json['timestamp'] as int?,
    );

Map<String, dynamic> _$$_OracleUcoPriceToJson(_$_OracleUcoPrice instance) =>
    <String, dynamic>{
      'uco': instance.uco,
      'timestamp': instance.timestamp,
    };
