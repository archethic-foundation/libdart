// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'balance.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Balance _$BalanceFromJson(Map<String, dynamic> json) {
  return _Balance.fromJson(json);
}

/// @nodoc
mixin _$Balance {
  /// Token: Token balances
  List<TokenBalance> get token => throw _privateConstructorUsedError;

  /// UCO: uco balance
  int? get uco => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BalanceCopyWith<Balance> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BalanceCopyWith<$Res> {
  factory $BalanceCopyWith(Balance value, $Res Function(Balance) then) =
      _$BalanceCopyWithImpl<$Res>;
  $Res call({List<TokenBalance> token, int? uco});
}

/// @nodoc
class _$BalanceCopyWithImpl<$Res> implements $BalanceCopyWith<$Res> {
  _$BalanceCopyWithImpl(this._value, this._then);

  final Balance _value;
  // ignore: unused_field
  final $Res Function(Balance) _then;

  @override
  $Res call({
    Object? token = freezed,
    Object? uco = freezed,
  }) {
    return _then(_value.copyWith(
      token: token == freezed
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as List<TokenBalance>,
      uco: uco == freezed
          ? _value.uco
          : uco // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
abstract class _$$_BalanceCopyWith<$Res> implements $BalanceCopyWith<$Res> {
  factory _$$_BalanceCopyWith(
          _$_Balance value, $Res Function(_$_Balance) then) =
      __$$_BalanceCopyWithImpl<$Res>;
  @override
  $Res call({List<TokenBalance> token, int? uco});
}

/// @nodoc
class __$$_BalanceCopyWithImpl<$Res> extends _$BalanceCopyWithImpl<$Res>
    implements _$$_BalanceCopyWith<$Res> {
  __$$_BalanceCopyWithImpl(_$_Balance _value, $Res Function(_$_Balance) _then)
      : super(_value, (v) => _then(v as _$_Balance));

  @override
  _$_Balance get _value => super._value as _$_Balance;

  @override
  $Res call({
    Object? token = freezed,
    Object? uco = freezed,
  }) {
    return _then(_$_Balance(
      token: token == freezed
          ? _value._token
          : token // ignore: cast_nullable_to_non_nullable
              as List<TokenBalance>,
      uco: uco == freezed
          ? _value.uco
          : uco // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Balance extends _Balance {
  const _$_Balance({final List<TokenBalance> token = const [], this.uco})
      : _token = token,
        super._();

  factory _$_Balance.fromJson(Map<String, dynamic> json) =>
      _$$_BalanceFromJson(json);

  /// Token: Token balances
  final List<TokenBalance> _token;

  /// Token: Token balances
  @override
  @JsonKey()
  List<TokenBalance> get token {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_token);
  }

  /// UCO: uco balance
  @override
  final int? uco;

  @override
  String toString() {
    return 'Balance(token: $token, uco: $uco)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Balance &&
            const DeepCollectionEquality().equals(other._token, _token) &&
            const DeepCollectionEquality().equals(other.uco, uco));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_token),
      const DeepCollectionEquality().hash(uco));

  @JsonKey(ignore: true)
  @override
  _$$_BalanceCopyWith<_$_Balance> get copyWith =>
      __$$_BalanceCopyWithImpl<_$_Balance>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_BalanceToJson(
      this,
    );
  }
}

abstract class _Balance extends Balance {
  const factory _Balance({final List<TokenBalance> token, final int? uco}) =
      _$_Balance;
  const _Balance._() : super._();

  factory _Balance.fromJson(Map<String, dynamic> json) = _$_Balance.fromJson;

  @override

  /// Token: Token balances
  List<TokenBalance> get token;
  @override

  /// UCO: uco balance
  int? get uco;
  @override
  @JsonKey(ignore: true)
  _$$_BalanceCopyWith<_$_Balance> get copyWith =>
      throw _privateConstructorUsedError;
}
