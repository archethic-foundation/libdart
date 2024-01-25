// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

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
      _$SharedSecretsCopyWithImpl<$Res, SharedSecrets>;
  @useResult
  $Res call({String? storageNoncePublicKey});
}

/// @nodoc
class _$SharedSecretsCopyWithImpl<$Res, $Val extends SharedSecrets>
    implements $SharedSecretsCopyWith<$Res> {
  _$SharedSecretsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? storageNoncePublicKey = freezed,
  }) {
    return _then(_value.copyWith(
      storageNoncePublicKey: freezed == storageNoncePublicKey
          ? _value.storageNoncePublicKey
          : storageNoncePublicKey // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SharedSecretsImplCopyWith<$Res>
    implements $SharedSecretsCopyWith<$Res> {
  factory _$$SharedSecretsImplCopyWith(
          _$SharedSecretsImpl value, $Res Function(_$SharedSecretsImpl) then) =
      __$$SharedSecretsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? storageNoncePublicKey});
}

/// @nodoc
class __$$SharedSecretsImplCopyWithImpl<$Res>
    extends _$SharedSecretsCopyWithImpl<$Res, _$SharedSecretsImpl>
    implements _$$SharedSecretsImplCopyWith<$Res> {
  __$$SharedSecretsImplCopyWithImpl(
      _$SharedSecretsImpl _value, $Res Function(_$SharedSecretsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? storageNoncePublicKey = freezed,
  }) {
    return _then(_$SharedSecretsImpl(
      storageNoncePublicKey: freezed == storageNoncePublicKey
          ? _value.storageNoncePublicKey
          : storageNoncePublicKey // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SharedSecretsImpl extends _SharedSecrets {
  const _$SharedSecretsImpl({this.storageNoncePublicKey}) : super._();

  factory _$SharedSecretsImpl.fromJson(Map<String, dynamic> json) =>
      _$$SharedSecretsImplFromJson(json);

  /// The storage nonce public key: Public Key to encrypt data for the node,
  /// so they will be able to decrypt it (mostly for smart contract authorized key)
  @override
  final String? storageNoncePublicKey;

  @override
  String toString() {
    return 'SharedSecrets(storageNoncePublicKey: $storageNoncePublicKey)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SharedSecretsImpl &&
            (identical(other.storageNoncePublicKey, storageNoncePublicKey) ||
                other.storageNoncePublicKey == storageNoncePublicKey));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, storageNoncePublicKey);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SharedSecretsImplCopyWith<_$SharedSecretsImpl> get copyWith =>
      __$$SharedSecretsImplCopyWithImpl<_$SharedSecretsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SharedSecretsImplToJson(
      this,
    );
  }
}

abstract class _SharedSecrets extends SharedSecrets {
  const factory _SharedSecrets({final String? storageNoncePublicKey}) =
      _$SharedSecretsImpl;
  const _SharedSecrets._() : super._();

  factory _SharedSecrets.fromJson(Map<String, dynamic> json) =
      _$SharedSecretsImpl.fromJson;

  @override

  /// The storage nonce public key: Public Key to encrypt data for the node,
  /// so they will be able to decrypt it (mostly for smart contract authorized key)
  String? get storageNoncePublicKey;
  @override
  @JsonKey(ignore: true)
  _$$SharedSecretsImplCopyWith<_$SharedSecretsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
