// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'hosting.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Hosting _$HostingFromJson(Map<String, dynamic> json) {
  return _Hosting.fromJson(json);
}

/// @nodoc
mixin _$Hosting {
  int get aewebVersion => throw _privateConstructorUsedError;
  String get hashFunction => throw _privateConstructorUsedError;
  Map<String, HostingContentMetaData> get metaData =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $HostingCopyWith<Hosting> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HostingCopyWith<$Res> {
  factory $HostingCopyWith(Hosting value, $Res Function(Hosting) then) =
      _$HostingCopyWithImpl<$Res, Hosting>;
  @useResult
  $Res call(
      {int aewebVersion,
      String hashFunction,
      Map<String, HostingContentMetaData> metaData});
}

/// @nodoc
class _$HostingCopyWithImpl<$Res, $Val extends Hosting>
    implements $HostingCopyWith<$Res> {
  _$HostingCopyWithImpl(this._value, this._then);

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
              as Map<String, HostingContentMetaData>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_HostingCopyWith<$Res> implements $HostingCopyWith<$Res> {
  factory _$$_HostingCopyWith(
          _$_Hosting value, $Res Function(_$_Hosting) then) =
      __$$_HostingCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int aewebVersion,
      String hashFunction,
      Map<String, HostingContentMetaData> metaData});
}

/// @nodoc
class __$$_HostingCopyWithImpl<$Res>
    extends _$HostingCopyWithImpl<$Res, _$_Hosting>
    implements _$$_HostingCopyWith<$Res> {
  __$$_HostingCopyWithImpl(_$_Hosting _value, $Res Function(_$_Hosting) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? aewebVersion = null,
    Object? hashFunction = null,
    Object? metaData = null,
  }) {
    return _then(_$_Hosting(
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
              as Map<String, HostingContentMetaData>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Hosting extends _Hosting {
  const _$_Hosting(
      {this.aewebVersion = 1,
      this.hashFunction = 'sha1',
      final Map<String, HostingContentMetaData> metaData = const {}})
      : _metaData = metaData,
        super._();

  factory _$_Hosting.fromJson(Map<String, dynamic> json) =>
      _$$_HostingFromJson(json);

  @override
  @JsonKey()
  final int aewebVersion;
  @override
  @JsonKey()
  final String hashFunction;
  final Map<String, HostingContentMetaData> _metaData;
  @override
  @JsonKey()
  Map<String, HostingContentMetaData> get metaData {
    if (_metaData is EqualUnmodifiableMapView) return _metaData;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_metaData);
  }

  @override
  String toString() {
    return 'Hosting(aewebVersion: $aewebVersion, hashFunction: $hashFunction, metaData: $metaData)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Hosting &&
            (identical(other.aewebVersion, aewebVersion) ||
                other.aewebVersion == aewebVersion) &&
            (identical(other.hashFunction, hashFunction) ||
                other.hashFunction == hashFunction) &&
            const DeepCollectionEquality().equals(other._metaData, _metaData));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, aewebVersion, hashFunction,
      const DeepCollectionEquality().hash(_metaData));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_HostingCopyWith<_$_Hosting> get copyWith =>
      __$$_HostingCopyWithImpl<_$_Hosting>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_HostingToJson(
      this,
    );
  }
}

abstract class _Hosting extends Hosting {
  const factory _Hosting(
      {final int aewebVersion,
      final String hashFunction,
      final Map<String, HostingContentMetaData> metaData}) = _$_Hosting;
  const _Hosting._() : super._();

  factory _Hosting.fromJson(Map<String, dynamic> json) = _$_Hosting.fromJson;

  @override
  int get aewebVersion;
  @override
  String get hashFunction;
  @override
  Map<String, HostingContentMetaData> get metaData;
  @override
  @JsonKey(ignore: true)
  _$$_HostingCopyWith<_$_Hosting> get copyWith =>
      throw _privateConstructorUsedError;
}
