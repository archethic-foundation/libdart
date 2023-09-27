// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Data _$$_DataFromJson(Map<String, dynamic> json) => _$_Data(
      code: json['code'] as String?,
      content: json['content'] as String?,
      ownerships: (json['ownerships'] as List<dynamic>?)
              ?.map((e) => Ownership.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      ledger: json['ledger'] == null
          ? null
          : Ledger.fromJson(json['ledger'] as Map<String, dynamic>),
      recipients: (json['recipients'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      actionRecipients: (json['actionRecipients'] as List<dynamic>?)
              ?.map((e) => Recipient.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$_DataToJson(_$_Data instance) => <String, dynamic>{
      'code': instance.code,
      'content': instance.content,
      'ownerships': instance.ownerships,
      'ledger': instance.ledger,
      'recipients': instance.recipients,
      'actionRecipients': instance.actionRecipients,
    };
