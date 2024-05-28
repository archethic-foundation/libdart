// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'validation_stamp.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ValidationStampImpl _$$ValidationStampImplFromJson(
        Map<String, dynamic> json) =>
    _$ValidationStampImpl(
      ledgerOperations: json['ledgerOperations'] == null
          ? null
          : LedgerOperations.fromJson(
              json['ledgerOperations'] as Map<String, dynamic>),
      proofOfIntegrity: json['proofOfIntegrity'] as String?,
      proofOfWork: json['proofOfWork'] as String?,
      signature: json['signature'] as String?,
      timestamp: json['timestamp'] as int?,
      protocolVersion: json['protocolVersion'] as int?,
    );

Map<String, dynamic> _$$ValidationStampImplToJson(
        _$ValidationStampImpl instance) =>
    <String, dynamic>{
      'ledgerOperations': instance.ledgerOperations,
      'proofOfIntegrity': instance.proofOfIntegrity,
      'proofOfWork': instance.proofOfWork,
      'signature': instance.signature,
      'timestamp': instance.timestamp,
      'protocolVersion': instance.protocolVersion,
    };
