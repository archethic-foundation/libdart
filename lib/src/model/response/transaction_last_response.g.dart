// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_last_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TransactionLastResponse _$$_TransactionLastResponseFromJson(
        Map<String, dynamic> json) =>
    _$_TransactionLastResponse(
      data: (json['data'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, Transaction.fromJson(e as Map<String, dynamic>)),
      ),
      error: json['error'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$$_TransactionLastResponseToJson(
        _$_TransactionLastResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
      'error': instance.error,
    };
