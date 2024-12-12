// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'consumed_inputs.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ConsumedInputs _$ConsumedInputsFromJson(Map<String, dynamic> json) {
  return _ConsumedInputs.fromJson(json);
}

/// @nodoc
mixin _$ConsumedInputs {
  /// Asset amount
  int? get amount => throw _privateConstructorUsedError;

  /// Transaction which send the amount of assets
  String? get from => throw _privateConstructorUsedError;

  /// Address of the token if the type is token
  String? get tokenAddress => throw _privateConstructorUsedError;

  /// Date time when the UTXO created/manipulated
  int? get timestamp => throw _privateConstructorUsedError;

  /// Type of input : UCO/token/state/call
  String? get type => throw _privateConstructorUsedError;

  /// Id for a token which is allocated when the token is minted.
  int? get tokenId => throw _privateConstructorUsedError;

  /// Version of the UTXO data structure
  int? get protocolVersion => throw _privateConstructorUsedError;

  /// State of a smart contract
  String? get state => throw _privateConstructorUsedError;

  /// Serializes this ConsumedInputs to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ConsumedInputs
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ConsumedInputsCopyWith<ConsumedInputs> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConsumedInputsCopyWith<$Res> {
  factory $ConsumedInputsCopyWith(
          ConsumedInputs value, $Res Function(ConsumedInputs) then) =
      _$ConsumedInputsCopyWithImpl<$Res, ConsumedInputs>;
  @useResult
  $Res call(
      {int? amount,
      String? from,
      String? tokenAddress,
      int? timestamp,
      String? type,
      int? tokenId,
      int? protocolVersion,
      String? state});
}

/// @nodoc
class _$ConsumedInputsCopyWithImpl<$Res, $Val extends ConsumedInputs>
    implements $ConsumedInputsCopyWith<$Res> {
  _$ConsumedInputsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ConsumedInputs
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? amount = freezed,
    Object? from = freezed,
    Object? tokenAddress = freezed,
    Object? timestamp = freezed,
    Object? type = freezed,
    Object? tokenId = freezed,
    Object? protocolVersion = freezed,
    Object? state = freezed,
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
      protocolVersion: freezed == protocolVersion
          ? _value.protocolVersion
          : protocolVersion // ignore: cast_nullable_to_non_nullable
              as int?,
      state: freezed == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ConsumedInputsImplCopyWith<$Res>
    implements $ConsumedInputsCopyWith<$Res> {
  factory _$$ConsumedInputsImplCopyWith(_$ConsumedInputsImpl value,
          $Res Function(_$ConsumedInputsImpl) then) =
      __$$ConsumedInputsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? amount,
      String? from,
      String? tokenAddress,
      int? timestamp,
      String? type,
      int? tokenId,
      int? protocolVersion,
      String? state});
}

/// @nodoc
class __$$ConsumedInputsImplCopyWithImpl<$Res>
    extends _$ConsumedInputsCopyWithImpl<$Res, _$ConsumedInputsImpl>
    implements _$$ConsumedInputsImplCopyWith<$Res> {
  __$$ConsumedInputsImplCopyWithImpl(
      _$ConsumedInputsImpl _value, $Res Function(_$ConsumedInputsImpl) _then)
      : super(_value, _then);

  /// Create a copy of ConsumedInputs
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? amount = freezed,
    Object? from = freezed,
    Object? tokenAddress = freezed,
    Object? timestamp = freezed,
    Object? type = freezed,
    Object? tokenId = freezed,
    Object? protocolVersion = freezed,
    Object? state = freezed,
  }) {
    return _then(_$ConsumedInputsImpl(
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
      protocolVersion: freezed == protocolVersion
          ? _value.protocolVersion
          : protocolVersion // ignore: cast_nullable_to_non_nullable
              as int?,
      state: freezed == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ConsumedInputsImpl extends _ConsumedInputs {
  const _$ConsumedInputsImpl(
      {this.amount,
      this.from,
      this.tokenAddress,
      this.timestamp,
      this.type,
      this.tokenId,
      this.protocolVersion,
      this.state})
      : super._();

  factory _$ConsumedInputsImpl.fromJson(Map<String, dynamic> json) =>
      _$$ConsumedInputsImplFromJson(json);

  /// Asset amount
  @override
  final int? amount;

  /// Transaction which send the amount of assets
  @override
  final String? from;

  /// Address of the token if the type is token
  @override
  final String? tokenAddress;

  /// Date time when the UTXO created/manipulated
  @override
  final int? timestamp;

  /// Type of input : UCO/token/state/call
  @override
  final String? type;

  /// Id for a token which is allocated when the token is minted.
  @override
  final int? tokenId;

  /// Version of the UTXO data structure
  @override
  final int? protocolVersion;

  /// State of a smart contract
  @override
  final String? state;

  @override
  String toString() {
    return 'ConsumedInputs(amount: $amount, from: $from, tokenAddress: $tokenAddress, timestamp: $timestamp, type: $type, tokenId: $tokenId, protocolVersion: $protocolVersion, state: $state)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ConsumedInputsImpl &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.from, from) || other.from == from) &&
            (identical(other.tokenAddress, tokenAddress) ||
                other.tokenAddress == tokenAddress) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.tokenId, tokenId) || other.tokenId == tokenId) &&
            (identical(other.protocolVersion, protocolVersion) ||
                other.protocolVersion == protocolVersion) &&
            (identical(other.state, state) || other.state == state));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, amount, from, tokenAddress,
      timestamp, type, tokenId, protocolVersion, state);

  /// Create a copy of ConsumedInputs
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ConsumedInputsImplCopyWith<_$ConsumedInputsImpl> get copyWith =>
      __$$ConsumedInputsImplCopyWithImpl<_$ConsumedInputsImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ConsumedInputsImplToJson(
      this,
    );
  }
}

abstract class _ConsumedInputs extends ConsumedInputs {
  const factory _ConsumedInputs(
      {final int? amount,
      final String? from,
      final String? tokenAddress,
      final int? timestamp,
      final String? type,
      final int? tokenId,
      final int? protocolVersion,
      final String? state}) = _$ConsumedInputsImpl;
  const _ConsumedInputs._() : super._();

  factory _ConsumedInputs.fromJson(Map<String, dynamic> json) =
      _$ConsumedInputsImpl.fromJson;

  /// Asset amount
  @override
  int? get amount;

  /// Transaction which send the amount of assets
  @override
  String? get from;

  /// Address of the token if the type is token
  @override
  String? get tokenAddress;

  /// Date time when the UTXO created/manipulated
  @override
  int? get timestamp;

  /// Type of input : UCO/token/state/call
  @override
  String? get type;

  /// Id for a token which is allocated when the token is minted.
  @override
  int? get tokenId;

  /// Version of the UTXO data structure
  @override
  int? get protocolVersion;

  /// State of a smart contract
  @override
  String? get state;

  /// Create a copy of ConsumedInputs
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ConsumedInputsImplCopyWith<_$ConsumedInputsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
