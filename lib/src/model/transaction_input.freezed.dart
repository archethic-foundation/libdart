// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'transaction_input.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TransactionInput _$TransactionInputFromJson(Map<String, dynamic> json) {
  return _TransactionInput.fromJson(json);
}

/// @nodoc
mixin _$TransactionInput {
  /// Amount: asset amount
  int? get amount => throw _privateConstructorUsedError;

  /// From: transaction which send the amount of assets
  String? get from => throw _privateConstructorUsedError;

  /// token address: address of the token if the type is token
  String? get tokenAddress => throw _privateConstructorUsedError;

  /// Spent: determines if the input has been spent
  bool? get spent => throw _privateConstructorUsedError;

  /// Timestamp: Date time when the inputs was generated
  int? get timestamp => throw _privateConstructorUsedError;

  /// Type: UCO/Token/Call
  String? get type => throw _privateConstructorUsedError;

  /// Token id: It is the id for a token which is allocated when the token is minted.
  int? get tokenId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TransactionInputCopyWith<TransactionInput> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransactionInputCopyWith<$Res> {
  factory $TransactionInputCopyWith(
          TransactionInput value, $Res Function(TransactionInput) then) =
      _$TransactionInputCopyWithImpl<$Res>;
  $Res call(
      {int? amount,
      String? from,
      String? tokenAddress,
      bool? spent,
      int? timestamp,
      String? type,
      int? tokenId});
}

/// @nodoc
class _$TransactionInputCopyWithImpl<$Res>
    implements $TransactionInputCopyWith<$Res> {
  _$TransactionInputCopyWithImpl(this._value, this._then);

  final TransactionInput _value;
  // ignore: unused_field
  final $Res Function(TransactionInput) _then;

  @override
  $Res call({
    Object? amount = freezed,
    Object? from = freezed,
    Object? tokenAddress = freezed,
    Object? spent = freezed,
    Object? timestamp = freezed,
    Object? type = freezed,
    Object? tokenId = freezed,
  }) {
    return _then(_value.copyWith(
      amount: amount == freezed
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int?,
      from: from == freezed
          ? _value.from
          : from // ignore: cast_nullable_to_non_nullable
              as String?,
      tokenAddress: tokenAddress == freezed
          ? _value.tokenAddress
          : tokenAddress // ignore: cast_nullable_to_non_nullable
              as String?,
      spent: spent == freezed
          ? _value.spent
          : spent // ignore: cast_nullable_to_non_nullable
              as bool?,
      timestamp: timestamp == freezed
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as int?,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      tokenId: tokenId == freezed
          ? _value.tokenId
          : tokenId // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
abstract class _$$_TransactionInputCopyWith<$Res>
    implements $TransactionInputCopyWith<$Res> {
  factory _$$_TransactionInputCopyWith(
          _$_TransactionInput value, $Res Function(_$_TransactionInput) then) =
      __$$_TransactionInputCopyWithImpl<$Res>;
  @override
  $Res call(
      {int? amount,
      String? from,
      String? tokenAddress,
      bool? spent,
      int? timestamp,
      String? type,
      int? tokenId});
}

/// @nodoc
class __$$_TransactionInputCopyWithImpl<$Res>
    extends _$TransactionInputCopyWithImpl<$Res>
    implements _$$_TransactionInputCopyWith<$Res> {
  __$$_TransactionInputCopyWithImpl(
      _$_TransactionInput _value, $Res Function(_$_TransactionInput) _then)
      : super(_value, (v) => _then(v as _$_TransactionInput));

  @override
  _$_TransactionInput get _value => super._value as _$_TransactionInput;

  @override
  $Res call({
    Object? amount = freezed,
    Object? from = freezed,
    Object? tokenAddress = freezed,
    Object? spent = freezed,
    Object? timestamp = freezed,
    Object? type = freezed,
    Object? tokenId = freezed,
  }) {
    return _then(_$_TransactionInput(
      amount: amount == freezed
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int?,
      from: from == freezed
          ? _value.from
          : from // ignore: cast_nullable_to_non_nullable
              as String?,
      tokenAddress: tokenAddress == freezed
          ? _value.tokenAddress
          : tokenAddress // ignore: cast_nullable_to_non_nullable
              as String?,
      spent: spent == freezed
          ? _value.spent
          : spent // ignore: cast_nullable_to_non_nullable
              as bool?,
      timestamp: timestamp == freezed
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as int?,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
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
class _$_TransactionInput extends _TransactionInput {
  const _$_TransactionInput(
      {this.amount,
      this.from,
      this.tokenAddress,
      this.spent,
      this.timestamp,
      this.type,
      this.tokenId})
      : super._();

  factory _$_TransactionInput.fromJson(Map<String, dynamic> json) =>
      _$$_TransactionInputFromJson(json);

  /// Amount: asset amount
  @override
  final int? amount;

  /// From: transaction which send the amount of assets
  @override
  final String? from;

  /// token address: address of the token if the type is token
  @override
  final String? tokenAddress;

  /// Spent: determines if the input has been spent
  @override
  final bool? spent;

  /// Timestamp: Date time when the inputs was generated
  @override
  final int? timestamp;

  /// Type: UCO/Token/Call
  @override
  final String? type;

  /// Token id: It is the id for a token which is allocated when the token is minted.
  @override
  final int? tokenId;

  @override
  String toString() {
    return 'TransactionInput(amount: $amount, from: $from, tokenAddress: $tokenAddress, spent: $spent, timestamp: $timestamp, type: $type, tokenId: $tokenId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TransactionInput &&
            const DeepCollectionEquality().equals(other.amount, amount) &&
            const DeepCollectionEquality().equals(other.from, from) &&
            const DeepCollectionEquality()
                .equals(other.tokenAddress, tokenAddress) &&
            const DeepCollectionEquality().equals(other.spent, spent) &&
            const DeepCollectionEquality().equals(other.timestamp, timestamp) &&
            const DeepCollectionEquality().equals(other.type, type) &&
            const DeepCollectionEquality().equals(other.tokenId, tokenId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(amount),
      const DeepCollectionEquality().hash(from),
      const DeepCollectionEquality().hash(tokenAddress),
      const DeepCollectionEquality().hash(spent),
      const DeepCollectionEquality().hash(timestamp),
      const DeepCollectionEquality().hash(type),
      const DeepCollectionEquality().hash(tokenId));

  @JsonKey(ignore: true)
  @override
  _$$_TransactionInputCopyWith<_$_TransactionInput> get copyWith =>
      __$$_TransactionInputCopyWithImpl<_$_TransactionInput>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TransactionInputToJson(
      this,
    );
  }
}

abstract class _TransactionInput extends TransactionInput {
  const factory _TransactionInput(
      {final int? amount,
      final String? from,
      final String? tokenAddress,
      final bool? spent,
      final int? timestamp,
      final String? type,
      final int? tokenId}) = _$_TransactionInput;
  const _TransactionInput._() : super._();

  factory _TransactionInput.fromJson(Map<String, dynamic> json) =
      _$_TransactionInput.fromJson;

  @override

  /// Amount: asset amount
  int? get amount;
  @override

  /// From: transaction which send the amount of assets
  String? get from;
  @override

  /// token address: address of the token if the type is token
  String? get tokenAddress;
  @override

  /// Spent: determines if the input has been spent
  bool? get spent;
  @override

  /// Timestamp: Date time when the inputs was generated
  int? get timestamp;
  @override

  /// Type: UCO/Token/Call
  String? get type;
  @override

  /// Token id: It is the id for a token which is allocated when the token is minted.
  int? get tokenId;
  @override
  @JsonKey(ignore: true)
  _$$_TransactionInputCopyWith<_$_TransactionInput> get copyWith =>
      throw _privateConstructorUsedError;
}
