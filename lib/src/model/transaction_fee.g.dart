// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_fee.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TransactionFee _$$_TransactionFeeFromJson(Map<String, dynamic> json) =>
    _$_TransactionFee(
      fee: json['fee'] as int?,
      rates: json['rates'] == null
          ? null
          : Rates.fromJson(json['rates'] as Map<String, dynamic>),
      errors: json['errors'] == null
          ? null
          : TransactionFeeErrors.fromJson(
              json['errors'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_TransactionFeeToJson(_$_TransactionFee instance) =>
    <String, dynamic>{
      'fee': instance.fee,
      'rates': instance.rates,
      'errors': instance.errors,
    };

_$_Rates _$$_RatesFromJson(Map<String, dynamic> json) => _$_Rates(
      eur: (json['eur'] as num?)?.toDouble(),
      usd: (json['usd'] as num?)?.toDouble(),
      errors: json['errors'] == null
          ? null
          : TransactionFeeErrors.fromJson(
              json['errors'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_RatesToJson(_$_Rates instance) => <String, dynamic>{
      'eur': instance.eur,
      'usd': instance.usd,
      'errors': instance.errors,
    };

_$_TransactionFeeErrors _$$_TransactionFeeErrorsFromJson(
        Map<String, dynamic> json) =>
    _$_TransactionFeeErrors(
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
      errors: json['errors'] == null
          ? null
          : TransactionFeeErrors.fromJson(
              json['errors'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_TransactionFeeErrorsToJson(
        _$_TransactionFeeErrors instance) =>
    <String, dynamic>{
      'data': instance.data,
      'errors': instance.errors,
    };
