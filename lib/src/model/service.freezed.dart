// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

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
  String get derivationPath => throw _privateConstructorUsedError;
  String get curve => throw _privateConstructorUsedError;
  String get hashAlgo => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ServiceCopyWith<Service> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ServiceCopyWith<$Res> {
  factory $ServiceCopyWith(Service value, $Res Function(Service) then) =
      _$ServiceCopyWithImpl<$Res, Service>;
  @useResult
  $Res call({String derivationPath, String curve, String hashAlgo});
}

/// @nodoc
class _$ServiceCopyWithImpl<$Res, $Val extends Service>
    implements $ServiceCopyWith<$Res> {
  _$ServiceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? derivationPath = null,
    Object? curve = null,
    Object? hashAlgo = null,
  }) {
    return _then(_value.copyWith(
      derivationPath: null == derivationPath
          ? _value.derivationPath
          : derivationPath // ignore: cast_nullable_to_non_nullable
              as String,
      curve: null == curve
          ? _value.curve
          : curve // ignore: cast_nullable_to_non_nullable
              as String,
      hashAlgo: null == hashAlgo
          ? _value.hashAlgo
          : hashAlgo // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ServiceImplCopyWith<$Res> implements $ServiceCopyWith<$Res> {
  factory _$$ServiceImplCopyWith(
          _$ServiceImpl value, $Res Function(_$ServiceImpl) then) =
      __$$ServiceImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String derivationPath, String curve, String hashAlgo});
}

/// @nodoc
class __$$ServiceImplCopyWithImpl<$Res>
    extends _$ServiceCopyWithImpl<$Res, _$ServiceImpl>
    implements _$$ServiceImplCopyWith<$Res> {
  __$$ServiceImplCopyWithImpl(
      _$ServiceImpl _value, $Res Function(_$ServiceImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? derivationPath = null,
    Object? curve = null,
    Object? hashAlgo = null,
  }) {
    return _then(_$ServiceImpl(
      derivationPath: null == derivationPath
          ? _value.derivationPath
          : derivationPath // ignore: cast_nullable_to_non_nullable
              as String,
      curve: null == curve
          ? _value.curve
          : curve // ignore: cast_nullable_to_non_nullable
              as String,
      hashAlgo: null == hashAlgo
          ? _value.hashAlgo
          : hashAlgo // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ServiceImpl extends _Service {
  const _$ServiceImpl(
      {required this.derivationPath,
      this.curve = 'ed25519',
      this.hashAlgo = 'sha256'})
      : super._();

  factory _$ServiceImpl.fromJson(Map<String, dynamic> json) =>
      _$$ServiceImplFromJson(json);

  @override
  final String derivationPath;
  @override
  @JsonKey()
  final String curve;
  @override
  @JsonKey()
  final String hashAlgo;

  @override
  String toString() {
    return 'Service(derivationPath: $derivationPath, curve: $curve, hashAlgo: $hashAlgo)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ServiceImpl &&
            (identical(other.derivationPath, derivationPath) ||
                other.derivationPath == derivationPath) &&
            (identical(other.curve, curve) || other.curve == curve) &&
            (identical(other.hashAlgo, hashAlgo) ||
                other.hashAlgo == hashAlgo));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, derivationPath, curve, hashAlgo);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ServiceImplCopyWith<_$ServiceImpl> get copyWith =>
      __$$ServiceImplCopyWithImpl<_$ServiceImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ServiceImplToJson(
      this,
    );
  }
}

abstract class _Service extends Service {
  const factory _Service(
      {required final String derivationPath,
      final String curve,
      final String hashAlgo}) = _$ServiceImpl;
  const _Service._() : super._();

  factory _Service.fromJson(Map<String, dynamic> json) = _$ServiceImpl.fromJson;

  @override
  String get derivationPath;
  @override
  String get curve;
  @override
  String get hashAlgo;
  @override
  @JsonKey(ignore: true)
  _$$ServiceImplCopyWith<_$ServiceImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
