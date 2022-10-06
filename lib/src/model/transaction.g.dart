// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Transaction _$$_TransactionFromJson(Map<String, dynamic> json) =>
    _$_Transaction(
      address: json['address'] == null
          ? null
          : Address.fromJson(json['address'] as Map<String, dynamic>),
      balance: json['balance'] == null
          ? null
          : Balance.fromJson(json['balance'] as Map<String, dynamic>),
      chainLength: json['chainLength'] as int?,
      crossValidationStamps: (json['crossValidationStamps'] as List<dynamic>?)
              ?.map((e) =>
                  CrossValidationStamp.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
      inputs: (json['inputs'] as List<dynamic>?)
              ?.map((e) => TransactionInput.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      originSignature: json['originSignature'] as String?,
      previousPublicKey: json['previousPublicKey'] as String?,
      previousSignature: json['previousSignature'] as String?,
      type: json['type'] as String?,
      validationStamp: json['validationStamp'] == null
          ? null
          : ValidationStamp.fromJson(
              json['validationStamp'] as Map<String, dynamic>),
      version: json['version'] as int?,
    );

Map<String, dynamic> _$$_TransactionToJson(_$_Transaction instance) =>
    <String, dynamic>{
      'address': instance.address,
      'balance': instance.balance,
      'chainLength': instance.chainLength,
      'crossValidationStamps': instance.crossValidationStamps,
      'data': instance.data,
      'inputs': instance.inputs,
      'originSignature': instance.originSignature,
      'previousPublicKey': instance.previousPublicKey,
      'previousSignature': instance.previousSignature,
      'type': instance.type,
      'validationStamp': instance.validationStamp,
      'version': instance.version,
    };
