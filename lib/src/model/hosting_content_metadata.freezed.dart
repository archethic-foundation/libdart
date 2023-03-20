// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'hosting_content_metadata.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

HostingContentMetaData _$HostingContentMetaDataFromJson(
    Map<String, dynamic> json) {
  return _HostingContentMetaData.fromJson(json);
}

/// @nodoc
mixin _$HostingContentMetaData {
  String get hash => throw _privateConstructorUsedError;
  int get size => throw _privateConstructorUsedError;
  String get encoding => throw _privateConstructorUsedError;
  List<String> get addresses => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $HostingContentMetaDataCopyWith<HostingContentMetaData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HostingContentMetaDataCopyWith<$Res> {
  factory $HostingContentMetaDataCopyWith(HostingContentMetaData value,
          $Res Function(HostingContentMetaData) then) =
      _$HostingContentMetaDataCopyWithImpl<$Res, HostingContentMetaData>;
  @useResult
  $Res call({String hash, int size, String encoding, List<String> addresses});
}

/// @nodoc
class _$HostingContentMetaDataCopyWithImpl<$Res,
        $Val extends HostingContentMetaData>
    implements $HostingContentMetaDataCopyWith<$Res> {
  _$HostingContentMetaDataCopyWithImpl(this._value, this._then);

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
abstract class _$$_HostingContentMetaDataCopyWith<$Res>
    implements $HostingContentMetaDataCopyWith<$Res> {
  factory _$$_HostingContentMetaDataCopyWith(_$_HostingContentMetaData value,
          $Res Function(_$_HostingContentMetaData) then) =
      __$$_HostingContentMetaDataCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String hash, int size, String encoding, List<String> addresses});
}

/// @nodoc
class __$$_HostingContentMetaDataCopyWithImpl<$Res>
    extends _$HostingContentMetaDataCopyWithImpl<$Res,
        _$_HostingContentMetaData>
    implements _$$_HostingContentMetaDataCopyWith<$Res> {
  __$$_HostingContentMetaDataCopyWithImpl(_$_HostingContentMetaData _value,
      $Res Function(_$_HostingContentMetaData) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? hash = null,
    Object? size = null,
    Object? encoding = null,
    Object? addresses = null,
  }) {
    return _then(_$_HostingContentMetaData(
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
class _$_HostingContentMetaData extends _HostingContentMetaData {
  const _$_HostingContentMetaData(
      {this.hash = '',
      this.size = 0,
      this.encoding = '',
      final List<String> addresses = const []})
      : _addresses = addresses,
        super._();

  factory _$_HostingContentMetaData.fromJson(Map<String, dynamic> json) =>
      _$$_HostingContentMetaDataFromJson(json);

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
    return 'HostingContentMetaData(hash: $hash, size: $size, encoding: $encoding, addresses: $addresses)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_HostingContentMetaData &&
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
  _$$_HostingContentMetaDataCopyWith<_$_HostingContentMetaData> get copyWith =>
      __$$_HostingContentMetaDataCopyWithImpl<_$_HostingContentMetaData>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_HostingContentMetaDataToJson(
      this,
    );
  }
}

abstract class _HostingContentMetaData extends HostingContentMetaData {
  const factory _HostingContentMetaData(
      {final String hash,
      final int size,
      final String encoding,
      final List<String> addresses}) = _$_HostingContentMetaData;
  const _HostingContentMetaData._() : super._();

  factory _HostingContentMetaData.fromJson(Map<String, dynamic> json) =
      _$_HostingContentMetaData.fromJson;

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
  _$$_HostingContentMetaDataCopyWith<_$_HostingContentMetaData> get copyWith =>
      throw _privateConstructorUsedError;
}
