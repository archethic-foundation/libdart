// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'key_pair.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$KeyPair {
  List<int>? get privateKey => throw _privateConstructorUsedError;
  List<int>? get publicKey => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $KeyPairCopyWith<KeyPair> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $KeyPairCopyWith<$Res> {
  factory $KeyPairCopyWith(KeyPair value, $Res Function(KeyPair) then) =
      _$KeyPairCopyWithImpl<$Res, KeyPair>;
  @useResult
  $Res call({List<int>? privateKey, List<int>? publicKey});
}

/// @nodoc
class _$KeyPairCopyWithImpl<$Res, $Val extends KeyPair>
    implements $KeyPairCopyWith<$Res> {
  _$KeyPairCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? privateKey = freezed,
    Object? publicKey = freezed,
  }) {
    return _then(_value.copyWith(
      privateKey: freezed == privateKey
          ? _value.privateKey
          : privateKey // ignore: cast_nullable_to_non_nullable
              as List<int>?,
      publicKey: freezed == publicKey
          ? _value.publicKey
          : publicKey // ignore: cast_nullable_to_non_nullable
              as List<int>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_KeyPairCopyWith<$Res> implements $KeyPairCopyWith<$Res> {
  factory _$$_KeyPairCopyWith(
          _$_KeyPair value, $Res Function(_$_KeyPair) then) =
      __$$_KeyPairCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<int>? privateKey, List<int>? publicKey});
}

/// @nodoc
class __$$_KeyPairCopyWithImpl<$Res>
    extends _$KeyPairCopyWithImpl<$Res, _$_KeyPair>
    implements _$$_KeyPairCopyWith<$Res> {
  __$$_KeyPairCopyWithImpl(_$_KeyPair _value, $Res Function(_$_KeyPair) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? privateKey = freezed,
    Object? publicKey = freezed,
  }) {
    return _then(_$_KeyPair(
      privateKey: freezed == privateKey
          ? _value._privateKey
          : privateKey // ignore: cast_nullable_to_non_nullable
              as List<int>?,
      publicKey: freezed == publicKey
          ? _value._publicKey
          : publicKey // ignore: cast_nullable_to_non_nullable
              as List<int>?,
    ));
  }
}

/// @nodoc

class _$_KeyPair extends _KeyPair {
  const _$_KeyPair({final List<int>? privateKey, final List<int>? publicKey})
      : _privateKey = privateKey,
        _publicKey = publicKey,
        super._();

  final List<int>? _privateKey;
  @override
  List<int>? get privateKey {
    final value = _privateKey;
    if (value == null) return null;
    if (_privateKey is EqualUnmodifiableListView) return _privateKey;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<int>? _publicKey;
  @override
  List<int>? get publicKey {
    final value = _publicKey;
    if (value == null) return null;
    if (_publicKey is EqualUnmodifiableListView) return _publicKey;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'KeyPair(privateKey: $privateKey, publicKey: $publicKey)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_KeyPair &&
            const DeepCollectionEquality()
                .equals(other._privateKey, _privateKey) &&
            const DeepCollectionEquality()
                .equals(other._publicKey, _publicKey));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_privateKey),
      const DeepCollectionEquality().hash(_publicKey));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_KeyPairCopyWith<_$_KeyPair> get copyWith =>
      __$$_KeyPairCopyWithImpl<_$_KeyPair>(this, _$identity);
}

abstract class _KeyPair extends KeyPair {
  const factory _KeyPair(
      {final List<int>? privateKey, final List<int>? publicKey}) = _$_KeyPair;
  const _KeyPair._() : super._();

  @override
  List<int>? get privateKey;
  @override
  List<int>? get publicKey;
  @override
  @JsonKey(ignore: true)
  _$$_KeyPairCopyWith<_$_KeyPair> get copyWith =>
      throw _privateConstructorUsedError;
}
