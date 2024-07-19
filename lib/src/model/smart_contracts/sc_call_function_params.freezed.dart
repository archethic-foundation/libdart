// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sc_call_function_params.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SCCallFunctionParams _$SCCallFunctionParamsFromJson(Map<String, dynamic> json) {
  return _SCCallFunctionParams.fromJson(json);
}

/// @nodoc
mixin _$SCCallFunctionParams {
  String get contract => throw _privateConstructorUsedError;
  String get function => throw _privateConstructorUsedError;
  List<dynamic> get args => throw _privateConstructorUsedError;
  @JsonKey(name: 'resolve_last')
  bool get resolveLast => throw _privateConstructorUsedError;

  /// Serializes this SCCallFunctionParams to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SCCallFunctionParams
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SCCallFunctionParamsCopyWith<SCCallFunctionParams> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SCCallFunctionParamsCopyWith<$Res> {
  factory $SCCallFunctionParamsCopyWith(SCCallFunctionParams value,
          $Res Function(SCCallFunctionParams) then) =
      _$SCCallFunctionParamsCopyWithImpl<$Res, SCCallFunctionParams>;
  @useResult
  $Res call(
      {String contract,
      String function,
      List<dynamic> args,
      @JsonKey(name: 'resolve_last') bool resolveLast});
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

  /// Create a copy of SCCallFunctionParams
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? contract = null,
    Object? function = null,
    Object? args = null,
    Object? resolveLast = null,
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
      resolveLast: null == resolveLast
          ? _value.resolveLast
          : resolveLast // ignore: cast_nullable_to_non_nullable
              as bool,
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
  $Res call(
      {String contract,
      String function,
      List<dynamic> args,
      @JsonKey(name: 'resolve_last') bool resolveLast});
}

/// @nodoc
class __$$SCCallFunctionParamsImplCopyWithImpl<$Res>
    extends _$SCCallFunctionParamsCopyWithImpl<$Res, _$SCCallFunctionParamsImpl>
    implements _$$SCCallFunctionParamsImplCopyWith<$Res> {
  __$$SCCallFunctionParamsImplCopyWithImpl(_$SCCallFunctionParamsImpl _value,
      $Res Function(_$SCCallFunctionParamsImpl) _then)
      : super(_value, _then);

  /// Create a copy of SCCallFunctionParams
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? contract = null,
    Object? function = null,
    Object? args = null,
    Object? resolveLast = null,
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
      resolveLast: null == resolveLast
          ? _value.resolveLast
          : resolveLast // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SCCallFunctionParamsImpl implements _SCCallFunctionParams {
  _$SCCallFunctionParamsImpl(
      {required this.contract,
      required this.function,
      required final List<dynamic> args,
      @JsonKey(name: 'resolve_last') this.resolveLast = true})
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
  @JsonKey(name: 'resolve_last')
  final bool resolveLast;

  @override
  String toString() {
    return 'SCCallFunctionParams(contract: $contract, function: $function, args: $args, resolveLast: $resolveLast)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SCCallFunctionParamsImpl &&
            (identical(other.contract, contract) ||
                other.contract == contract) &&
            (identical(other.function, function) ||
                other.function == function) &&
            const DeepCollectionEquality().equals(other._args, _args) &&
            (identical(other.resolveLast, resolveLast) ||
                other.resolveLast == resolveLast));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, contract, function,
      const DeepCollectionEquality().hash(_args), resolveLast);

  /// Create a copy of SCCallFunctionParams
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
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
          required final List<dynamic> args,
          @JsonKey(name: 'resolve_last') final bool resolveLast}) =
      _$SCCallFunctionParamsImpl;

  factory _SCCallFunctionParams.fromJson(Map<String, dynamic> json) =
      _$SCCallFunctionParamsImpl.fromJson;

  @override
  String get contract;
  @override
  String get function;
  @override
  List<dynamic> get args;
  @override
  @JsonKey(name: 'resolve_last')
  bool get resolveLast;

  /// Create a copy of SCCallFunctionParams
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SCCallFunctionParamsImplCopyWith<_$SCCallFunctionParamsImpl>
      get copyWith => throw _privateConstructorUsedError;
}
