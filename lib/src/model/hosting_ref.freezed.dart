// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'hosting_ref.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

HostingRef _$HostingRefFromJson(Map<String, dynamic> json) {
  return _HostingRef.fromJson(json);
}

/// @nodoc
mixin _$HostingRef {
  int get aewebVersion => throw _privateConstructorUsedError;
  String get hashFunction => throw _privateConstructorUsedError;
  Map<String, HostingRefContentMetaData> get metaData =>
      throw _privateConstructorUsedError;
  String get sslCertificate => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $HostingRefCopyWith<HostingRef> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HostingRefCopyWith<$Res> {
  factory $HostingRefCopyWith(
          HostingRef value, $Res Function(HostingRef) then) =
      _$HostingRefCopyWithImpl<$Res, HostingRef>;
  @useResult
  $Res call(
      {int aewebVersion,
      String hashFunction,
      Map<String, HostingRefContentMetaData> metaData,
      String sslCertificate});
}

/// @nodoc
class _$HostingRefCopyWithImpl<$Res, $Val extends HostingRef>
    implements $HostingRefCopyWith<$Res> {
  _$HostingRefCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? aewebVersion = null,
    Object? hashFunction = null,
    Object? metaData = null,
    Object? sslCertificate = null,
  }) {
    return _then(_value.copyWith(
      aewebVersion: null == aewebVersion
          ? _value.aewebVersion
          : aewebVersion // ignore: cast_nullable_to_non_nullable
              as int,
      hashFunction: null == hashFunction
          ? _value.hashFunction
          : hashFunction // ignore: cast_nullable_to_non_nullable
              as String,
      metaData: null == metaData
          ? _value.metaData
          : metaData // ignore: cast_nullable_to_non_nullable
              as Map<String, HostingRefContentMetaData>,
      sslCertificate: null == sslCertificate
          ? _value.sslCertificate
          : sslCertificate // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_HostingRefCopyWith<$Res>
    implements $HostingRefCopyWith<$Res> {
  factory _$$_HostingRefCopyWith(
          _$_HostingRef value, $Res Function(_$_HostingRef) then) =
      __$$_HostingRefCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int aewebVersion,
      String hashFunction,
      Map<String, HostingRefContentMetaData> metaData,
      String sslCertificate});
}

/// @nodoc
class __$$_HostingRefCopyWithImpl<$Res>
    extends _$HostingRefCopyWithImpl<$Res, _$_HostingRef>
    implements _$$_HostingRefCopyWith<$Res> {
  __$$_HostingRefCopyWithImpl(
      _$_HostingRef _value, $Res Function(_$_HostingRef) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? aewebVersion = null,
    Object? hashFunction = null,
    Object? metaData = null,
    Object? sslCertificate = null,
  }) {
    return _then(_$_HostingRef(
      aewebVersion: null == aewebVersion
          ? _value.aewebVersion
          : aewebVersion // ignore: cast_nullable_to_non_nullable
              as int,
      hashFunction: null == hashFunction
          ? _value.hashFunction
          : hashFunction // ignore: cast_nullable_to_non_nullable
              as String,
      metaData: null == metaData
          ? _value._metaData
          : metaData // ignore: cast_nullable_to_non_nullable
              as Map<String, HostingRefContentMetaData>,
      sslCertificate: null == sslCertificate
          ? _value.sslCertificate
          : sslCertificate // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_HostingRef extends _HostingRef {
  const _$_HostingRef(
      {this.aewebVersion = 1,
      this.hashFunction = 'sha1',
      final Map<String, HostingRefContentMetaData> metaData = const {},
      this.sslCertificate = ''})
      : _metaData = metaData,
        super._();

  factory _$_HostingRef.fromJson(Map<String, dynamic> json) =>
      _$$_HostingRefFromJson(json);

  @override
  @JsonKey()
  final int aewebVersion;
  @override
  @JsonKey()
  final String hashFunction;
  final Map<String, HostingRefContentMetaData> _metaData;
  @override
  @JsonKey()
  Map<String, HostingRefContentMetaData> get metaData {
    if (_metaData is EqualUnmodifiableMapView) return _metaData;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_metaData);
  }

  @override
  @JsonKey()
  final String sslCertificate;

  @override
  String toString() {
    return 'HostingRef(aewebVersion: $aewebVersion, hashFunction: $hashFunction, metaData: $metaData, sslCertificate: $sslCertificate)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_HostingRef &&
            (identical(other.aewebVersion, aewebVersion) ||
                other.aewebVersion == aewebVersion) &&
            (identical(other.hashFunction, hashFunction) ||
                other.hashFunction == hashFunction) &&
            const DeepCollectionEquality().equals(other._metaData, _metaData) &&
            (identical(other.sslCertificate, sslCertificate) ||
                other.sslCertificate == sslCertificate));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, aewebVersion, hashFunction,
      const DeepCollectionEquality().hash(_metaData), sslCertificate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_HostingRefCopyWith<_$_HostingRef> get copyWith =>
      __$$_HostingRefCopyWithImpl<_$_HostingRef>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_HostingRefToJson(
      this,
    );
  }
}

abstract class _HostingRef extends HostingRef {
  const factory _HostingRef(
      {final int aewebVersion,
      final String hashFunction,
      final Map<String, HostingRefContentMetaData> metaData,
      final String sslCertificate}) = _$_HostingRef;
  const _HostingRef._() : super._();

  factory _HostingRef.fromJson(Map<String, dynamic> json) =
      _$_HostingRef.fromJson;

  @override
  int get aewebVersion;
  @override
  String get hashFunction;
  @override
  Map<String, HostingRefContentMetaData> get metaData;
  @override
  String get sslCertificate;
  @override
  @JsonKey(ignore: true)
  _$$_HostingRefCopyWith<_$_HostingRef> get copyWith =>
      throw _privateConstructorUsedError;
}
