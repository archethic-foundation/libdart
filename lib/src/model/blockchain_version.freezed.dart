// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'blockchain_version.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

BlockchainVersionModel _$BlockchainVersionModelFromJson(
    Map<String, dynamic> json) {
  return _BlockchainVersionModel.fromJson(json);
}

/// @nodoc
mixin _$BlockchainVersionModel {
  BlockchainVersion get version => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BlockchainVersionModelCopyWith<BlockchainVersionModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BlockchainVersionModelCopyWith<$Res> {
  factory $BlockchainVersionModelCopyWith(BlockchainVersionModel value,
          $Res Function(BlockchainVersionModel) then) =
      _$BlockchainVersionModelCopyWithImpl<$Res, BlockchainVersionModel>;
  @useResult
  $Res call({BlockchainVersion version});

  $BlockchainVersionCopyWith<$Res> get version;
}

/// @nodoc
class _$BlockchainVersionModelCopyWithImpl<$Res,
        $Val extends BlockchainVersionModel>
    implements $BlockchainVersionModelCopyWith<$Res> {
  _$BlockchainVersionModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? version = null,
  }) {
    return _then(_value.copyWith(
      version: null == version
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as BlockchainVersion,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $BlockchainVersionCopyWith<$Res> get version {
    return $BlockchainVersionCopyWith<$Res>(_value.version, (value) {
      return _then(_value.copyWith(version: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$BlockchainVersionModelImplCopyWith<$Res>
    implements $BlockchainVersionModelCopyWith<$Res> {
  factory _$$BlockchainVersionModelImplCopyWith(
          _$BlockchainVersionModelImpl value,
          $Res Function(_$BlockchainVersionModelImpl) then) =
      __$$BlockchainVersionModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({BlockchainVersion version});

  @override
  $BlockchainVersionCopyWith<$Res> get version;
}

/// @nodoc
class __$$BlockchainVersionModelImplCopyWithImpl<$Res>
    extends _$BlockchainVersionModelCopyWithImpl<$Res,
        _$BlockchainVersionModelImpl>
    implements _$$BlockchainVersionModelImplCopyWith<$Res> {
  __$$BlockchainVersionModelImplCopyWithImpl(
      _$BlockchainVersionModelImpl _value,
      $Res Function(_$BlockchainVersionModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? version = null,
  }) {
    return _then(_$BlockchainVersionModelImpl(
      version: null == version
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as BlockchainVersion,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BlockchainVersionModelImpl implements _BlockchainVersionModel {
  const _$BlockchainVersionModelImpl({required this.version});

  factory _$BlockchainVersionModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$BlockchainVersionModelImplFromJson(json);

  @override
  final BlockchainVersion version;

  @override
  String toString() {
    return 'BlockchainVersionModel(version: $version)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BlockchainVersionModelImpl &&
            (identical(other.version, version) || other.version == version));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, version);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BlockchainVersionModelImplCopyWith<_$BlockchainVersionModelImpl>
      get copyWith => __$$BlockchainVersionModelImplCopyWithImpl<
          _$BlockchainVersionModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BlockchainVersionModelImplToJson(
      this,
    );
  }
}

abstract class _BlockchainVersionModel implements BlockchainVersionModel {
  const factory _BlockchainVersionModel(
          {required final BlockchainVersion version}) =
      _$BlockchainVersionModelImpl;

  factory _BlockchainVersionModel.fromJson(Map<String, dynamic> json) =
      _$BlockchainVersionModelImpl.fromJson;

  @override
  BlockchainVersion get version;
  @override
  @JsonKey(ignore: true)
  _$$BlockchainVersionModelImplCopyWith<_$BlockchainVersionModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

BlockchainVersion _$BlockchainVersionFromJson(Map<String, dynamic> json) {
  return _BlockchainVersion.fromJson(json);
}

/// @nodoc
mixin _$BlockchainVersion {
  String? get code => throw _privateConstructorUsedError;
  String get protocol => throw _privateConstructorUsedError;
  String get transaction => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BlockchainVersionCopyWith<BlockchainVersion> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BlockchainVersionCopyWith<$Res> {
  factory $BlockchainVersionCopyWith(
          BlockchainVersion value, $Res Function(BlockchainVersion) then) =
      _$BlockchainVersionCopyWithImpl<$Res, BlockchainVersion>;
  @useResult
  $Res call({String? code, String protocol, String transaction});
}

/// @nodoc
class _$BlockchainVersionCopyWithImpl<$Res, $Val extends BlockchainVersion>
    implements $BlockchainVersionCopyWith<$Res> {
  _$BlockchainVersionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = freezed,
    Object? protocol = null,
    Object? transaction = null,
  }) {
    return _then(_value.copyWith(
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      protocol: null == protocol
          ? _value.protocol
          : protocol // ignore: cast_nullable_to_non_nullable
              as String,
      transaction: null == transaction
          ? _value.transaction
          : transaction // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BlockchainVersionImplCopyWith<$Res>
    implements $BlockchainVersionCopyWith<$Res> {
  factory _$$BlockchainVersionImplCopyWith(_$BlockchainVersionImpl value,
          $Res Function(_$BlockchainVersionImpl) then) =
      __$$BlockchainVersionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? code, String protocol, String transaction});
}

/// @nodoc
class __$$BlockchainVersionImplCopyWithImpl<$Res>
    extends _$BlockchainVersionCopyWithImpl<$Res, _$BlockchainVersionImpl>
    implements _$$BlockchainVersionImplCopyWith<$Res> {
  __$$BlockchainVersionImplCopyWithImpl(_$BlockchainVersionImpl _value,
      $Res Function(_$BlockchainVersionImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = freezed,
    Object? protocol = null,
    Object? transaction = null,
  }) {
    return _then(_$BlockchainVersionImpl(
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      protocol: null == protocol
          ? _value.protocol
          : protocol // ignore: cast_nullable_to_non_nullable
              as String,
      transaction: null == transaction
          ? _value.transaction
          : transaction // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BlockchainVersionImpl implements _BlockchainVersion {
  const _$BlockchainVersionImpl(
      {this.code, required this.protocol, required this.transaction});

  factory _$BlockchainVersionImpl.fromJson(Map<String, dynamic> json) =>
      _$$BlockchainVersionImplFromJson(json);

  @override
  final String? code;
  @override
  final String protocol;
  @override
  final String transaction;

  @override
  String toString() {
    return 'BlockchainVersion(code: $code, protocol: $protocol, transaction: $transaction)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BlockchainVersionImpl &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.protocol, protocol) ||
                other.protocol == protocol) &&
            (identical(other.transaction, transaction) ||
                other.transaction == transaction));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, code, protocol, transaction);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BlockchainVersionImplCopyWith<_$BlockchainVersionImpl> get copyWith =>
      __$$BlockchainVersionImplCopyWithImpl<_$BlockchainVersionImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BlockchainVersionImplToJson(
      this,
    );
  }
}

abstract class _BlockchainVersion implements BlockchainVersion {
  const factory _BlockchainVersion(
      {final String? code,
      required final String protocol,
      required final String transaction}) = _$BlockchainVersionImpl;

  factory _BlockchainVersion.fromJson(Map<String, dynamic> json) =
      _$BlockchainVersionImpl.fromJson;

  @override
  String? get code;
  @override
  String get protocol;
  @override
  String get transaction;
  @override
  @JsonKey(ignore: true)
  _$$BlockchainVersionImplCopyWith<_$BlockchainVersionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
