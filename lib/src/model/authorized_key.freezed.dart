// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'authorized_key.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AuthorizedKey _$AuthorizedKeyFromJson(Map<String, dynamic> json) {
  return _AuthorizedKey.fromJson(json);
}

/// @nodoc
mixin _$AuthorizedKey {
  String? get publicKey => throw _privateConstructorUsedError;
  String? get encryptedSecretKey => throw _privateConstructorUsedError;

  /// Serializes this AuthorizedKey to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AuthorizedKey
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AuthorizedKeyCopyWith<AuthorizedKey> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthorizedKeyCopyWith<$Res> {
  factory $AuthorizedKeyCopyWith(
          AuthorizedKey value, $Res Function(AuthorizedKey) then) =
      _$AuthorizedKeyCopyWithImpl<$Res, AuthorizedKey>;
  @useResult
  $Res call({String? publicKey, String? encryptedSecretKey});
}

/// @nodoc
class _$AuthorizedKeyCopyWithImpl<$Res, $Val extends AuthorizedKey>
    implements $AuthorizedKeyCopyWith<$Res> {
  _$AuthorizedKeyCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AuthorizedKey
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? publicKey = freezed,
    Object? encryptedSecretKey = freezed,
  }) {
    return _then(_value.copyWith(
      publicKey: freezed == publicKey
          ? _value.publicKey
          : publicKey // ignore: cast_nullable_to_non_nullable
              as String?,
      encryptedSecretKey: freezed == encryptedSecretKey
          ? _value.encryptedSecretKey
          : encryptedSecretKey // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AuthorizedKeyImplCopyWith<$Res>
    implements $AuthorizedKeyCopyWith<$Res> {
  factory _$$AuthorizedKeyImplCopyWith(
          _$AuthorizedKeyImpl value, $Res Function(_$AuthorizedKeyImpl) then) =
      __$$AuthorizedKeyImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? publicKey, String? encryptedSecretKey});
}

/// @nodoc
class __$$AuthorizedKeyImplCopyWithImpl<$Res>
    extends _$AuthorizedKeyCopyWithImpl<$Res, _$AuthorizedKeyImpl>
    implements _$$AuthorizedKeyImplCopyWith<$Res> {
  __$$AuthorizedKeyImplCopyWithImpl(
      _$AuthorizedKeyImpl _value, $Res Function(_$AuthorizedKeyImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthorizedKey
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? publicKey = freezed,
    Object? encryptedSecretKey = freezed,
  }) {
    return _then(_$AuthorizedKeyImpl(
      publicKey: freezed == publicKey
          ? _value.publicKey
          : publicKey // ignore: cast_nullable_to_non_nullable
              as String?,
      encryptedSecretKey: freezed == encryptedSecretKey
          ? _value.encryptedSecretKey
          : encryptedSecretKey // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AuthorizedKeyImpl extends _AuthorizedKey {
  const _$AuthorizedKeyImpl({this.publicKey, this.encryptedSecretKey})
      : super._();

  factory _$AuthorizedKeyImpl.fromJson(Map<String, dynamic> json) =>
      _$$AuthorizedKeyImplFromJson(json);

  @override
  final String? publicKey;
  @override
  final String? encryptedSecretKey;

  @override
  String toString() {
    return 'AuthorizedKey(publicKey: $publicKey, encryptedSecretKey: $encryptedSecretKey)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthorizedKeyImpl &&
            (identical(other.publicKey, publicKey) ||
                other.publicKey == publicKey) &&
            (identical(other.encryptedSecretKey, encryptedSecretKey) ||
                other.encryptedSecretKey == encryptedSecretKey));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, publicKey, encryptedSecretKey);

  /// Create a copy of AuthorizedKey
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthorizedKeyImplCopyWith<_$AuthorizedKeyImpl> get copyWith =>
      __$$AuthorizedKeyImplCopyWithImpl<_$AuthorizedKeyImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AuthorizedKeyImplToJson(
      this,
    );
  }
}

abstract class _AuthorizedKey extends AuthorizedKey {
  const factory _AuthorizedKey(
      {final String? publicKey,
      final String? encryptedSecretKey}) = _$AuthorizedKeyImpl;
  const _AuthorizedKey._() : super._();

  factory _AuthorizedKey.fromJson(Map<String, dynamic> json) =
      _$AuthorizedKeyImpl.fromJson;

  @override
  String? get publicKey;
  @override
  String? get encryptedSecretKey;

  /// Create a copy of AuthorizedKey
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AuthorizedKeyImplCopyWith<_$AuthorizedKeyImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
