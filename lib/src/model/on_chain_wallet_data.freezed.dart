// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'on_chain_wallet_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

OnChainWalletData _$OnChainWalletDataFromJson(Map<String, dynamic> json) {
  return _OnChainWalletData.fromJson(json);
}

/// @nodoc
mixin _$OnChainWalletData {
  String? get encodedWalletKey => throw _privateConstructorUsedError;
  String? get encryptedWallet => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OnChainWalletDataCopyWith<OnChainWalletData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OnChainWalletDataCopyWith<$Res> {
  factory $OnChainWalletDataCopyWith(
          OnChainWalletData value, $Res Function(OnChainWalletData) then) =
      _$OnChainWalletDataCopyWithImpl<$Res>;
  $Res call({String? encodedWalletKey, String? encryptedWallet});
}

/// @nodoc
class _$OnChainWalletDataCopyWithImpl<$Res>
    implements $OnChainWalletDataCopyWith<$Res> {
  _$OnChainWalletDataCopyWithImpl(this._value, this._then);

  final OnChainWalletData _value;
  // ignore: unused_field
  final $Res Function(OnChainWalletData) _then;

  @override
  $Res call({
    Object? encodedWalletKey = freezed,
    Object? encryptedWallet = freezed,
  }) {
    return _then(_value.copyWith(
      encodedWalletKey: encodedWalletKey == freezed
          ? _value.encodedWalletKey
          : encodedWalletKey // ignore: cast_nullable_to_non_nullable
              as String?,
      encryptedWallet: encryptedWallet == freezed
          ? _value.encryptedWallet
          : encryptedWallet // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$$_OnChainWalletDataCopyWith<$Res>
    implements $OnChainWalletDataCopyWith<$Res> {
  factory _$$_OnChainWalletDataCopyWith(_$_OnChainWalletData value,
          $Res Function(_$_OnChainWalletData) then) =
      __$$_OnChainWalletDataCopyWithImpl<$Res>;
  @override
  $Res call({String? encodedWalletKey, String? encryptedWallet});
}

/// @nodoc
class __$$_OnChainWalletDataCopyWithImpl<$Res>
    extends _$OnChainWalletDataCopyWithImpl<$Res>
    implements _$$_OnChainWalletDataCopyWith<$Res> {
  __$$_OnChainWalletDataCopyWithImpl(
      _$_OnChainWalletData _value, $Res Function(_$_OnChainWalletData) _then)
      : super(_value, (v) => _then(v as _$_OnChainWalletData));

  @override
  _$_OnChainWalletData get _value => super._value as _$_OnChainWalletData;

  @override
  $Res call({
    Object? encodedWalletKey = freezed,
    Object? encryptedWallet = freezed,
  }) {
    return _then(_$_OnChainWalletData(
      encodedWalletKey: encodedWalletKey == freezed
          ? _value.encodedWalletKey
          : encodedWalletKey // ignore: cast_nullable_to_non_nullable
              as String?,
      encryptedWallet: encryptedWallet == freezed
          ? _value.encryptedWallet
          : encryptedWallet // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_OnChainWalletData extends _OnChainWalletData {
  const _$_OnChainWalletData({this.encodedWalletKey, this.encryptedWallet})
      : super._();

  factory _$_OnChainWalletData.fromJson(Map<String, dynamic> json) =>
      _$$_OnChainWalletDataFromJson(json);

  @override
  final String? encodedWalletKey;
  @override
  final String? encryptedWallet;

  @override
  String toString() {
    return 'OnChainWalletData(encodedWalletKey: $encodedWalletKey, encryptedWallet: $encryptedWallet)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_OnChainWalletData &&
            const DeepCollectionEquality()
                .equals(other.encodedWalletKey, encodedWalletKey) &&
            const DeepCollectionEquality()
                .equals(other.encryptedWallet, encryptedWallet));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(encodedWalletKey),
      const DeepCollectionEquality().hash(encryptedWallet));

  @JsonKey(ignore: true)
  @override
  _$$_OnChainWalletDataCopyWith<_$_OnChainWalletData> get copyWith =>
      __$$_OnChainWalletDataCopyWithImpl<_$_OnChainWalletData>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_OnChainWalletDataToJson(
      this,
    );
  }
}

abstract class _OnChainWalletData extends OnChainWalletData {
  const factory _OnChainWalletData(
      {final String? encodedWalletKey,
      final String? encryptedWallet}) = _$_OnChainWalletData;
  const _OnChainWalletData._() : super._();

  factory _OnChainWalletData.fromJson(Map<String, dynamic> json) =
      _$_OnChainWalletData.fromJson;

  @override
  String? get encodedWalletKey;
  @override
  String? get encryptedWallet;
  @override
  @JsonKey(ignore: true)
  _$$_OnChainWalletDataCopyWith<_$_OnChainWalletData> get copyWith =>
      throw _privateConstructorUsedError;
}
