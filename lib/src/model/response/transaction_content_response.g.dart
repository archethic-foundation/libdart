// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_content_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TransactionContentResponse _$$_TransactionContentResponseFromJson(
        Map<String, dynamic> json) =>
    _$_TransactionContentResponse(
      data: (json['data'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, Transaction.fromJson(e as Map<String, dynamic>)),
      ),
      error: json['error'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$$_TransactionContentResponseToJson(
        _$_TransactionContentResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
      'error': instance.error,
    };
