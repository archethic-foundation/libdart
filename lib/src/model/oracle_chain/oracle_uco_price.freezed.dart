// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'oracle_uco_price.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

OracleUcoPrice _$OracleUcoPriceFromJson(Map<String, dynamic> json) {
  return _OracleUcoPrice.fromJson(json);
}

/// @nodoc
mixin _$OracleUcoPrice {
  Uco? get uco => throw _privateConstructorUsedError;
  int? get timestamp => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OracleUcoPriceCopyWith<OracleUcoPrice> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OracleUcoPriceCopyWith<$Res> {
  factory $OracleUcoPriceCopyWith(
          OracleUcoPrice value, $Res Function(OracleUcoPrice) then) =
      _$OracleUcoPriceCopyWithImpl<$Res>;
  $Res call({Uco? uco, int? timestamp});

  $UcoCopyWith<$Res>? get uco;
}

/// @nodoc
class _$OracleUcoPriceCopyWithImpl<$Res>
    implements $OracleUcoPriceCopyWith<$Res> {
  _$OracleUcoPriceCopyWithImpl(this._value, this._then);

  final OracleUcoPrice _value;
  // ignore: unused_field
  final $Res Function(OracleUcoPrice) _then;

  @override
  $Res call({
    Object? uco = freezed,
    Object? timestamp = freezed,
  }) {
    return _then(_value.copyWith(
      uco: uco == freezed
          ? _value.uco
          : uco // ignore: cast_nullable_to_non_nullable
              as Uco?,
      timestamp: timestamp == freezed
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }

  @override
  $UcoCopyWith<$Res>? get uco {
    if (_value.uco == null) {
      return null;
    }

    return $UcoCopyWith<$Res>(_value.uco!, (value) {
      return _then(_value.copyWith(uco: value));
    });
  }
}

/// @nodoc
abstract class _$$_OracleUcoPriceCopyWith<$Res>
    implements $OracleUcoPriceCopyWith<$Res> {
  factory _$$_OracleUcoPriceCopyWith(
          _$_OracleUcoPrice value, $Res Function(_$_OracleUcoPrice) then) =
      __$$_OracleUcoPriceCopyWithImpl<$Res>;
  @override
  $Res call({Uco? uco, int? timestamp});

  @override
  $UcoCopyWith<$Res>? get uco;
}

/// @nodoc
class __$$_OracleUcoPriceCopyWithImpl<$Res>
    extends _$OracleUcoPriceCopyWithImpl<$Res>
    implements _$$_OracleUcoPriceCopyWith<$Res> {
  __$$_OracleUcoPriceCopyWithImpl(
      _$_OracleUcoPrice _value, $Res Function(_$_OracleUcoPrice) _then)
      : super(_value, (v) => _then(v as _$_OracleUcoPrice));

  @override
  _$_OracleUcoPrice get _value => super._value as _$_OracleUcoPrice;

  @override
  $Res call({
    Object? uco = freezed,
    Object? timestamp = freezed,
  }) {
    return _then(_$_OracleUcoPrice(
      uco: uco == freezed
          ? _value.uco
          : uco // ignore: cast_nullable_to_non_nullable
              as Uco?,
      timestamp: timestamp == freezed
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_OracleUcoPrice extends _OracleUcoPrice {
  const _$_OracleUcoPrice({this.uco, this.timestamp}) : super._();

  factory _$_OracleUcoPrice.fromJson(Map<String, dynamic> json) =>
      _$$_OracleUcoPriceFromJson(json);

  @override
  final Uco? uco;
  @override
  final int? timestamp;

  @override
  String toString() {
    return 'OracleUcoPrice(uco: $uco, timestamp: $timestamp)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_OracleUcoPrice &&
            const DeepCollectionEquality().equals(other.uco, uco) &&
            const DeepCollectionEquality().equals(other.timestamp, timestamp));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(uco),
      const DeepCollectionEquality().hash(timestamp));

  @JsonKey(ignore: true)
  @override
  _$$_OracleUcoPriceCopyWith<_$_OracleUcoPrice> get copyWith =>
      __$$_OracleUcoPriceCopyWithImpl<_$_OracleUcoPrice>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_OracleUcoPriceToJson(
      this,
    );
  }
}

abstract class _OracleUcoPrice extends OracleUcoPrice {
  const factory _OracleUcoPrice({final Uco? uco, final int? timestamp}) =
      _$_OracleUcoPrice;
  const _OracleUcoPrice._() : super._();

  factory _OracleUcoPrice.fromJson(Map<String, dynamic> json) =
      _$_OracleUcoPrice.fromJson;

  @override
  Uco? get uco;
  @override
  int? get timestamp;
  @override
  @JsonKey(ignore: true)
  _$$_OracleUcoPriceCopyWith<_$_OracleUcoPrice> get copyWith =>
      throw _privateConstructorUsedError;
}
