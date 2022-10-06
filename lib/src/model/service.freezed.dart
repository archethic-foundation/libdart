// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'service.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Service _$ServiceFromJson(Map<String, dynamic> json) {
  return _Service.fromJson(json);
}

/// @nodoc
mixin _$Service {
  String? get derivationPath => throw _privateConstructorUsedError;
  String? get curve => throw _privateConstructorUsedError;
  String? get hashAlgo => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ServiceCopyWith<Service> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ServiceCopyWith<$Res> {
  factory $ServiceCopyWith(Service value, $Res Function(Service) then) =
      _$ServiceCopyWithImpl<$Res>;
  $Res call({String? derivationPath, String? curve, String? hashAlgo});
}

/// @nodoc
class _$ServiceCopyWithImpl<$Res> implements $ServiceCopyWith<$Res> {
  _$ServiceCopyWithImpl(this._value, this._then);

  final Service _value;
  // ignore: unused_field
  final $Res Function(Service) _then;

  @override
  $Res call({
    Object? derivationPath = freezed,
    Object? curve = freezed,
    Object? hashAlgo = freezed,
  }) {
    return _then(_value.copyWith(
      derivationPath: derivationPath == freezed
          ? _value.derivationPath
          : derivationPath // ignore: cast_nullable_to_non_nullable
              as String?,
      curve: curve == freezed
          ? _value.curve
          : curve // ignore: cast_nullable_to_non_nullable
              as String?,
      hashAlgo: hashAlgo == freezed
          ? _value.hashAlgo
          : hashAlgo // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$$_ServiceCopyWith<$Res> implements $ServiceCopyWith<$Res> {
  factory _$$_ServiceCopyWith(
          _$_Service value, $Res Function(_$_Service) then) =
      __$$_ServiceCopyWithImpl<$Res>;
  @override
  $Res call({String? derivationPath, String? curve, String? hashAlgo});
}

/// @nodoc
class __$$_ServiceCopyWithImpl<$Res> extends _$ServiceCopyWithImpl<$Res>
    implements _$$_ServiceCopyWith<$Res> {
  __$$_ServiceCopyWithImpl(_$_Service _value, $Res Function(_$_Service) _then)
      : super(_value, (v) => _then(v as _$_Service));

  @override
  _$_Service get _value => super._value as _$_Service;

  @override
  $Res call({
    Object? derivationPath = freezed,
    Object? curve = freezed,
    Object? hashAlgo = freezed,
  }) {
    return _then(_$_Service(
      derivationPath: derivationPath == freezed
          ? _value.derivationPath
          : derivationPath // ignore: cast_nullable_to_non_nullable
              as String?,
      curve: curve == freezed
          ? _value.curve
          : curve // ignore: cast_nullable_to_non_nullable
              as String?,
      hashAlgo: hashAlgo == freezed
          ? _value.hashAlgo
          : hashAlgo // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Service extends _Service {
  const _$_Service({this.derivationPath, this.curve, this.hashAlgo})
      : super._();

  factory _$_Service.fromJson(Map<String, dynamic> json) =>
      _$$_ServiceFromJson(json);

  @override
  final String? derivationPath;
  @override
  final String? curve;
  @override
  final String? hashAlgo;

  @override
  String toString() {
    return 'Service(derivationPath: $derivationPath, curve: $curve, hashAlgo: $hashAlgo)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Service &&
            const DeepCollectionEquality()
                .equals(other.derivationPath, derivationPath) &&
            const DeepCollectionEquality().equals(other.curve, curve) &&
            const DeepCollectionEquality().equals(other.hashAlgo, hashAlgo));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(derivationPath),
      const DeepCollectionEquality().hash(curve),
      const DeepCollectionEquality().hash(hashAlgo));

  @JsonKey(ignore: true)
  @override
  _$$_ServiceCopyWith<_$_Service> get copyWith =>
      __$$_ServiceCopyWithImpl<_$_Service>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ServiceToJson(
      this,
    );
  }
}

abstract class _Service extends Service {
  const factory _Service(
      {final String? derivationPath,
      final String? curve,
      final String? hashAlgo}) = _$_Service;
  const _Service._() : super._();

  factory _Service.fromJson(Map<String, dynamic> json) = _$_Service.fromJson;

  @override
  String? get derivationPath;
  @override
  String? get curve;
  @override
  String? get hashAlgo;
  @override
  @JsonKey(ignore: true)
  _$$_ServiceCopyWith<_$_Service> get copyWith =>
      throw _privateConstructorUsedError;
}
