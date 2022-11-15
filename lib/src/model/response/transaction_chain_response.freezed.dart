// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'transaction_chain_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TransactionChainResponse _$TransactionChainResponseFromJson(
    Map<String, dynamic> json) {
  return _TransactionChainResponse.fromJson(json);
}

/// @nodoc
mixin _$TransactionChainResponse {
  Map<String, List<Transaction>?>? get data =>
      throw _privateConstructorUsedError;
  Map<String, dynamic>? get error => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TransactionChainResponseCopyWith<TransactionChainResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransactionChainResponseCopyWith<$Res> {
  factory $TransactionChainResponseCopyWith(TransactionChainResponse value,
          $Res Function(TransactionChainResponse) then) =
      _$TransactionChainResponseCopyWithImpl<$Res, TransactionChainResponse>;
  @useResult
  $Res call(
      {Map<String, List<Transaction>?>? data, Map<String, dynamic>? error});
}

/// @nodoc
class _$TransactionChainResponseCopyWithImpl<$Res,
        $Val extends TransactionChainResponse>
    implements $TransactionChainResponseCopyWith<$Res> {
  _$TransactionChainResponseCopyWithImpl(this._value, this._then);

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
              as Map<String, List<Transaction>?>?,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TransactionChainResponseCopyWith<$Res>
    implements $TransactionChainResponseCopyWith<$Res> {
  factory _$$_TransactionChainResponseCopyWith(
          _$_TransactionChainResponse value,
          $Res Function(_$_TransactionChainResponse) then) =
      __$$_TransactionChainResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Map<String, List<Transaction>?>? data, Map<String, dynamic>? error});
}

/// @nodoc
class __$$_TransactionChainResponseCopyWithImpl<$Res>
    extends _$TransactionChainResponseCopyWithImpl<$Res,
        _$_TransactionChainResponse>
    implements _$$_TransactionChainResponseCopyWith<$Res> {
  __$$_TransactionChainResponseCopyWithImpl(_$_TransactionChainResponse _value,
      $Res Function(_$_TransactionChainResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
    Object? error = freezed,
  }) {
    return _then(_$_TransactionChainResponse(
      data: freezed == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as Map<String, List<Transaction>?>?,
      error: freezed == error
          ? _value._error
          : error // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TransactionChainResponse extends _TransactionChainResponse {
  const _$_TransactionChainResponse(
      {final Map<String, List<Transaction>?>? data,
      final Map<String, dynamic>? error})
      : _data = data,
        _error = error,
        super._();

  factory _$_TransactionChainResponse.fromJson(Map<String, dynamic> json) =>
      _$$_TransactionChainResponseFromJson(json);

  final Map<String, List<Transaction>?>? _data;
  @override
  Map<String, List<Transaction>?>? get data {
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
    return 'TransactionChainResponse(data: $data, error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TransactionChainResponse &&
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
  _$$_TransactionChainResponseCopyWith<_$_TransactionChainResponse>
      get copyWith => __$$_TransactionChainResponseCopyWithImpl<
          _$_TransactionChainResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TransactionChainResponseToJson(
      this,
    );
  }
}

abstract class _TransactionChainResponse extends TransactionChainResponse {
  const factory _TransactionChainResponse(
      {final Map<String, List<Transaction>?>? data,
      final Map<String, dynamic>? error}) = _$_TransactionChainResponse;
  const _TransactionChainResponse._() : super._();

  factory _TransactionChainResponse.fromJson(Map<String, dynamic> json) =
      _$_TransactionChainResponse.fromJson;

  @override
  Map<String, List<Transaction>?>? get data;
  @override
  Map<String, dynamic>? get error;
  @override
  @JsonKey(ignore: true)
  _$$_TransactionChainResponseCopyWith<_$_TransactionChainResponse>
      get copyWith => throw _privateConstructorUsedError;
}
