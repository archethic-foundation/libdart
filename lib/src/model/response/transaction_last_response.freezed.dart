// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'transaction_last_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TransactionLastResponse _$TransactionLastResponseFromJson(
    Map<String, dynamic> json) {
  return _TransactionLastResponse.fromJson(json);
}

/// @nodoc
mixin _$TransactionLastResponse {
  Map<String, Transaction>? get data => throw _privateConstructorUsedError;
  Map<String, dynamic>? get error => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TransactionLastResponseCopyWith<TransactionLastResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransactionLastResponseCopyWith<$Res> {
  factory $TransactionLastResponseCopyWith(TransactionLastResponse value,
          $Res Function(TransactionLastResponse) then) =
      _$TransactionLastResponseCopyWithImpl<$Res, TransactionLastResponse>;
  @useResult
  $Res call({Map<String, Transaction>? data, Map<String, dynamic>? error});
}

/// @nodoc
class _$TransactionLastResponseCopyWithImpl<$Res,
        $Val extends TransactionLastResponse>
    implements $TransactionLastResponseCopyWith<$Res> {
  _$TransactionLastResponseCopyWithImpl(this._value, this._then);

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
              as Map<String, Transaction>?,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TransactionLastResponseCopyWith<$Res>
    implements $TransactionLastResponseCopyWith<$Res> {
  factory _$$_TransactionLastResponseCopyWith(_$_TransactionLastResponse value,
          $Res Function(_$_TransactionLastResponse) then) =
      __$$_TransactionLastResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Map<String, Transaction>? data, Map<String, dynamic>? error});
}

/// @nodoc
class __$$_TransactionLastResponseCopyWithImpl<$Res>
    extends _$TransactionLastResponseCopyWithImpl<$Res,
        _$_TransactionLastResponse>
    implements _$$_TransactionLastResponseCopyWith<$Res> {
  __$$_TransactionLastResponseCopyWithImpl(_$_TransactionLastResponse _value,
      $Res Function(_$_TransactionLastResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
    Object? error = freezed,
  }) {
    return _then(_$_TransactionLastResponse(
      data: freezed == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as Map<String, Transaction>?,
      error: freezed == error
          ? _value._error
          : error // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TransactionLastResponse extends _TransactionLastResponse {
  const _$_TransactionLastResponse(
      {final Map<String, Transaction>? data, final Map<String, dynamic>? error})
      : _data = data,
        _error = error,
        super._();

  factory _$_TransactionLastResponse.fromJson(Map<String, dynamic> json) =>
      _$$_TransactionLastResponseFromJson(json);

  final Map<String, Transaction>? _data;
  @override
  Map<String, Transaction>? get data {
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
    return 'TransactionLastResponse(data: $data, error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TransactionLastResponse &&
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
  _$$_TransactionLastResponseCopyWith<_$_TransactionLastResponse>
      get copyWith =>
          __$$_TransactionLastResponseCopyWithImpl<_$_TransactionLastResponse>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TransactionLastResponseToJson(
      this,
    );
  }
}

abstract class _TransactionLastResponse extends TransactionLastResponse {
  const factory _TransactionLastResponse(
      {final Map<String, Transaction>? data,
      final Map<String, dynamic>? error}) = _$_TransactionLastResponse;
  const _TransactionLastResponse._() : super._();

  factory _TransactionLastResponse.fromJson(Map<String, dynamic> json) =
      _$_TransactionLastResponse.fromJson;

  @override
  Map<String, Transaction>? get data;
  @override
  Map<String, dynamic>? get error;
  @override
  @JsonKey(ignore: true)
  _$$_TransactionLastResponseCopyWith<_$_TransactionLastResponse>
      get copyWith => throw _privateConstructorUsedError;
}
