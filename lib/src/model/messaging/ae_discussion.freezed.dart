// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ae_discussion.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AEDiscussion _$AEDiscussionFromJson(Map<String, dynamic> json) {
  return _AEDiscussion.fromJson(json);
}

/// @nodoc
mixin _$AEDiscussion {
  String get discussionName => throw _privateConstructorUsedError;
  String get address => throw _privateConstructorUsedError;
  List<String> get usersPubKey => throw _privateConstructorUsedError;
  List<String> get adminPublicKey => throw _privateConstructorUsedError;
  int get timestampLastUpdate => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AEDiscussionCopyWith<AEDiscussion> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AEDiscussionCopyWith<$Res> {
  factory $AEDiscussionCopyWith(
          AEDiscussion value, $Res Function(AEDiscussion) then) =
      _$AEDiscussionCopyWithImpl<$Res, AEDiscussion>;
  @useResult
  $Res call(
      {String discussionName,
      String address,
      List<String> usersPubKey,
      List<String> adminPublicKey,
      int timestampLastUpdate});
}

/// @nodoc
class _$AEDiscussionCopyWithImpl<$Res, $Val extends AEDiscussion>
    implements $AEDiscussionCopyWith<$Res> {
  _$AEDiscussionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? discussionName = null,
    Object? address = null,
    Object? usersPubKey = null,
    Object? adminPublicKey = null,
    Object? timestampLastUpdate = null,
  }) {
    return _then(_value.copyWith(
      discussionName: null == discussionName
          ? _value.discussionName
          : discussionName // ignore: cast_nullable_to_non_nullable
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
abstract class _$$_AEDiscussionCopyWith<$Res>
    implements $AEDiscussionCopyWith<$Res> {
  factory _$$_AEDiscussionCopyWith(
          _$_AEDiscussion value, $Res Function(_$_AEDiscussion) then) =
      __$$_AEDiscussionCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String discussionName,
      String address,
      List<String> usersPubKey,
      List<String> adminPublicKey,
      int timestampLastUpdate});
}

/// @nodoc
class __$$_AEDiscussionCopyWithImpl<$Res>
    extends _$AEDiscussionCopyWithImpl<$Res, _$_AEDiscussion>
    implements _$$_AEDiscussionCopyWith<$Res> {
  __$$_AEDiscussionCopyWithImpl(
      _$_AEDiscussion _value, $Res Function(_$_AEDiscussion) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? discussionName = null,
    Object? address = null,
    Object? usersPubKey = null,
    Object? adminPublicKey = null,
    Object? timestampLastUpdate = null,
  }) {
    return _then(_$_AEDiscussion(
      discussionName: null == discussionName
          ? _value.discussionName
          : discussionName // ignore: cast_nullable_to_non_nullable
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
class _$_AEDiscussion extends _AEDiscussion {
  const _$_AEDiscussion(
      {this.discussionName = '',
      this.address = '',
      final List<String> usersPubKey = const [],
      final List<String> adminPublicKey = const [],
      this.timestampLastUpdate = 0})
      : _usersPubKey = usersPubKey,
        _adminPublicKey = adminPublicKey,
        super._();

  factory _$_AEDiscussion.fromJson(Map<String, dynamic> json) =>
      _$$_AEDiscussionFromJson(json);

  @override
  @JsonKey()
  final String discussionName;
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
    return 'AEDiscussion(discussionName: $discussionName, address: $address, usersPubKey: $usersPubKey, adminPublicKey: $adminPublicKey, timestampLastUpdate: $timestampLastUpdate)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AEDiscussion &&
            (identical(other.discussionName, discussionName) ||
                other.discussionName == discussionName) &&
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
      discussionName,
      address,
      const DeepCollectionEquality().hash(_usersPubKey),
      const DeepCollectionEquality().hash(_adminPublicKey),
      timestampLastUpdate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AEDiscussionCopyWith<_$_AEDiscussion> get copyWith =>
      __$$_AEDiscussionCopyWithImpl<_$_AEDiscussion>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AEDiscussionToJson(
      this,
    );
  }
}

abstract class _AEDiscussion extends AEDiscussion {
  const factory _AEDiscussion(
      {final String discussionName,
      final String address,
      final List<String> usersPubKey,
      final List<String> adminPublicKey,
      final int timestampLastUpdate}) = _$_AEDiscussion;
  const _AEDiscussion._() : super._();

  factory _AEDiscussion.fromJson(Map<String, dynamic> json) =
      _$_AEDiscussion.fromJson;

  @override
  String get discussionName;
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
  _$$_AEDiscussionCopyWith<_$_AEDiscussion> get copyWith =>
      throw _privateConstructorUsedError;
}
