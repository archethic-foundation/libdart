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
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Secret {
  List<int>? get iv => throw _privateConstructorUsedError;
  List<int>? get aesKey => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SecretCopyWith<Secret> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SecretCopyWith<$Res> {
  factory $SecretCopyWith(Secret value, $Res Function(Secret) then) =
      _$SecretCopyWithImpl<$Res, Secret>;
  @useResult
  $Res call({List<int>? iv, List<int>? aesKey});
}

/// @nodoc
class _$SecretCopyWithImpl<$Res, $Val extends Secret>
    implements $SecretCopyWith<$Res> {
  _$SecretCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

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
              as List<int>?,
      aesKey: freezed == aesKey
          ? _value.aesKey
          : aesKey // ignore: cast_nullable_to_non_nullable
              as List<int>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SecretCopyWith<$Res> implements $SecretCopyWith<$Res> {
  factory _$$_SecretCopyWith(_$_Secret value, $Res Function(_$_Secret) then) =
      __$$_SecretCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<int>? iv, List<int>? aesKey});
}

/// @nodoc
class __$$_SecretCopyWithImpl<$Res>
    extends _$SecretCopyWithImpl<$Res, _$_Secret>
    implements _$$_SecretCopyWith<$Res> {
  __$$_SecretCopyWithImpl(_$_Secret _value, $Res Function(_$_Secret) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? iv = freezed,
    Object? aesKey = freezed,
  }) {
    return _then(_$_Secret(
      iv: freezed == iv
          ? _value._iv
          : iv // ignore: cast_nullable_to_non_nullable
              as List<int>?,
      aesKey: freezed == aesKey
          ? _value._aesKey
          : aesKey // ignore: cast_nullable_to_non_nullable
              as List<int>?,
    ));
  }
}

/// @nodoc

class _$_Secret extends _Secret {
  const _$_Secret({final List<int>? iv, final List<int>? aesKey})
      : _iv = iv,
        _aesKey = aesKey,
        super._();

  final List<int>? _iv;
  @override
  List<int>? get iv {
    final value = _iv;
    if (value == null) return null;
    if (_iv is EqualUnmodifiableListView) return _iv;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<int>? _aesKey;
  @override
  List<int>? get aesKey {
    final value = _aesKey;
    if (value == null) return null;
    if (_aesKey is EqualUnmodifiableListView) return _aesKey;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'Secret(iv: $iv, aesKey: $aesKey)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Secret &&
            const DeepCollectionEquality().equals(other._iv, _iv) &&
            const DeepCollectionEquality().equals(other._aesKey, _aesKey));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_iv),
      const DeepCollectionEquality().hash(_aesKey));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SecretCopyWith<_$_Secret> get copyWith =>
      __$$_SecretCopyWithImpl<_$_Secret>(this, _$identity);
}

abstract class _Secret extends Secret {
  const factory _Secret({final List<int>? iv, final List<int>? aesKey}) =
      _$_Secret;
  const _Secret._() : super._();

  @override
  List<int>? get iv;
  @override
  List<int>? get aesKey;
  @override
  @JsonKey(ignore: true)
  _$$_SecretCopyWith<_$_Secret> get copyWith =>
      throw _privateConstructorUsedError;
}
