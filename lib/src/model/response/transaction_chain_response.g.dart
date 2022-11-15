// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_chain_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TransactionChainResponse _$$_TransactionChainResponseFromJson(
        Map<String, dynamic> json) =>
    _$_TransactionChainResponse(
      data: (json['data'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(
            k,
            (e as List<dynamic>?)
                ?.map((e) => Transaction.fromJson(e as Map<String, dynamic>))
                .toList()),
      ),
      error: json['error'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$$_TransactionChainResponseToJson(
        _$_TransactionChainResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
      'error': instance.error,
    };
