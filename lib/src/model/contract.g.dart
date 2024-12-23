// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contract.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CodeWithManifestImpl _$$CodeWithManifestImplFromJson(
        Map<String, dynamic> json) =>
    _$CodeWithManifestImpl(
      bytecode: json['bytecode'] as String,
      manifest:
          ContractManifest.fromJson(json['manifest'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$CodeWithManifestImplToJson(
        _$CodeWithManifestImpl instance) =>
    <String, dynamic>{
      'bytecode': instance.bytecode,
      'manifest': instance.manifest,
    };

_$ContractManifestImpl _$$ContractManifestImplFromJson(
        Map<String, dynamic> json) =>
    _$ContractManifestImpl(
      abi: WasmABI.fromJson(json['abi'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ContractManifestImplToJson(
        _$ContractManifestImpl instance) =>
    <String, dynamic>{
      'abi': instance.abi,
    };

_$WasmABIImpl _$$WasmABIImplFromJson(Map<String, dynamic> json) =>
    _$WasmABIImpl(
      state: Map<String, String>.from(json['state'] as Map),
      functions: (json['functions'] as Map<String, dynamic>).map(
        (k, e) =>
            MapEntry(k, WASMFunctionABI.fromJson(e as Map<String, dynamic>)),
      ),
    );

Map<String, dynamic> _$$WasmABIImplToJson(_$WasmABIImpl instance) =>
    <String, dynamic>{
      'state': instance.state,
      'functions': instance.functions,
    };

_$WASMFunctionABIImpl _$$WASMFunctionABIImplFromJson(
        Map<String, dynamic> json) =>
    _$WASMFunctionABIImpl(
      type: json['type'] as String,
      triggerType: json['triggerType'] as String?,
      name: json['name'] as String,
      input: json['input'] as Map<String, dynamic>,
    );

Map<String, dynamic> _$$WASMFunctionABIImplToJson(
        _$WASMFunctionABIImpl instance) =>
    <String, dynamic>{
      'type': instance.type,
      'triggerType': instance.triggerType,
      'name': instance.name,
      'input': instance.input,
    };

_$ContractActionImpl _$$ContractActionImplFromJson(Map<String, dynamic> json) =>
    _$ContractActionImpl(
      name: json['name'] as String,
      parameters: (json['parameters'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$$ContractActionImplToJson(
        _$ContractActionImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'parameters': instance.parameters,
    };

_$ContractImpl _$$ContractImplFromJson(Map<String, dynamic> json) =>
    _$ContractImpl(
      bytecode:
          const Uint8ListConverter().fromJson(json['bytecode'] as List<int>?),
      manifest:
          ContractManifest.fromJson(json['manifest'] as Map<String, dynamic>),
      compress: json['compress'] as bool? ?? true,
    );

Map<String, dynamic> _$$ContractImplToJson(_$ContractImpl instance) =>
    <String, dynamic>{
      'bytecode': const Uint8ListConverter().toJson(instance.bytecode),
      'manifest': instance.manifest,
      'compress': instance.compress,
    };
