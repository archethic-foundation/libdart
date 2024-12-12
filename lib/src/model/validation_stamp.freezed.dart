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
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ValidationStamp _$ValidationStampFromJson(Map<String, dynamic> json) {
  return _ValidationStamp.fromJson(json);
}

/// @nodoc
mixin _$ValidationStamp {
  /// All the operations performed by the transaction
  LedgerOperations? get ledgerOperations => throw _privateConstructorUsedError;

  /// Hash of the previous proof of integrity and the transaction
  String? get proofOfIntegrity => throw _privateConstructorUsedError;

  /// Public key matching the origin signature
  String? get proofOfWork => throw _privateConstructorUsedError;

  /// Coordinator signature of the stamp
  String? get signature => throw _privateConstructorUsedError;

  /// Timestamp
  int? get timestamp => throw _privateConstructorUsedError;

  /// Version of the transaction validation protocol
  int? get protocolVersion => throw _privateConstructorUsedError;

  /// Serializes this ValidationStamp to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ValidationStamp
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
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
      int? timestamp,
      int? protocolVersion});

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

  /// Create a copy of ValidationStamp
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ledgerOperations = freezed,
    Object? proofOfIntegrity = freezed,
    Object? proofOfWork = freezed,
    Object? signature = freezed,
    Object? timestamp = freezed,
    Object? protocolVersion = freezed,
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
      protocolVersion: freezed == protocolVersion
          ? _value.protocolVersion
          : protocolVersion // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }

  /// Create a copy of ValidationStamp
  /// with the given fields replaced by the non-null parameter values.
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
abstract class _$$ValidationStampImplCopyWith<$Res>
    implements $ValidationStampCopyWith<$Res> {
  factory _$$ValidationStampImplCopyWith(_$ValidationStampImpl value,
          $Res Function(_$ValidationStampImpl) then) =
      __$$ValidationStampImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {LedgerOperations? ledgerOperations,
      String? proofOfIntegrity,
      String? proofOfWork,
      String? signature,
      int? timestamp,
      int? protocolVersion});

  @override
  $LedgerOperationsCopyWith<$Res>? get ledgerOperations;
}

/// @nodoc
class __$$ValidationStampImplCopyWithImpl<$Res>
    extends _$ValidationStampCopyWithImpl<$Res, _$ValidationStampImpl>
    implements _$$ValidationStampImplCopyWith<$Res> {
  __$$ValidationStampImplCopyWithImpl(
      _$ValidationStampImpl _value, $Res Function(_$ValidationStampImpl) _then)
      : super(_value, _then);

  /// Create a copy of ValidationStamp
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ledgerOperations = freezed,
    Object? proofOfIntegrity = freezed,
    Object? proofOfWork = freezed,
    Object? signature = freezed,
    Object? timestamp = freezed,
    Object? protocolVersion = freezed,
  }) {
    return _then(_$ValidationStampImpl(
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
      protocolVersion: freezed == protocolVersion
          ? _value.protocolVersion
          : protocolVersion // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ValidationStampImpl extends _ValidationStamp {
  const _$ValidationStampImpl(
      {this.ledgerOperations,
      this.proofOfIntegrity,
      this.proofOfWork,
      this.signature,
      this.timestamp,
      this.protocolVersion})
      : super._();

  factory _$ValidationStampImpl.fromJson(Map<String, dynamic> json) =>
      _$$ValidationStampImplFromJson(json);

  /// All the operations performed by the transaction
  @override
  final LedgerOperations? ledgerOperations;

  /// Hash of the previous proof of integrity and the transaction
  @override
  final String? proofOfIntegrity;

  /// Public key matching the origin signature
  @override
  final String? proofOfWork;

  /// Coordinator signature of the stamp
  @override
  final String? signature;

  /// Timestamp
  @override
  final int? timestamp;

  /// Version of the transaction validation protocol
  @override
  final int? protocolVersion;

  @override
  String toString() {
    return 'ValidationStamp(ledgerOperations: $ledgerOperations, proofOfIntegrity: $proofOfIntegrity, proofOfWork: $proofOfWork, signature: $signature, timestamp: $timestamp, protocolVersion: $protocolVersion)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ValidationStampImpl &&
            (identical(other.ledgerOperations, ledgerOperations) ||
                other.ledgerOperations == ledgerOperations) &&
            (identical(other.proofOfIntegrity, proofOfIntegrity) ||
                other.proofOfIntegrity == proofOfIntegrity) &&
            (identical(other.proofOfWork, proofOfWork) ||
                other.proofOfWork == proofOfWork) &&
            (identical(other.signature, signature) ||
                other.signature == signature) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp) &&
            (identical(other.protocolVersion, protocolVersion) ||
                other.protocolVersion == protocolVersion));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, ledgerOperations,
      proofOfIntegrity, proofOfWork, signature, timestamp, protocolVersion);

  /// Create a copy of ValidationStamp
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ValidationStampImplCopyWith<_$ValidationStampImpl> get copyWith =>
      __$$ValidationStampImplCopyWithImpl<_$ValidationStampImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ValidationStampImplToJson(
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
      final int? timestamp,
      final int? protocolVersion}) = _$ValidationStampImpl;
  const _ValidationStamp._() : super._();

  factory _ValidationStamp.fromJson(Map<String, dynamic> json) =
      _$ValidationStampImpl.fromJson;

  /// All the operations performed by the transaction
  @override
  LedgerOperations? get ledgerOperations;

  /// Hash of the previous proof of integrity and the transaction
  @override
  String? get proofOfIntegrity;

  /// Public key matching the origin signature
  @override
  String? get proofOfWork;

  /// Coordinator signature of the stamp
  @override
  String? get signature;

  /// Timestamp
  @override
  int? get timestamp;

  /// Version of the transaction validation protocol
  @override
  int? get protocolVersion;

  /// Create a copy of ValidationStamp
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ValidationStampImplCopyWith<_$ValidationStampImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
