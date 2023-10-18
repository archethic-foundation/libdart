// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ownership.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Ownership _$OwnershipFromJson(Map<String, dynamic> json) {
  return _Ownership.fromJson(json);
}

/// @nodoc
mixin _$Ownership {
  List<AuthorizedKey> get authorizedPublicKeys =>
      throw _privateConstructorUsedError;
  String? get secret => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OwnershipCopyWith<Ownership> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OwnershipCopyWith<$Res> {
  factory $OwnershipCopyWith(Ownership value, $Res Function(Ownership) then) =
      _$OwnershipCopyWithImpl<$Res, Ownership>;
  @useResult
  $Res call({List<AuthorizedKey> authorizedPublicKeys, String? secret});
}

/// @nodoc
class _$OwnershipCopyWithImpl<$Res, $Val extends Ownership>
    implements $OwnershipCopyWith<$Res> {
  _$OwnershipCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? authorizedPublicKeys = null,
    Object? secret = freezed,
  }) {
    return _then(_value.copyWith(
      authorizedPublicKeys: null == authorizedPublicKeys
          ? _value.authorizedPublicKeys
          : authorizedPublicKeys // ignore: cast_nullable_to_non_nullable
              as List<AuthorizedKey>,
      secret: freezed == secret
          ? _value.secret
          : secret // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OwnershipImplCopyWith<$Res>
    implements $OwnershipCopyWith<$Res> {
  factory _$$OwnershipImplCopyWith(
          _$OwnershipImpl value, $Res Function(_$OwnershipImpl) then) =
      __$$OwnershipImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<AuthorizedKey> authorizedPublicKeys, String? secret});
}

/// @nodoc
class __$$OwnershipImplCopyWithImpl<$Res>
    extends _$OwnershipCopyWithImpl<$Res, _$OwnershipImpl>
    implements _$$OwnershipImplCopyWith<$Res> {
  __$$OwnershipImplCopyWithImpl(
      _$OwnershipImpl _value, $Res Function(_$OwnershipImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? authorizedPublicKeys = null,
    Object? secret = freezed,
  }) {
    return _then(_$OwnershipImpl(
      authorizedPublicKeys: null == authorizedPublicKeys
          ? _value._authorizedPublicKeys
          : authorizedPublicKeys // ignore: cast_nullable_to_non_nullable
              as List<AuthorizedKey>,
      secret: freezed == secret
          ? _value.secret
          : secret // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OwnershipImpl extends _Ownership {
  const _$OwnershipImpl(
      {final List<AuthorizedKey> authorizedPublicKeys = const [], this.secret})
      : _authorizedPublicKeys = authorizedPublicKeys,
        super._();

  factory _$OwnershipImpl.fromJson(Map<String, dynamic> json) =>
      _$$OwnershipImplFromJson(json);

  final List<AuthorizedKey> _authorizedPublicKeys;
  @override
  @JsonKey()
  List<AuthorizedKey> get authorizedPublicKeys {
    if (_authorizedPublicKeys is EqualUnmodifiableListView)
      return _authorizedPublicKeys;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_authorizedPublicKeys);
  }

  @override
  final String? secret;

  @override
  String toString() {
    return 'Ownership(authorizedPublicKeys: $authorizedPublicKeys, secret: $secret)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OwnershipImpl &&
            const DeepCollectionEquality()
                .equals(other._authorizedPublicKeys, _authorizedPublicKeys) &&
            (identical(other.secret, secret) || other.secret == secret));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_authorizedPublicKeys), secret);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OwnershipImplCopyWith<_$OwnershipImpl> get copyWith =>
      __$$OwnershipImplCopyWithImpl<_$OwnershipImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OwnershipImplToJson(
      this,
    );
  }
}

abstract class _Ownership extends Ownership {
  const factory _Ownership(
      {final List<AuthorizedKey> authorizedPublicKeys,
      final String? secret}) = _$OwnershipImpl;
  const _Ownership._() : super._();

  factory _Ownership.fromJson(Map<String, dynamic> json) =
      _$OwnershipImpl.fromJson;

  @override
  List<AuthorizedKey> get authorizedPublicKeys;
  @override
  String? get secret;
  @override
  @JsonKey(ignore: true)
  _$$OwnershipImplCopyWith<_$OwnershipImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
