// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Data _$DataFromJson(Map<String, dynamic> json) {
  return _Data.fromJson(json);
}

/// @nodoc
mixin _$Data {
  /// Smart contract code (hexadecimal),
  String? get code => throw _privateConstructorUsedError;

  /// Smart contract
  Contract? get contract => throw _privateConstructorUsedError;

  /// Free zone for data hosting (string or hexadecimal)
  String? get content => throw _privateConstructorUsedError;

  /// Authorization/Delegations containing list of secrets and their authorized public keys to proof the ownership
  List<Ownership> get ownerships => throw _privateConstructorUsedError;

  /// Asset transfers
  Ledger? get ledger => throw _privateConstructorUsedError;

  /// For non asset transfers, the list of recipients of the transaction (e.g Smart contract interactions)
  List<Recipient> get recipients => throw _privateConstructorUsedError;

  /// Serializes this Data to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Data
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DataCopyWith<Data> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DataCopyWith<$Res> {
  factory $DataCopyWith(Data value, $Res Function(Data) then) =
      _$DataCopyWithImpl<$Res, Data>;
  @useResult
  $Res call(
      {String? code,
      Contract? contract,
      String? content,
      List<Ownership> ownerships,
      Ledger? ledger,
      List<Recipient> recipients});

  $ContractCopyWith<$Res>? get contract;
  $LedgerCopyWith<$Res>? get ledger;
}

/// @nodoc
class _$DataCopyWithImpl<$Res, $Val extends Data>
    implements $DataCopyWith<$Res> {
  _$DataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Data
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = freezed,
    Object? contract = freezed,
    Object? content = freezed,
    Object? ownerships = null,
    Object? ledger = freezed,
    Object? recipients = null,
  }) {
    return _then(_value.copyWith(
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      contract: freezed == contract
          ? _value.contract
          : contract // ignore: cast_nullable_to_non_nullable
              as Contract?,
      content: freezed == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String?,
      ownerships: null == ownerships
          ? _value.ownerships
          : ownerships // ignore: cast_nullable_to_non_nullable
              as List<Ownership>,
      ledger: freezed == ledger
          ? _value.ledger
          : ledger // ignore: cast_nullable_to_non_nullable
              as Ledger?,
      recipients: null == recipients
          ? _value.recipients
          : recipients // ignore: cast_nullable_to_non_nullable
              as List<Recipient>,
    ) as $Val);
  }

  /// Create a copy of Data
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ContractCopyWith<$Res>? get contract {
    if (_value.contract == null) {
      return null;
    }

    return $ContractCopyWith<$Res>(_value.contract!, (value) {
      return _then(_value.copyWith(contract: value) as $Val);
    });
  }

  /// Create a copy of Data
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $LedgerCopyWith<$Res>? get ledger {
    if (_value.ledger == null) {
      return null;
    }

    return $LedgerCopyWith<$Res>(_value.ledger!, (value) {
      return _then(_value.copyWith(ledger: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$DataImplCopyWith<$Res> implements $DataCopyWith<$Res> {
  factory _$$DataImplCopyWith(
          _$DataImpl value, $Res Function(_$DataImpl) then) =
      __$$DataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? code,
      Contract? contract,
      String? content,
      List<Ownership> ownerships,
      Ledger? ledger,
      List<Recipient> recipients});

  @override
  $ContractCopyWith<$Res>? get contract;
  @override
  $LedgerCopyWith<$Res>? get ledger;
}

/// @nodoc
class __$$DataImplCopyWithImpl<$Res>
    extends _$DataCopyWithImpl<$Res, _$DataImpl>
    implements _$$DataImplCopyWith<$Res> {
  __$$DataImplCopyWithImpl(_$DataImpl _value, $Res Function(_$DataImpl) _then)
      : super(_value, _then);

  /// Create a copy of Data
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = freezed,
    Object? contract = freezed,
    Object? content = freezed,
    Object? ownerships = null,
    Object? ledger = freezed,
    Object? recipients = null,
  }) {
    return _then(_$DataImpl(
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      contract: freezed == contract
          ? _value.contract
          : contract // ignore: cast_nullable_to_non_nullable
              as Contract?,
      content: freezed == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String?,
      ownerships: null == ownerships
          ? _value.ownerships
          : ownerships // ignore: cast_nullable_to_non_nullable
              as List<Ownership>,
      ledger: freezed == ledger
          ? _value.ledger
          : ledger // ignore: cast_nullable_to_non_nullable
              as Ledger?,
      recipients: null == recipients
          ? _value.recipients
          : recipients // ignore: cast_nullable_to_non_nullable
              as List<Recipient>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DataImpl extends _Data {
  const _$DataImpl(
      {this.code,
      this.contract,
      this.content,
      this.ownerships = const [],
      this.ledger,
      this.recipients = const []})
      : super._();

  factory _$DataImpl.fromJson(Map<String, dynamic> json) =>
      _$$DataImplFromJson(json);

  /// Smart contract code (hexadecimal),
  @override
  final String? code;

  /// Smart contract
  @override
  final Contract? contract;

  /// Free zone for data hosting (string or hexadecimal)
  @override
  final String? content;

  /// Authorization/Delegations containing list of secrets and their authorized public keys to proof the ownership
  @override
  @JsonKey()
  final List<Ownership> ownerships;

  /// Asset transfers
  @override
  final Ledger? ledger;

  /// For non asset transfers, the list of recipients of the transaction (e.g Smart contract interactions)
  @override
  @JsonKey()
  final List<Recipient> recipients;

  @override
  String toString() {
    return 'Data(code: $code, contract: $contract, content: $content, ownerships: $ownerships, ledger: $ledger, recipients: $recipients)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DataImpl &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.contract, contract) ||
                other.contract == contract) &&
            (identical(other.content, content) || other.content == content) &&
            const DeepCollectionEquality()
                .equals(other.ownerships, ownerships) &&
            (identical(other.ledger, ledger) || other.ledger == ledger) &&
            const DeepCollectionEquality()
                .equals(other.recipients, recipients));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      code,
      contract,
      content,
      const DeepCollectionEquality().hash(ownerships),
      ledger,
      const DeepCollectionEquality().hash(recipients));

  /// Create a copy of Data
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DataImplCopyWith<_$DataImpl> get copyWith =>
      __$$DataImplCopyWithImpl<_$DataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DataImplToJson(
      this,
    );
  }
}

abstract class _Data extends Data {
  const factory _Data(
      {final String? code,
      final Contract? contract,
      final String? content,
      final List<Ownership> ownerships,
      final Ledger? ledger,
      final List<Recipient> recipients}) = _$DataImpl;
  const _Data._() : super._();

  factory _Data.fromJson(Map<String, dynamic> json) = _$DataImpl.fromJson;

  /// Smart contract code (hexadecimal),
  @override
  String? get code;

  /// Smart contract
  @override
  Contract? get contract;

  /// Free zone for data hosting (string or hexadecimal)
  @override
  String? get content;

  /// Authorization/Delegations containing list of secrets and their authorized public keys to proof the ownership
  @override
  List<Ownership> get ownerships;

  /// Asset transfers
  @override
  Ledger? get ledger;

  /// For non asset transfers, the list of recipients of the transaction (e.g Smart contract interactions)
  @override
  List<Recipient> get recipients;

  /// Create a copy of Data
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DataImplCopyWith<_$DataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
