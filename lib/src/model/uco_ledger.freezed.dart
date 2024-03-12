// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'uco_ledger.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UCOLedger _$UCOLedgerFromJson(Map<String, dynamic> json) {
  return _UCOLedger.fromJson(json);
}

/// @nodoc
mixin _$UCOLedger {
  List<UCOTransfer> get transfers => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UCOLedgerCopyWith<UCOLedger> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UCOLedgerCopyWith<$Res> {
  factory $UCOLedgerCopyWith(UCOLedger value, $Res Function(UCOLedger) then) =
      _$UCOLedgerCopyWithImpl<$Res, UCOLedger>;
  @useResult
  $Res call({List<UCOTransfer> transfers});
}

/// @nodoc
class _$UCOLedgerCopyWithImpl<$Res, $Val extends UCOLedger>
    implements $UCOLedgerCopyWith<$Res> {
  _$UCOLedgerCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? transfers = null,
  }) {
    return _then(_value.copyWith(
      transfers: null == transfers
          ? _value.transfers
          : transfers // ignore: cast_nullable_to_non_nullable
              as List<UCOTransfer>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UCOLedgerImplCopyWith<$Res>
    implements $UCOLedgerCopyWith<$Res> {
  factory _$$UCOLedgerImplCopyWith(
          _$UCOLedgerImpl value, $Res Function(_$UCOLedgerImpl) then) =
      __$$UCOLedgerImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<UCOTransfer> transfers});
}

/// @nodoc
class __$$UCOLedgerImplCopyWithImpl<$Res>
    extends _$UCOLedgerCopyWithImpl<$Res, _$UCOLedgerImpl>
    implements _$$UCOLedgerImplCopyWith<$Res> {
  __$$UCOLedgerImplCopyWithImpl(
      _$UCOLedgerImpl _value, $Res Function(_$UCOLedgerImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? transfers = null,
  }) {
    return _then(_$UCOLedgerImpl(
      transfers: null == transfers
          ? _value.transfers
          : transfers // ignore: cast_nullable_to_non_nullable
              as List<UCOTransfer>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UCOLedgerImpl extends _UCOLedger {
  const _$UCOLedgerImpl({this.transfers = const []}) : super._();

  factory _$UCOLedgerImpl.fromJson(Map<String, dynamic> json) =>
      _$$UCOLedgerImplFromJson(json);

  @override
  @JsonKey()
  final List<UCOTransfer> transfers;

  @override
  String toString() {
    return 'UCOLedger(transfers: $transfers)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UCOLedgerImpl &&
            const DeepCollectionEquality().equals(other.transfers, transfers));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(transfers));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UCOLedgerImplCopyWith<_$UCOLedgerImpl> get copyWith =>
      __$$UCOLedgerImplCopyWithImpl<_$UCOLedgerImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UCOLedgerImplToJson(
      this,
    );
  }
}

abstract class _UCOLedger extends UCOLedger {
  const factory _UCOLedger({final List<UCOTransfer> transfers}) =
      _$UCOLedgerImpl;
  const _UCOLedger._() : super._();

  factory _UCOLedger.fromJson(Map<String, dynamic> json) =
      _$UCOLedgerImpl.fromJson;

  @override
  List<UCOTransfer> get transfers;
  @override
  @JsonKey(ignore: true)
  _$$UCOLedgerImplCopyWith<_$UCOLedgerImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
