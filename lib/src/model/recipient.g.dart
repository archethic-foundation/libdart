// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipient.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RecipientImpl _$$RecipientImplFromJson(Map<String, dynamic> json) =>
    _$RecipientImpl(
      action: json['action'] as String?,
      address: json['address'] as String?,
      args: json['args'],
    );

Map<String, dynamic> _$$RecipientImplToJson(_$RecipientImpl instance) =>
    <String, dynamic>{
      'action': instance.action,
      'address': instance.address,
      'args': instance.args,
    };
