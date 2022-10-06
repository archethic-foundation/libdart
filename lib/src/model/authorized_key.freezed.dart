// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'authorized_key.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AuthorizedKey _$AuthorizedKeyFromJson(Map<String, dynamic> json) {
  return _AuthorizedKey.fromJson(json);
}

/// @nodoc
mixin _$AuthorizedKey {
  String? get publicKey => throw _privateConstructorUsedError;
  String? get encryptedSecretKey => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AuthorizedKeyCopyWith<AuthorizedKey> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthorizedKeyCopyWith<$Res> {
  factory $AuthorizedKeyCopyWith(
          AuthorizedKey value, $Res Function(AuthorizedKey) then) =
      _$AuthorizedKeyCopyWithImpl<$Res>;
  $Res call({String? publicKey, String? encryptedSecretKey});
}

/// @nodoc
class _$AuthorizedKeyCopyWithImpl<$Res>
    implements $AuthorizedKeyCopyWith<$Res> {
  _$AuthorizedKeyCopyWithImpl(this._value, this._then);

  final AuthorizedKey _value;
  // ignore: unused_field
  final $Res Function(AuthorizedKey) _then;

  @override
  $Res call({
    Object? publicKey = freezed,
    Object? encryptedSecretKey = freezed,
  }) {
    return _then(_value.copyWith(
      publicKey: publicKey == freezed
          ? _value.publicKey
          : publicKey // ignore: cast_nullable_to_non_nullable
              as String?,
      encryptedSecretKey: encryptedSecretKey == freezed
          ? _value.encryptedSecretKey
          : encryptedSecretKey // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$$_AuthorizedKeyCopyWith<$Res>
    implements $AuthorizedKeyCopyWith<$Res> {
  factory _$$_AuthorizedKeyCopyWith(
          _$_AuthorizedKey value, $Res Function(_$_AuthorizedKey) then) =
      __$$_AuthorizedKeyCopyWithImpl<$Res>;
  @override
  $Res call({String? publicKey, String? encryptedSecretKey});
}

/// @nodoc
class __$$_AuthorizedKeyCopyWithImpl<$Res>
    extends _$AuthorizedKeyCopyWithImpl<$Res>
    implements _$$_AuthorizedKeyCopyWith<$Res> {
  __$$_AuthorizedKeyCopyWithImpl(
      _$_AuthorizedKey _value, $Res Function(_$_AuthorizedKey) _then)
      : super(_value, (v) => _then(v as _$_AuthorizedKey));

  @override
  _$_AuthorizedKey get _value => super._value as _$_AuthorizedKey;

  @override
  $Res call({
    Object? publicKey = freezed,
    Object? encryptedSecretKey = freezed,
  }) {
    return _then(_$_AuthorizedKey(
      publicKey: publicKey == freezed
          ? _value.publicKey
          : publicKey // ignore: cast_nullable_to_non_nullable
              as String?,
      encryptedSecretKey: encryptedSecretKey == freezed
          ? _value.encryptedSecretKey
          : encryptedSecretKey // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AuthorizedKey extends _AuthorizedKey {
  const _$_AuthorizedKey({this.publicKey, this.encryptedSecretKey}) : super._();

  factory _$_AuthorizedKey.fromJson(Map<String, dynamic> json) =>
      _$$_AuthorizedKeyFromJson(json);

  @override
  final String? publicKey;
  @override
  final String? encryptedSecretKey;

  @override
  String toString() {
    return 'AuthorizedKey(publicKey: $publicKey, encryptedSecretKey: $encryptedSecretKey)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AuthorizedKey &&
            const DeepCollectionEquality().equals(other.publicKey, publicKey) &&
            const DeepCollectionEquality()
                .equals(other.encryptedSecretKey, encryptedSecretKey));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(publicKey),
      const DeepCollectionEquality().hash(encryptedSecretKey));

  @JsonKey(ignore: true)
  @override
  _$$_AuthorizedKeyCopyWith<_$_AuthorizedKey> get copyWith =>
      __$$_AuthorizedKeyCopyWithImpl<_$_AuthorizedKey>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AuthorizedKeyToJson(
      this,
    );
  }
}

abstract class _AuthorizedKey extends AuthorizedKey {
  const factory _AuthorizedKey(
      {final String? publicKey,
      final String? encryptedSecretKey}) = _$_AuthorizedKey;
  const _AuthorizedKey._() : super._();

  factory _AuthorizedKey.fromJson(Map<String, dynamic> json) =
      _$_AuthorizedKey.fromJson;

  @override
  String? get publicKey;
  @override
  String? get encryptedSecretKey;
  @override
  @JsonKey(ignore: true)
  _$$_AuthorizedKeyCopyWith<_$_AuthorizedKey> get copyWith =>
      throw _privateConstructorUsedError;
}
