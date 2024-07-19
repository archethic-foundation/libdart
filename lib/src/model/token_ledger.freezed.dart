// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'token_ledger.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TokenLedger _$TokenLedgerFromJson(Map<String, dynamic> json) {
  return _TokenLedger.fromJson(json);
}

/// @nodoc
mixin _$TokenLedger {
  List<TokenTransfer> get transfers => throw _privateConstructorUsedError;

  /// Serializes this TokenLedger to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TokenLedger
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TokenLedgerCopyWith<TokenLedger> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TokenLedgerCopyWith<$Res> {
  factory $TokenLedgerCopyWith(
          TokenLedger value, $Res Function(TokenLedger) then) =
      _$TokenLedgerCopyWithImpl<$Res, TokenLedger>;
  @useResult
  $Res call({List<TokenTransfer> transfers});
}

/// @nodoc
class _$TokenLedgerCopyWithImpl<$Res, $Val extends TokenLedger>
    implements $TokenLedgerCopyWith<$Res> {
  _$TokenLedgerCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TokenLedger
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? transfers = null,
  }) {
    return _then(_value.copyWith(
      transfers: null == transfers
          ? _value.transfers
          : transfers // ignore: cast_nullable_to_non_nullable
              as List<TokenTransfer>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TokenLedgerImplCopyWith<$Res>
    implements $TokenLedgerCopyWith<$Res> {
  factory _$$TokenLedgerImplCopyWith(
          _$TokenLedgerImpl value, $Res Function(_$TokenLedgerImpl) then) =
      __$$TokenLedgerImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<TokenTransfer> transfers});
}

/// @nodoc
class __$$TokenLedgerImplCopyWithImpl<$Res>
    extends _$TokenLedgerCopyWithImpl<$Res, _$TokenLedgerImpl>
    implements _$$TokenLedgerImplCopyWith<$Res> {
  __$$TokenLedgerImplCopyWithImpl(
      _$TokenLedgerImpl _value, $Res Function(_$TokenLedgerImpl) _then)
      : super(_value, _then);

  /// Create a copy of TokenLedger
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? transfers = null,
  }) {
    return _then(_$TokenLedgerImpl(
      transfers: null == transfers
          ? _value.transfers
          : transfers // ignore: cast_nullable_to_non_nullable
              as List<TokenTransfer>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TokenLedgerImpl extends _TokenLedger {
  const _$TokenLedgerImpl({this.transfers = const []}) : super._();

  factory _$TokenLedgerImpl.fromJson(Map<String, dynamic> json) =>
      _$$TokenLedgerImplFromJson(json);

  @override
  @JsonKey()
  final List<TokenTransfer> transfers;

  @override
  String toString() {
    return 'TokenLedger(transfers: $transfers)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TokenLedgerImpl &&
            const DeepCollectionEquality().equals(other.transfers, transfers));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(transfers));

  /// Create a copy of TokenLedger
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TokenLedgerImplCopyWith<_$TokenLedgerImpl> get copyWith =>
      __$$TokenLedgerImplCopyWithImpl<_$TokenLedgerImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TokenLedgerImplToJson(
      this,
    );
  }
}

abstract class _TokenLedger extends TokenLedger {
  const factory _TokenLedger({final List<TokenTransfer> transfers}) =
      _$TokenLedgerImpl;
  const _TokenLedger._() : super._();

  factory _TokenLedger.fromJson(Map<String, dynamic> json) =
      _$TokenLedgerImpl.fromJson;

  @override
  List<TokenTransfer> get transfers;

  /// Create a copy of TokenLedger
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TokenLedgerImplCopyWith<_$TokenLedgerImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
