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
  @Uint8ListConverter()
  Uint8List? get privateKey => throw _privateConstructorUsedError;
  @Uint8ListConverter()
  Uint8List? get publicKey => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $KeyPairCopyWith<KeyPair> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $KeyPairCopyWith<$Res> {
  factory $KeyPairCopyWith(KeyPair value, $Res Function(KeyPair) then) =
      _$KeyPairCopyWithImpl<$Res, KeyPair>;
  @useResult
  $Res call(
      {@Uint8ListConverter() Uint8List? privateKey,
      @Uint8ListConverter() Uint8List? publicKey});
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
              as Uint8List?,
      publicKey: freezed == publicKey
          ? _value.publicKey
          : publicKey // ignore: cast_nullable_to_non_nullable
              as Uint8List?,
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
  $Res call(
      {@Uint8ListConverter() Uint8List? privateKey,
      @Uint8ListConverter() Uint8List? publicKey});
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
          ? _value.privateKey
          : privateKey // ignore: cast_nullable_to_non_nullable
              as Uint8List?,
      publicKey: freezed == publicKey
          ? _value.publicKey
          : publicKey // ignore: cast_nullable_to_non_nullable
              as Uint8List?,
    ));
  }
}

/// @nodoc

class _$_KeyPair extends _KeyPair {
  const _$_KeyPair(
      {@Uint8ListConverter() this.privateKey,
      @Uint8ListConverter() this.publicKey})
      : super._();

  @override
  @Uint8ListConverter()
  final Uint8List? privateKey;
  @override
  @Uint8ListConverter()
  final Uint8List? publicKey;

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
                .equals(other.privateKey, privateKey) &&
            const DeepCollectionEquality().equals(other.publicKey, publicKey));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(privateKey),
      const DeepCollectionEquality().hash(publicKey));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_KeyPairCopyWith<_$_KeyPair> get copyWith =>
      __$$_KeyPairCopyWithImpl<_$_KeyPair>(this, _$identity);
}

abstract class _KeyPair extends KeyPair {
  const factory _KeyPair(
      {@Uint8ListConverter() final Uint8List? privateKey,
      @Uint8ListConverter() final Uint8List? publicKey}) = _$_KeyPair;
  const _KeyPair._() : super._();

  @override
  @Uint8ListConverter()
  Uint8List? get privateKey;
  @override
  @Uint8ListConverter()
  Uint8List? get publicKey;
  @override
  @JsonKey(ignore: true)
  _$$_KeyPairCopyWith<_$_KeyPair> get copyWith =>
      throw _privateConstructorUsedError;
}
