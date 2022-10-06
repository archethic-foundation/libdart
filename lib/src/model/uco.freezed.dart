// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'uco.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Uco _$UcoFromJson(Map<String, dynamic> json) {
  return _Uco.fromJson(json);
}

/// @nodoc
mixin _$Uco {
  double? get eur => throw _privateConstructorUsedError;
  double? get usd => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UcoCopyWith<Uco> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UcoCopyWith<$Res> {
  factory $UcoCopyWith(Uco value, $Res Function(Uco) then) =
      _$UcoCopyWithImpl<$Res>;
  $Res call({double? eur, double? usd});
}

/// @nodoc
class _$UcoCopyWithImpl<$Res> implements $UcoCopyWith<$Res> {
  _$UcoCopyWithImpl(this._value, this._then);

  final Uco _value;
  // ignore: unused_field
  final $Res Function(Uco) _then;

  @override
  $Res call({
    Object? eur = freezed,
    Object? usd = freezed,
  }) {
    return _then(_value.copyWith(
      eur: eur == freezed
          ? _value.eur
          : eur // ignore: cast_nullable_to_non_nullable
              as double?,
      usd: usd == freezed
          ? _value.usd
          : usd // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
abstract class _$$_UcoCopyWith<$Res> implements $UcoCopyWith<$Res> {
  factory _$$_UcoCopyWith(_$_Uco value, $Res Function(_$_Uco) then) =
      __$$_UcoCopyWithImpl<$Res>;
  @override
  $Res call({double? eur, double? usd});
}

/// @nodoc
class __$$_UcoCopyWithImpl<$Res> extends _$UcoCopyWithImpl<$Res>
    implements _$$_UcoCopyWith<$Res> {
  __$$_UcoCopyWithImpl(_$_Uco _value, $Res Function(_$_Uco) _then)
      : super(_value, (v) => _then(v as _$_Uco));

  @override
  _$_Uco get _value => super._value as _$_Uco;

  @override
  $Res call({
    Object? eur = freezed,
    Object? usd = freezed,
  }) {
    return _then(_$_Uco(
      eur: eur == freezed
          ? _value.eur
          : eur // ignore: cast_nullable_to_non_nullable
              as double?,
      usd: usd == freezed
          ? _value.usd
          : usd // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Uco extends _Uco {
  const _$_Uco({this.eur, this.usd}) : super._();

  factory _$_Uco.fromJson(Map<String, dynamic> json) => _$$_UcoFromJson(json);

  @override
  final double? eur;
  @override
  final double? usd;

  @override
  String toString() {
    return 'Uco(eur: $eur, usd: $usd)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Uco &&
            const DeepCollectionEquality().equals(other.eur, eur) &&
            const DeepCollectionEquality().equals(other.usd, usd));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(eur),
      const DeepCollectionEquality().hash(usd));

  @JsonKey(ignore: true)
  @override
  _$$_UcoCopyWith<_$_Uco> get copyWith =>
      __$$_UcoCopyWithImpl<_$_Uco>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UcoToJson(
      this,
    );
  }
}

abstract class _Uco extends Uco {
  const factory _Uco({final double? eur, final double? usd}) = _$_Uco;
  const _Uco._() : super._();

  factory _Uco.fromJson(Map<String, dynamic> json) = _$_Uco.fromJson;

  @override
  double? get eur;
  @override
  double? get usd;
  @override
  @JsonKey(ignore: true)
  _$$_UcoCopyWith<_$_Uco> get copyWith => throw _privateConstructorUsedError;
}
