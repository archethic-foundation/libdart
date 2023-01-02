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
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TransactionMovement _$TransactionMovementFromJson(Map<String, dynamic> json) {
  return _TransactionMovement.fromJson(json);
}

/// @nodoc
mixin _$TransactionMovement {
  /// Amount: asset amount
  int? get amount => throw _privateConstructorUsedError;

  /// Token address: address of the token if the type is token
  String? get tokenAddress => throw _privateConstructorUsedError;

  /// To: asset transfer recipient
  String? get to => throw _privateConstructorUsedError;

  /// Type: UCO/Token
  String? get type => throw _privateConstructorUsedError;

  /// Token id: It is the id for a token which is allocated when the token is minted.
  int? get tokenId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
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
abstract class _$$_TransactionMovementCopyWith<$Res>
    implements $TransactionMovementCopyWith<$Res> {
  factory _$$_TransactionMovementCopyWith(_$_TransactionMovement value,
          $Res Function(_$_TransactionMovement) then) =
      __$$_TransactionMovementCopyWithImpl<$Res>;
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
class __$$_TransactionMovementCopyWithImpl<$Res>
    extends _$TransactionMovementCopyWithImpl<$Res, _$_TransactionMovement>
    implements _$$_TransactionMovementCopyWith<$Res> {
  __$$_TransactionMovementCopyWithImpl(_$_TransactionMovement _value,
      $Res Function(_$_TransactionMovement) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? amount = freezed,
    Object? tokenAddress = freezed,
    Object? to = freezed,
    Object? type = freezed,
    Object? tokenId = freezed,
  }) {
    return _then(_$_TransactionMovement(
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
class _$_TransactionMovement extends _TransactionMovement {
  const _$_TransactionMovement(
      {this.amount, this.tokenAddress, this.to, this.type, this.tokenId})
      : super._();

  factory _$_TransactionMovement.fromJson(Map<String, dynamic> json) =>
      _$$_TransactionMovementFromJson(json);

  /// Amount: asset amount
  @override
  final int? amount;

  /// Token address: address of the token if the type is token
  @override
  final String? tokenAddress;

  /// To: asset transfer recipient
  @override
  final String? to;

  /// Type: UCO/Token
  @override
  final String? type;

  /// Token id: It is the id for a token which is allocated when the token is minted.
  @override
  final int? tokenId;

  @override
  String toString() {
    return 'TransactionMovement(amount: $amount, tokenAddress: $tokenAddress, to: $to, type: $type, tokenId: $tokenId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TransactionMovement &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.tokenAddress, tokenAddress) ||
                other.tokenAddress == tokenAddress) &&
            (identical(other.to, to) || other.to == to) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.tokenId, tokenId) || other.tokenId == tokenId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, amount, tokenAddress, to, type, tokenId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TransactionMovementCopyWith<_$_TransactionMovement> get copyWith =>
      __$$_TransactionMovementCopyWithImpl<_$_TransactionMovement>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TransactionMovementToJson(
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
      final int? tokenId}) = _$_TransactionMovement;
  const _TransactionMovement._() : super._();

  factory _TransactionMovement.fromJson(Map<String, dynamic> json) =
      _$_TransactionMovement.fromJson;

  @override

  /// Amount: asset amount
  int? get amount;
  @override

  /// Token address: address of the token if the type is token
  String? get tokenAddress;
  @override

  /// To: asset transfer recipient
  String? get to;
  @override

  /// Type: UCO/Token
  String? get type;
  @override

  /// Token id: It is the id for a token which is allocated when the token is minted.
  int? get tokenId;
  @override
  @JsonKey(ignore: true)
  _$$_TransactionMovementCopyWith<_$_TransactionMovement> get copyWith =>
      throw _privateConstructorUsedError;
}
