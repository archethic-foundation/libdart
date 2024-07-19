// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'secret.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$Secret {
  @Uint8ListConverter()
  Uint8List? get iv => throw _privateConstructorUsedError;
  @Uint8ListConverter()
  Uint8List? get aesKey => throw _privateConstructorUsedError;

  /// Create a copy of Secret
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SecretCopyWith<Secret> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SecretCopyWith<$Res> {
  factory $SecretCopyWith(Secret value, $Res Function(Secret) then) =
      _$SecretCopyWithImpl<$Res, Secret>;
  @useResult
  $Res call(
      {@Uint8ListConverter() Uint8List? iv,
      @Uint8ListConverter() Uint8List? aesKey});
}

/// @nodoc
class _$SecretCopyWithImpl<$Res, $Val extends Secret>
    implements $SecretCopyWith<$Res> {
  _$SecretCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Secret
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? iv = freezed,
    Object? aesKey = freezed,
  }) {
    return _then(_value.copyWith(
      iv: freezed == iv
          ? _value.iv
          : iv // ignore: cast_nullable_to_non_nullable
              as Uint8List?,
      aesKey: freezed == aesKey
          ? _value.aesKey
          : aesKey // ignore: cast_nullable_to_non_nullable
              as Uint8List?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SecretImplCopyWith<$Res> implements $SecretCopyWith<$Res> {
  factory _$$SecretImplCopyWith(
          _$SecretImpl value, $Res Function(_$SecretImpl) then) =
      __$$SecretImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@Uint8ListConverter() Uint8List? iv,
      @Uint8ListConverter() Uint8List? aesKey});
}

/// @nodoc
class __$$SecretImplCopyWithImpl<$Res>
    extends _$SecretCopyWithImpl<$Res, _$SecretImpl>
    implements _$$SecretImplCopyWith<$Res> {
  __$$SecretImplCopyWithImpl(
      _$SecretImpl _value, $Res Function(_$SecretImpl) _then)
      : super(_value, _then);

  /// Create a copy of Secret
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? iv = freezed,
    Object? aesKey = freezed,
  }) {
    return _then(_$SecretImpl(
      iv: freezed == iv
          ? _value.iv
          : iv // ignore: cast_nullable_to_non_nullable
              as Uint8List?,
      aesKey: freezed == aesKey
          ? _value.aesKey
          : aesKey // ignore: cast_nullable_to_non_nullable
              as Uint8List?,
    ));
  }
}

/// @nodoc

class _$SecretImpl extends _Secret {
  const _$SecretImpl(
      {@Uint8ListConverter() this.iv, @Uint8ListConverter() this.aesKey})
      : super._();

  @override
  @Uint8ListConverter()
  final Uint8List? iv;
  @override
  @Uint8ListConverter()
  final Uint8List? aesKey;

  @override
  String toString() {
    return 'Secret(iv: $iv, aesKey: $aesKey)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SecretImpl &&
            const DeepCollectionEquality().equals(other.iv, iv) &&
            const DeepCollectionEquality().equals(other.aesKey, aesKey));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(iv),
      const DeepCollectionEquality().hash(aesKey));

  /// Create a copy of Secret
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SecretImplCopyWith<_$SecretImpl> get copyWith =>
      __$$SecretImplCopyWithImpl<_$SecretImpl>(this, _$identity);
}

abstract class _Secret extends Secret {
  const factory _Secret(
      {@Uint8ListConverter() final Uint8List? iv,
      @Uint8ListConverter() final Uint8List? aesKey}) = _$SecretImpl;
  const _Secret._() : super._();

  @override
  @Uint8ListConverter()
  Uint8List? get iv;
  @override
  @Uint8ListConverter()
  Uint8List? get aesKey;

  /// Create a copy of Secret
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SecretImplCopyWith<_$SecretImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
