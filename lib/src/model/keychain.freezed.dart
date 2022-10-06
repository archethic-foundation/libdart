// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'keychain.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Keychain _$KeychainFromJson(Map<String, dynamic> json) {
  return _Keychain.fromJson(json);
}

/// @nodoc
mixin _$Keychain {
  @Uint8ListConverter()
  Uint8List? get seed => throw _privateConstructorUsedError;
  int get version => throw _privateConstructorUsedError;
  Map<String, Service>? get services => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $KeychainCopyWith<Keychain> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $KeychainCopyWith<$Res> {
  factory $KeychainCopyWith(Keychain value, $Res Function(Keychain) then) =
      _$KeychainCopyWithImpl<$Res>;
  $Res call(
      {@Uint8ListConverter() Uint8List? seed,
      int version,
      Map<String, Service>? services});
}

/// @nodoc
class _$KeychainCopyWithImpl<$Res> implements $KeychainCopyWith<$Res> {
  _$KeychainCopyWithImpl(this._value, this._then);

  final Keychain _value;
  // ignore: unused_field
  final $Res Function(Keychain) _then;

  @override
  $Res call({
    Object? seed = freezed,
    Object? version = freezed,
    Object? services = freezed,
  }) {
    return _then(_value.copyWith(
      seed: seed == freezed
          ? _value.seed
          : seed // ignore: cast_nullable_to_non_nullable
              as Uint8List?,
      version: version == freezed
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as int,
      services: services == freezed
          ? _value.services
          : services // ignore: cast_nullable_to_non_nullable
              as Map<String, Service>?,
    ));
  }
}

/// @nodoc
abstract class _$$_KeychainCopyWith<$Res> implements $KeychainCopyWith<$Res> {
  factory _$$_KeychainCopyWith(
          _$_Keychain value, $Res Function(_$_Keychain) then) =
      __$$_KeychainCopyWithImpl<$Res>;
  @override
  $Res call(
      {@Uint8ListConverter() Uint8List? seed,
      int version,
      Map<String, Service>? services});
}

/// @nodoc
class __$$_KeychainCopyWithImpl<$Res> extends _$KeychainCopyWithImpl<$Res>
    implements _$$_KeychainCopyWith<$Res> {
  __$$_KeychainCopyWithImpl(
      _$_Keychain _value, $Res Function(_$_Keychain) _then)
      : super(_value, (v) => _then(v as _$_Keychain));

  @override
  _$_Keychain get _value => super._value as _$_Keychain;

  @override
  $Res call({
    Object? seed = freezed,
    Object? version = freezed,
    Object? services = freezed,
  }) {
    return _then(_$_Keychain(
      seed: seed == freezed
          ? _value.seed
          : seed // ignore: cast_nullable_to_non_nullable
              as Uint8List?,
      version: version == freezed
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as int,
      services: services == freezed
          ? _value.services
          : services // ignore: cast_nullable_to_non_nullable
              as Map<String, Service>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Keychain extends _Keychain {
  const _$_Keychain(
      {@Uint8ListConverter() this.seed,
      this.version = 1,
      this.services = const {}})
      : super._();

  factory _$_Keychain.fromJson(Map<String, dynamic> json) =>
      _$$_KeychainFromJson(json);

  @override
  @Uint8ListConverter()
  final Uint8List? seed;
  @override
  @JsonKey()
  final int version;
  @override
  @JsonKey()
  final Map<String, Service>? services;

  @override
  String toString() {
    return 'Keychain(seed: $seed, version: $version, services: $services)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Keychain &&
            const DeepCollectionEquality().equals(other.seed, seed) &&
            const DeepCollectionEquality().equals(other.version, version) &&
            const DeepCollectionEquality().equals(other.services, services));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(seed),
      const DeepCollectionEquality().hash(version),
      const DeepCollectionEquality().hash(services));

  @JsonKey(ignore: true)
  @override
  _$$_KeychainCopyWith<_$_Keychain> get copyWith =>
      __$$_KeychainCopyWithImpl<_$_Keychain>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_KeychainToJson(
      this,
    );
  }
}

abstract class _Keychain extends Keychain {
  const factory _Keychain(
      {@Uint8ListConverter() final Uint8List? seed,
      final int version,
      final Map<String, Service>? services}) = _$_Keychain;
  const _Keychain._() : super._();

  factory _Keychain.fromJson(Map<String, dynamic> json) = _$_Keychain.fromJson;

  @override
  @Uint8ListConverter()
  Uint8List? get seed;
  @override
  int get version;
  @override
  Map<String, Service>? get services;
  @override
  @JsonKey(ignore: true)
  _$$_KeychainCopyWith<_$_Keychain> get copyWith =>
      throw _privateConstructorUsedError;
}
