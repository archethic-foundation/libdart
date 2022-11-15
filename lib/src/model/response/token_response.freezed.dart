// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'token_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TokenResponse _$TokenResponseFromJson(Map<String, dynamic> json) {
  return _TokenResponse.fromJson(json);
}

/// @nodoc
mixin _$TokenResponse {
  Map<String, List<Token>>? get data => throw _privateConstructorUsedError;
  Map<String, dynamic>? get error => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TokenResponseCopyWith<TokenResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TokenResponseCopyWith<$Res> {
  factory $TokenResponseCopyWith(
          TokenResponse value, $Res Function(TokenResponse) then) =
      _$TokenResponseCopyWithImpl<$Res, TokenResponse>;
  @useResult
  $Res call({Map<String, List<Token>>? data, Map<String, dynamic>? error});
}

/// @nodoc
class _$TokenResponseCopyWithImpl<$Res, $Val extends TokenResponse>
    implements $TokenResponseCopyWith<$Res> {
  _$TokenResponseCopyWithImpl(this._value, this._then);

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
              as Map<String, List<Token>>?,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TokenResponseCopyWith<$Res>
    implements $TokenResponseCopyWith<$Res> {
  factory _$$_TokenResponseCopyWith(
          _$_TokenResponse value, $Res Function(_$_TokenResponse) then) =
      __$$_TokenResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Map<String, List<Token>>? data, Map<String, dynamic>? error});
}

/// @nodoc
class __$$_TokenResponseCopyWithImpl<$Res>
    extends _$TokenResponseCopyWithImpl<$Res, _$_TokenResponse>
    implements _$$_TokenResponseCopyWith<$Res> {
  __$$_TokenResponseCopyWithImpl(
      _$_TokenResponse _value, $Res Function(_$_TokenResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
    Object? error = freezed,
  }) {
    return _then(_$_TokenResponse(
      data: freezed == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as Map<String, List<Token>>?,
      error: freezed == error
          ? _value._error
          : error // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TokenResponse extends _TokenResponse {
  const _$_TokenResponse(
      {final Map<String, List<Token>>? data, final Map<String, dynamic>? error})
      : _data = data,
        _error = error,
        super._();

  factory _$_TokenResponse.fromJson(Map<String, dynamic> json) =>
      _$$_TokenResponseFromJson(json);

  final Map<String, List<Token>>? _data;
  @override
  Map<String, List<Token>>? get data {
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
    return 'TokenResponse(data: $data, error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TokenResponse &&
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
  _$$_TokenResponseCopyWith<_$_TokenResponse> get copyWith =>
      __$$_TokenResponseCopyWithImpl<_$_TokenResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TokenResponseToJson(
      this,
    );
  }
}

abstract class _TokenResponse extends TokenResponse {
  const factory _TokenResponse(
      {final Map<String, List<Token>>? data,
      final Map<String, dynamic>? error}) = _$_TokenResponse;
  const _TokenResponse._() : super._();

  factory _TokenResponse.fromJson(Map<String, dynamic> json) =
      _$_TokenResponse.fromJson;

  @override
  Map<String, List<Token>>? get data;
  @override
  Map<String, dynamic>? get error;
  @override
  @JsonKey(ignore: true)
  _$$_TokenResponseCopyWith<_$_TokenResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
