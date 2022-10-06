// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

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
      _$TransactionStatusCopyWithImpl<$Res>;
  $Res call({String? status});
}

/// @nodoc
class _$TransactionStatusCopyWithImpl<$Res>
    implements $TransactionStatusCopyWith<$Res> {
  _$TransactionStatusCopyWithImpl(this._value, this._then);

  final TransactionStatus _value;
  // ignore: unused_field
  final $Res Function(TransactionStatus) _then;

  @override
  $Res call({
    Object? status = freezed,
  }) {
    return _then(_value.copyWith(
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$$_TransactionStatusCopyWith<$Res>
    implements $TransactionStatusCopyWith<$Res> {
  factory _$$_TransactionStatusCopyWith(_$_TransactionStatus value,
          $Res Function(_$_TransactionStatus) then) =
      __$$_TransactionStatusCopyWithImpl<$Res>;
  @override
  $Res call({String? status});
}

/// @nodoc
class __$$_TransactionStatusCopyWithImpl<$Res>
    extends _$TransactionStatusCopyWithImpl<$Res>
    implements _$$_TransactionStatusCopyWith<$Res> {
  __$$_TransactionStatusCopyWithImpl(
      _$_TransactionStatus _value, $Res Function(_$_TransactionStatus) _then)
      : super(_value, (v) => _then(v as _$_TransactionStatus));

  @override
  _$_TransactionStatus get _value => super._value as _$_TransactionStatus;

  @override
  $Res call({
    Object? status = freezed,
  }) {
    return _then(_$_TransactionStatus(
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TransactionStatus extends _TransactionStatus {
  const _$_TransactionStatus({this.status}) : super._();

  factory _$_TransactionStatus.fromJson(Map<String, dynamic> json) =>
      _$$_TransactionStatusFromJson(json);

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
            other is _$_TransactionStatus &&
            const DeepCollectionEquality().equals(other.status, status));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(status));

  @JsonKey(ignore: true)
  @override
  _$$_TransactionStatusCopyWith<_$_TransactionStatus> get copyWith =>
      __$$_TransactionStatusCopyWithImpl<_$_TransactionStatus>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TransactionStatusToJson(
      this,
    );
  }
}

abstract class _TransactionStatus extends TransactionStatus {
  const factory _TransactionStatus({final String? status}) =
      _$_TransactionStatus;
  const _TransactionStatus._() : super._();

  factory _TransactionStatus.fromJson(Map<String, dynamic> json) =
      _$_TransactionStatus.fromJson;

  @override
  String? get status;
  @override
  @JsonKey(ignore: true)
  _$$_TransactionStatusCopyWith<_$_TransactionStatus> get copyWith =>
      throw _privateConstructorUsedError;
}
