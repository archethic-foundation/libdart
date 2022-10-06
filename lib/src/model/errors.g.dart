// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'errors.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Errors _$$_ErrorsFromJson(Map<String, dynamic> json) => _$_Errors(
      errors: (json['errors'] as List<dynamic>?)
              ?.map((e) => Error.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$_ErrorsToJson(_$_Errors instance) => <String, dynamic>{
      'errors': instance.errors,
    };
