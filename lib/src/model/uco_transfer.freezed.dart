// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'uco_transfer.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UCOTransfer _$UCOTransferFromJson(Map<String, dynamic> json) {
  return _UCOTransfer.fromJson(json);
}

/// @nodoc
mixin _$UCOTransfer {
  int? get amount => throw _privateConstructorUsedError;
  String? get to => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UCOTransferCopyWith<UCOTransfer> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UCOTransferCopyWith<$Res> {
  factory $UCOTransferCopyWith(
          UCOTransfer value, $Res Function(UCOTransfer) then) =
      _$UCOTransferCopyWithImpl<$Res, UCOTransfer>;
  @useResult
  $Res call({int? amount, String? to});
}

/// @nodoc
class _$UCOTransferCopyWithImpl<$Res, $Val extends UCOTransfer>
    implements $UCOTransferCopyWith<$Res> {
  _$UCOTransferCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? amount = freezed,
    Object? to = freezed,
  }) {
    return _then(_value.copyWith(
      amount: freezed == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int?,
      to: freezed == to
          ? _value.to
          : to // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UCOTransferImplCopyWith<$Res>
    implements $UCOTransferCopyWith<$Res> {
  factory _$$UCOTransferImplCopyWith(
          _$UCOTransferImpl value, $Res Function(_$UCOTransferImpl) then) =
      __$$UCOTransferImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? amount, String? to});
}

/// @nodoc
class __$$UCOTransferImplCopyWithImpl<$Res>
    extends _$UCOTransferCopyWithImpl<$Res, _$UCOTransferImpl>
    implements _$$UCOTransferImplCopyWith<$Res> {
  __$$UCOTransferImplCopyWithImpl(
      _$UCOTransferImpl _value, $Res Function(_$UCOTransferImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? amount = freezed,
    Object? to = freezed,
  }) {
    return _then(_$UCOTransferImpl(
      amount: freezed == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int?,
      to: freezed == to
          ? _value.to
          : to // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UCOTransferImpl extends _UCOTransfer {
  const _$UCOTransferImpl({this.amount, this.to}) : super._();

  factory _$UCOTransferImpl.fromJson(Map<String, dynamic> json) =>
      _$$UCOTransferImplFromJson(json);

  @override
  final int? amount;
  @override
  final String? to;

  @override
  String toString() {
    return 'UCOTransfer(amount: $amount, to: $to)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UCOTransferImpl &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.to, to) || other.to == to));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, amount, to);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UCOTransferImplCopyWith<_$UCOTransferImpl> get copyWith =>
      __$$UCOTransferImplCopyWithImpl<_$UCOTransferImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UCOTransferImplToJson(
      this,
    );
  }
}

abstract class _UCOTransfer extends UCOTransfer {
  const factory _UCOTransfer({final int? amount, final String? to}) =
      _$UCOTransferImpl;
  const _UCOTransfer._() : super._();

  factory _UCOTransfer.fromJson(Map<String, dynamic> json) =
      _$UCOTransferImpl.fromJson;

  @override
  int? get amount;
  @override
  String? get to;
  @override
  @JsonKey(ignore: true)
  _$$UCOTransferImplCopyWith<_$UCOTransferImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
