// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

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
      _$LedgerOperationsCopyWithImpl<$Res, LedgerOperations>;
  @useResult
  $Res call(
      {int? fee,
      List<TransactionMovement> transactionMovements,
      List<UnspentOutputs> unspentOutputs});
}

/// @nodoc
class _$LedgerOperationsCopyWithImpl<$Res, $Val extends LedgerOperations>
    implements $LedgerOperationsCopyWith<$Res> {
  _$LedgerOperationsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fee = freezed,
    Object? transactionMovements = null,
    Object? unspentOutputs = null,
  }) {
    return _then(_value.copyWith(
      fee: freezed == fee
          ? _value.fee
          : fee // ignore: cast_nullable_to_non_nullable
              as int?,
      transactionMovements: null == transactionMovements
          ? _value.transactionMovements
          : transactionMovements // ignore: cast_nullable_to_non_nullable
              as List<TransactionMovement>,
      unspentOutputs: null == unspentOutputs
          ? _value.unspentOutputs
          : unspentOutputs // ignore: cast_nullable_to_non_nullable
              as List<UnspentOutputs>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LedgerOperationsImplCopyWith<$Res>
    implements $LedgerOperationsCopyWith<$Res> {
  factory _$$LedgerOperationsImplCopyWith(_$LedgerOperationsImpl value,
          $Res Function(_$LedgerOperationsImpl) then) =
      __$$LedgerOperationsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? fee,
      List<TransactionMovement> transactionMovements,
      List<UnspentOutputs> unspentOutputs});
}

/// @nodoc
class __$$LedgerOperationsImplCopyWithImpl<$Res>
    extends _$LedgerOperationsCopyWithImpl<$Res, _$LedgerOperationsImpl>
    implements _$$LedgerOperationsImplCopyWith<$Res> {
  __$$LedgerOperationsImplCopyWithImpl(_$LedgerOperationsImpl _value,
      $Res Function(_$LedgerOperationsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fee = freezed,
    Object? transactionMovements = null,
    Object? unspentOutputs = null,
  }) {
    return _then(_$LedgerOperationsImpl(
      fee: freezed == fee
          ? _value.fee
          : fee // ignore: cast_nullable_to_non_nullable
              as int?,
      transactionMovements: null == transactionMovements
          ? _value._transactionMovements
          : transactionMovements // ignore: cast_nullable_to_non_nullable
              as List<TransactionMovement>,
      unspentOutputs: null == unspentOutputs
          ? _value._unspentOutputs
          : unspentOutputs // ignore: cast_nullable_to_non_nullable
              as List<UnspentOutputs>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LedgerOperationsImpl extends _LedgerOperations {
  const _$LedgerOperationsImpl(
      {this.fee,
      final List<TransactionMovement> transactionMovements = const [],
      final List<UnspentOutputs> unspentOutputs = const []})
      : _transactionMovements = transactionMovements,
        _unspentOutputs = unspentOutputs,
        super._();

  factory _$LedgerOperationsImpl.fromJson(Map<String, dynamic> json) =>
      _$$LedgerOperationsImplFromJson(json);

  /// Fee: transaction fee (distributed over the node rewards)
  @override
  final int? fee;

  /// Transaction movements: assets transfers
  final List<TransactionMovement> _transactionMovements;

  /// Transaction movements: assets transfers
  @override
  @JsonKey()
  List<TransactionMovement> get transactionMovements {
    if (_transactionMovements is EqualUnmodifiableListView)
      return _transactionMovements;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_transactionMovements);
  }

  /// Unspent outputs: remaining unspent outputs
  final List<UnspentOutputs> _unspentOutputs;

  /// Unspent outputs: remaining unspent outputs
  @override
  @JsonKey()
  List<UnspentOutputs> get unspentOutputs {
    if (_unspentOutputs is EqualUnmodifiableListView) return _unspentOutputs;
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
            other is _$LedgerOperationsImpl &&
            (identical(other.fee, fee) || other.fee == fee) &&
            const DeepCollectionEquality()
                .equals(other._transactionMovements, _transactionMovements) &&
            const DeepCollectionEquality()
                .equals(other._unspentOutputs, _unspentOutputs));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      fee,
      const DeepCollectionEquality().hash(_transactionMovements),
      const DeepCollectionEquality().hash(_unspentOutputs));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LedgerOperationsImplCopyWith<_$LedgerOperationsImpl> get copyWith =>
      __$$LedgerOperationsImplCopyWithImpl<_$LedgerOperationsImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LedgerOperationsImplToJson(
      this,
    );
  }
}

abstract class _LedgerOperations extends LedgerOperations {
  const factory _LedgerOperations(
      {final int? fee,
      final List<TransactionMovement> transactionMovements,
      final List<UnspentOutputs> unspentOutputs}) = _$LedgerOperationsImpl;
  const _LedgerOperations._() : super._();

  factory _LedgerOperations.fromJson(Map<String, dynamic> json) =
      _$LedgerOperationsImpl.fromJson;

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
  _$$LedgerOperationsImplCopyWith<_$LedgerOperationsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
