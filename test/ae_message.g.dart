// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ae_message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AEMessage _$$_AEMessageFromJson(Map<String, dynamic> json) => _$_AEMessage(
      address: json['address'] as String? ?? '',
      content: json['content'] as String? ?? '',
      timestamp: json['timestamp'] as int? ?? 0,
      sender: json['sender'] as String? ?? '',
    );

Map<String, dynamic> _$$_AEMessageToJson(_$_AEMessage instance) =>
    <String, dynamic>{
      'address': instance.address,
      'content': instance.content,
      'timestamp': instance.timestamp,
      'sender': instance.sender,
    };
