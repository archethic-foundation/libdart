// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'hosting_ref_content_metadata.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

HostingRefContentMetaData _$HostingRefContentMetaDataFromJson(
    Map<String, dynamic> json) {
  return _HostingRefContentMetaData.fromJson(json);
}

/// @nodoc
mixin _$HostingRefContentMetaData {
  String get hash => throw _privateConstructorUsedError;
  int get size => throw _privateConstructorUsedError;
  String get encoding => throw _privateConstructorUsedError;
  List<String> get addresses => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $HostingRefContentMetaDataCopyWith<HostingRefContentMetaData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HostingRefContentMetaDataCopyWith<$Res> {
  factory $HostingRefContentMetaDataCopyWith(HostingRefContentMetaData value,
          $Res Function(HostingRefContentMetaData) then) =
      _$HostingRefContentMetaDataCopyWithImpl<$Res, HostingRefContentMetaData>;
  @useResult
  $Res call({String hash, int size, String encoding, List<String> addresses});
}

/// @nodoc
class _$HostingRefContentMetaDataCopyWithImpl<$Res,
        $Val extends HostingRefContentMetaData>
    implements $HostingRefContentMetaDataCopyWith<$Res> {
  _$HostingRefContentMetaDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? hash = null,
    Object? size = null,
    Object? encoding = null,
    Object? addresses = null,
  }) {
    return _then(_value.copyWith(
      hash: null == hash
          ? _value.hash
          : hash // ignore: cast_nullable_to_non_nullable
              as String,
      size: null == size
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as int,
      encoding: null == encoding
          ? _value.encoding
          : encoding // ignore: cast_nullable_to_non_nullable
              as String,
      addresses: null == addresses
          ? _value.addresses
          : addresses // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$HostingRefContentMetaDataImplCopyWith<$Res>
    implements $HostingRefContentMetaDataCopyWith<$Res> {
  factory _$$HostingRefContentMetaDataImplCopyWith(
          _$HostingRefContentMetaDataImpl value,
          $Res Function(_$HostingRefContentMetaDataImpl) then) =
      __$$HostingRefContentMetaDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String hash, int size, String encoding, List<String> addresses});
}

/// @nodoc
class __$$HostingRefContentMetaDataImplCopyWithImpl<$Res>
    extends _$HostingRefContentMetaDataCopyWithImpl<$Res,
        _$HostingRefContentMetaDataImpl>
    implements _$$HostingRefContentMetaDataImplCopyWith<$Res> {
  __$$HostingRefContentMetaDataImplCopyWithImpl(
      _$HostingRefContentMetaDataImpl _value,
      $Res Function(_$HostingRefContentMetaDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? hash = null,
    Object? size = null,
    Object? encoding = null,
    Object? addresses = null,
  }) {
    return _then(_$HostingRefContentMetaDataImpl(
      hash: null == hash
          ? _value.hash
          : hash // ignore: cast_nullable_to_non_nullable
              as String,
      size: null == size
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as int,
      encoding: null == encoding
          ? _value.encoding
          : encoding // ignore: cast_nullable_to_non_nullable
              as String,
      addresses: null == addresses
          ? _value._addresses
          : addresses // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$HostingRefContentMetaDataImpl extends _HostingRefContentMetaData {
  const _$HostingRefContentMetaDataImpl(
      {this.hash = '',
      this.size = 0,
      this.encoding = '',
      final List<String> addresses = const []})
      : _addresses = addresses,
        super._();

  factory _$HostingRefContentMetaDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$HostingRefContentMetaDataImplFromJson(json);

  @override
  @JsonKey()
  final String hash;
  @override
  @JsonKey()
  final int size;
  @override
  @JsonKey()
  final String encoding;
  final List<String> _addresses;
  @override
  @JsonKey()
  List<String> get addresses {
    if (_addresses is EqualUnmodifiableListView) return _addresses;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_addresses);
  }

  @override
  String toString() {
    return 'HostingRefContentMetaData(hash: $hash, size: $size, encoding: $encoding, addresses: $addresses)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HostingRefContentMetaDataImpl &&
            (identical(other.hash, hash) || other.hash == hash) &&
            (identical(other.size, size) || other.size == size) &&
            (identical(other.encoding, encoding) ||
                other.encoding == encoding) &&
            const DeepCollectionEquality()
                .equals(other._addresses, _addresses));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, hash, size, encoding,
      const DeepCollectionEquality().hash(_addresses));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$HostingRefContentMetaDataImplCopyWith<_$HostingRefContentMetaDataImpl>
      get copyWith => __$$HostingRefContentMetaDataImplCopyWithImpl<
          _$HostingRefContentMetaDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$HostingRefContentMetaDataImplToJson(
      this,
    );
  }
}

abstract class _HostingRefContentMetaData extends HostingRefContentMetaData {
  const factory _HostingRefContentMetaData(
      {final String hash,
      final int size,
      final String encoding,
      final List<String> addresses}) = _$HostingRefContentMetaDataImpl;
  const _HostingRefContentMetaData._() : super._();

  factory _HostingRefContentMetaData.fromJson(Map<String, dynamic> json) =
      _$HostingRefContentMetaDataImpl.fromJson;

  @override
  String get hash;
  @override
  int get size;
  @override
  String get encoding;
  @override
  List<String> get addresses;
  @override
  @JsonKey(ignore: true)
  _$$HostingRefContentMetaDataImplCopyWith<_$HostingRefContentMetaDataImpl>
      get copyWith => throw _privateConstructorUsedError;
}
