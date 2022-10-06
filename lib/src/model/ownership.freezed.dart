// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

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
      _$OwnershipCopyWithImpl<$Res>;
  $Res call({List<AuthorizedKey> authorizedPublicKeys, String? secret});
}

/// @nodoc
class _$OwnershipCopyWithImpl<$Res> implements $OwnershipCopyWith<$Res> {
  _$OwnershipCopyWithImpl(this._value, this._then);

  final Ownership _value;
  // ignore: unused_field
  final $Res Function(Ownership) _then;

  @override
  $Res call({
    Object? authorizedPublicKeys = freezed,
    Object? secret = freezed,
  }) {
    return _then(_value.copyWith(
      authorizedPublicKeys: authorizedPublicKeys == freezed
          ? _value.authorizedPublicKeys
          : authorizedPublicKeys // ignore: cast_nullable_to_non_nullable
              as List<AuthorizedKey>,
      secret: secret == freezed
          ? _value.secret
          : secret // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$$_OwnershipCopyWith<$Res> implements $OwnershipCopyWith<$Res> {
  factory _$$_OwnershipCopyWith(
          _$_Ownership value, $Res Function(_$_Ownership) then) =
      __$$_OwnershipCopyWithImpl<$Res>;
  @override
  $Res call({List<AuthorizedKey> authorizedPublicKeys, String? secret});
}

/// @nodoc
class __$$_OwnershipCopyWithImpl<$Res> extends _$OwnershipCopyWithImpl<$Res>
    implements _$$_OwnershipCopyWith<$Res> {
  __$$_OwnershipCopyWithImpl(
      _$_Ownership _value, $Res Function(_$_Ownership) _then)
      : super(_value, (v) => _then(v as _$_Ownership));

  @override
  _$_Ownership get _value => super._value as _$_Ownership;

  @override
  $Res call({
    Object? authorizedPublicKeys = freezed,
    Object? secret = freezed,
  }) {
    return _then(_$_Ownership(
      authorizedPublicKeys: authorizedPublicKeys == freezed
          ? _value.authorizedPublicKeys
          : authorizedPublicKeys // ignore: cast_nullable_to_non_nullable
              as List<AuthorizedKey>,
      secret: secret == freezed
          ? _value.secret
          : secret // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Ownership extends _Ownership {
  const _$_Ownership({this.authorizedPublicKeys = const [], this.secret})
      : super._();

  factory _$_Ownership.fromJson(Map<String, dynamic> json) =>
      _$$_OwnershipFromJson(json);

  @override
  @JsonKey()
  final List<AuthorizedKey> authorizedPublicKeys;
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
            other is _$_Ownership &&
            const DeepCollectionEquality()
                .equals(other.authorizedPublicKeys, authorizedPublicKeys) &&
            const DeepCollectionEquality().equals(other.secret, secret));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(authorizedPublicKeys),
      const DeepCollectionEquality().hash(secret));

  @JsonKey(ignore: true)
  @override
  _$$_OwnershipCopyWith<_$_Ownership> get copyWith =>
      __$$_OwnershipCopyWithImpl<_$_Ownership>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_OwnershipToJson(
      this,
    );
  }
}

abstract class _Ownership extends Ownership {
  const factory _Ownership(
      {final List<AuthorizedKey> authorizedPublicKeys,
      final String? secret}) = _$_Ownership;
  const _Ownership._() : super._();

  factory _Ownership.fromJson(Map<String, dynamic> json) =
      _$_Ownership.fromJson;

  @override
  List<AuthorizedKey> get authorizedPublicKeys;
  @override
  String? get secret;
  @override
  @JsonKey(ignore: true)
  _$$_OwnershipCopyWith<_$_Ownership> get copyWith =>
      throw _privateConstructorUsedError;
}
