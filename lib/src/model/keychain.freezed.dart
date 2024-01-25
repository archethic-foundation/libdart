// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

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
  Map<String, Service> get services => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $KeychainCopyWith<Keychain> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $KeychainCopyWith<$Res> {
  factory $KeychainCopyWith(Keychain value, $Res Function(Keychain) then) =
      _$KeychainCopyWithImpl<$Res, Keychain>;
  @useResult
  $Res call(
      {@Uint8ListConverter() Uint8List? seed,
      int version,
      Map<String, Service> services});
}

/// @nodoc
class _$KeychainCopyWithImpl<$Res, $Val extends Keychain>
    implements $KeychainCopyWith<$Res> {
  _$KeychainCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? seed = freezed,
    Object? version = null,
    Object? services = null,
  }) {
    return _then(_value.copyWith(
      seed: freezed == seed
          ? _value.seed
          : seed // ignore: cast_nullable_to_non_nullable
              as Uint8List?,
      version: null == version
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as int,
      services: null == services
          ? _value.services
          : services // ignore: cast_nullable_to_non_nullable
              as Map<String, Service>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$KeychainImplCopyWith<$Res>
    implements $KeychainCopyWith<$Res> {
  factory _$$KeychainImplCopyWith(
          _$KeychainImpl value, $Res Function(_$KeychainImpl) then) =
      __$$KeychainImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@Uint8ListConverter() Uint8List? seed,
      int version,
      Map<String, Service> services});
}

/// @nodoc
class __$$KeychainImplCopyWithImpl<$Res>
    extends _$KeychainCopyWithImpl<$Res, _$KeychainImpl>
    implements _$$KeychainImplCopyWith<$Res> {
  __$$KeychainImplCopyWithImpl(
      _$KeychainImpl _value, $Res Function(_$KeychainImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? seed = freezed,
    Object? version = null,
    Object? services = null,
  }) {
    return _then(_$KeychainImpl(
      seed: freezed == seed
          ? _value.seed
          : seed // ignore: cast_nullable_to_non_nullable
              as Uint8List?,
      version: null == version
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as int,
      services: null == services
          ? _value._services
          : services // ignore: cast_nullable_to_non_nullable
              as Map<String, Service>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$KeychainImpl extends _Keychain {
  const _$KeychainImpl(
      {@Uint8ListConverter() this.seed,
      this.version = 1,
      final Map<String, Service> services = const {}})
      : _services = services,
        super._();

  factory _$KeychainImpl.fromJson(Map<String, dynamic> json) =>
      _$$KeychainImplFromJson(json);

  @override
  @Uint8ListConverter()
  final Uint8List? seed;
  @override
  @JsonKey()
  final int version;
  final Map<String, Service> _services;
  @override
  @JsonKey()
  Map<String, Service> get services {
    if (_services is EqualUnmodifiableMapView) return _services;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_services);
  }

  @override
  String toString() {
    return 'Keychain(seed: $seed, version: $version, services: $services)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$KeychainImpl &&
            const DeepCollectionEquality().equals(other.seed, seed) &&
            (identical(other.version, version) || other.version == version) &&
            const DeepCollectionEquality().equals(other._services, _services));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(seed),
      version,
      const DeepCollectionEquality().hash(_services));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$KeychainImplCopyWith<_$KeychainImpl> get copyWith =>
      __$$KeychainImplCopyWithImpl<_$KeychainImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$KeychainImplToJson(
      this,
    );
  }
}

abstract class _Keychain extends Keychain {
  const factory _Keychain(
      {@Uint8ListConverter() final Uint8List? seed,
      final int version,
      final Map<String, Service> services}) = _$KeychainImpl;
  const _Keychain._() : super._();

  factory _Keychain.fromJson(Map<String, dynamic> json) =
      _$KeychainImpl.fromJson;

  @override
  @Uint8ListConverter()
  Uint8List? get seed;
  @override
  int get version;
  @override
  Map<String, Service> get services;
  @override
  @JsonKey(ignore: true)
  _$$KeychainImplCopyWith<_$KeychainImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
