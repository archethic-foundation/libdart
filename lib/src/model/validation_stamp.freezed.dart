// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'validation_stamp.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ValidationStamp _$ValidationStampFromJson(Map<String, dynamic> json) {
  return _ValidationStamp.fromJson(json);
}

/// @nodoc
mixin _$ValidationStamp {
  /// Ledger operations: All the operations performed by the transaction
  LedgerOperations? get ledgerOperations => throw _privateConstructorUsedError;

  /// Proof of integrity: Hash of the previous proof of integrity and the transaction
  String? get proofOfIntegrity => throw _privateConstructorUsedError;

  /// Proof of work: Public key matching the origin signature
  String? get proofOfWork => throw _privateConstructorUsedError;

  /// Signature: Coordinator signature of the stamp
  String? get signature => throw _privateConstructorUsedError;

  /// Timestamp
  int? get timestamp => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ValidationStampCopyWith<ValidationStamp> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ValidationStampCopyWith<$Res> {
  factory $ValidationStampCopyWith(
          ValidationStamp value, $Res Function(ValidationStamp) then) =
      _$ValidationStampCopyWithImpl<$Res, ValidationStamp>;
  @useResult
  $Res call(
      {LedgerOperations? ledgerOperations,
      String? proofOfIntegrity,
      String? proofOfWork,
      String? signature,
      int? timestamp});

  $LedgerOperationsCopyWith<$Res>? get ledgerOperations;
}

/// @nodoc
class _$ValidationStampCopyWithImpl<$Res, $Val extends ValidationStamp>
    implements $ValidationStampCopyWith<$Res> {
  _$ValidationStampCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ledgerOperations = freezed,
    Object? proofOfIntegrity = freezed,
    Object? proofOfWork = freezed,
    Object? signature = freezed,
    Object? timestamp = freezed,
  }) {
    return _then(_value.copyWith(
      ledgerOperations: freezed == ledgerOperations
          ? _value.ledgerOperations
          : ledgerOperations // ignore: cast_nullable_to_non_nullable
              as LedgerOperations?,
      proofOfIntegrity: freezed == proofOfIntegrity
          ? _value.proofOfIntegrity
          : proofOfIntegrity // ignore: cast_nullable_to_non_nullable
              as String?,
      proofOfWork: freezed == proofOfWork
          ? _value.proofOfWork
          : proofOfWork // ignore: cast_nullable_to_non_nullable
              as String?,
      signature: freezed == signature
          ? _value.signature
          : signature // ignore: cast_nullable_to_non_nullable
              as String?,
      timestamp: freezed == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $LedgerOperationsCopyWith<$Res>? get ledgerOperations {
    if (_value.ledgerOperations == null) {
      return null;
    }

    return $LedgerOperationsCopyWith<$Res>(_value.ledgerOperations!, (value) {
      return _then(_value.copyWith(ledgerOperations: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_ValidationStampCopyWith<$Res>
    implements $ValidationStampCopyWith<$Res> {
  factory _$$_ValidationStampCopyWith(
          _$_ValidationStamp value, $Res Function(_$_ValidationStamp) then) =
      __$$_ValidationStampCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {LedgerOperations? ledgerOperations,
      String? proofOfIntegrity,
      String? proofOfWork,
      String? signature,
      int? timestamp});

  @override
  $LedgerOperationsCopyWith<$Res>? get ledgerOperations;
}

/// @nodoc
class __$$_ValidationStampCopyWithImpl<$Res>
    extends _$ValidationStampCopyWithImpl<$Res, _$_ValidationStamp>
    implements _$$_ValidationStampCopyWith<$Res> {
  __$$_ValidationStampCopyWithImpl(
      _$_ValidationStamp _value, $Res Function(_$_ValidationStamp) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ledgerOperations = freezed,
    Object? proofOfIntegrity = freezed,
    Object? proofOfWork = freezed,
    Object? signature = freezed,
    Object? timestamp = freezed,
  }) {
    return _then(_$_ValidationStamp(
      ledgerOperations: freezed == ledgerOperations
          ? _value.ledgerOperations
          : ledgerOperations // ignore: cast_nullable_to_non_nullable
              as LedgerOperations?,
      proofOfIntegrity: freezed == proofOfIntegrity
          ? _value.proofOfIntegrity
          : proofOfIntegrity // ignore: cast_nullable_to_non_nullable
              as String?,
      proofOfWork: freezed == proofOfWork
          ? _value.proofOfWork
          : proofOfWork // ignore: cast_nullable_to_non_nullable
              as String?,
      signature: freezed == signature
          ? _value.signature
          : signature // ignore: cast_nullable_to_non_nullable
              as String?,
      timestamp: freezed == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ValidationStamp extends _ValidationStamp {
  const _$_ValidationStamp(
      {this.ledgerOperations,
      this.proofOfIntegrity,
      this.proofOfWork,
      this.signature,
      this.timestamp})
      : super._();

  factory _$_ValidationStamp.fromJson(Map<String, dynamic> json) =>
      _$$_ValidationStampFromJson(json);

  /// Ledger operations: All the operations performed by the transaction
  @override
  final LedgerOperations? ledgerOperations;

  /// Proof of integrity: Hash of the previous proof of integrity and the transaction
  @override
  final String? proofOfIntegrity;

  /// Proof of work: Public key matching the origin signature
  @override
  final String? proofOfWork;

  /// Signature: Coordinator signature of the stamp
  @override
  final String? signature;

  /// Timestamp
  @override
  final int? timestamp;

  @override
  String toString() {
    return 'ValidationStamp(ledgerOperations: $ledgerOperations, proofOfIntegrity: $proofOfIntegrity, proofOfWork: $proofOfWork, signature: $signature, timestamp: $timestamp)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ValidationStamp &&
            (identical(other.ledgerOperations, ledgerOperations) ||
                other.ledgerOperations == ledgerOperations) &&
            (identical(other.proofOfIntegrity, proofOfIntegrity) ||
                other.proofOfIntegrity == proofOfIntegrity) &&
            (identical(other.proofOfWork, proofOfWork) ||
                other.proofOfWork == proofOfWork) &&
            (identical(other.signature, signature) ||
                other.signature == signature) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, ledgerOperations,
      proofOfIntegrity, proofOfWork, signature, timestamp);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ValidationStampCopyWith<_$_ValidationStamp> get copyWith =>
      __$$_ValidationStampCopyWithImpl<_$_ValidationStamp>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ValidationStampToJson(
      this,
    );
  }
}

abstract class _ValidationStamp extends ValidationStamp {
  const factory _ValidationStamp(
      {final LedgerOperations? ledgerOperations,
      final String? proofOfIntegrity,
      final String? proofOfWork,
      final String? signature,
      final int? timestamp}) = _$_ValidationStamp;
  const _ValidationStamp._() : super._();

  factory _ValidationStamp.fromJson(Map<String, dynamic> json) =
      _$_ValidationStamp.fromJson;

  @override

  /// Ledger operations: All the operations performed by the transaction
  LedgerOperations? get ledgerOperations;
  @override

  /// Proof of integrity: Hash of the previous proof of integrity and the transaction
  String? get proofOfIntegrity;
  @override

  /// Proof of work: Public key matching the origin signature
  String? get proofOfWork;
  @override

  /// Signature: Coordinator signature of the stamp
  String? get signature;
  @override

  /// Timestamp
  int? get timestamp;
  @override
  @JsonKey(ignore: true)
  _$$_ValidationStampCopyWith<_$_ValidationStamp> get copyWith =>
      throw _privateConstructorUsedError;
}
