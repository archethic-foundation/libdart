// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'uco_transfer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UCOTransferImpl _$$UCOTransferImplFromJson(Map<String, dynamic> json) =>
    _$UCOTransferImpl(
      amount: (json['amount'] as num?)?.toInt(),
      to: json['to'] as String?,
    );

Map<String, dynamic> _$$UCOTransferImplToJson(_$UCOTransferImpl instance) =>
    <String, dynamic>{
      'amount': instance.amount,
      'to': instance.to,
    };
