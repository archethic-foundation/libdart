// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ae_message.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AEMessage _$AEMessageFromJson(Map<String, dynamic> json) {
  return _AEMessage.fromJson(json);
}

/// @nodoc
mixin _$AEMessage {
  String get address => throw _privateConstructorUsedError;
  String get genesisPublicKey => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;
  int get timestamp => throw _privateConstructorUsedError;
  String get sender => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AEMessageCopyWith<AEMessage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AEMessageCopyWith<$Res> {
  factory $AEMessageCopyWith(AEMessage value, $Res Function(AEMessage) then) =
      _$AEMessageCopyWithImpl<$Res, AEMessage>;
  @useResult
  $Res call(
      {String address,
      String genesisPublicKey,
      String content,
      int timestamp,
      String sender});
}

/// @nodoc
class _$AEMessageCopyWithImpl<$Res, $Val extends AEMessage>
    implements $AEMessageCopyWith<$Res> {
  _$AEMessageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? address = null,
    Object? genesisPublicKey = null,
    Object? content = null,
    Object? timestamp = null,
    Object? sender = null,
  }) {
    return _then(_value.copyWith(
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      genesisPublicKey: null == genesisPublicKey
          ? _value.genesisPublicKey
          : genesisPublicKey // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as int,
      sender: null == sender
          ? _value.sender
          : sender // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AEMessageCopyWith<$Res> implements $AEMessageCopyWith<$Res> {
  factory _$$_AEMessageCopyWith(
          _$_AEMessage value, $Res Function(_$_AEMessage) then) =
      __$$_AEMessageCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String address,
      String genesisPublicKey,
      String content,
      int timestamp,
      String sender});
}

/// @nodoc
class __$$_AEMessageCopyWithImpl<$Res>
    extends _$AEMessageCopyWithImpl<$Res, _$_AEMessage>
    implements _$$_AEMessageCopyWith<$Res> {
  __$$_AEMessageCopyWithImpl(
      _$_AEMessage _value, $Res Function(_$_AEMessage) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? address = null,
    Object? genesisPublicKey = null,
    Object? content = null,
    Object? timestamp = null,
    Object? sender = null,
  }) {
    return _then(_$_AEMessage(
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      genesisPublicKey: null == genesisPublicKey
          ? _value.genesisPublicKey
          : genesisPublicKey // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as int,
      sender: null == sender
          ? _value.sender
          : sender // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AEMessage extends _AEMessage {
  const _$_AEMessage(
      {this.address = '',
      this.genesisPublicKey = '',
      this.content = '',
      this.timestamp = 0,
      this.sender = ''})
      : super._();

  factory _$_AEMessage.fromJson(Map<String, dynamic> json) =>
      _$$_AEMessageFromJson(json);

  @override
  @JsonKey()
  final String address;
  @override
  @JsonKey()
  final String genesisPublicKey;
  @override
  @JsonKey()
  final String content;
  @override
  @JsonKey()
  final int timestamp;
  @override
  @JsonKey()
  final String sender;

  @override
  String toString() {
    return 'AEMessage(address: $address, genesisPublicKey: $genesisPublicKey, content: $content, timestamp: $timestamp, sender: $sender)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AEMessage &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.genesisPublicKey, genesisPublicKey) ||
                other.genesisPublicKey == genesisPublicKey) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp) &&
            (identical(other.sender, sender) || other.sender == sender));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, address, genesisPublicKey, content, timestamp, sender);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AEMessageCopyWith<_$_AEMessage> get copyWith =>
      __$$_AEMessageCopyWithImpl<_$_AEMessage>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AEMessageToJson(
      this,
    );
  }
}

abstract class _AEMessage extends AEMessage {
  const factory _AEMessage(
      {final String address,
      final String genesisPublicKey,
      final String content,
      final int timestamp,
      final String sender}) = _$_AEMessage;
  const _AEMessage._() : super._();

  factory _AEMessage.fromJson(Map<String, dynamic> json) =
      _$_AEMessage.fromJson;

  @override
  String get address;
  @override
  String get genesisPublicKey;
  @override
  String get content;
  @override
  int get timestamp;
  @override
  String get sender;
  @override
  @JsonKey(ignore: true)
  _$$_AEMessageCopyWith<_$_AEMessage> get copyWith =>
      throw _privateConstructorUsedError;
}
