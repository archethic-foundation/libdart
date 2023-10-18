// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sc_call_function_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SCCallFunctionRequest _$SCCallFunctionRequestFromJson(
    Map<String, dynamic> json) {
  return _SCCallFunctionRequest.fromJson(json);
}

/// @nodoc
mixin _$SCCallFunctionRequest {
  String get jsonrpc => throw _privateConstructorUsedError;
  String get method => throw _privateConstructorUsedError;
  int get id => throw _privateConstructorUsedError;
  SCCallFunctionParams get params => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SCCallFunctionRequestCopyWith<SCCallFunctionRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SCCallFunctionRequestCopyWith<$Res> {
  factory $SCCallFunctionRequestCopyWith(SCCallFunctionRequest value,
          $Res Function(SCCallFunctionRequest) then) =
      _$SCCallFunctionRequestCopyWithImpl<$Res, SCCallFunctionRequest>;
  @useResult
  $Res call(
      {String jsonrpc, String method, int id, SCCallFunctionParams params});

  $SCCallFunctionParamsCopyWith<$Res> get params;
}

/// @nodoc
class _$SCCallFunctionRequestCopyWithImpl<$Res,
        $Val extends SCCallFunctionRequest>
    implements $SCCallFunctionRequestCopyWith<$Res> {
  _$SCCallFunctionRequestCopyWithImpl(this._value, this._then);

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
              as SCCallFunctionParams,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $SCCallFunctionParamsCopyWith<$Res> get params {
    return $SCCallFunctionParamsCopyWith<$Res>(_value.params, (value) {
      return _then(_value.copyWith(params: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$SCCallFunctionRequestImplCopyWith<$Res>
    implements $SCCallFunctionRequestCopyWith<$Res> {
  factory _$$SCCallFunctionRequestImplCopyWith(
          _$SCCallFunctionRequestImpl value,
          $Res Function(_$SCCallFunctionRequestImpl) then) =
      __$$SCCallFunctionRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String jsonrpc, String method, int id, SCCallFunctionParams params});

  @override
  $SCCallFunctionParamsCopyWith<$Res> get params;
}

/// @nodoc
class __$$SCCallFunctionRequestImplCopyWithImpl<$Res>
    extends _$SCCallFunctionRequestCopyWithImpl<$Res,
        _$SCCallFunctionRequestImpl>
    implements _$$SCCallFunctionRequestImplCopyWith<$Res> {
  __$$SCCallFunctionRequestImplCopyWithImpl(_$SCCallFunctionRequestImpl _value,
      $Res Function(_$SCCallFunctionRequestImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? jsonrpc = null,
    Object? method = null,
    Object? id = null,
    Object? params = null,
  }) {
    return _then(_$SCCallFunctionRequestImpl(
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
              as SCCallFunctionParams,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SCCallFunctionRequestImpl implements _SCCallFunctionRequest {
  _$SCCallFunctionRequestImpl(
      {this.jsonrpc = '2.0',
      required this.method,
      this.id = 1,
      required this.params});

  factory _$SCCallFunctionRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$SCCallFunctionRequestImplFromJson(json);

  @override
  @JsonKey()
  final String jsonrpc;
  @override
  final String method;
  @override
  @JsonKey()
  final int id;
  @override
  final SCCallFunctionParams params;

  @override
  String toString() {
    return 'SCCallFunctionRequest(jsonrpc: $jsonrpc, method: $method, id: $id, params: $params)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SCCallFunctionRequestImpl &&
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
  _$$SCCallFunctionRequestImplCopyWith<_$SCCallFunctionRequestImpl>
      get copyWith => __$$SCCallFunctionRequestImplCopyWithImpl<
          _$SCCallFunctionRequestImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SCCallFunctionRequestImplToJson(
      this,
    );
  }
}

abstract class _SCCallFunctionRequest implements SCCallFunctionRequest {
  factory _SCCallFunctionRequest(
          {final String jsonrpc,
          required final String method,
          final int id,
          required final SCCallFunctionParams params}) =
      _$SCCallFunctionRequestImpl;

  factory _SCCallFunctionRequest.fromJson(Map<String, dynamic> json) =
      _$SCCallFunctionRequestImpl.fromJson;

  @override
  String get jsonrpc;
  @override
  String get method;
  @override
  int get id;
  @override
  SCCallFunctionParams get params;
  @override
  @JsonKey(ignore: true)
  _$$SCCallFunctionRequestImplCopyWith<_$SCCallFunctionRequestImpl>
      get copyWith => throw _privateConstructorUsedError;
}

SCCallFunctionParams _$SCCallFunctionParamsFromJson(Map<String, dynamic> json) {
  return _SCCallFunctionParams.fromJson(json);
}

/// @nodoc
mixin _$SCCallFunctionParams {
  String get contract => throw _privateConstructorUsedError;
  String get function => throw _privateConstructorUsedError;
  List<dynamic> get args => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SCCallFunctionParamsCopyWith<SCCallFunctionParams> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SCCallFunctionParamsCopyWith<$Res> {
  factory $SCCallFunctionParamsCopyWith(SCCallFunctionParams value,
          $Res Function(SCCallFunctionParams) then) =
      _$SCCallFunctionParamsCopyWithImpl<$Res, SCCallFunctionParams>;
  @useResult
  $Res call({String contract, String function, List<dynamic> args});
}

/// @nodoc
class _$SCCallFunctionParamsCopyWithImpl<$Res,
        $Val extends SCCallFunctionParams>
    implements $SCCallFunctionParamsCopyWith<$Res> {
  _$SCCallFunctionParamsCopyWithImpl(this._value, this._then);

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
abstract class _$$SCCallFunctionParamsImplCopyWith<$Res>
    implements $SCCallFunctionParamsCopyWith<$Res> {
  factory _$$SCCallFunctionParamsImplCopyWith(_$SCCallFunctionParamsImpl value,
          $Res Function(_$SCCallFunctionParamsImpl) then) =
      __$$SCCallFunctionParamsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String contract, String function, List<dynamic> args});
}

/// @nodoc
class __$$SCCallFunctionParamsImplCopyWithImpl<$Res>
    extends _$SCCallFunctionParamsCopyWithImpl<$Res, _$SCCallFunctionParamsImpl>
    implements _$$SCCallFunctionParamsImplCopyWith<$Res> {
  __$$SCCallFunctionParamsImplCopyWithImpl(_$SCCallFunctionParamsImpl _value,
      $Res Function(_$SCCallFunctionParamsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? contract = null,
    Object? function = null,
    Object? args = null,
  }) {
    return _then(_$SCCallFunctionParamsImpl(
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
class _$SCCallFunctionParamsImpl implements _SCCallFunctionParams {
  _$SCCallFunctionParamsImpl(
      {required this.contract,
      required this.function,
      required final List<dynamic> args})
      : _args = args;

  factory _$SCCallFunctionParamsImpl.fromJson(Map<String, dynamic> json) =>
      _$$SCCallFunctionParamsImplFromJson(json);

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
    return 'SCCallFunctionParams(contract: $contract, function: $function, args: $args)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SCCallFunctionParamsImpl &&
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
  _$$SCCallFunctionParamsImplCopyWith<_$SCCallFunctionParamsImpl>
      get copyWith =>
          __$$SCCallFunctionParamsImplCopyWithImpl<_$SCCallFunctionParamsImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SCCallFunctionParamsImplToJson(
      this,
    );
  }
}

abstract class _SCCallFunctionParams implements SCCallFunctionParams {
  factory _SCCallFunctionParams(
      {required final String contract,
      required final String function,
      required final List<dynamic> args}) = _$SCCallFunctionParamsImpl;

  factory _SCCallFunctionParams.fromJson(Map<String, dynamic> json) =
      _$SCCallFunctionParamsImpl.fromJson;

  @override
  String get contract;
  @override
  String get function;
  @override
  List<dynamic> get args;
  @override
  @JsonKey(ignore: true)
  _$$SCCallFunctionParamsImplCopyWith<_$SCCallFunctionParamsImpl>
      get copyWith => throw _privateConstructorUsedError;
}
