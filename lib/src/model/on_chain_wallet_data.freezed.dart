// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

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
      _$OnChainWalletDataCopyWithImpl<$Res, OnChainWalletData>;
  @useResult
  $Res call({String? encodedWalletKey, String? encryptedWallet});
}

/// @nodoc
class _$OnChainWalletDataCopyWithImpl<$Res, $Val extends OnChainWalletData>
    implements $OnChainWalletDataCopyWith<$Res> {
  _$OnChainWalletDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? encodedWalletKey = freezed,
    Object? encryptedWallet = freezed,
  }) {
    return _then(_value.copyWith(
      encodedWalletKey: freezed == encodedWalletKey
          ? _value.encodedWalletKey
          : encodedWalletKey // ignore: cast_nullable_to_non_nullable
              as String?,
      encryptedWallet: freezed == encryptedWallet
          ? _value.encryptedWallet
          : encryptedWallet // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OnChainWalletDataImplCopyWith<$Res>
    implements $OnChainWalletDataCopyWith<$Res> {
  factory _$$OnChainWalletDataImplCopyWith(_$OnChainWalletDataImpl value,
          $Res Function(_$OnChainWalletDataImpl) then) =
      __$$OnChainWalletDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? encodedWalletKey, String? encryptedWallet});
}

/// @nodoc
class __$$OnChainWalletDataImplCopyWithImpl<$Res>
    extends _$OnChainWalletDataCopyWithImpl<$Res, _$OnChainWalletDataImpl>
    implements _$$OnChainWalletDataImplCopyWith<$Res> {
  __$$OnChainWalletDataImplCopyWithImpl(_$OnChainWalletDataImpl _value,
      $Res Function(_$OnChainWalletDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? encodedWalletKey = freezed,
    Object? encryptedWallet = freezed,
  }) {
    return _then(_$OnChainWalletDataImpl(
      encodedWalletKey: freezed == encodedWalletKey
          ? _value.encodedWalletKey
          : encodedWalletKey // ignore: cast_nullable_to_non_nullable
              as String?,
      encryptedWallet: freezed == encryptedWallet
          ? _value.encryptedWallet
          : encryptedWallet // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OnChainWalletDataImpl extends _OnChainWalletData {
  const _$OnChainWalletDataImpl({this.encodedWalletKey, this.encryptedWallet})
      : super._();

  factory _$OnChainWalletDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$OnChainWalletDataImplFromJson(json);

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
            other is _$OnChainWalletDataImpl &&
            (identical(other.encodedWalletKey, encodedWalletKey) ||
                other.encodedWalletKey == encodedWalletKey) &&
            (identical(other.encryptedWallet, encryptedWallet) ||
                other.encryptedWallet == encryptedWallet));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, encodedWalletKey, encryptedWallet);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OnChainWalletDataImplCopyWith<_$OnChainWalletDataImpl> get copyWith =>
      __$$OnChainWalletDataImplCopyWithImpl<_$OnChainWalletDataImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OnChainWalletDataImplToJson(
      this,
    );
  }
}

abstract class _OnChainWalletData extends OnChainWalletData {
  const factory _OnChainWalletData(
      {final String? encodedWalletKey,
      final String? encryptedWallet}) = _$OnChainWalletDataImpl;
  const _OnChainWalletData._() : super._();

  factory _OnChainWalletData.fromJson(Map<String, dynamic> json) =
      _$OnChainWalletDataImpl.fromJson;

  @override
  String? get encodedWalletKey;
  @override
  String? get encryptedWallet;
  @override
  @JsonKey(ignore: true)
  _$$OnChainWalletDataImplCopyWith<_$OnChainWalletDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
