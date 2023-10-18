// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sc_call_function_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SCCallFunctionRequestImpl _$$SCCallFunctionRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$SCCallFunctionRequestImpl(
      jsonrpc: json['jsonrpc'] as String? ?? '2.0',
      method: json['method'] as String,
      id: json['id'] as int? ?? 1,
      params:
          SCCallFunctionParams.fromJson(json['params'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$SCCallFunctionRequestImplToJson(
        _$SCCallFunctionRequestImpl instance) =>
    <String, dynamic>{
      'jsonrpc': instance.jsonrpc,
      'method': instance.method,
      'id': instance.id,
      'params': instance.params,
    };

_$SCCallFunctionParamsImpl _$$SCCallFunctionParamsImplFromJson(
        Map<String, dynamic> json) =>
    _$SCCallFunctionParamsImpl(
      contract: json['contract'] as String,
      function: json['function'] as String,
      args: json['args'] as List<dynamic>,
    );

Map<String, dynamic> _$$SCCallFunctionParamsImplToJson(
        _$SCCallFunctionParamsImpl instance) =>
    <String, dynamic>{
      'contract': instance.contract,
      'function': instance.function,
      'args': instance.args,
    };
