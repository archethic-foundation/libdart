// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'token_transfer.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TokenTransfer _$TokenTransferFromJson(Map<String, dynamic> json) {
  return _TokenTransfer.fromJson(json);
}

/// @nodoc
mixin _$TokenTransfer {
  int? get amount => throw _privateConstructorUsedError;
  String? get to => throw _privateConstructorUsedError;
  String? get tokenAddress => throw _privateConstructorUsedError;
  int? get tokenId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TokenTransferCopyWith<TokenTransfer> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TokenTransferCopyWith<$Res> {
  factory $TokenTransferCopyWith(
          TokenTransfer value, $Res Function(TokenTransfer) then) =
      _$TokenTransferCopyWithImpl<$Res>;
  $Res call({int? amount, String? to, String? tokenAddress, int? tokenId});
}

/// @nodoc
class _$TokenTransferCopyWithImpl<$Res>
    implements $TokenTransferCopyWith<$Res> {
  _$TokenTransferCopyWithImpl(this._value, this._then);

  final TokenTransfer _value;
  // ignore: unused_field
  final $Res Function(TokenTransfer) _then;

  @override
  $Res call({
    Object? amount = freezed,
    Object? to = freezed,
    Object? tokenAddress = freezed,
    Object? tokenId = freezed,
  }) {
    return _then(_value.copyWith(
      amount: amount == freezed
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int?,
      to: to == freezed
          ? _value.to
          : to // ignore: cast_nullable_to_non_nullable
              as String?,
      tokenAddress: tokenAddress == freezed
          ? _value.tokenAddress
          : tokenAddress // ignore: cast_nullable_to_non_nullable
              as String?,
      tokenId: tokenId == freezed
          ? _value.tokenId
          : tokenId // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
abstract class _$$_TokenTransferCopyWith<$Res>
    implements $TokenTransferCopyWith<$Res> {
  factory _$$_TokenTransferCopyWith(
          _$_TokenTransfer value, $Res Function(_$_TokenTransfer) then) =
      __$$_TokenTransferCopyWithImpl<$Res>;
  @override
  $Res call({int? amount, String? to, String? tokenAddress, int? tokenId});
}

/// @nodoc
class __$$_TokenTransferCopyWithImpl<$Res>
    extends _$TokenTransferCopyWithImpl<$Res>
    implements _$$_TokenTransferCopyWith<$Res> {
  __$$_TokenTransferCopyWithImpl(
      _$_TokenTransfer _value, $Res Function(_$_TokenTransfer) _then)
      : super(_value, (v) => _then(v as _$_TokenTransfer));

  @override
  _$_TokenTransfer get _value => super._value as _$_TokenTransfer;

  @override
  $Res call({
    Object? amount = freezed,
    Object? to = freezed,
    Object? tokenAddress = freezed,
    Object? tokenId = freezed,
  }) {
    return _then(_$_TokenTransfer(
      amount: amount == freezed
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int?,
      to: to == freezed
          ? _value.to
          : to // ignore: cast_nullable_to_non_nullable
              as String?,
      tokenAddress: tokenAddress == freezed
          ? _value.tokenAddress
          : tokenAddress // ignore: cast_nullable_to_non_nullable
              as String?,
      tokenId: tokenId == freezed
          ? _value.tokenId
          : tokenId // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TokenTransfer extends _TokenTransfer {
  const _$_TokenTransfer(
      {this.amount, this.to, this.tokenAddress, this.tokenId})
      : super._();

  factory _$_TokenTransfer.fromJson(Map<String, dynamic> json) =>
      _$$_TokenTransferFromJson(json);

  @override
  final int? amount;
  @override
  final String? to;
  @override
  final String? tokenAddress;
  @override
  final int? tokenId;

  @override
  String toString() {
    return 'TokenTransfer(amount: $amount, to: $to, tokenAddress: $tokenAddress, tokenId: $tokenId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TokenTransfer &&
            const DeepCollectionEquality().equals(other.amount, amount) &&
            const DeepCollectionEquality().equals(other.to, to) &&
            const DeepCollectionEquality()
                .equals(other.tokenAddress, tokenAddress) &&
            const DeepCollectionEquality().equals(other.tokenId, tokenId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(amount),
      const DeepCollectionEquality().hash(to),
      const DeepCollectionEquality().hash(tokenAddress),
      const DeepCollectionEquality().hash(tokenId));

  @JsonKey(ignore: true)
  @override
  _$$_TokenTransferCopyWith<_$_TokenTransfer> get copyWith =>
      __$$_TokenTransferCopyWithImpl<_$_TokenTransfer>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TokenTransferToJson(
      this,
    );
  }
}

abstract class _TokenTransfer extends TokenTransfer {
  const factory _TokenTransfer(
      {final int? amount,
      final String? to,
      final String? tokenAddress,
      final int? tokenId}) = _$_TokenTransfer;
  const _TokenTransfer._() : super._();

  factory _TokenTransfer.fromJson(Map<String, dynamic> json) =
      _$_TokenTransfer.fromJson;

  @override
  int? get amount;
  @override
  String? get to;
  @override
  String? get tokenAddress;
  @override
  int? get tokenId;
  @override
  @JsonKey(ignore: true)
  _$$_TokenTransferCopyWith<_$_TokenTransfer> get copyWith =>
      throw _privateConstructorUsedError;
}
