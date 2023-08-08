// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sc_call_function_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SCCallFunctionRequest _$$_SCCallFunctionRequestFromJson(
        Map<String, dynamic> json) =>
    _$_SCCallFunctionRequest(
      jsonrpc: json['jsonrpc'] as String? ?? '2.0',
      method: json['method'] as String,
      id: json['id'] as int? ?? 1,
      params:
          SCCallFunctionParams.fromJson(json['params'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_SCCallFunctionRequestToJson(
        _$_SCCallFunctionRequest instance) =>
    <String, dynamic>{
      'jsonrpc': instance.jsonrpc,
      'method': instance.method,
      'id': instance.id,
      'params': instance.params,
    };

_$_SCCallFunctionParams _$$_SCCallFunctionParamsFromJson(
        Map<String, dynamic> json) =>
    _$_SCCallFunctionParams(
      contract: json['contract'] as String,
      function: json['function'] as String,
      args: json['args'] as List<dynamic>,
    );

Map<String, dynamic> _$$_SCCallFunctionParamsToJson(
        _$_SCCallFunctionParams instance) =>
    <String, dynamic>{
      'contract': instance.contract,
      'function': instance.function,
      'args': instance.args,
    };
