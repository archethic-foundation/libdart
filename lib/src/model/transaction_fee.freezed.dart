// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'transaction_fee.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TransactionFee _$TransactionFeeFromJson(Map<String, dynamic> json) {
  return _TransactionFee.fromJson(json);
}

/// @nodoc
mixin _$TransactionFee {
  int? get fee => throw _privateConstructorUsedError;
  Rates? get rates => throw _privateConstructorUsedError;
  TransactionFeeErrors? get errors => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TransactionFeeCopyWith<TransactionFee> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransactionFeeCopyWith<$Res> {
  factory $TransactionFeeCopyWith(
          TransactionFee value, $Res Function(TransactionFee) then) =
      _$TransactionFeeCopyWithImpl<$Res, TransactionFee>;
  @useResult
  $Res call({int? fee, Rates? rates, TransactionFeeErrors? errors});

  $RatesCopyWith<$Res>? get rates;
  $TransactionFeeErrorsCopyWith<$Res>? get errors;
}

/// @nodoc
class _$TransactionFeeCopyWithImpl<$Res, $Val extends TransactionFee>
    implements $TransactionFeeCopyWith<$Res> {
  _$TransactionFeeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fee = freezed,
    Object? rates = freezed,
    Object? errors = freezed,
  }) {
    return _then(_value.copyWith(
      fee: freezed == fee
          ? _value.fee
          : fee // ignore: cast_nullable_to_non_nullable
              as int?,
      rates: freezed == rates
          ? _value.rates
          : rates // ignore: cast_nullable_to_non_nullable
              as Rates?,
      errors: freezed == errors
          ? _value.errors
          : errors // ignore: cast_nullable_to_non_nullable
              as TransactionFeeErrors?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $RatesCopyWith<$Res>? get rates {
    if (_value.rates == null) {
      return null;
    }

    return $RatesCopyWith<$Res>(_value.rates!, (value) {
      return _then(_value.copyWith(rates: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $TransactionFeeErrorsCopyWith<$Res>? get errors {
    if (_value.errors == null) {
      return null;
    }

    return $TransactionFeeErrorsCopyWith<$Res>(_value.errors!, (value) {
      return _then(_value.copyWith(errors: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$TransactionFeeImplCopyWith<$Res>
    implements $TransactionFeeCopyWith<$Res> {
  factory _$$TransactionFeeImplCopyWith(_$TransactionFeeImpl value,
          $Res Function(_$TransactionFeeImpl) then) =
      __$$TransactionFeeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? fee, Rates? rates, TransactionFeeErrors? errors});

  @override
  $RatesCopyWith<$Res>? get rates;
  @override
  $TransactionFeeErrorsCopyWith<$Res>? get errors;
}

/// @nodoc
class __$$TransactionFeeImplCopyWithImpl<$Res>
    extends _$TransactionFeeCopyWithImpl<$Res, _$TransactionFeeImpl>
    implements _$$TransactionFeeImplCopyWith<$Res> {
  __$$TransactionFeeImplCopyWithImpl(
      _$TransactionFeeImpl _value, $Res Function(_$TransactionFeeImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fee = freezed,
    Object? rates = freezed,
    Object? errors = freezed,
  }) {
    return _then(_$TransactionFeeImpl(
      fee: freezed == fee
          ? _value.fee
          : fee // ignore: cast_nullable_to_non_nullable
              as int?,
      rates: freezed == rates
          ? _value.rates
          : rates // ignore: cast_nullable_to_non_nullable
              as Rates?,
      errors: freezed == errors
          ? _value.errors
          : errors // ignore: cast_nullable_to_non_nullable
              as TransactionFeeErrors?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TransactionFeeImpl extends _TransactionFee {
  const _$TransactionFeeImpl({this.fee, this.rates, this.errors}) : super._();

  factory _$TransactionFeeImpl.fromJson(Map<String, dynamic> json) =>
      _$$TransactionFeeImplFromJson(json);

  @override
  final int? fee;
  @override
  final Rates? rates;
  @override
  final TransactionFeeErrors? errors;

  @override
  String toString() {
    return 'TransactionFee(fee: $fee, rates: $rates, errors: $errors)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TransactionFeeImpl &&
            (identical(other.fee, fee) || other.fee == fee) &&
            (identical(other.rates, rates) || other.rates == rates) &&
            (identical(other.errors, errors) || other.errors == errors));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, fee, rates, errors);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TransactionFeeImplCopyWith<_$TransactionFeeImpl> get copyWith =>
      __$$TransactionFeeImplCopyWithImpl<_$TransactionFeeImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TransactionFeeImplToJson(
      this,
    );
  }
}

abstract class _TransactionFee extends TransactionFee {
  const factory _TransactionFee(
      {final int? fee,
      final Rates? rates,
      final TransactionFeeErrors? errors}) = _$TransactionFeeImpl;
  const _TransactionFee._() : super._();

  factory _TransactionFee.fromJson(Map<String, dynamic> json) =
      _$TransactionFeeImpl.fromJson;

  @override
  int? get fee;
  @override
  Rates? get rates;
  @override
  TransactionFeeErrors? get errors;
  @override
  @JsonKey(ignore: true)
  _$$TransactionFeeImplCopyWith<_$TransactionFeeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Rates _$RatesFromJson(Map<String, dynamic> json) {
  return _Rates.fromJson(json);
}

/// @nodoc
mixin _$Rates {
  double? get eur => throw _privateConstructorUsedError;
  double? get usd => throw _privateConstructorUsedError;
  TransactionFeeErrors? get errors => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RatesCopyWith<Rates> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RatesCopyWith<$Res> {
  factory $RatesCopyWith(Rates value, $Res Function(Rates) then) =
      _$RatesCopyWithImpl<$Res, Rates>;
  @useResult
  $Res call({double? eur, double? usd, TransactionFeeErrors? errors});

  $TransactionFeeErrorsCopyWith<$Res>? get errors;
}

/// @nodoc
class _$RatesCopyWithImpl<$Res, $Val extends Rates>
    implements $RatesCopyWith<$Res> {
  _$RatesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? eur = freezed,
    Object? usd = freezed,
    Object? errors = freezed,
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
      errors: freezed == errors
          ? _value.errors
          : errors // ignore: cast_nullable_to_non_nullable
              as TransactionFeeErrors?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $TransactionFeeErrorsCopyWith<$Res>? get errors {
    if (_value.errors == null) {
      return null;
    }

    return $TransactionFeeErrorsCopyWith<$Res>(_value.errors!, (value) {
      return _then(_value.copyWith(errors: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$RatesImplCopyWith<$Res> implements $RatesCopyWith<$Res> {
  factory _$$RatesImplCopyWith(
          _$RatesImpl value, $Res Function(_$RatesImpl) then) =
      __$$RatesImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double? eur, double? usd, TransactionFeeErrors? errors});

  @override
  $TransactionFeeErrorsCopyWith<$Res>? get errors;
}

/// @nodoc
class __$$RatesImplCopyWithImpl<$Res>
    extends _$RatesCopyWithImpl<$Res, _$RatesImpl>
    implements _$$RatesImplCopyWith<$Res> {
  __$$RatesImplCopyWithImpl(
      _$RatesImpl _value, $Res Function(_$RatesImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? eur = freezed,
    Object? usd = freezed,
    Object? errors = freezed,
  }) {
    return _then(_$RatesImpl(
      eur: freezed == eur
          ? _value.eur
          : eur // ignore: cast_nullable_to_non_nullable
              as double?,
      usd: freezed == usd
          ? _value.usd
          : usd // ignore: cast_nullable_to_non_nullable
              as double?,
      errors: freezed == errors
          ? _value.errors
          : errors // ignore: cast_nullable_to_non_nullable
              as TransactionFeeErrors?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RatesImpl extends _Rates {
  const _$RatesImpl({this.eur, this.usd, this.errors}) : super._();

  factory _$RatesImpl.fromJson(Map<String, dynamic> json) =>
      _$$RatesImplFromJson(json);

  @override
  final double? eur;
  @override
  final double? usd;
  @override
  final TransactionFeeErrors? errors;

  @override
  String toString() {
    return 'Rates(eur: $eur, usd: $usd, errors: $errors)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RatesImpl &&
            (identical(other.eur, eur) || other.eur == eur) &&
            (identical(other.usd, usd) || other.usd == usd) &&
            (identical(other.errors, errors) || other.errors == errors));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, eur, usd, errors);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RatesImplCopyWith<_$RatesImpl> get copyWith =>
      __$$RatesImplCopyWithImpl<_$RatesImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RatesImplToJson(
      this,
    );
  }
}

abstract class _Rates extends Rates {
  const factory _Rates(
      {final double? eur,
      final double? usd,
      final TransactionFeeErrors? errors}) = _$RatesImpl;
  const _Rates._() : super._();

  factory _Rates.fromJson(Map<String, dynamic> json) = _$RatesImpl.fromJson;

  @override
  double? get eur;
  @override
  double? get usd;
  @override
  TransactionFeeErrors? get errors;
  @override
  @JsonKey(ignore: true)
  _$$RatesImplCopyWith<_$RatesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

TransactionFeeErrors _$TransactionFeeErrorsFromJson(Map<String, dynamic> json) {
  return _TransactionFeeErrors.fromJson(json);
}

/// @nodoc
mixin _$TransactionFeeErrors {
  Data? get data => throw _privateConstructorUsedError;
  TransactionFeeErrors? get errors => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TransactionFeeErrorsCopyWith<TransactionFeeErrors> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransactionFeeErrorsCopyWith<$Res> {
  factory $TransactionFeeErrorsCopyWith(TransactionFeeErrors value,
          $Res Function(TransactionFeeErrors) then) =
      _$TransactionFeeErrorsCopyWithImpl<$Res, TransactionFeeErrors>;
  @useResult
  $Res call({Data? data, TransactionFeeErrors? errors});

  $DataCopyWith<$Res>? get data;
  $TransactionFeeErrorsCopyWith<$Res>? get errors;
}

/// @nodoc
class _$TransactionFeeErrorsCopyWithImpl<$Res,
        $Val extends TransactionFeeErrors>
    implements $TransactionFeeErrorsCopyWith<$Res> {
  _$TransactionFeeErrorsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
    Object? errors = freezed,
  }) {
    return _then(_value.copyWith(
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as Data?,
      errors: freezed == errors
          ? _value.errors
          : errors // ignore: cast_nullable_to_non_nullable
              as TransactionFeeErrors?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $DataCopyWith<$Res>? get data {
    if (_value.data == null) {
      return null;
    }

    return $DataCopyWith<$Res>(_value.data!, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $TransactionFeeErrorsCopyWith<$Res>? get errors {
    if (_value.errors == null) {
      return null;
    }

    return $TransactionFeeErrorsCopyWith<$Res>(_value.errors!, (value) {
      return _then(_value.copyWith(errors: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$TransactionFeeErrorsImplCopyWith<$Res>
    implements $TransactionFeeErrorsCopyWith<$Res> {
  factory _$$TransactionFeeErrorsImplCopyWith(_$TransactionFeeErrorsImpl value,
          $Res Function(_$TransactionFeeErrorsImpl) then) =
      __$$TransactionFeeErrorsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Data? data, TransactionFeeErrors? errors});

  @override
  $DataCopyWith<$Res>? get data;
  @override
  $TransactionFeeErrorsCopyWith<$Res>? get errors;
}

/// @nodoc
class __$$TransactionFeeErrorsImplCopyWithImpl<$Res>
    extends _$TransactionFeeErrorsCopyWithImpl<$Res, _$TransactionFeeErrorsImpl>
    implements _$$TransactionFeeErrorsImplCopyWith<$Res> {
  __$$TransactionFeeErrorsImplCopyWithImpl(_$TransactionFeeErrorsImpl _value,
      $Res Function(_$TransactionFeeErrorsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
    Object? errors = freezed,
  }) {
    return _then(_$TransactionFeeErrorsImpl(
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as Data?,
      errors: freezed == errors
          ? _value.errors
          : errors // ignore: cast_nullable_to_non_nullable
              as TransactionFeeErrors?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TransactionFeeErrorsImpl extends _TransactionFeeErrors {
  const _$TransactionFeeErrorsImpl({this.data, this.errors}) : super._();

  factory _$TransactionFeeErrorsImpl.fromJson(Map<String, dynamic> json) =>
      _$$TransactionFeeErrorsImplFromJson(json);

  @override
  final Data? data;
  @override
  final TransactionFeeErrors? errors;

  @override
  String toString() {
    return 'TransactionFeeErrors(data: $data, errors: $errors)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TransactionFeeErrorsImpl &&
            (identical(other.data, data) || other.data == data) &&
            (identical(other.errors, errors) || other.errors == errors));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, data, errors);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TransactionFeeErrorsImplCopyWith<_$TransactionFeeErrorsImpl>
      get copyWith =>
          __$$TransactionFeeErrorsImplCopyWithImpl<_$TransactionFeeErrorsImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TransactionFeeErrorsImplToJson(
      this,
    );
  }
}

abstract class _TransactionFeeErrors extends TransactionFeeErrors {
  const factory _TransactionFeeErrors(
      {final Data? data,
      final TransactionFeeErrors? errors}) = _$TransactionFeeErrorsImpl;
  const _TransactionFeeErrors._() : super._();

  factory _TransactionFeeErrors.fromJson(Map<String, dynamic> json) =
      _$TransactionFeeErrorsImpl.fromJson;

  @override
  Data? get data;
  @override
  TransactionFeeErrors? get errors;
  @override
  @JsonKey(ignore: true)
  _$$TransactionFeeErrorsImplCopyWith<_$TransactionFeeErrorsImpl>
      get copyWith => throw _privateConstructorUsedError;
}
