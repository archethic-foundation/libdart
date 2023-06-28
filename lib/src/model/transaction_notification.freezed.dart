// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'transaction_notification.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$TransactionNotification {
  String get txAddress => throw _privateConstructorUsedError;
  String get txChainGenesisAddress => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TransactionNotificationCopyWith<TransactionNotification> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransactionNotificationCopyWith<$Res> {
  factory $TransactionNotificationCopyWith(TransactionNotification value,
          $Res Function(TransactionNotification) then) =
      _$TransactionNotificationCopyWithImpl<$Res, TransactionNotification>;
  @useResult
  $Res call({String txAddress, String txChainGenesisAddress});
}

/// @nodoc
class _$TransactionNotificationCopyWithImpl<$Res,
        $Val extends TransactionNotification>
    implements $TransactionNotificationCopyWith<$Res> {
  _$TransactionNotificationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? txAddress = null,
    Object? txChainGenesisAddress = null,
  }) {
    return _then(_value.copyWith(
      txAddress: null == txAddress
          ? _value.txAddress
          : txAddress // ignore: cast_nullable_to_non_nullable
              as String,
      txChainGenesisAddress: null == txChainGenesisAddress
          ? _value.txChainGenesisAddress
          : txChainGenesisAddress // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TransactionNotificationCopyWith<$Res>
    implements $TransactionNotificationCopyWith<$Res> {
  factory _$$_TransactionNotificationCopyWith(_$_TransactionNotification value,
          $Res Function(_$_TransactionNotification) then) =
      __$$_TransactionNotificationCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String txAddress, String txChainGenesisAddress});
}

/// @nodoc
class __$$_TransactionNotificationCopyWithImpl<$Res>
    extends _$TransactionNotificationCopyWithImpl<$Res,
        _$_TransactionNotification>
    implements _$$_TransactionNotificationCopyWith<$Res> {
  __$$_TransactionNotificationCopyWithImpl(_$_TransactionNotification _value,
      $Res Function(_$_TransactionNotification) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? txAddress = null,
    Object? txChainGenesisAddress = null,
  }) {
    return _then(_$_TransactionNotification(
      txAddress: null == txAddress
          ? _value.txAddress
          : txAddress // ignore: cast_nullable_to_non_nullable
              as String,
      txChainGenesisAddress: null == txChainGenesisAddress
          ? _value.txChainGenesisAddress
          : txChainGenesisAddress // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_TransactionNotification extends _TransactionNotification {
  const _$_TransactionNotification(
      {required this.txAddress, required this.txChainGenesisAddress})
      : super._();

  @override
  final String txAddress;
  @override
  final String txChainGenesisAddress;

  @override
  String toString() {
    return 'TransactionNotification(txAddress: $txAddress, txChainGenesisAddress: $txChainGenesisAddress)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TransactionNotification &&
            (identical(other.txAddress, txAddress) ||
                other.txAddress == txAddress) &&
            (identical(other.txChainGenesisAddress, txChainGenesisAddress) ||
                other.txChainGenesisAddress == txChainGenesisAddress));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, txAddress, txChainGenesisAddress);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TransactionNotificationCopyWith<_$_TransactionNotification>
      get copyWith =>
          __$$_TransactionNotificationCopyWithImpl<_$_TransactionNotification>(
              this, _$identity);
}

abstract class _TransactionNotification extends TransactionNotification {
  const factory _TransactionNotification(
          {required final String txAddress,
          required final String txChainGenesisAddress}) =
      _$_TransactionNotification;
  const _TransactionNotification._() : super._();

  @override
  String get txAddress;
  @override
  String get txChainGenesisAddress;
  @override
  @JsonKey(ignore: true)
  _$$_TransactionNotificationCopyWith<_$_TransactionNotification>
      get copyWith => throw _privateConstructorUsedError;
}

PushNotification _$PushNotificationFromJson(Map<String, dynamic> json) {
  return _PushNotification.fromJson(json);
}

/// @nodoc
mixin _$PushNotification {
  String? get title => throw _privateConstructorUsedError;
  String? get body => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PushNotificationCopyWith<PushNotification> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PushNotificationCopyWith<$Res> {
  factory $PushNotificationCopyWith(
          PushNotification value, $Res Function(PushNotification) then) =
      _$PushNotificationCopyWithImpl<$Res, PushNotification>;
  @useResult
  $Res call({String? title, String? body});
}

/// @nodoc
class _$PushNotificationCopyWithImpl<$Res, $Val extends PushNotification>
    implements $PushNotificationCopyWith<$Res> {
  _$PushNotificationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = freezed,
    Object? body = freezed,
  }) {
    return _then(_value.copyWith(
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      body: freezed == body
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PushNotificationCopyWith<$Res>
    implements $PushNotificationCopyWith<$Res> {
  factory _$$_PushNotificationCopyWith(
          _$_PushNotification value, $Res Function(_$_PushNotification) then) =
      __$$_PushNotificationCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? title, String? body});
}

/// @nodoc
class __$$_PushNotificationCopyWithImpl<$Res>
    extends _$PushNotificationCopyWithImpl<$Res, _$_PushNotification>
    implements _$$_PushNotificationCopyWith<$Res> {
  __$$_PushNotificationCopyWithImpl(
      _$_PushNotification _value, $Res Function(_$_PushNotification) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = freezed,
    Object? body = freezed,
  }) {
    return _then(_$_PushNotification(
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      body: freezed == body
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PushNotification extends _PushNotification {
  const _$_PushNotification({this.title, this.body}) : super._();

  factory _$_PushNotification.fromJson(Map<String, dynamic> json) =>
      _$$_PushNotificationFromJson(json);

  @override
  final String? title;
  @override
  final String? body;

  @override
  String toString() {
    return 'PushNotification(title: $title, body: $body)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PushNotification &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.body, body) || other.body == body));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, title, body);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PushNotificationCopyWith<_$_PushNotification> get copyWith =>
      __$$_PushNotificationCopyWithImpl<_$_PushNotification>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PushNotificationToJson(
      this,
    );
  }
}

abstract class _PushNotification extends PushNotification {
  const factory _PushNotification({final String? title, final String? body}) =
      _$_PushNotification;
  const _PushNotification._() : super._();

  factory _PushNotification.fromJson(Map<String, dynamic> json) =
      _$_PushNotification.fromJson;

  @override
  String? get title;
  @override
  String? get body;
  @override
  @JsonKey(ignore: true)
  _$$_PushNotificationCopyWith<_$_PushNotification> get copyWith =>
      throw _privateConstructorUsedError;
}
