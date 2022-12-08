// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'token_transfer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TokenTransfer _$$_TokenTransferFromJson(Map<String, dynamic> json) =>
    _$_TokenTransfer(
      amount: json['amount'] as int?,
      to: json['to'] as String?,
      tokenAddress: json['tokenAddress'] as String?,
      tokenId: json['tokenId'] as int?,
    );

Map<String, dynamic> _$$_TokenTransferToJson(_$_TokenTransfer instance) =>
    <String, dynamic>{
      'amount': instance.amount,
      'to': instance.to,
      'tokenAddress': instance.tokenAddress,
      'tokenId': instance.tokenId,
    };
