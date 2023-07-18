// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ae_message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AEMessage _$$_AEMessageFromJson(Map<String, dynamic> json) => _$_AEMessage(
      address: json['address'] as String? ?? '',
      senderGenesisPublicKey: json['senderGenesisPublicKey'] as String? ?? '',
      content: json['content'] as String? ?? '',
      timestampCreation: json['timestampCreation'] as int? ?? 0,
      sender: json['sender'] as String? ?? '',
    );

Map<String, dynamic> _$$_AEMessageToJson(_$_AEMessage instance) =>
    <String, dynamic>{
      'address': instance.address,
      'senderGenesisPublicKey': instance.senderGenesisPublicKey,
      'content': instance.content,
      'timestampCreation': instance.timestampCreation,
      'sender': instance.sender,
    };
