// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'token_balance.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TokenBalance _$TokenBalanceFromJson(Map<String, dynamic> json) {
  return _TokenBalance.fromJson(json);
}

/// @nodoc
mixin _$TokenBalance {
  /// token: address of the token
  String? get address => throw _privateConstructorUsedError;

  /// Amount: amount of token
  int? get amount => throw _privateConstructorUsedError;

  /// Token ID: ID of the token
  int? get tokenId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TokenBalanceCopyWith<TokenBalance> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TokenBalanceCopyWith<$Res> {
  factory $TokenBalanceCopyWith(
          TokenBalance value, $Res Function(TokenBalance) then) =
      _$TokenBalanceCopyWithImpl<$Res>;
  $Res call({String? address, int? amount, int? tokenId});
}

/// @nodoc
class _$TokenBalanceCopyWithImpl<$Res> implements $TokenBalanceCopyWith<$Res> {
  _$TokenBalanceCopyWithImpl(this._value, this._then);

  final TokenBalance _value;
  // ignore: unused_field
  final $Res Function(TokenBalance) _then;

  @override
  $Res call({
    Object? address = freezed,
    Object? amount = freezed,
    Object? tokenId = freezed,
  }) {
    return _then(_value.copyWith(
      address: address == freezed
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      amount: amount == freezed
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int?,
      tokenId: tokenId == freezed
          ? _value.tokenId
          : tokenId // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
abstract class _$$_TokenBalanceCopyWith<$Res>
    implements $TokenBalanceCopyWith<$Res> {
  factory _$$_TokenBalanceCopyWith(
          _$_TokenBalance value, $Res Function(_$_TokenBalance) then) =
      __$$_TokenBalanceCopyWithImpl<$Res>;
  @override
  $Res call({String? address, int? amount, int? tokenId});
}

/// @nodoc
class __$$_TokenBalanceCopyWithImpl<$Res>
    extends _$TokenBalanceCopyWithImpl<$Res>
    implements _$$_TokenBalanceCopyWith<$Res> {
  __$$_TokenBalanceCopyWithImpl(
      _$_TokenBalance _value, $Res Function(_$_TokenBalance) _then)
      : super(_value, (v) => _then(v as _$_TokenBalance));

  @override
  _$_TokenBalance get _value => super._value as _$_TokenBalance;

  @override
  $Res call({
    Object? address = freezed,
    Object? amount = freezed,
    Object? tokenId = freezed,
  }) {
    return _then(_$_TokenBalance(
      address: address == freezed
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      amount: amount == freezed
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int?,
      tokenId: tokenId == freezed
          ? _value.tokenId
          : tokenId // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TokenBalance extends _TokenBalance {
  const _$_TokenBalance({this.address, this.amount, this.tokenId}) : super._();

  factory _$_TokenBalance.fromJson(Map<String, dynamic> json) =>
      _$$_TokenBalanceFromJson(json);

  /// token: address of the token
  @override
  final String? address;

  /// Amount: amount of token
  @override
  final int? amount;

  /// Token ID: ID of the token
  @override
  final int? tokenId;

  @override
  String toString() {
    return 'TokenBalance(address: $address, amount: $amount, tokenId: $tokenId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TokenBalance &&
            const DeepCollectionEquality().equals(other.address, address) &&
            const DeepCollectionEquality().equals(other.amount, amount) &&
            const DeepCollectionEquality().equals(other.tokenId, tokenId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(address),
      const DeepCollectionEquality().hash(amount),
      const DeepCollectionEquality().hash(tokenId));

  @JsonKey(ignore: true)
  @override
  _$$_TokenBalanceCopyWith<_$_TokenBalance> get copyWith =>
      __$$_TokenBalanceCopyWithImpl<_$_TokenBalance>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TokenBalanceToJson(
      this,
    );
  }
}

abstract class _TokenBalance extends TokenBalance {
  const factory _TokenBalance(
      {final String? address,
      final int? amount,
      final int? tokenId}) = _$_TokenBalance;
  const _TokenBalance._() : super._();

  factory _TokenBalance.fromJson(Map<String, dynamic> json) =
      _$_TokenBalance.fromJson;

  @override

  /// token: address of the token
  String? get address;
  @override

  /// Amount: amount of token
  int? get amount;
  @override

  /// Token ID: ID of the token
  int? get tokenId;
  @override
  @JsonKey(ignore: true)
  _$$_TokenBalanceCopyWith<_$_TokenBalance> get copyWith =>
      throw _privateConstructorUsedError;
}
