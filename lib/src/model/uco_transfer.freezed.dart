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
abstract class _$$_UCOTransferCopyWith<$Res>
    implements $UCOTransferCopyWith<$Res> {
  factory _$$_UCOTransferCopyWith(
          _$_UCOTransfer value, $Res Function(_$_UCOTransfer) then) =
      __$$_UCOTransferCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? amount, String? to});
}

/// @nodoc
class __$$_UCOTransferCopyWithImpl<$Res>
    extends _$UCOTransferCopyWithImpl<$Res, _$_UCOTransfer>
    implements _$$_UCOTransferCopyWith<$Res> {
  __$$_UCOTransferCopyWithImpl(
      _$_UCOTransfer _value, $Res Function(_$_UCOTransfer) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? amount = freezed,
    Object? to = freezed,
  }) {
    return _then(_$_UCOTransfer(
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
class _$_UCOTransfer extends _UCOTransfer {
  const _$_UCOTransfer({this.amount, this.to}) : super._();

  factory _$_UCOTransfer.fromJson(Map<String, dynamic> json) =>
      _$$_UCOTransferFromJson(json);

  @override
  final int? amount;
  @override
  final String? to;

  @override
  String toString() {
    return 'UCOTransfer(amount: $amount, to: $to)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UCOTransfer &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.to, to) || other.to == to));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, amount, to);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UCOTransferCopyWith<_$_UCOTransfer> get copyWith =>
      __$$_UCOTransferCopyWithImpl<_$_UCOTransfer>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UCOTransferToJson(
      this,
    );
  }
}

abstract class _UCOTransfer extends UCOTransfer {
  const factory _UCOTransfer({final int? amount, final String? to}) =
      _$_UCOTransfer;
  const _UCOTransfer._() : super._();

  factory _UCOTransfer.fromJson(Map<String, dynamic> json) =
      _$_UCOTransfer.fromJson;

  @override
  int? get amount;
  @override
  String? get to;
  @override
  @JsonKey(ignore: true)
  _$$_UCOTransferCopyWith<_$_UCOTransfer> get copyWith =>
      throw _privateConstructorUsedError;
}
