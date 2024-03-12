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
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AesAuthEncryptInfos {
  @Uint8ListConverter()
  Uint8List? get tag => throw _privateConstructorUsedError;
  @Uint8ListConverter()
  Uint8List? get encrypted => throw _privateConstructorUsedError;

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
  $Res call(
      {@Uint8ListConverter() Uint8List? tag,
      @Uint8ListConverter() Uint8List? encrypted});
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
              as Uint8List?,
      encrypted: freezed == encrypted
          ? _value.encrypted
          : encrypted // ignore: cast_nullable_to_non_nullable
              as Uint8List?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AesAuthEncryptInfosImplCopyWith<$Res>
    implements $AesAuthEncryptInfosCopyWith<$Res> {
  factory _$$AesAuthEncryptInfosImplCopyWith(_$AesAuthEncryptInfosImpl value,
          $Res Function(_$AesAuthEncryptInfosImpl) then) =
      __$$AesAuthEncryptInfosImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@Uint8ListConverter() Uint8List? tag,
      @Uint8ListConverter() Uint8List? encrypted});
}

/// @nodoc
class __$$AesAuthEncryptInfosImplCopyWithImpl<$Res>
    extends _$AesAuthEncryptInfosCopyWithImpl<$Res, _$AesAuthEncryptInfosImpl>
    implements _$$AesAuthEncryptInfosImplCopyWith<$Res> {
  __$$AesAuthEncryptInfosImplCopyWithImpl(_$AesAuthEncryptInfosImpl _value,
      $Res Function(_$AesAuthEncryptInfosImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tag = freezed,
    Object? encrypted = freezed,
  }) {
    return _then(_$AesAuthEncryptInfosImpl(
      tag: freezed == tag
          ? _value.tag
          : tag // ignore: cast_nullable_to_non_nullable
              as Uint8List?,
      encrypted: freezed == encrypted
          ? _value.encrypted
          : encrypted // ignore: cast_nullable_to_non_nullable
              as Uint8List?,
    ));
  }
}

/// @nodoc

class _$AesAuthEncryptInfosImpl extends _AesAuthEncryptInfos {
  const _$AesAuthEncryptInfosImpl(
      {@Uint8ListConverter() this.tag, @Uint8ListConverter() this.encrypted})
      : super._();

  @override
  @Uint8ListConverter()
  final Uint8List? tag;
  @override
  @Uint8ListConverter()
  final Uint8List? encrypted;

  @override
  String toString() {
    return 'AesAuthEncryptInfos(tag: $tag, encrypted: $encrypted)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AesAuthEncryptInfosImpl &&
            const DeepCollectionEquality().equals(other.tag, tag) &&
            const DeepCollectionEquality().equals(other.encrypted, encrypted));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(tag),
      const DeepCollectionEquality().hash(encrypted));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AesAuthEncryptInfosImplCopyWith<_$AesAuthEncryptInfosImpl> get copyWith =>
      __$$AesAuthEncryptInfosImplCopyWithImpl<_$AesAuthEncryptInfosImpl>(
          this, _$identity);
}

abstract class _AesAuthEncryptInfos extends AesAuthEncryptInfos {
  const factory _AesAuthEncryptInfos(
          {@Uint8ListConverter() final Uint8List? tag,
          @Uint8ListConverter() final Uint8List? encrypted}) =
      _$AesAuthEncryptInfosImpl;
  const _AesAuthEncryptInfos._() : super._();

  @override
  @Uint8ListConverter()
  Uint8List? get tag;
  @override
  @Uint8ListConverter()
  Uint8List? get encrypted;
  @override
  @JsonKey(ignore: true)
  _$$AesAuthEncryptInfosImplCopyWith<_$AesAuthEncryptInfosImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
