// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'shared_secrets.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SharedSecrets _$SharedSecretsFromJson(Map<String, dynamic> json) {
  return _SharedSecrets.fromJson(json);
}

/// @nodoc
mixin _$SharedSecrets {
  /// The storage nonce public key: Public Key to encrypt data for the node,
  /// so they will be able to decrypt it (mostly for smart contract authorized key)
  String? get storageNoncePublicKey => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SharedSecretsCopyWith<SharedSecrets> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SharedSecretsCopyWith<$Res> {
  factory $SharedSecretsCopyWith(
          SharedSecrets value, $Res Function(SharedSecrets) then) =
      _$SharedSecretsCopyWithImpl<$Res>;
  $Res call({String? storageNoncePublicKey});
}

/// @nodoc
class _$SharedSecretsCopyWithImpl<$Res>
    implements $SharedSecretsCopyWith<$Res> {
  _$SharedSecretsCopyWithImpl(this._value, this._then);

  final SharedSecrets _value;
  // ignore: unused_field
  final $Res Function(SharedSecrets) _then;

  @override
  $Res call({
    Object? storageNoncePublicKey = freezed,
  }) {
    return _then(_value.copyWith(
      storageNoncePublicKey: storageNoncePublicKey == freezed
          ? _value.storageNoncePublicKey
          : storageNoncePublicKey // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$$_SharedSecretsCopyWith<$Res>
    implements $SharedSecretsCopyWith<$Res> {
  factory _$$_SharedSecretsCopyWith(
          _$_SharedSecrets value, $Res Function(_$_SharedSecrets) then) =
      __$$_SharedSecretsCopyWithImpl<$Res>;
  @override
  $Res call({String? storageNoncePublicKey});
}

/// @nodoc
class __$$_SharedSecretsCopyWithImpl<$Res>
    extends _$SharedSecretsCopyWithImpl<$Res>
    implements _$$_SharedSecretsCopyWith<$Res> {
  __$$_SharedSecretsCopyWithImpl(
      _$_SharedSecrets _value, $Res Function(_$_SharedSecrets) _then)
      : super(_value, (v) => _then(v as _$_SharedSecrets));

  @override
  _$_SharedSecrets get _value => super._value as _$_SharedSecrets;

  @override
  $Res call({
    Object? storageNoncePublicKey = freezed,
  }) {
    return _then(_$_SharedSecrets(
      storageNoncePublicKey: storageNoncePublicKey == freezed
          ? _value.storageNoncePublicKey
          : storageNoncePublicKey // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SharedSecrets extends _SharedSecrets {
  const _$_SharedSecrets({this.storageNoncePublicKey}) : super._();

  factory _$_SharedSecrets.fromJson(Map<String, dynamic> json) =>
      _$$_SharedSecretsFromJson(json);

  /// The storage nonce public key: Public Key to encrypt data for the node,
  /// so they will be able to decrypt it (mostly for smart contract authorized key)
  @override
  final String? storageNoncePublicKey;

  @override
  String toString() {
    return 'SharedSecrets(storageNoncePublicKey: $storageNoncePublicKey)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SharedSecrets &&
            const DeepCollectionEquality()
                .equals(other.storageNoncePublicKey, storageNoncePublicKey));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(storageNoncePublicKey));

  @JsonKey(ignore: true)
  @override
  _$$_SharedSecretsCopyWith<_$_SharedSecrets> get copyWith =>
      __$$_SharedSecretsCopyWithImpl<_$_SharedSecrets>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SharedSecretsToJson(
      this,
    );
  }
}

abstract class _SharedSecrets extends SharedSecrets {
  const factory _SharedSecrets({final String? storageNoncePublicKey}) =
      _$_SharedSecrets;
  const _SharedSecrets._() : super._();

  factory _SharedSecrets.fromJson(Map<String, dynamic> json) =
      _$_SharedSecrets.fromJson;

  @override

  /// The storage nonce public key: Public Key to encrypt data for the node,
  /// so they will be able to decrypt it (mostly for smart contract authorized key)
  String? get storageNoncePublicKey;
  @override
  @JsonKey(ignore: true)
  _$$_SharedSecretsCopyWith<_$_SharedSecrets> get copyWith =>
      throw _privateConstructorUsedError;
}
