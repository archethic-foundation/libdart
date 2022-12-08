// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'validation_stamp.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ValidationStamp _$$_ValidationStampFromJson(Map<String, dynamic> json) =>
    _$_ValidationStamp(
      ledgerOperations: json['ledgerOperations'] == null
          ? null
          : LedgerOperations.fromJson(
              json['ledgerOperations'] as Map<String, dynamic>),
      proofOfIntegrity: json['proofOfIntegrity'] as String?,
      proofOfWork: json['proofOfWork'] as String?,
      signature: json['signature'] as String?,
      timestamp: json['timestamp'] as int?,
    );

Map<String, dynamic> _$$_ValidationStampToJson(_$_ValidationStamp instance) =>
    <String, dynamic>{
      'ledgerOperations': instance.ledgerOperations,
      'proofOfIntegrity': instance.proofOfIntegrity,
      'proofOfWork': instance.proofOfWork,
      'signature': instance.signature,
      'timestamp': instance.timestamp,
    };
