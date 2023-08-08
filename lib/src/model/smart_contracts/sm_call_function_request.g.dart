// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sm_call_function_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SMCallFunctionRequest _$$_SMCallFunctionRequestFromJson(
        Map<String, dynamic> json) =>
    _$_SMCallFunctionRequest(
      jsonrpc: json['jsonrpc'] as String? ?? '2.0',
      method: json['method'] as String,
      id: json['id'] as int? ?? 1,
      params:
          SMCallFunctionParams.fromJson(json['params'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_SMCallFunctionRequestToJson(
        _$_SMCallFunctionRequest instance) =>
    <String, dynamic>{
      'jsonrpc': instance.jsonrpc,
      'method': instance.method,
      'id': instance.id,
      'params': instance.params,
    };

_$_SMCallFunctionParams _$$_SMCallFunctionParamsFromJson(
        Map<String, dynamic> json) =>
    _$_SMCallFunctionParams(
      contract: json['contract'] as String,
      function: json['function'] as String,
      args: json['args'] as List<dynamic>,
    );

Map<String, dynamic> _$$_SMCallFunctionParamsToJson(
        _$_SMCallFunctionParams instance) =>
    <String, dynamic>{
      'contract': instance.contract,
      'function': instance.function,
      'args': instance.args,
    };
