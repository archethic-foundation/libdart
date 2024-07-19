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
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

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

  /// Serializes this HostingRef to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of HostingRef
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
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

  /// Create a copy of HostingRef
  /// with the given fields replaced by the non-null parameter values.
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
abstract class _$$HostingRefImplCopyWith<$Res>
    implements $HostingRefCopyWith<$Res> {
  factory _$$HostingRefImplCopyWith(
          _$HostingRefImpl value, $Res Function(_$HostingRefImpl) then) =
      __$$HostingRefImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int aewebVersion,
      String hashFunction,
      Map<String, HostingRefContentMetaData> metaData,
      String sslCertificate});
}

/// @nodoc
class __$$HostingRefImplCopyWithImpl<$Res>
    extends _$HostingRefCopyWithImpl<$Res, _$HostingRefImpl>
    implements _$$HostingRefImplCopyWith<$Res> {
  __$$HostingRefImplCopyWithImpl(
      _$HostingRefImpl _value, $Res Function(_$HostingRefImpl) _then)
      : super(_value, _then);

  /// Create a copy of HostingRef
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? aewebVersion = null,
    Object? hashFunction = null,
    Object? metaData = null,
    Object? sslCertificate = null,
  }) {
    return _then(_$HostingRefImpl(
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
class _$HostingRefImpl extends _HostingRef {
  const _$HostingRefImpl(
      {this.aewebVersion = 1,
      this.hashFunction = 'sha1',
      final Map<String, HostingRefContentMetaData> metaData = const {},
      this.sslCertificate = ''})
      : _metaData = metaData,
        super._();

  factory _$HostingRefImpl.fromJson(Map<String, dynamic> json) =>
      _$$HostingRefImplFromJson(json);

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
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HostingRefImpl &&
            (identical(other.aewebVersion, aewebVersion) ||
                other.aewebVersion == aewebVersion) &&
            (identical(other.hashFunction, hashFunction) ||
                other.hashFunction == hashFunction) &&
            const DeepCollectionEquality().equals(other._metaData, _metaData) &&
            (identical(other.sslCertificate, sslCertificate) ||
                other.sslCertificate == sslCertificate));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, aewebVersion, hashFunction,
      const DeepCollectionEquality().hash(_metaData), sslCertificate);

  /// Create a copy of HostingRef
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HostingRefImplCopyWith<_$HostingRefImpl> get copyWith =>
      __$$HostingRefImplCopyWithImpl<_$HostingRefImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$HostingRefImplToJson(
      this,
    );
  }
}

abstract class _HostingRef extends HostingRef {
  const factory _HostingRef(
      {final int aewebVersion,
      final String hashFunction,
      final Map<String, HostingRefContentMetaData> metaData,
      final String sslCertificate}) = _$HostingRefImpl;
  const _HostingRef._() : super._();

  factory _HostingRef.fromJson(Map<String, dynamic> json) =
      _$HostingRefImpl.fromJson;

  @override
  int get aewebVersion;
  @override
  String get hashFunction;
  @override
  Map<String, HostingRefContentMetaData> get metaData;
  @override
  String get sslCertificate;

  /// Create a copy of HostingRef
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HostingRefImplCopyWith<_$HostingRefImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
