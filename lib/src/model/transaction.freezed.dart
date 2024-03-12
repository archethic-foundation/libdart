// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'transaction.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Transaction _$TransactionFromJson(Map<String, dynamic> json) {
  return _Transaction.fromJson(json);
}

/// @nodoc
mixin _$Transaction {
  ///  - Address: hash of the new generated public key for the given transaction
  @AddressJsonConverter()
  Address? get address => throw _privateConstructorUsedError;

  /// - [Balance] represents a ledger balance
  Balance? get balance => throw _privateConstructorUsedError;

  /// - Length of the chain
  int? get chainLength => throw _privateConstructorUsedError;

  /// - Cross validation stamps: endorsements of the validation stamp from the coordinator
  List<CrossValidationStamp> get crossValidationStamps =>
      throw _privateConstructorUsedError;

  /// - [Data]: transaction data zone (identity, keychain, smart contract, etc.)
  Data? get data => throw _privateConstructorUsedError;

  /// - [TransactionInput] represents the inputs from the transaction
  List<TransactionInput> get inputs => throw _privateConstructorUsedError;

  /// - Origin signature: signature from the device which originated the transaction (used in the Proof of work)
  String? get originSignature => throw _privateConstructorUsedError;

  /// - Previous address
  @AddressJsonConverter()
  Address? get previousAddress => throw _privateConstructorUsedError;

  /// - Previous public key: previous generated public key matching the previous signature
  String? get previousPublicKey => throw _privateConstructorUsedError;

  /// - Previous signature: signature from the previous public key
  String? get previousSignature => throw _privateConstructorUsedError;

  /// - Type: transaction type
  String? get type => throw _privateConstructorUsedError;

  /// - [ValidationStamp]: coordinator work result
  ValidationStamp? get validationStamp => throw _privateConstructorUsedError;

  /// - Version: version of the transaction (used for backward compatiblity)
  int get version => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TransactionCopyWith<Transaction> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransactionCopyWith<$Res> {
  factory $TransactionCopyWith(
          Transaction value, $Res Function(Transaction) then) =
      _$TransactionCopyWithImpl<$Res, Transaction>;
  @useResult
  $Res call(
      {@AddressJsonConverter() Address? address,
      Balance? balance,
      int? chainLength,
      List<CrossValidationStamp> crossValidationStamps,
      Data? data,
      List<TransactionInput> inputs,
      String? originSignature,
      @AddressJsonConverter() Address? previousAddress,
      String? previousPublicKey,
      String? previousSignature,
      String? type,
      ValidationStamp? validationStamp,
      int version});

  $AddressCopyWith<$Res>? get address;
  $BalanceCopyWith<$Res>? get balance;
  $DataCopyWith<$Res>? get data;
  $AddressCopyWith<$Res>? get previousAddress;
  $ValidationStampCopyWith<$Res>? get validationStamp;
}

/// @nodoc
class _$TransactionCopyWithImpl<$Res, $Val extends Transaction>
    implements $TransactionCopyWith<$Res> {
  _$TransactionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? address = freezed,
    Object? balance = freezed,
    Object? chainLength = freezed,
    Object? crossValidationStamps = null,
    Object? data = freezed,
    Object? inputs = null,
    Object? originSignature = freezed,
    Object? previousAddress = freezed,
    Object? previousPublicKey = freezed,
    Object? previousSignature = freezed,
    Object? type = freezed,
    Object? validationStamp = freezed,
    Object? version = null,
  }) {
    return _then(_value.copyWith(
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as Address?,
      balance: freezed == balance
          ? _value.balance
          : balance // ignore: cast_nullable_to_non_nullable
              as Balance?,
      chainLength: freezed == chainLength
          ? _value.chainLength
          : chainLength // ignore: cast_nullable_to_non_nullable
              as int?,
      crossValidationStamps: null == crossValidationStamps
          ? _value.crossValidationStamps
          : crossValidationStamps // ignore: cast_nullable_to_non_nullable
              as List<CrossValidationStamp>,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as Data?,
      inputs: null == inputs
          ? _value.inputs
          : inputs // ignore: cast_nullable_to_non_nullable
              as List<TransactionInput>,
      originSignature: freezed == originSignature
          ? _value.originSignature
          : originSignature // ignore: cast_nullable_to_non_nullable
              as String?,
      previousAddress: freezed == previousAddress
          ? _value.previousAddress
          : previousAddress // ignore: cast_nullable_to_non_nullable
              as Address?,
      previousPublicKey: freezed == previousPublicKey
          ? _value.previousPublicKey
          : previousPublicKey // ignore: cast_nullable_to_non_nullable
              as String?,
      previousSignature: freezed == previousSignature
          ? _value.previousSignature
          : previousSignature // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      validationStamp: freezed == validationStamp
          ? _value.validationStamp
          : validationStamp // ignore: cast_nullable_to_non_nullable
              as ValidationStamp?,
      version: null == version
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $AddressCopyWith<$Res>? get address {
    if (_value.address == null) {
      return null;
    }

    return $AddressCopyWith<$Res>(_value.address!, (value) {
      return _then(_value.copyWith(address: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $BalanceCopyWith<$Res>? get balance {
    if (_value.balance == null) {
      return null;
    }

    return $BalanceCopyWith<$Res>(_value.balance!, (value) {
      return _then(_value.copyWith(balance: value) as $Val);
    });
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
  $AddressCopyWith<$Res>? get previousAddress {
    if (_value.previousAddress == null) {
      return null;
    }

    return $AddressCopyWith<$Res>(_value.previousAddress!, (value) {
      return _then(_value.copyWith(previousAddress: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ValidationStampCopyWith<$Res>? get validationStamp {
    if (_value.validationStamp == null) {
      return null;
    }

    return $ValidationStampCopyWith<$Res>(_value.validationStamp!, (value) {
      return _then(_value.copyWith(validationStamp: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$TransactionImplCopyWith<$Res>
    implements $TransactionCopyWith<$Res> {
  factory _$$TransactionImplCopyWith(
          _$TransactionImpl value, $Res Function(_$TransactionImpl) then) =
      __$$TransactionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@AddressJsonConverter() Address? address,
      Balance? balance,
      int? chainLength,
      List<CrossValidationStamp> crossValidationStamps,
      Data? data,
      List<TransactionInput> inputs,
      String? originSignature,
      @AddressJsonConverter() Address? previousAddress,
      String? previousPublicKey,
      String? previousSignature,
      String? type,
      ValidationStamp? validationStamp,
      int version});

  @override
  $AddressCopyWith<$Res>? get address;
  @override
  $BalanceCopyWith<$Res>? get balance;
  @override
  $DataCopyWith<$Res>? get data;
  @override
  $AddressCopyWith<$Res>? get previousAddress;
  @override
  $ValidationStampCopyWith<$Res>? get validationStamp;
}

/// @nodoc
class __$$TransactionImplCopyWithImpl<$Res>
    extends _$TransactionCopyWithImpl<$Res, _$TransactionImpl>
    implements _$$TransactionImplCopyWith<$Res> {
  __$$TransactionImplCopyWithImpl(
      _$TransactionImpl _value, $Res Function(_$TransactionImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? address = freezed,
    Object? balance = freezed,
    Object? chainLength = freezed,
    Object? crossValidationStamps = null,
    Object? data = freezed,
    Object? inputs = null,
    Object? originSignature = freezed,
    Object? previousAddress = freezed,
    Object? previousPublicKey = freezed,
    Object? previousSignature = freezed,
    Object? type = freezed,
    Object? validationStamp = freezed,
    Object? version = null,
  }) {
    return _then(_$TransactionImpl(
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as Address?,
      balance: freezed == balance
          ? _value.balance
          : balance // ignore: cast_nullable_to_non_nullable
              as Balance?,
      chainLength: freezed == chainLength
          ? _value.chainLength
          : chainLength // ignore: cast_nullable_to_non_nullable
              as int?,
      crossValidationStamps: null == crossValidationStamps
          ? _value._crossValidationStamps
          : crossValidationStamps // ignore: cast_nullable_to_non_nullable
              as List<CrossValidationStamp>,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as Data?,
      inputs: null == inputs
          ? _value._inputs
          : inputs // ignore: cast_nullable_to_non_nullable
              as List<TransactionInput>,
      originSignature: freezed == originSignature
          ? _value.originSignature
          : originSignature // ignore: cast_nullable_to_non_nullable
              as String?,
      previousAddress: freezed == previousAddress
          ? _value.previousAddress
          : previousAddress // ignore: cast_nullable_to_non_nullable
              as Address?,
      previousPublicKey: freezed == previousPublicKey
          ? _value.previousPublicKey
          : previousPublicKey // ignore: cast_nullable_to_non_nullable
              as String?,
      previousSignature: freezed == previousSignature
          ? _value.previousSignature
          : previousSignature // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      validationStamp: freezed == validationStamp
          ? _value.validationStamp
          : validationStamp // ignore: cast_nullable_to_non_nullable
              as ValidationStamp?,
      version: null == version
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TransactionImpl extends _Transaction {
  const _$TransactionImpl(
      {@AddressJsonConverter() this.address,
      this.balance,
      this.chainLength,
      final List<CrossValidationStamp> crossValidationStamps = const [],
      this.data,
      final List<TransactionInput> inputs = const [],
      this.originSignature,
      @AddressJsonConverter() this.previousAddress,
      this.previousPublicKey,
      this.previousSignature,
      this.type,
      this.validationStamp,
      this.version = cVersion})
      : _crossValidationStamps = crossValidationStamps,
        _inputs = inputs,
        super._();

  factory _$TransactionImpl.fromJson(Map<String, dynamic> json) =>
      _$$TransactionImplFromJson(json);

  ///  - Address: hash of the new generated public key for the given transaction
  @override
  @AddressJsonConverter()
  final Address? address;

  /// - [Balance] represents a ledger balance
  @override
  final Balance? balance;

  /// - Length of the chain
  @override
  final int? chainLength;

  /// - Cross validation stamps: endorsements of the validation stamp from the coordinator
  final List<CrossValidationStamp> _crossValidationStamps;

  /// - Cross validation stamps: endorsements of the validation stamp from the coordinator
  @override
  @JsonKey()
  List<CrossValidationStamp> get crossValidationStamps {
    if (_crossValidationStamps is EqualUnmodifiableListView)
      return _crossValidationStamps;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_crossValidationStamps);
  }

  /// - [Data]: transaction data zone (identity, keychain, smart contract, etc.)
  @override
  final Data? data;

  /// - [TransactionInput] represents the inputs from the transaction
  final List<TransactionInput> _inputs;

  /// - [TransactionInput] represents the inputs from the transaction
  @override
  @JsonKey()
  List<TransactionInput> get inputs {
    if (_inputs is EqualUnmodifiableListView) return _inputs;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_inputs);
  }

  /// - Origin signature: signature from the device which originated the transaction (used in the Proof of work)
  @override
  final String? originSignature;

  /// - Previous address
  @override
  @AddressJsonConverter()
  final Address? previousAddress;

  /// - Previous public key: previous generated public key matching the previous signature
  @override
  final String? previousPublicKey;

  /// - Previous signature: signature from the previous public key
  @override
  final String? previousSignature;

  /// - Type: transaction type
  @override
  final String? type;

  /// - [ValidationStamp]: coordinator work result
  @override
  final ValidationStamp? validationStamp;

  /// - Version: version of the transaction (used for backward compatiblity)
  @override
  @JsonKey()
  final int version;

  @override
  String toString() {
    return 'Transaction(address: $address, balance: $balance, chainLength: $chainLength, crossValidationStamps: $crossValidationStamps, data: $data, inputs: $inputs, originSignature: $originSignature, previousAddress: $previousAddress, previousPublicKey: $previousPublicKey, previousSignature: $previousSignature, type: $type, validationStamp: $validationStamp, version: $version)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TransactionImpl &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.balance, balance) || other.balance == balance) &&
            (identical(other.chainLength, chainLength) ||
                other.chainLength == chainLength) &&
            const DeepCollectionEquality()
                .equals(other._crossValidationStamps, _crossValidationStamps) &&
            (identical(other.data, data) || other.data == data) &&
            const DeepCollectionEquality().equals(other._inputs, _inputs) &&
            (identical(other.originSignature, originSignature) ||
                other.originSignature == originSignature) &&
            (identical(other.previousAddress, previousAddress) ||
                other.previousAddress == previousAddress) &&
            (identical(other.previousPublicKey, previousPublicKey) ||
                other.previousPublicKey == previousPublicKey) &&
            (identical(other.previousSignature, previousSignature) ||
                other.previousSignature == previousSignature) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.validationStamp, validationStamp) ||
                other.validationStamp == validationStamp) &&
            (identical(other.version, version) || other.version == version));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      address,
      balance,
      chainLength,
      const DeepCollectionEquality().hash(_crossValidationStamps),
      data,
      const DeepCollectionEquality().hash(_inputs),
      originSignature,
      previousAddress,
      previousPublicKey,
      previousSignature,
      type,
      validationStamp,
      version);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TransactionImplCopyWith<_$TransactionImpl> get copyWith =>
      __$$TransactionImplCopyWithImpl<_$TransactionImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TransactionImplToJson(
      this,
    );
  }
}

abstract class _Transaction extends Transaction {
  const factory _Transaction(
      {@AddressJsonConverter() final Address? address,
      final Balance? balance,
      final int? chainLength,
      final List<CrossValidationStamp> crossValidationStamps,
      final Data? data,
      final List<TransactionInput> inputs,
      final String? originSignature,
      @AddressJsonConverter() final Address? previousAddress,
      final String? previousPublicKey,
      final String? previousSignature,
      final String? type,
      final ValidationStamp? validationStamp,
      final int version}) = _$TransactionImpl;
  const _Transaction._() : super._();

  factory _Transaction.fromJson(Map<String, dynamic> json) =
      _$TransactionImpl.fromJson;

  @override

  ///  - Address: hash of the new generated public key for the given transaction
  @AddressJsonConverter()
  Address? get address;
  @override

  /// - [Balance] represents a ledger balance
  Balance? get balance;
  @override

  /// - Length of the chain
  int? get chainLength;
  @override

  /// - Cross validation stamps: endorsements of the validation stamp from the coordinator
  List<CrossValidationStamp> get crossValidationStamps;
  @override

  /// - [Data]: transaction data zone (identity, keychain, smart contract, etc.)
  Data? get data;
  @override

  /// - [TransactionInput] represents the inputs from the transaction
  List<TransactionInput> get inputs;
  @override

  /// - Origin signature: signature from the device which originated the transaction (used in the Proof of work)
  String? get originSignature;
  @override

  /// - Previous address
  @AddressJsonConverter()
  Address? get previousAddress;
  @override

  /// - Previous public key: previous generated public key matching the previous signature
  String? get previousPublicKey;
  @override

  /// - Previous signature: signature from the previous public key
  String? get previousSignature;
  @override

  /// - Type: transaction type
  String? get type;
  @override

  /// - [ValidationStamp]: coordinator work result
  ValidationStamp? get validationStamp;
  @override

  /// - Version: version of the transaction (used for backward compatiblity)
  int get version;
  @override
  @JsonKey(ignore: true)
  _$$TransactionImplCopyWith<_$TransactionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
