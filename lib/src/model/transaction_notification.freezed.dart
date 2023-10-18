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
  String get notificationRecipientAddress => throw _privateConstructorUsedError;
  List<String> get listenAddresses => throw _privateConstructorUsedError;

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
  $Res call(
      {String notificationRecipientAddress, List<String> listenAddresses});
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
    Object? notificationRecipientAddress = null,
    Object? listenAddresses = null,
  }) {
    return _then(_value.copyWith(
      notificationRecipientAddress: null == notificationRecipientAddress
          ? _value.notificationRecipientAddress
          : notificationRecipientAddress // ignore: cast_nullable_to_non_nullable
              as String,
      listenAddresses: null == listenAddresses
          ? _value.listenAddresses
          : listenAddresses // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TransactionNotificationImplCopyWith<$Res>
    implements $TransactionNotificationCopyWith<$Res> {
  factory _$$TransactionNotificationImplCopyWith(
          _$TransactionNotificationImpl value,
          $Res Function(_$TransactionNotificationImpl) then) =
      __$$TransactionNotificationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String notificationRecipientAddress, List<String> listenAddresses});
}

/// @nodoc
class __$$TransactionNotificationImplCopyWithImpl<$Res>
    extends _$TransactionNotificationCopyWithImpl<$Res,
        _$TransactionNotificationImpl>
    implements _$$TransactionNotificationImplCopyWith<$Res> {
  __$$TransactionNotificationImplCopyWithImpl(
      _$TransactionNotificationImpl _value,
      $Res Function(_$TransactionNotificationImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? notificationRecipientAddress = null,
    Object? listenAddresses = null,
  }) {
    return _then(_$TransactionNotificationImpl(
      notificationRecipientAddress: null == notificationRecipientAddress
          ? _value.notificationRecipientAddress
          : notificationRecipientAddress // ignore: cast_nullable_to_non_nullable
              as String,
      listenAddresses: null == listenAddresses
          ? _value._listenAddresses
          : listenAddresses // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc

class _$TransactionNotificationImpl extends _TransactionNotification {
  const _$TransactionNotificationImpl(
      {required this.notificationRecipientAddress,
      required final List<String> listenAddresses})
      : _listenAddresses = listenAddresses,
        super._();

  @override
  final String notificationRecipientAddress;
  final List<String> _listenAddresses;
  @override
  List<String> get listenAddresses {
    if (_listenAddresses is EqualUnmodifiableListView) return _listenAddresses;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_listenAddresses);
  }

  @override
  String toString() {
    return 'TransactionNotification(notificationRecipientAddress: $notificationRecipientAddress, listenAddresses: $listenAddresses)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TransactionNotificationImpl &&
            (identical(other.notificationRecipientAddress,
                    notificationRecipientAddress) ||
                other.notificationRecipientAddress ==
                    notificationRecipientAddress) &&
            const DeepCollectionEquality()
                .equals(other._listenAddresses, _listenAddresses));
  }

  @override
  int get hashCode => Object.hash(runtimeType, notificationRecipientAddress,
      const DeepCollectionEquality().hash(_listenAddresses));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TransactionNotificationImplCopyWith<_$TransactionNotificationImpl>
      get copyWith => __$$TransactionNotificationImplCopyWithImpl<
          _$TransactionNotificationImpl>(this, _$identity);
}

abstract class _TransactionNotification extends TransactionNotification {
  const factory _TransactionNotification(
          {required final String notificationRecipientAddress,
          required final List<String> listenAddresses}) =
      _$TransactionNotificationImpl;
  const _TransactionNotification._() : super._();

  @override
  String get notificationRecipientAddress;
  @override
  List<String> get listenAddresses;
  @override
  @JsonKey(ignore: true)
  _$$TransactionNotificationImplCopyWith<_$TransactionNotificationImpl>
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
abstract class _$$PushNotificationImplCopyWith<$Res>
    implements $PushNotificationCopyWith<$Res> {
  factory _$$PushNotificationImplCopyWith(_$PushNotificationImpl value,
          $Res Function(_$PushNotificationImpl) then) =
      __$$PushNotificationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? title, String? body});
}

/// @nodoc
class __$$PushNotificationImplCopyWithImpl<$Res>
    extends _$PushNotificationCopyWithImpl<$Res, _$PushNotificationImpl>
    implements _$$PushNotificationImplCopyWith<$Res> {
  __$$PushNotificationImplCopyWithImpl(_$PushNotificationImpl _value,
      $Res Function(_$PushNotificationImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = freezed,
    Object? body = freezed,
  }) {
    return _then(_$PushNotificationImpl(
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
class _$PushNotificationImpl extends _PushNotification {
  const _$PushNotificationImpl({this.title, this.body}) : super._();

  factory _$PushNotificationImpl.fromJson(Map<String, dynamic> json) =>
      _$$PushNotificationImplFromJson(json);

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
            other is _$PushNotificationImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.body, body) || other.body == body));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, title, body);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PushNotificationImplCopyWith<_$PushNotificationImpl> get copyWith =>
      __$$PushNotificationImplCopyWithImpl<_$PushNotificationImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PushNotificationImplToJson(
      this,
    );
  }
}

abstract class _PushNotification extends PushNotification {
  const factory _PushNotification({final String? title, final String? body}) =
      _$PushNotificationImpl;
  const _PushNotification._() : super._();

  factory _PushNotification.fromJson(Map<String, dynamic> json) =
      _$PushNotificationImpl.fromJson;

  @override
  String? get title;
  @override
  String? get body;
  @override
  @JsonKey(ignore: true)
  _$$PushNotificationImplCopyWith<_$PushNotificationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
