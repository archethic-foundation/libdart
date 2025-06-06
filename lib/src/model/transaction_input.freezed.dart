// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'transaction_input.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TransactionInput _$TransactionInputFromJson(Map<String, dynamic> json) {
  return _TransactionInput.fromJson(json);
}

/// @nodoc
mixin _$TransactionInput {
  /// Asset amount
  int? get amount => throw _privateConstructorUsedError;

  /// Transaction which send the amount of assets
  String? get from => throw _privateConstructorUsedError;

  /// Address of the token if the type is token
  String? get tokenAddress => throw _privateConstructorUsedError;

  /// Determines if the input has been spent
  bool? get spent => throw _privateConstructorUsedError;

  /// Date time when the inputs was generated
  int? get timestamp => throw _privateConstructorUsedError;

  /// Type of the input: UCO/Token/Call
  String? get type => throw _privateConstructorUsedError;

  /// Id for a token which is allocated when the token is minted.
  int? get tokenId => throw _privateConstructorUsedError;

  /// Serializes this TransactionInput to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TransactionInput
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TransactionInputCopyWith<TransactionInput> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransactionInputCopyWith<$Res> {
  factory $TransactionInputCopyWith(
          TransactionInput value, $Res Function(TransactionInput) then) =
      _$TransactionInputCopyWithImpl<$Res, TransactionInput>;
  @useResult
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
class _$TransactionInputCopyWithImpl<$Res, $Val extends TransactionInput>
    implements $TransactionInputCopyWith<$Res> {
  _$TransactionInputCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TransactionInput
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
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
      amount: freezed == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int?,
      from: freezed == from
          ? _value.from
          : from // ignore: cast_nullable_to_non_nullable
              as String?,
      tokenAddress: freezed == tokenAddress
          ? _value.tokenAddress
          : tokenAddress // ignore: cast_nullable_to_non_nullable
              as String?,
      spent: freezed == spent
          ? _value.spent
          : spent // ignore: cast_nullable_to_non_nullable
              as bool?,
      timestamp: freezed == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as int?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      tokenId: freezed == tokenId
          ? _value.tokenId
          : tokenId // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TransactionInputImplCopyWith<$Res>
    implements $TransactionInputCopyWith<$Res> {
  factory _$$TransactionInputImplCopyWith(_$TransactionInputImpl value,
          $Res Function(_$TransactionInputImpl) then) =
      __$$TransactionInputImplCopyWithImpl<$Res>;
  @override
  @useResult
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
class __$$TransactionInputImplCopyWithImpl<$Res>
    extends _$TransactionInputCopyWithImpl<$Res, _$TransactionInputImpl>
    implements _$$TransactionInputImplCopyWith<$Res> {
  __$$TransactionInputImplCopyWithImpl(_$TransactionInputImpl _value,
      $Res Function(_$TransactionInputImpl) _then)
      : super(_value, _then);

  /// Create a copy of TransactionInput
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
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
    return _then(_$TransactionInputImpl(
      amount: freezed == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int?,
      from: freezed == from
          ? _value.from
          : from // ignore: cast_nullable_to_non_nullable
              as String?,
      tokenAddress: freezed == tokenAddress
          ? _value.tokenAddress
          : tokenAddress // ignore: cast_nullable_to_non_nullable
              as String?,
      spent: freezed == spent
          ? _value.spent
          : spent // ignore: cast_nullable_to_non_nullable
              as bool?,
      timestamp: freezed == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as int?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      tokenId: freezed == tokenId
          ? _value.tokenId
          : tokenId // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TransactionInputImpl extends _TransactionInput {
  const _$TransactionInputImpl(
      {this.amount,
      this.from,
      this.tokenAddress,
      this.spent,
      this.timestamp,
      this.type,
      this.tokenId})
      : super._();

  factory _$TransactionInputImpl.fromJson(Map<String, dynamic> json) =>
      _$$TransactionInputImplFromJson(json);

  /// Asset amount
  @override
  final int? amount;

  /// Transaction which send the amount of assets
  @override
  final String? from;

  /// Address of the token if the type is token
  @override
  final String? tokenAddress;

  /// Determines if the input has been spent
  @override
  final bool? spent;

  /// Date time when the inputs was generated
  @override
  final int? timestamp;

  /// Type of the input: UCO/Token/Call
  @override
  final String? type;

  /// Id for a token which is allocated when the token is minted.
  @override
  final int? tokenId;

  @override
  String toString() {
    return 'TransactionInput(amount: $amount, from: $from, tokenAddress: $tokenAddress, spent: $spent, timestamp: $timestamp, type: $type, tokenId: $tokenId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TransactionInputImpl &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.from, from) || other.from == from) &&
            (identical(other.tokenAddress, tokenAddress) ||
                other.tokenAddress == tokenAddress) &&
            (identical(other.spent, spent) || other.spent == spent) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.tokenId, tokenId) || other.tokenId == tokenId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, amount, from, tokenAddress, spent, timestamp, type, tokenId);

  /// Create a copy of TransactionInput
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TransactionInputImplCopyWith<_$TransactionInputImpl> get copyWith =>
      __$$TransactionInputImplCopyWithImpl<_$TransactionInputImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TransactionInputImplToJson(
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
      final int? tokenId}) = _$TransactionInputImpl;
  const _TransactionInput._() : super._();

  factory _TransactionInput.fromJson(Map<String, dynamic> json) =
      _$TransactionInputImpl.fromJson;

  /// Asset amount
  @override
  int? get amount;

  /// Transaction which send the amount of assets
  @override
  String? get from;

  /// Address of the token if the type is token
  @override
  String? get tokenAddress;

  /// Determines if the input has been spent
  @override
  bool? get spent;

  /// Date time when the inputs was generated
  @override
  int? get timestamp;

  /// Type of the input: UCO/Token/Call
  @override
  String? get type;

  /// Id for a token which is allocated when the token is minted.
  @override
  int? get tokenId;

  /// Create a copy of TransactionInput
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TransactionInputImplCopyWith<_$TransactionInputImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
