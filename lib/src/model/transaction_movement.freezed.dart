// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'transaction_movement.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TransactionMovement _$TransactionMovementFromJson(Map<String, dynamic> json) {
  return _TransactionMovement.fromJson(json);
}

/// @nodoc
mixin _$TransactionMovement {
  /// Asset amount
  int? get amount => throw _privateConstructorUsedError;

  /// Address of the token if the type is token
  String? get tokenAddress => throw _privateConstructorUsedError;

  /// Asset transfer recipient
  String? get to => throw _privateConstructorUsedError;

  /// Type of the asset: UCO/Token
  String? get type => throw _privateConstructorUsedError;

  /// Id for a token which is allocated when the token is minted.
  int? get tokenId => throw _privateConstructorUsedError;

  /// Serializes this TransactionMovement to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TransactionMovement
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TransactionMovementCopyWith<TransactionMovement> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransactionMovementCopyWith<$Res> {
  factory $TransactionMovementCopyWith(
          TransactionMovement value, $Res Function(TransactionMovement) then) =
      _$TransactionMovementCopyWithImpl<$Res, TransactionMovement>;
  @useResult
  $Res call(
      {int? amount,
      String? tokenAddress,
      String? to,
      String? type,
      int? tokenId});
}

/// @nodoc
class _$TransactionMovementCopyWithImpl<$Res, $Val extends TransactionMovement>
    implements $TransactionMovementCopyWith<$Res> {
  _$TransactionMovementCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TransactionMovement
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? amount = freezed,
    Object? tokenAddress = freezed,
    Object? to = freezed,
    Object? type = freezed,
    Object? tokenId = freezed,
  }) {
    return _then(_value.copyWith(
      amount: freezed == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int?,
      tokenAddress: freezed == tokenAddress
          ? _value.tokenAddress
          : tokenAddress // ignore: cast_nullable_to_non_nullable
              as String?,
      to: freezed == to
          ? _value.to
          : to // ignore: cast_nullable_to_non_nullable
              as String?,
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
abstract class _$$TransactionMovementImplCopyWith<$Res>
    implements $TransactionMovementCopyWith<$Res> {
  factory _$$TransactionMovementImplCopyWith(_$TransactionMovementImpl value,
          $Res Function(_$TransactionMovementImpl) then) =
      __$$TransactionMovementImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? amount,
      String? tokenAddress,
      String? to,
      String? type,
      int? tokenId});
}

/// @nodoc
class __$$TransactionMovementImplCopyWithImpl<$Res>
    extends _$TransactionMovementCopyWithImpl<$Res, _$TransactionMovementImpl>
    implements _$$TransactionMovementImplCopyWith<$Res> {
  __$$TransactionMovementImplCopyWithImpl(_$TransactionMovementImpl _value,
      $Res Function(_$TransactionMovementImpl) _then)
      : super(_value, _then);

  /// Create a copy of TransactionMovement
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? amount = freezed,
    Object? tokenAddress = freezed,
    Object? to = freezed,
    Object? type = freezed,
    Object? tokenId = freezed,
  }) {
    return _then(_$TransactionMovementImpl(
      amount: freezed == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int?,
      tokenAddress: freezed == tokenAddress
          ? _value.tokenAddress
          : tokenAddress // ignore: cast_nullable_to_non_nullable
              as String?,
      to: freezed == to
          ? _value.to
          : to // ignore: cast_nullable_to_non_nullable
              as String?,
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
class _$TransactionMovementImpl extends _TransactionMovement {
  const _$TransactionMovementImpl(
      {this.amount, this.tokenAddress, this.to, this.type, this.tokenId})
      : super._();

  factory _$TransactionMovementImpl.fromJson(Map<String, dynamic> json) =>
      _$$TransactionMovementImplFromJson(json);

  /// Asset amount
  @override
  final int? amount;

  /// Address of the token if the type is token
  @override
  final String? tokenAddress;

  /// Asset transfer recipient
  @override
  final String? to;

  /// Type of the asset: UCO/Token
  @override
  final String? type;

  /// Id for a token which is allocated when the token is minted.
  @override
  final int? tokenId;

  @override
  String toString() {
    return 'TransactionMovement(amount: $amount, tokenAddress: $tokenAddress, to: $to, type: $type, tokenId: $tokenId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TransactionMovementImpl &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.tokenAddress, tokenAddress) ||
                other.tokenAddress == tokenAddress) &&
            (identical(other.to, to) || other.to == to) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.tokenId, tokenId) || other.tokenId == tokenId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, amount, tokenAddress, to, type, tokenId);

  /// Create a copy of TransactionMovement
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TransactionMovementImplCopyWith<_$TransactionMovementImpl> get copyWith =>
      __$$TransactionMovementImplCopyWithImpl<_$TransactionMovementImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TransactionMovementImplToJson(
      this,
    );
  }
}

abstract class _TransactionMovement extends TransactionMovement {
  const factory _TransactionMovement(
      {final int? amount,
      final String? tokenAddress,
      final String? to,
      final String? type,
      final int? tokenId}) = _$TransactionMovementImpl;
  const _TransactionMovement._() : super._();

  factory _TransactionMovement.fromJson(Map<String, dynamic> json) =
      _$TransactionMovementImpl.fromJson;

  /// Asset amount
  @override
  int? get amount;

  /// Address of the token if the type is token
  @override
  String? get tokenAddress;

  /// Asset transfer recipient
  @override
  String? get to;

  /// Type of the asset: UCO/Token
  @override
  String? get type;

  /// Id for a token which is allocated when the token is minted.
  @override
  int? get tokenId;

  /// Create a copy of TransactionMovement
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TransactionMovementImplCopyWith<_$TransactionMovementImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
