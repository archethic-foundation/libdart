// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_fee.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TransactionFeeImpl _$$TransactionFeeImplFromJson(Map<String, dynamic> json) =>
    _$TransactionFeeImpl(
      fee: json['fee'] as int?,
      rates: json['rates'] == null
          ? null
          : Rates.fromJson(json['rates'] as Map<String, dynamic>),
      errors: json['errors'] == null
          ? null
          : TransactionFeeErrors.fromJson(
              json['errors'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$TransactionFeeImplToJson(
        _$TransactionFeeImpl instance) =>
    <String, dynamic>{
      'fee': instance.fee,
      'rates': instance.rates,
      'errors': instance.errors,
    };

_$RatesImpl _$$RatesImplFromJson(Map<String, dynamic> json) => _$RatesImpl(
      eur: (json['eur'] as num?)?.toDouble(),
      usd: (json['usd'] as num?)?.toDouble(),
      errors: json['errors'] == null
          ? null
          : TransactionFeeErrors.fromJson(
              json['errors'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$RatesImplToJson(_$RatesImpl instance) =>
    <String, dynamic>{
      'eur': instance.eur,
      'usd': instance.usd,
      'errors': instance.errors,
    };

_$TransactionFeeErrorsImpl _$$TransactionFeeErrorsImplFromJson(
        Map<String, dynamic> json) =>
    _$TransactionFeeErrorsImpl(
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
      errors: json['errors'] == null
          ? null
          : TransactionFeeErrors.fromJson(
              json['errors'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$TransactionFeeErrorsImplToJson(
        _$TransactionFeeErrorsImpl instance) =>
    <String, dynamic>{
      'data': instance.data,
      'errors': instance.errors,
    };
