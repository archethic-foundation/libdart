// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'endpoint.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Endpoint _$EndpointFromJson(Map<String, dynamic> json) {
  return _Endpoint.fromJson(json);
}

/// @nodoc
mixin _$Endpoint {
  String get ip => throw _privateConstructorUsedError;
  int get port => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EndpointCopyWith<Endpoint> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EndpointCopyWith<$Res> {
  factory $EndpointCopyWith(Endpoint value, $Res Function(Endpoint) then) =
      _$EndpointCopyWithImpl<$Res, Endpoint>;
  @useResult
  $Res call({String ip, int port});
}

/// @nodoc
class _$EndpointCopyWithImpl<$Res, $Val extends Endpoint>
    implements $EndpointCopyWith<$Res> {
  _$EndpointCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ip = null,
    Object? port = null,
  }) {
    return _then(_value.copyWith(
      ip: null == ip
          ? _value.ip
          : ip // ignore: cast_nullable_to_non_nullable
              as String,
      port: null == port
          ? _value.port
          : port // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EndpointImplCopyWith<$Res>
    implements $EndpointCopyWith<$Res> {
  factory _$$EndpointImplCopyWith(
          _$EndpointImpl value, $Res Function(_$EndpointImpl) then) =
      __$$EndpointImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String ip, int port});
}

/// @nodoc
class __$$EndpointImplCopyWithImpl<$Res>
    extends _$EndpointCopyWithImpl<$Res, _$EndpointImpl>
    implements _$$EndpointImplCopyWith<$Res> {
  __$$EndpointImplCopyWithImpl(
      _$EndpointImpl _value, $Res Function(_$EndpointImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ip = null,
    Object? port = null,
  }) {
    return _then(_$EndpointImpl(
      ip: null == ip
          ? _value.ip
          : ip // ignore: cast_nullable_to_non_nullable
              as String,
      port: null == port
          ? _value.port
          : port // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$EndpointImpl extends _Endpoint {
  const _$EndpointImpl({this.ip = '', this.port = 0}) : super._();

  factory _$EndpointImpl.fromJson(Map<String, dynamic> json) =>
      _$$EndpointImplFromJson(json);

  @override
  @JsonKey()
  final String ip;
  @override
  @JsonKey()
  final int port;

  @override
  String toString() {
    return 'Endpoint(ip: $ip, port: $port)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EndpointImpl &&
            (identical(other.ip, ip) || other.ip == ip) &&
            (identical(other.port, port) || other.port == port));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, ip, port);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EndpointImplCopyWith<_$EndpointImpl> get copyWith =>
      __$$EndpointImplCopyWithImpl<_$EndpointImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EndpointImplToJson(
      this,
    );
  }
}

abstract class _Endpoint extends Endpoint {
  const factory _Endpoint({final String ip, final int port}) = _$EndpointImpl;
  const _Endpoint._() : super._();

  factory _Endpoint.fromJson(Map<String, dynamic> json) =
      _$EndpointImpl.fromJson;

  @override
  String get ip;
  @override
  int get port;
  @override
  @JsonKey(ignore: true)
  _$$EndpointImplCopyWith<_$EndpointImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
