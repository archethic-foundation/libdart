// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'ledger_operations.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

LedgerOperations _$LedgerOperationsFromJson(Map<String, dynamic> json) {
  return _LedgerOperations.fromJson(json);
}

/// @nodoc
mixin _$LedgerOperations {
  /// Fee: transaction fee (distributed over the node rewards)
  int? get fee => throw _privateConstructorUsedError;

  /// Transaction movements: assets transfers
  List<TransactionMovement> get transactionMovements =>
      throw _privateConstructorUsedError;

  /// Unspent outputs: remaining unspent outputs
  List<UnspentOutputs> get unspentOutputs => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LedgerOperationsCopyWith<LedgerOperations> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LedgerOperationsCopyWith<$Res> {
  factory $LedgerOperationsCopyWith(
          LedgerOperations value, $Res Function(LedgerOperations) then) =
      _$LedgerOperationsCopyWithImpl<$Res>;
  $Res call(
      {int? fee,
      List<TransactionMovement> transactionMovements,
      List<UnspentOutputs> unspentOutputs});
}

/// @nodoc
class _$LedgerOperationsCopyWithImpl<$Res>
    implements $LedgerOperationsCopyWith<$Res> {
  _$LedgerOperationsCopyWithImpl(this._value, this._then);

  final LedgerOperations _value;
  // ignore: unused_field
  final $Res Function(LedgerOperations) _then;

  @override
  $Res call({
    Object? fee = freezed,
    Object? transactionMovements = freezed,
    Object? unspentOutputs = freezed,
  }) {
    return _then(_value.copyWith(
      fee: fee == freezed
          ? _value.fee
          : fee // ignore: cast_nullable_to_non_nullable
              as int?,
      transactionMovements: transactionMovements == freezed
          ? _value.transactionMovements
          : transactionMovements // ignore: cast_nullable_to_non_nullable
              as List<TransactionMovement>,
      unspentOutputs: unspentOutputs == freezed
          ? _value.unspentOutputs
          : unspentOutputs // ignore: cast_nullable_to_non_nullable
              as List<UnspentOutputs>,
    ));
  }
}

/// @nodoc
abstract class _$$_LedgerOperationsCopyWith<$Res>
    implements $LedgerOperationsCopyWith<$Res> {
  factory _$$_LedgerOperationsCopyWith(
          _$_LedgerOperations value, $Res Function(_$_LedgerOperations) then) =
      __$$_LedgerOperationsCopyWithImpl<$Res>;
  @override
  $Res call(
      {int? fee,
      List<TransactionMovement> transactionMovements,
      List<UnspentOutputs> unspentOutputs});
}

/// @nodoc
class __$$_LedgerOperationsCopyWithImpl<$Res>
    extends _$LedgerOperationsCopyWithImpl<$Res>
    implements _$$_LedgerOperationsCopyWith<$Res> {
  __$$_LedgerOperationsCopyWithImpl(
      _$_LedgerOperations _value, $Res Function(_$_LedgerOperations) _then)
      : super(_value, (v) => _then(v as _$_LedgerOperations));

  @override
  _$_LedgerOperations get _value => super._value as _$_LedgerOperations;

  @override
  $Res call({
    Object? fee = freezed,
    Object? transactionMovements = freezed,
    Object? unspentOutputs = freezed,
  }) {
    return _then(_$_LedgerOperations(
      fee: fee == freezed
          ? _value.fee
          : fee // ignore: cast_nullable_to_non_nullable
              as int?,
      transactionMovements: transactionMovements == freezed
          ? _value._transactionMovements
          : transactionMovements // ignore: cast_nullable_to_non_nullable
              as List<TransactionMovement>,
      unspentOutputs: unspentOutputs == freezed
          ? _value._unspentOutputs
          : unspentOutputs // ignore: cast_nullable_to_non_nullable
              as List<UnspentOutputs>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_LedgerOperations extends _LedgerOperations {
  const _$_LedgerOperations(
      {this.fee,
      final List<TransactionMovement> transactionMovements = const [],
      final List<UnspentOutputs> unspentOutputs = const []})
      : _transactionMovements = transactionMovements,
        _unspentOutputs = unspentOutputs,
        super._();

  factory _$_LedgerOperations.fromJson(Map<String, dynamic> json) =>
      _$$_LedgerOperationsFromJson(json);

  /// Fee: transaction fee (distributed over the node rewards)
  @override
  final int? fee;

  /// Transaction movements: assets transfers
  final List<TransactionMovement> _transactionMovements;

  /// Transaction movements: assets transfers
  @override
  @JsonKey()
  List<TransactionMovement> get transactionMovements {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_transactionMovements);
  }

  /// Unspent outputs: remaining unspent outputs
  final List<UnspentOutputs> _unspentOutputs;

  /// Unspent outputs: remaining unspent outputs
  @override
  @JsonKey()
  List<UnspentOutputs> get unspentOutputs {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_unspentOutputs);
  }

  @override
  String toString() {
    return 'LedgerOperations(fee: $fee, transactionMovements: $transactionMovements, unspentOutputs: $unspentOutputs)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LedgerOperations &&
            const DeepCollectionEquality().equals(other.fee, fee) &&
            const DeepCollectionEquality()
                .equals(other._transactionMovements, _transactionMovements) &&
            const DeepCollectionEquality()
                .equals(other._unspentOutputs, _unspentOutputs));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(fee),
      const DeepCollectionEquality().hash(_transactionMovements),
      const DeepCollectionEquality().hash(_unspentOutputs));

  @JsonKey(ignore: true)
  @override
  _$$_LedgerOperationsCopyWith<_$_LedgerOperations> get copyWith =>
      __$$_LedgerOperationsCopyWithImpl<_$_LedgerOperations>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_LedgerOperationsToJson(
      this,
    );
  }
}

abstract class _LedgerOperations extends LedgerOperations {
  const factory _LedgerOperations(
      {final int? fee,
      final List<TransactionMovement> transactionMovements,
      final List<UnspentOutputs> unspentOutputs}) = _$_LedgerOperations;
  const _LedgerOperations._() : super._();

  factory _LedgerOperations.fromJson(Map<String, dynamic> json) =
      _$_LedgerOperations.fromJson;

  @override

  /// Fee: transaction fee (distributed over the node rewards)
  int? get fee;
  @override

  /// Transaction movements: assets transfers
  List<TransactionMovement> get transactionMovements;
  @override

  /// Unspent outputs: remaining unspent outputs
  List<UnspentOutputs> get unspentOutputs;
  @override
  @JsonKey(ignore: true)
  _$$_LedgerOperationsCopyWith<_$_LedgerOperations> get copyWith =>
      throw _privateConstructorUsedError;
}
