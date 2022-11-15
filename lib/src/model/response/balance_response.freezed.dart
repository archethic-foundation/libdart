// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'balance_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

BalanceResponse _$BalanceResponseFromJson(Map<String, dynamic> json) {
  return _BalanceResponse.fromJson(json);
}

/// @nodoc
mixin _$BalanceResponse {
  Map<String, Balance>? get data => throw _privateConstructorUsedError;
  Map<String, dynamic>? get error => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BalanceResponseCopyWith<BalanceResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BalanceResponseCopyWith<$Res> {
  factory $BalanceResponseCopyWith(
          BalanceResponse value, $Res Function(BalanceResponse) then) =
      _$BalanceResponseCopyWithImpl<$Res, BalanceResponse>;
  @useResult
  $Res call({Map<String, Balance>? data, Map<String, dynamic>? error});
}

/// @nodoc
class _$BalanceResponseCopyWithImpl<$Res, $Val extends BalanceResponse>
    implements $BalanceResponseCopyWith<$Res> {
  _$BalanceResponseCopyWithImpl(this._value, this._then);

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
              as Map<String, Balance>?,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_BalanceResponseCopyWith<$Res>
    implements $BalanceResponseCopyWith<$Res> {
  factory _$$_BalanceResponseCopyWith(
          _$_BalanceResponse value, $Res Function(_$_BalanceResponse) then) =
      __$$_BalanceResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Map<String, Balance>? data, Map<String, dynamic>? error});
}

/// @nodoc
class __$$_BalanceResponseCopyWithImpl<$Res>
    extends _$BalanceResponseCopyWithImpl<$Res, _$_BalanceResponse>
    implements _$$_BalanceResponseCopyWith<$Res> {
  __$$_BalanceResponseCopyWithImpl(
      _$_BalanceResponse _value, $Res Function(_$_BalanceResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
    Object? error = freezed,
  }) {
    return _then(_$_BalanceResponse(
      data: freezed == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as Map<String, Balance>?,
      error: freezed == error
          ? _value._error
          : error // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_BalanceResponse extends _BalanceResponse {
  const _$_BalanceResponse(
      {final Map<String, Balance>? data, final Map<String, dynamic>? error})
      : _data = data,
        _error = error,
        super._();

  factory _$_BalanceResponse.fromJson(Map<String, dynamic> json) =>
      _$$_BalanceResponseFromJson(json);

  final Map<String, Balance>? _data;
  @override
  Map<String, Balance>? get data {
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
    return 'BalanceResponse(data: $data, error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_BalanceResponse &&
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
  _$$_BalanceResponseCopyWith<_$_BalanceResponse> get copyWith =>
      __$$_BalanceResponseCopyWithImpl<_$_BalanceResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_BalanceResponseToJson(
      this,
    );
  }
}

abstract class _BalanceResponse extends BalanceResponse {
  const factory _BalanceResponse(
      {final Map<String, Balance>? data,
      final Map<String, dynamic>? error}) = _$_BalanceResponse;
  const _BalanceResponse._() : super._();

  factory _BalanceResponse.fromJson(Map<String, dynamic> json) =
      _$_BalanceResponse.fromJson;

  @override
  Map<String, Balance>? get data;
  @override
  Map<String, dynamic>? get error;
  @override
  @JsonKey(ignore: true)
  _$$_BalanceResponseCopyWith<_$_BalanceResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
