// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'aes_auth_encrypt_infos.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AesAuthEncryptInfos {
  List<int>? get tag => throw _privateConstructorUsedError;
  List<int>? get encrypted => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AesAuthEncryptInfosCopyWith<AesAuthEncryptInfos> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AesAuthEncryptInfosCopyWith<$Res> {
  factory $AesAuthEncryptInfosCopyWith(
          AesAuthEncryptInfos value, $Res Function(AesAuthEncryptInfos) then) =
      _$AesAuthEncryptInfosCopyWithImpl<$Res, AesAuthEncryptInfos>;
  @useResult
  $Res call({List<int>? tag, List<int>? encrypted});
}

/// @nodoc
class _$AesAuthEncryptInfosCopyWithImpl<$Res, $Val extends AesAuthEncryptInfos>
    implements $AesAuthEncryptInfosCopyWith<$Res> {
  _$AesAuthEncryptInfosCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tag = freezed,
    Object? encrypted = freezed,
  }) {
    return _then(_value.copyWith(
      tag: freezed == tag
          ? _value.tag
          : tag // ignore: cast_nullable_to_non_nullable
              as List<int>?,
      encrypted: freezed == encrypted
          ? _value.encrypted
          : encrypted // ignore: cast_nullable_to_non_nullable
              as List<int>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AesAuthEncryptInfosCopyWith<$Res>
    implements $AesAuthEncryptInfosCopyWith<$Res> {
  factory _$$_AesAuthEncryptInfosCopyWith(_$_AesAuthEncryptInfos value,
          $Res Function(_$_AesAuthEncryptInfos) then) =
      __$$_AesAuthEncryptInfosCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<int>? tag, List<int>? encrypted});
}

/// @nodoc
class __$$_AesAuthEncryptInfosCopyWithImpl<$Res>
    extends _$AesAuthEncryptInfosCopyWithImpl<$Res, _$_AesAuthEncryptInfos>
    implements _$$_AesAuthEncryptInfosCopyWith<$Res> {
  __$$_AesAuthEncryptInfosCopyWithImpl(_$_AesAuthEncryptInfos _value,
      $Res Function(_$_AesAuthEncryptInfos) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tag = freezed,
    Object? encrypted = freezed,
  }) {
    return _then(_$_AesAuthEncryptInfos(
      tag: freezed == tag
          ? _value._tag
          : tag // ignore: cast_nullable_to_non_nullable
              as List<int>?,
      encrypted: freezed == encrypted
          ? _value._encrypted
          : encrypted // ignore: cast_nullable_to_non_nullable
              as List<int>?,
    ));
  }
}

/// @nodoc

class _$_AesAuthEncryptInfos extends _AesAuthEncryptInfos {
  const _$_AesAuthEncryptInfos(
      {final List<int>? tag, final List<int>? encrypted})
      : _tag = tag,
        _encrypted = encrypted,
        super._();

  final List<int>? _tag;
  @override
  List<int>? get tag {
    final value = _tag;
    if (value == null) return null;
    if (_tag is EqualUnmodifiableListView) return _tag;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<int>? _encrypted;
  @override
  List<int>? get encrypted {
    final value = _encrypted;
    if (value == null) return null;
    if (_encrypted is EqualUnmodifiableListView) return _encrypted;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'AesAuthEncryptInfos(tag: $tag, encrypted: $encrypted)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AesAuthEncryptInfos &&
            const DeepCollectionEquality().equals(other._tag, _tag) &&
            const DeepCollectionEquality()
                .equals(other._encrypted, _encrypted));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_tag),
      const DeepCollectionEquality().hash(_encrypted));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AesAuthEncryptInfosCopyWith<_$_AesAuthEncryptInfos> get copyWith =>
      __$$_AesAuthEncryptInfosCopyWithImpl<_$_AesAuthEncryptInfos>(
          this, _$identity);
}

abstract class _AesAuthEncryptInfos extends AesAuthEncryptInfos {
  const factory _AesAuthEncryptInfos(
      {final List<int>? tag,
      final List<int>? encrypted}) = _$_AesAuthEncryptInfos;
  const _AesAuthEncryptInfos._() : super._();

  @override
  List<int>? get tag;
  @override
  List<int>? get encrypted;
  @override
  @JsonKey(ignore: true)
  _$$_AesAuthEncryptInfosCopyWith<_$_AesAuthEncryptInfos> get copyWith =>
      throw _privateConstructorUsedError;
}
