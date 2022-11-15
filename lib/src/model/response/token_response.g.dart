// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'token_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TokenResponse _$$_TokenResponseFromJson(Map<String, dynamic> json) =>
    _$_TokenResponse(
      data: (json['data'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(
            k,
            (e as List<dynamic>)
                .map((e) => Token.fromJson(e as Map<String, dynamic>))
                .toList()),
      ),
      error: json['error'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$$_TokenResponseToJson(_$_TokenResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
      'error': instance.error,
    };
