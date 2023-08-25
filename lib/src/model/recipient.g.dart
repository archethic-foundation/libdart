// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipient.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Recipient _$$_RecipientFromJson(Map<String, dynamic> json) => _$_Recipient(
      action: json['action'] as String?,
      address: json['address'] as String?,
      args: (json['args'] as List<dynamic>?)?.map((e) => e as Object).toList(),
    );

Map<String, dynamic> _$$_RecipientToJson(_$_Recipient instance) =>
    <String, dynamic>{
      'action': instance.action,
      'address': instance.address,
      'args': instance.args,
    };
