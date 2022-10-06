// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'unspent_outputs.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UnspentOutputs _$UnspentOutputsFromJson(Map<String, dynamic> json) {
  return _UnspentOutputs.fromJson(json);
}

/// @nodoc
mixin _$UnspentOutputs {
  /// Amount: asset amount
  int? get amount => throw _privateConstructorUsedError;

  /// Token address: address of the token if the type is token
  String? get tokenAddress => throw _privateConstructorUsedError;

  /// Type: UCO/Token
  String? get type => throw _privateConstructorUsedError;

  /// From: transaction which send the amount of assets
  String? get from => throw _privateConstructorUsedError;

  /// Token id: It is the id for a token which is allocated when the token is minted.
  int? get tokenId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UnspentOutputsCopyWith<UnspentOutputs> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UnspentOutputsCopyWith<$Res> {
  factory $UnspentOutputsCopyWith(
          UnspentOutputs value, $Res Function(UnspentOutputs) then) =
      _$UnspentOutputsCopyWithImpl<$Res>;
  $Res call(
      {int? amount,
      String? tokenAddress,
      String? type,
      String? from,
      int? tokenId});
}

/// @nodoc
class _$UnspentOutputsCopyWithImpl<$Res>
    implements $UnspentOutputsCopyWith<$Res> {
  _$UnspentOutputsCopyWithImpl(this._value, this._then);

  final UnspentOutputs _value;
  // ignore: unused_field
  final $Res Function(UnspentOutputs) _then;

  @override
  $Res call({
    Object? amount = freezed,
    Object? tokenAddress = freezed,
    Object? type = freezed,
    Object? from = freezed,
    Object? tokenId = freezed,
  }) {
    return _then(_value.copyWith(
      amount: amount == freezed
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int?,
      tokenAddress: tokenAddress == freezed
          ? _value.tokenAddress
          : tokenAddress // ignore: cast_nullable_to_non_nullable
              as String?,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      from: from == freezed
          ? _value.from
          : from // ignore: cast_nullable_to_non_nullable
              as String?,
      tokenId: tokenId == freezed
          ? _value.tokenId
          : tokenId // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
abstract class _$$_UnspentOutputsCopyWith<$Res>
    implements $UnspentOutputsCopyWith<$Res> {
  factory _$$_UnspentOutputsCopyWith(
          _$_UnspentOutputs value, $Res Function(_$_UnspentOutputs) then) =
      __$$_UnspentOutputsCopyWithImpl<$Res>;
  @override
  $Res call(
      {int? amount,
      String? tokenAddress,
      String? type,
      String? from,
      int? tokenId});
}

/// @nodoc
class __$$_UnspentOutputsCopyWithImpl<$Res>
    extends _$UnspentOutputsCopyWithImpl<$Res>
    implements _$$_UnspentOutputsCopyWith<$Res> {
  __$$_UnspentOutputsCopyWithImpl(
      _$_UnspentOutputs _value, $Res Function(_$_UnspentOutputs) _then)
      : super(_value, (v) => _then(v as _$_UnspentOutputs));

  @override
  _$_UnspentOutputs get _value => super._value as _$_UnspentOutputs;

  @override
  $Res call({
    Object? amount = freezed,
    Object? tokenAddress = freezed,
    Object? type = freezed,
    Object? from = freezed,
    Object? tokenId = freezed,
  }) {
    return _then(_$_UnspentOutputs(
      amount: amount == freezed
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int?,
      tokenAddress: tokenAddress == freezed
          ? _value.tokenAddress
          : tokenAddress // ignore: cast_nullable_to_non_nullable
              as String?,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      from: from == freezed
          ? _value.from
          : from // ignore: cast_nullable_to_non_nullable
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
class _$_UnspentOutputs extends _UnspentOutputs {
  const _$_UnspentOutputs(
      {this.amount, this.tokenAddress, this.type, this.from, this.tokenId})
      : super._();

  factory _$_UnspentOutputs.fromJson(Map<String, dynamic> json) =>
      _$$_UnspentOutputsFromJson(json);

  /// Amount: asset amount
  @override
  final int? amount;

  /// Token address: address of the token if the type is token
  @override
  final String? tokenAddress;

  /// Type: UCO/Token
  @override
  final String? type;

  /// From: transaction which send the amount of assets
  @override
  final String? from;

  /// Token id: It is the id for a token which is allocated when the token is minted.
  @override
  final int? tokenId;

  @override
  String toString() {
    return 'UnspentOutputs(amount: $amount, tokenAddress: $tokenAddress, type: $type, from: $from, tokenId: $tokenId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UnspentOutputs &&
            const DeepCollectionEquality().equals(other.amount, amount) &&
            const DeepCollectionEquality()
                .equals(other.tokenAddress, tokenAddress) &&
            const DeepCollectionEquality().equals(other.type, type) &&
            const DeepCollectionEquality().equals(other.from, from) &&
            const DeepCollectionEquality().equals(other.tokenId, tokenId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(amount),
      const DeepCollectionEquality().hash(tokenAddress),
      const DeepCollectionEquality().hash(type),
      const DeepCollectionEquality().hash(from),
      const DeepCollectionEquality().hash(tokenId));

  @JsonKey(ignore: true)
  @override
  _$$_UnspentOutputsCopyWith<_$_UnspentOutputs> get copyWith =>
      __$$_UnspentOutputsCopyWithImpl<_$_UnspentOutputs>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UnspentOutputsToJson(
      this,
    );
  }
}

abstract class _UnspentOutputs extends UnspentOutputs {
  const factory _UnspentOutputs(
      {final int? amount,
      final String? tokenAddress,
      final String? type,
      final String? from,
      final int? tokenId}) = _$_UnspentOutputs;
  const _UnspentOutputs._() : super._();

  factory _UnspentOutputs.fromJson(Map<String, dynamic> json) =
      _$_UnspentOutputs.fromJson;

  @override

  /// Amount: asset amount
  int? get amount;
  @override

  /// Token address: address of the token if the type is token
  String? get tokenAddress;
  @override

  /// Type: UCO/Token
  String? get type;
  @override

  /// From: transaction which send the amount of assets
  String? get from;
  @override

  /// Token id: It is the id for a token which is allocated when the token is minted.
  int? get tokenId;
  @override
  @JsonKey(ignore: true)
  _$$_UnspentOutputsCopyWith<_$_UnspentOutputs> get copyWith =>
      throw _privateConstructorUsedError;
}
