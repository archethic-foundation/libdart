// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'transaction_status.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TransactionStatus _$TransactionStatusFromJson(Map<String, dynamic> json) {
  return _TransactionStatus.fromJson(json);
}

/// @nodoc
mixin _$TransactionStatus {
  String? get status => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TransactionStatusCopyWith<TransactionStatus> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransactionStatusCopyWith<$Res> {
  factory $TransactionStatusCopyWith(
          TransactionStatus value, $Res Function(TransactionStatus) then) =
      _$TransactionStatusCopyWithImpl<$Res, TransactionStatus>;
  @useResult
  $Res call({String? status});
}

/// @nodoc
class _$TransactionStatusCopyWithImpl<$Res, $Val extends TransactionStatus>
    implements $TransactionStatusCopyWith<$Res> {
  _$TransactionStatusCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
  }) {
    return _then(_value.copyWith(
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TransactionStatusImplCopyWith<$Res>
    implements $TransactionStatusCopyWith<$Res> {
  factory _$$TransactionStatusImplCopyWith(_$TransactionStatusImpl value,
          $Res Function(_$TransactionStatusImpl) then) =
      __$$TransactionStatusImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? status});
}

/// @nodoc
class __$$TransactionStatusImplCopyWithImpl<$Res>
    extends _$TransactionStatusCopyWithImpl<$Res, _$TransactionStatusImpl>
    implements _$$TransactionStatusImplCopyWith<$Res> {
  __$$TransactionStatusImplCopyWithImpl(_$TransactionStatusImpl _value,
      $Res Function(_$TransactionStatusImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
  }) {
    return _then(_$TransactionStatusImpl(
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TransactionStatusImpl extends _TransactionStatus {
  const _$TransactionStatusImpl({this.status}) : super._();

  factory _$TransactionStatusImpl.fromJson(Map<String, dynamic> json) =>
      _$$TransactionStatusImplFromJson(json);

  @override
  final String? status;

  @override
  String toString() {
    return 'TransactionStatus(status: $status)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TransactionStatusImpl &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, status);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TransactionStatusImplCopyWith<_$TransactionStatusImpl> get copyWith =>
      __$$TransactionStatusImplCopyWithImpl<_$TransactionStatusImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TransactionStatusImplToJson(
      this,
    );
  }
}

abstract class _TransactionStatus extends TransactionStatus {
  const factory _TransactionStatus({final String? status}) =
      _$TransactionStatusImpl;
  const _TransactionStatus._() : super._();

  factory _TransactionStatus.fromJson(Map<String, dynamic> json) =
      _$TransactionStatusImpl.fromJson;

  @override
  String? get status;
  @override
  @JsonKey(ignore: true)
  _$$TransactionStatusImplCopyWith<_$TransactionStatusImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
