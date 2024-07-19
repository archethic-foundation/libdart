// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'unspent_outputs.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

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

  /// Date time when the UTXO created/manipulated
  int? get timestamp => throw _privateConstructorUsedError;

  /// State: It is the state of a smart contract
  Map<String, dynamic>? get state => throw _privateConstructorUsedError;

  /// Serializes this UnspentOutputs to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UnspentOutputs
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UnspentOutputsCopyWith<UnspentOutputs> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UnspentOutputsCopyWith<$Res> {
  factory $UnspentOutputsCopyWith(
          UnspentOutputs value, $Res Function(UnspentOutputs) then) =
      _$UnspentOutputsCopyWithImpl<$Res, UnspentOutputs>;
  @useResult
  $Res call(
      {int? amount,
      String? tokenAddress,
      String? type,
      String? from,
      int? tokenId,
      int? timestamp,
      Map<String, dynamic>? state});
}

/// @nodoc
class _$UnspentOutputsCopyWithImpl<$Res, $Val extends UnspentOutputs>
    implements $UnspentOutputsCopyWith<$Res> {
  _$UnspentOutputsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UnspentOutputs
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? amount = freezed,
    Object? tokenAddress = freezed,
    Object? type = freezed,
    Object? from = freezed,
    Object? tokenId = freezed,
    Object? timestamp = freezed,
    Object? state = freezed,
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
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      from: freezed == from
          ? _value.from
          : from // ignore: cast_nullable_to_non_nullable
              as String?,
      tokenId: freezed == tokenId
          ? _value.tokenId
          : tokenId // ignore: cast_nullable_to_non_nullable
              as int?,
      timestamp: freezed == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as int?,
      state: freezed == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UnspentOutputsImplCopyWith<$Res>
    implements $UnspentOutputsCopyWith<$Res> {
  factory _$$UnspentOutputsImplCopyWith(_$UnspentOutputsImpl value,
          $Res Function(_$UnspentOutputsImpl) then) =
      __$$UnspentOutputsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? amount,
      String? tokenAddress,
      String? type,
      String? from,
      int? tokenId,
      int? timestamp,
      Map<String, dynamic>? state});
}

/// @nodoc
class __$$UnspentOutputsImplCopyWithImpl<$Res>
    extends _$UnspentOutputsCopyWithImpl<$Res, _$UnspentOutputsImpl>
    implements _$$UnspentOutputsImplCopyWith<$Res> {
  __$$UnspentOutputsImplCopyWithImpl(
      _$UnspentOutputsImpl _value, $Res Function(_$UnspentOutputsImpl) _then)
      : super(_value, _then);

  /// Create a copy of UnspentOutputs
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? amount = freezed,
    Object? tokenAddress = freezed,
    Object? type = freezed,
    Object? from = freezed,
    Object? tokenId = freezed,
    Object? timestamp = freezed,
    Object? state = freezed,
  }) {
    return _then(_$UnspentOutputsImpl(
      amount: freezed == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int?,
      tokenAddress: freezed == tokenAddress
          ? _value.tokenAddress
          : tokenAddress // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      from: freezed == from
          ? _value.from
          : from // ignore: cast_nullable_to_non_nullable
              as String?,
      tokenId: freezed == tokenId
          ? _value.tokenId
          : tokenId // ignore: cast_nullable_to_non_nullable
              as int?,
      timestamp: freezed == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as int?,
      state: freezed == state
          ? _value._state
          : state // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UnspentOutputsImpl extends _UnspentOutputs {
  const _$UnspentOutputsImpl(
      {this.amount,
      this.tokenAddress,
      this.type,
      this.from,
      this.tokenId,
      this.timestamp,
      final Map<String, dynamic>? state})
      : _state = state,
        super._();

  factory _$UnspentOutputsImpl.fromJson(Map<String, dynamic> json) =>
      _$$UnspentOutputsImplFromJson(json);

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

  /// Date time when the UTXO created/manipulated
  @override
  final int? timestamp;

  /// State: It is the state of a smart contract
  final Map<String, dynamic>? _state;

  /// State: It is the state of a smart contract
  @override
  Map<String, dynamic>? get state {
    final value = _state;
    if (value == null) return null;
    if (_state is EqualUnmodifiableMapView) return _state;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  String toString() {
    return 'UnspentOutputs(amount: $amount, tokenAddress: $tokenAddress, type: $type, from: $from, tokenId: $tokenId, timestamp: $timestamp, state: $state)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UnspentOutputsImpl &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.tokenAddress, tokenAddress) ||
                other.tokenAddress == tokenAddress) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.from, from) || other.from == from) &&
            (identical(other.tokenId, tokenId) || other.tokenId == tokenId) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp) &&
            const DeepCollectionEquality().equals(other._state, _state));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, amount, tokenAddress, type, from,
      tokenId, timestamp, const DeepCollectionEquality().hash(_state));

  /// Create a copy of UnspentOutputs
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UnspentOutputsImplCopyWith<_$UnspentOutputsImpl> get copyWith =>
      __$$UnspentOutputsImplCopyWithImpl<_$UnspentOutputsImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UnspentOutputsImplToJson(
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
      final int? tokenId,
      final int? timestamp,
      final Map<String, dynamic>? state}) = _$UnspentOutputsImpl;
  const _UnspentOutputs._() : super._();

  factory _UnspentOutputs.fromJson(Map<String, dynamic> json) =
      _$UnspentOutputsImpl.fromJson;

  /// Amount: asset amount
  @override
  int? get amount;

  /// Token address: address of the token if the type is token
  @override
  String? get tokenAddress;

  /// Type: UCO/Token
  @override
  String? get type;

  /// From: transaction which send the amount of assets
  @override
  String? get from;

  /// Token id: It is the id for a token which is allocated when the token is minted.
  @override
  int? get tokenId;

  /// Date time when the UTXO created/manipulated
  @override
  int? get timestamp;

  /// State: It is the state of a smart contract
  @override
  Map<String, dynamic>? get state;

  /// Create a copy of UnspentOutputs
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UnspentOutputsImplCopyWith<_$UnspentOutputsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
