// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'transaction_inputs_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TransactionInputsResponse _$TransactionInputsResponseFromJson(
    Map<String, dynamic> json) {
  return _TransactionInputsResponse.fromJson(json);
}

/// @nodoc
mixin _$TransactionInputsResponse {
  Map<String, List<TransactionInput>>? get data =>
      throw _privateConstructorUsedError;
  Map<String, dynamic>? get error => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TransactionInputsResponseCopyWith<TransactionInputsResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransactionInputsResponseCopyWith<$Res> {
  factory $TransactionInputsResponseCopyWith(TransactionInputsResponse value,
          $Res Function(TransactionInputsResponse) then) =
      _$TransactionInputsResponseCopyWithImpl<$Res, TransactionInputsResponse>;
  @useResult
  $Res call(
      {Map<String, List<TransactionInput>>? data, Map<String, dynamic>? error});
}

/// @nodoc
class _$TransactionInputsResponseCopyWithImpl<$Res,
        $Val extends TransactionInputsResponse>
    implements $TransactionInputsResponseCopyWith<$Res> {
  _$TransactionInputsResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
    Object? error = freezed,
  }) {
    return _then(_value.copyWith(
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as Map<String, List<TransactionInput>>?,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TransactionInputsResponseCopyWith<$Res>
    implements $TransactionInputsResponseCopyWith<$Res> {
  factory _$$_TransactionInputsResponseCopyWith(
          _$_TransactionInputsResponse value,
          $Res Function(_$_TransactionInputsResponse) then) =
      __$$_TransactionInputsResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Map<String, List<TransactionInput>>? data, Map<String, dynamic>? error});
}

/// @nodoc
class __$$_TransactionInputsResponseCopyWithImpl<$Res>
    extends _$TransactionInputsResponseCopyWithImpl<$Res,
        _$_TransactionInputsResponse>
    implements _$$_TransactionInputsResponseCopyWith<$Res> {
  __$$_TransactionInputsResponseCopyWithImpl(
      _$_TransactionInputsResponse _value,
      $Res Function(_$_TransactionInputsResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
    Object? error = freezed,
  }) {
    return _then(_$_TransactionInputsResponse(
      data: freezed == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as Map<String, List<TransactionInput>>?,
      error: freezed == error
          ? _value._error
          : error // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TransactionInputsResponse extends _TransactionInputsResponse {
  const _$_TransactionInputsResponse(
      {final Map<String, List<TransactionInput>>? data,
      final Map<String, dynamic>? error})
      : _data = data,
        _error = error,
        super._();

  factory _$_TransactionInputsResponse.fromJson(Map<String, dynamic> json) =>
      _$$_TransactionInputsResponseFromJson(json);

  final Map<String, List<TransactionInput>>? _data;
  @override
  Map<String, List<TransactionInput>>? get data {
    final value = _data;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  final Map<String, dynamic>? _error;
  @override
  Map<String, dynamic>? get error {
    final value = _error;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  String toString() {
    return 'TransactionInputsResponse(data: $data, error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TransactionInputsResponse &&
            const DeepCollectionEquality().equals(other._data, _data) &&
            const DeepCollectionEquality().equals(other._error, _error));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_data),
      const DeepCollectionEquality().hash(_error));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TransactionInputsResponseCopyWith<_$_TransactionInputsResponse>
      get copyWith => __$$_TransactionInputsResponseCopyWithImpl<
          _$_TransactionInputsResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TransactionInputsResponseToJson(
      this,
    );
  }
}

abstract class _TransactionInputsResponse extends TransactionInputsResponse {
  const factory _TransactionInputsResponse(
      {final Map<String, List<TransactionInput>>? data,
      final Map<String, dynamic>? error}) = _$_TransactionInputsResponse;
  const _TransactionInputsResponse._() : super._();

  factory _TransactionInputsResponse.fromJson(Map<String, dynamic> json) =
      _$_TransactionInputsResponse.fromJson;

  @override
  Map<String, List<TransactionInput>>? get data;
  @override
  Map<String, dynamic>? get error;
  @override
  @JsonKey(ignore: true)
  _$$_TransactionInputsResponseCopyWith<_$_TransactionInputsResponse>
      get copyWith => throw _privateConstructorUsedError;
}
