// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_inputs_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TransactionInputsResponse _$$_TransactionInputsResponseFromJson(
        Map<String, dynamic> json) =>
    _$_TransactionInputsResponse(
      data: (json['data'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(
            k,
            (e as List<dynamic>?)
                ?.map(
                    (e) => TransactionInput.fromJson(e as Map<String, dynamic>))
                .toList()),
      ),
      error: json['error'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$$_TransactionInputsResponseToJson(
        _$_TransactionInputsResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
      'error': instance.error,
    };
