// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sc_call_function_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SCCallFunctionParamsImpl _$$SCCallFunctionParamsImplFromJson(
        Map<String, dynamic> json) =>
    _$SCCallFunctionParamsImpl(
      contract: json['contract'] as String,
      function: json['function'] as String,
      args: json['args'] as List<dynamic>,
      resolveLast: json['resolve_last'] as bool? ?? true,
    );

Map<String, dynamic> _$$SCCallFunctionParamsImplToJson(
        _$SCCallFunctionParamsImpl instance) =>
    <String, dynamic>{
      'contract': instance.contract,
      'function': instance.function,
      'args': instance.args,
      'resolve_last': instance.resolveLast,
    };
