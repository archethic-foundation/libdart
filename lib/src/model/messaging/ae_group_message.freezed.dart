// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ae_group_message.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AEGroupMessage _$AEGroupMessageFromJson(Map<String, dynamic> json) {
  return _AEGroupMessage.fromJson(json);
}

/// @nodoc
mixin _$AEGroupMessage {
  String get groupName => throw _privateConstructorUsedError;
  String get address => throw _privateConstructorUsedError;
  List<String> get usersPubKey => throw _privateConstructorUsedError;
  List<String> get adminPublicKey => throw _privateConstructorUsedError;
  int get timestampLastUpdate => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AEGroupMessageCopyWith<AEGroupMessage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AEGroupMessageCopyWith<$Res> {
  factory $AEGroupMessageCopyWith(
          AEGroupMessage value, $Res Function(AEGroupMessage) then) =
      _$AEGroupMessageCopyWithImpl<$Res, AEGroupMessage>;
  @useResult
  $Res call(
      {String groupName,
      String address,
      List<String> usersPubKey,
      List<String> adminPublicKey,
      int timestampLastUpdate});
}

/// @nodoc
class _$AEGroupMessageCopyWithImpl<$Res, $Val extends AEGroupMessage>
    implements $AEGroupMessageCopyWith<$Res> {
  _$AEGroupMessageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? groupName = null,
    Object? address = null,
    Object? usersPubKey = null,
    Object? adminPublicKey = null,
    Object? timestampLastUpdate = null,
  }) {
    return _then(_value.copyWith(
      groupName: null == groupName
          ? _value.groupName
          : groupName // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      usersPubKey: null == usersPubKey
          ? _value.usersPubKey
          : usersPubKey // ignore: cast_nullable_to_non_nullable
              as List<String>,
      adminPublicKey: null == adminPublicKey
          ? _value.adminPublicKey
          : adminPublicKey // ignore: cast_nullable_to_non_nullable
              as List<String>,
      timestampLastUpdate: null == timestampLastUpdate
          ? _value.timestampLastUpdate
          : timestampLastUpdate // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AEGroupMessageCopyWith<$Res>
    implements $AEGroupMessageCopyWith<$Res> {
  factory _$$_AEGroupMessageCopyWith(
          _$_AEGroupMessage value, $Res Function(_$_AEGroupMessage) then) =
      __$$_AEGroupMessageCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String groupName,
      String address,
      List<String> usersPubKey,
      List<String> adminPublicKey,
      int timestampLastUpdate});
}

/// @nodoc
class __$$_AEGroupMessageCopyWithImpl<$Res>
    extends _$AEGroupMessageCopyWithImpl<$Res, _$_AEGroupMessage>
    implements _$$_AEGroupMessageCopyWith<$Res> {
  __$$_AEGroupMessageCopyWithImpl(
      _$_AEGroupMessage _value, $Res Function(_$_AEGroupMessage) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? groupName = null,
    Object? address = null,
    Object? usersPubKey = null,
    Object? adminPublicKey = null,
    Object? timestampLastUpdate = null,
  }) {
    return _then(_$_AEGroupMessage(
      groupName: null == groupName
          ? _value.groupName
          : groupName // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      usersPubKey: null == usersPubKey
          ? _value._usersPubKey
          : usersPubKey // ignore: cast_nullable_to_non_nullable
              as List<String>,
      adminPublicKey: null == adminPublicKey
          ? _value._adminPublicKey
          : adminPublicKey // ignore: cast_nullable_to_non_nullable
              as List<String>,
      timestampLastUpdate: null == timestampLastUpdate
          ? _value.timestampLastUpdate
          : timestampLastUpdate // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AEGroupMessage extends _AEGroupMessage {
  const _$_AEGroupMessage(
      {this.groupName = '',
      this.address = '',
      final List<String> usersPubKey = const [],
      final List<String> adminPublicKey = const [],
      this.timestampLastUpdate = 0})
      : _usersPubKey = usersPubKey,
        _adminPublicKey = adminPublicKey,
        super._();

  factory _$_AEGroupMessage.fromJson(Map<String, dynamic> json) =>
      _$$_AEGroupMessageFromJson(json);

  @override
  @JsonKey()
  final String groupName;
  @override
  @JsonKey()
  final String address;
  final List<String> _usersPubKey;
  @override
  @JsonKey()
  List<String> get usersPubKey {
    if (_usersPubKey is EqualUnmodifiableListView) return _usersPubKey;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_usersPubKey);
  }

  final List<String> _adminPublicKey;
  @override
  @JsonKey()
  List<String> get adminPublicKey {
    if (_adminPublicKey is EqualUnmodifiableListView) return _adminPublicKey;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_adminPublicKey);
  }

  @override
  @JsonKey()
  final int timestampLastUpdate;

  @override
  String toString() {
    return 'AEGroupMessage(groupName: $groupName, address: $address, usersPubKey: $usersPubKey, adminPublicKey: $adminPublicKey, timestampLastUpdate: $timestampLastUpdate)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AEGroupMessage &&
            (identical(other.groupName, groupName) ||
                other.groupName == groupName) &&
            (identical(other.address, address) || other.address == address) &&
            const DeepCollectionEquality()
                .equals(other._usersPubKey, _usersPubKey) &&
            const DeepCollectionEquality()
                .equals(other._adminPublicKey, _adminPublicKey) &&
            (identical(other.timestampLastUpdate, timestampLastUpdate) ||
                other.timestampLastUpdate == timestampLastUpdate));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      groupName,
      address,
      const DeepCollectionEquality().hash(_usersPubKey),
      const DeepCollectionEquality().hash(_adminPublicKey),
      timestampLastUpdate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AEGroupMessageCopyWith<_$_AEGroupMessage> get copyWith =>
      __$$_AEGroupMessageCopyWithImpl<_$_AEGroupMessage>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AEGroupMessageToJson(
      this,
    );
  }
}

abstract class _AEGroupMessage extends AEGroupMessage {
  const factory _AEGroupMessage(
      {final String groupName,
      final String address,
      final List<String> usersPubKey,
      final List<String> adminPublicKey,
      final int timestampLastUpdate}) = _$_AEGroupMessage;
  const _AEGroupMessage._() : super._();

  factory _AEGroupMessage.fromJson(Map<String, dynamic> json) =
      _$_AEGroupMessage.fromJson;

  @override
  String get groupName;
  @override
  String get address;
  @override
  List<String> get usersPubKey;
  @override
  List<String> get adminPublicKey;
  @override
  int get timestampLastUpdate;
  @override
  @JsonKey(ignore: true)
  _$$_AEGroupMessageCopyWith<_$_AEGroupMessage> get copyWith =>
      throw _privateConstructorUsedError;
}
