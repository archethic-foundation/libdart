// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sm_call_function_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SMCallFunctionRequest _$SMCallFunctionRequestFromJson(
    Map<String, dynamic> json) {
  return _SMCallFunctionRequest.fromJson(json);
}

/// @nodoc
mixin _$SMCallFunctionRequest {
  String get jsonrpc => throw _privateConstructorUsedError;
  String get method => throw _privateConstructorUsedError;
  int get id => throw _privateConstructorUsedError;
  SMCallFunctionParams get params => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SMCallFunctionRequestCopyWith<SMCallFunctionRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SMCallFunctionRequestCopyWith<$Res> {
  factory $SMCallFunctionRequestCopyWith(SMCallFunctionRequest value,
          $Res Function(SMCallFunctionRequest) then) =
      _$SMCallFunctionRequestCopyWithImpl<$Res, SMCallFunctionRequest>;
  @useResult
  $Res call(
      {String jsonrpc, String method, int id, SMCallFunctionParams params});

  $SMCallFunctionParamsCopyWith<$Res> get params;
}

/// @nodoc
class _$SMCallFunctionRequestCopyWithImpl<$Res,
        $Val extends SMCallFunctionRequest>
    implements $SMCallFunctionRequestCopyWith<$Res> {
  _$SMCallFunctionRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? jsonrpc = null,
    Object? method = null,
    Object? id = null,
    Object? params = null,
  }) {
    return _then(_value.copyWith(
      jsonrpc: null == jsonrpc
          ? _value.jsonrpc
          : jsonrpc // ignore: cast_nullable_to_non_nullable
              as String,
      method: null == method
          ? _value.method
          : method // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      params: null == params
          ? _value.params
          : params // ignore: cast_nullable_to_non_nullable
              as SMCallFunctionParams,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $SMCallFunctionParamsCopyWith<$Res> get params {
    return $SMCallFunctionParamsCopyWith<$Res>(_value.params, (value) {
      return _then(_value.copyWith(params: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_SMCallFunctionRequestCopyWith<$Res>
    implements $SMCallFunctionRequestCopyWith<$Res> {
  factory _$$_SMCallFunctionRequestCopyWith(_$_SMCallFunctionRequest value,
          $Res Function(_$_SMCallFunctionRequest) then) =
      __$$_SMCallFunctionRequestCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String jsonrpc, String method, int id, SMCallFunctionParams params});

  @override
  $SMCallFunctionParamsCopyWith<$Res> get params;
}

/// @nodoc
class __$$_SMCallFunctionRequestCopyWithImpl<$Res>
    extends _$SMCallFunctionRequestCopyWithImpl<$Res, _$_SMCallFunctionRequest>
    implements _$$_SMCallFunctionRequestCopyWith<$Res> {
  __$$_SMCallFunctionRequestCopyWithImpl(_$_SMCallFunctionRequest _value,
      $Res Function(_$_SMCallFunctionRequest) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? jsonrpc = null,
    Object? method = null,
    Object? id = null,
    Object? params = null,
  }) {
    return _then(_$_SMCallFunctionRequest(
      jsonrpc: null == jsonrpc
          ? _value.jsonrpc
          : jsonrpc // ignore: cast_nullable_to_non_nullable
              as String,
      method: null == method
          ? _value.method
          : method // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      params: null == params
          ? _value.params
          : params // ignore: cast_nullable_to_non_nullable
              as SMCallFunctionParams,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SMCallFunctionRequest implements _SMCallFunctionRequest {
  _$_SMCallFunctionRequest(
      {this.jsonrpc = '2.0',
      required this.method,
      this.id = 1,
      required this.params});

  factory _$_SMCallFunctionRequest.fromJson(Map<String, dynamic> json) =>
      _$$_SMCallFunctionRequestFromJson(json);

  @override
  @JsonKey()
  final String jsonrpc;
  @override
  final String method;
  @override
  @JsonKey()
  final int id;
  @override
  final SMCallFunctionParams params;

  @override
  String toString() {
    return 'SMCallFunctionRequest(jsonrpc: $jsonrpc, method: $method, id: $id, params: $params)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SMCallFunctionRequest &&
            (identical(other.jsonrpc, jsonrpc) || other.jsonrpc == jsonrpc) &&
            (identical(other.method, method) || other.method == method) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.params, params) || other.params == params));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, jsonrpc, method, id, params);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SMCallFunctionRequestCopyWith<_$_SMCallFunctionRequest> get copyWith =>
      __$$_SMCallFunctionRequestCopyWithImpl<_$_SMCallFunctionRequest>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SMCallFunctionRequestToJson(
      this,
    );
  }
}

abstract class _SMCallFunctionRequest implements SMCallFunctionRequest {
  factory _SMCallFunctionRequest(
      {final String jsonrpc,
      required final String method,
      final int id,
      required final SMCallFunctionParams params}) = _$_SMCallFunctionRequest;

  factory _SMCallFunctionRequest.fromJson(Map<String, dynamic> json) =
      _$_SMCallFunctionRequest.fromJson;

  @override
  String get jsonrpc;
  @override
  String get method;
  @override
  int get id;
  @override
  SMCallFunctionParams get params;
  @override
  @JsonKey(ignore: true)
  _$$_SMCallFunctionRequestCopyWith<_$_SMCallFunctionRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

SMCallFunctionParams _$SMCallFunctionParamsFromJson(Map<String, dynamic> json) {
  return _SMCallFunctionParams.fromJson(json);
}

/// @nodoc
mixin _$SMCallFunctionParams {
  String get contract => throw _privateConstructorUsedError;
  String get function => throw _privateConstructorUsedError;
  List<dynamic> get args => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SMCallFunctionParamsCopyWith<SMCallFunctionParams> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SMCallFunctionParamsCopyWith<$Res> {
  factory $SMCallFunctionParamsCopyWith(SMCallFunctionParams value,
          $Res Function(SMCallFunctionParams) then) =
      _$SMCallFunctionParamsCopyWithImpl<$Res, SMCallFunctionParams>;
  @useResult
  $Res call({String contract, String function, List<dynamic> args});
}

/// @nodoc
class _$SMCallFunctionParamsCopyWithImpl<$Res,
        $Val extends SMCallFunctionParams>
    implements $SMCallFunctionParamsCopyWith<$Res> {
  _$SMCallFunctionParamsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? contract = null,
    Object? function = null,
    Object? args = null,
  }) {
    return _then(_value.copyWith(
      contract: null == contract
          ? _value.contract
          : contract // ignore: cast_nullable_to_non_nullable
              as String,
      function: null == function
          ? _value.function
          : function // ignore: cast_nullable_to_non_nullable
              as String,
      args: null == args
          ? _value.args
          : args // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SMCallFunctionParamsCopyWith<$Res>
    implements $SMCallFunctionParamsCopyWith<$Res> {
  factory _$$_SMCallFunctionParamsCopyWith(_$_SMCallFunctionParams value,
          $Res Function(_$_SMCallFunctionParams) then) =
      __$$_SMCallFunctionParamsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String contract, String function, List<dynamic> args});
}

/// @nodoc
class __$$_SMCallFunctionParamsCopyWithImpl<$Res>
    extends _$SMCallFunctionParamsCopyWithImpl<$Res, _$_SMCallFunctionParams>
    implements _$$_SMCallFunctionParamsCopyWith<$Res> {
  __$$_SMCallFunctionParamsCopyWithImpl(_$_SMCallFunctionParams _value,
      $Res Function(_$_SMCallFunctionParams) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? contract = null,
    Object? function = null,
    Object? args = null,
  }) {
    return _then(_$_SMCallFunctionParams(
      contract: null == contract
          ? _value.contract
          : contract // ignore: cast_nullable_to_non_nullable
              as String,
      function: null == function
          ? _value.function
          : function // ignore: cast_nullable_to_non_nullable
              as String,
      args: null == args
          ? _value._args
          : args // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SMCallFunctionParams implements _SMCallFunctionParams {
  _$_SMCallFunctionParams(
      {required this.contract,
      required this.function,
      required final List<dynamic> args})
      : _args = args;

  factory _$_SMCallFunctionParams.fromJson(Map<String, dynamic> json) =>
      _$$_SMCallFunctionParamsFromJson(json);

  @override
  final String contract;
  @override
  final String function;
  final List<dynamic> _args;
  @override
  List<dynamic> get args {
    if (_args is EqualUnmodifiableListView) return _args;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_args);
  }

  @override
  String toString() {
    return 'SMCallFunctionParams(contract: $contract, function: $function, args: $args)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SMCallFunctionParams &&
            (identical(other.contract, contract) ||
                other.contract == contract) &&
            (identical(other.function, function) ||
                other.function == function) &&
            const DeepCollectionEquality().equals(other._args, _args));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, contract, function,
      const DeepCollectionEquality().hash(_args));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SMCallFunctionParamsCopyWith<_$_SMCallFunctionParams> get copyWith =>
      __$$_SMCallFunctionParamsCopyWithImpl<_$_SMCallFunctionParams>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SMCallFunctionParamsToJson(
      this,
    );
  }
}

abstract class _SMCallFunctionParams implements SMCallFunctionParams {
  factory _SMCallFunctionParams(
      {required final String contract,
      required final String function,
      required final List<dynamic> args}) = _$_SMCallFunctionParams;

  factory _SMCallFunctionParams.fromJson(Map<String, dynamic> json) =
      _$_SMCallFunctionParams.fromJson;

  @override
  String get contract;
  @override
  String get function;
  @override
  List<dynamic> get args;
  @override
  @JsonKey(ignore: true)
  _$$_SMCallFunctionParamsCopyWith<_$_SMCallFunctionParams> get copyWith =>
      throw _privateConstructorUsedError;
}
