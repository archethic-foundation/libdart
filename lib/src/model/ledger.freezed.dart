// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ledger.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Ledger _$LedgerFromJson(Map<String, dynamic> json) {
  return _Ledger.fromJson(json);
}

/// @nodoc
mixin _$Ledger {
  TokenLedger? get token => throw _privateConstructorUsedError;
  UCOLedger? get uco => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LedgerCopyWith<Ledger> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LedgerCopyWith<$Res> {
  factory $LedgerCopyWith(Ledger value, $Res Function(Ledger) then) =
      _$LedgerCopyWithImpl<$Res, Ledger>;
  @useResult
  $Res call({TokenLedger? token, UCOLedger? uco});

  $TokenLedgerCopyWith<$Res>? get token;
  $UCOLedgerCopyWith<$Res>? get uco;
}

/// @nodoc
class _$LedgerCopyWithImpl<$Res, $Val extends Ledger>
    implements $LedgerCopyWith<$Res> {
  _$LedgerCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? token = freezed,
    Object? uco = freezed,
  }) {
    return _then(_value.copyWith(
      token: freezed == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as TokenLedger?,
      uco: freezed == uco
          ? _value.uco
          : uco // ignore: cast_nullable_to_non_nullable
              as UCOLedger?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $TokenLedgerCopyWith<$Res>? get token {
    if (_value.token == null) {
      return null;
    }

    return $TokenLedgerCopyWith<$Res>(_value.token!, (value) {
      return _then(_value.copyWith(token: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $UCOLedgerCopyWith<$Res>? get uco {
    if (_value.uco == null) {
      return null;
    }

    return $UCOLedgerCopyWith<$Res>(_value.uco!, (value) {
      return _then(_value.copyWith(uco: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$LedgerImplCopyWith<$Res> implements $LedgerCopyWith<$Res> {
  factory _$$LedgerImplCopyWith(
          _$LedgerImpl value, $Res Function(_$LedgerImpl) then) =
      __$$LedgerImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({TokenLedger? token, UCOLedger? uco});

  @override
  $TokenLedgerCopyWith<$Res>? get token;
  @override
  $UCOLedgerCopyWith<$Res>? get uco;
}

/// @nodoc
class __$$LedgerImplCopyWithImpl<$Res>
    extends _$LedgerCopyWithImpl<$Res, _$LedgerImpl>
    implements _$$LedgerImplCopyWith<$Res> {
  __$$LedgerImplCopyWithImpl(
      _$LedgerImpl _value, $Res Function(_$LedgerImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? token = freezed,
    Object? uco = freezed,
  }) {
    return _then(_$LedgerImpl(
      token: freezed == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as TokenLedger?,
      uco: freezed == uco
          ? _value.uco
          : uco // ignore: cast_nullable_to_non_nullable
              as UCOLedger?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LedgerImpl extends _Ledger {
  const _$LedgerImpl({this.token, this.uco}) : super._();

  factory _$LedgerImpl.fromJson(Map<String, dynamic> json) =>
      _$$LedgerImplFromJson(json);

  @override
  final TokenLedger? token;
  @override
  final UCOLedger? uco;

  @override
  String toString() {
    return 'Ledger(token: $token, uco: $uco)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LedgerImpl &&
            (identical(other.token, token) || other.token == token) &&
            (identical(other.uco, uco) || other.uco == uco));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, token, uco);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LedgerImplCopyWith<_$LedgerImpl> get copyWith =>
      __$$LedgerImplCopyWithImpl<_$LedgerImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LedgerImplToJson(
      this,
    );
  }
}

abstract class _Ledger extends Ledger {
  const factory _Ledger({final TokenLedger? token, final UCOLedger? uco}) =
      _$LedgerImpl;
  const _Ledger._() : super._();

  factory _Ledger.fromJson(Map<String, dynamic> json) = _$LedgerImpl.fromJson;

  @override
  TokenLedger? get token;
  @override
  UCOLedger? get uco;
  @override
  @JsonKey(ignore: true)
  _$$LedgerImplCopyWith<_$LedgerImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
