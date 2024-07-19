// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'uco.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Uco _$UcoFromJson(Map<String, dynamic> json) {
  return _Uco.fromJson(json);
}

/// @nodoc
mixin _$Uco {
  double? get eur => throw _privateConstructorUsedError;
  double? get usd => throw _privateConstructorUsedError;

  /// Serializes this Uco to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Uco
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UcoCopyWith<Uco> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UcoCopyWith<$Res> {
  factory $UcoCopyWith(Uco value, $Res Function(Uco) then) =
      _$UcoCopyWithImpl<$Res, Uco>;
  @useResult
  $Res call({double? eur, double? usd});
}

/// @nodoc
class _$UcoCopyWithImpl<$Res, $Val extends Uco> implements $UcoCopyWith<$Res> {
  _$UcoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Uco
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? eur = freezed,
    Object? usd = freezed,
  }) {
    return _then(_value.copyWith(
      eur: freezed == eur
          ? _value.eur
          : eur // ignore: cast_nullable_to_non_nullable
              as double?,
      usd: freezed == usd
          ? _value.usd
          : usd // ignore: cast_nullable_to_non_nullable
              as double?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UcoImplCopyWith<$Res> implements $UcoCopyWith<$Res> {
  factory _$$UcoImplCopyWith(_$UcoImpl value, $Res Function(_$UcoImpl) then) =
      __$$UcoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double? eur, double? usd});
}

/// @nodoc
class __$$UcoImplCopyWithImpl<$Res> extends _$UcoCopyWithImpl<$Res, _$UcoImpl>
    implements _$$UcoImplCopyWith<$Res> {
  __$$UcoImplCopyWithImpl(_$UcoImpl _value, $Res Function(_$UcoImpl) _then)
      : super(_value, _then);

  /// Create a copy of Uco
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? eur = freezed,
    Object? usd = freezed,
  }) {
    return _then(_$UcoImpl(
      eur: freezed == eur
          ? _value.eur
          : eur // ignore: cast_nullable_to_non_nullable
              as double?,
      usd: freezed == usd
          ? _value.usd
          : usd // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UcoImpl extends _Uco {
  const _$UcoImpl({this.eur, this.usd}) : super._();

  factory _$UcoImpl.fromJson(Map<String, dynamic> json) =>
      _$$UcoImplFromJson(json);

  @override
  final double? eur;
  @override
  final double? usd;

  @override
  String toString() {
    return 'Uco(eur: $eur, usd: $usd)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UcoImpl &&
            (identical(other.eur, eur) || other.eur == eur) &&
            (identical(other.usd, usd) || other.usd == usd));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, eur, usd);

  /// Create a copy of Uco
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UcoImplCopyWith<_$UcoImpl> get copyWith =>
      __$$UcoImplCopyWithImpl<_$UcoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UcoImplToJson(
      this,
    );
  }
}

abstract class _Uco extends Uco {
  const factory _Uco({final double? eur, final double? usd}) = _$UcoImpl;
  const _Uco._() : super._();

  factory _Uco.fromJson(Map<String, dynamic> json) = _$UcoImpl.fromJson;

  @override
  double? get eur;
  @override
  double? get usd;

  /// Create a copy of Uco
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UcoImplCopyWith<_$UcoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
