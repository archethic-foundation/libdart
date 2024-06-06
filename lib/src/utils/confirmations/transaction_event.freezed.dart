// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'transaction_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$TransactionError {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() timeout,
    required TResult Function() connectivity,
    required TResult Function() consensusNotReached,
    required TResult Function() invalidTransaction,
    required TResult Function() invalidConfirmation,
    required TResult Function() insufficientFunds,
    required TResult Function() serviceNotFound,
    required TResult Function() serviceAlreadyExists,
    required TResult Function() userRejected,
    required TResult Function(String accountName) unknownAccount,
    required TResult Function(int code, String message, Object? data) rpcError,
    required TResult Function(int? code, Object? data, String? message) other,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? timeout,
    TResult? Function()? connectivity,
    TResult? Function()? consensusNotReached,
    TResult? Function()? invalidTransaction,
    TResult? Function()? invalidConfirmation,
    TResult? Function()? insufficientFunds,
    TResult? Function()? serviceNotFound,
    TResult? Function()? serviceAlreadyExists,
    TResult? Function()? userRejected,
    TResult? Function(String accountName)? unknownAccount,
    TResult? Function(int code, String message, Object? data)? rpcError,
    TResult? Function(int? code, Object? data, String? message)? other,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? timeout,
    TResult Function()? connectivity,
    TResult Function()? consensusNotReached,
    TResult Function()? invalidTransaction,
    TResult Function()? invalidConfirmation,
    TResult Function()? insufficientFunds,
    TResult Function()? serviceNotFound,
    TResult Function()? serviceAlreadyExists,
    TResult Function()? userRejected,
    TResult Function(String accountName)? unknownAccount,
    TResult Function(int code, String message, Object? data)? rpcError,
    TResult Function(int? code, Object? data, String? message)? other,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_TransactionTimeout value) timeout,
    required TResult Function(_TransactionConnectionError value) connectivity,
    required TResult Function(_TransactionConsensusNotReachedError value)
        consensusNotReached,
    required TResult Function(_TransactionInvalid value) invalidTransaction,
    required TResult Function(_TransactionInvalidConfirmation value)
        invalidConfirmation,
    required TResult Function(_TransactionInsufficientFunds value)
        insufficientFunds,
    required TResult Function(_TransactionServiceNotFound value)
        serviceNotFound,
    required TResult Function(_TransactionServiceAlreadyExists value)
        serviceAlreadyExists,
    required TResult Function(_TransactionUserRejected value) userRejected,
    required TResult Function(_TransactionUnknownAccount value) unknownAccount,
    required TResult Function(_TransactionRPCError value) rpcError,
    required TResult Function(_TransactionOtherError value) other,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_TransactionTimeout value)? timeout,
    TResult? Function(_TransactionConnectionError value)? connectivity,
    TResult? Function(_TransactionConsensusNotReachedError value)?
        consensusNotReached,
    TResult? Function(_TransactionInvalid value)? invalidTransaction,
    TResult? Function(_TransactionInvalidConfirmation value)?
        invalidConfirmation,
    TResult? Function(_TransactionInsufficientFunds value)? insufficientFunds,
    TResult? Function(_TransactionServiceNotFound value)? serviceNotFound,
    TResult? Function(_TransactionServiceAlreadyExists value)?
        serviceAlreadyExists,
    TResult? Function(_TransactionUserRejected value)? userRejected,
    TResult? Function(_TransactionUnknownAccount value)? unknownAccount,
    TResult? Function(_TransactionRPCError value)? rpcError,
    TResult? Function(_TransactionOtherError value)? other,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_TransactionTimeout value)? timeout,
    TResult Function(_TransactionConnectionError value)? connectivity,
    TResult Function(_TransactionConsensusNotReachedError value)?
        consensusNotReached,
    TResult Function(_TransactionInvalid value)? invalidTransaction,
    TResult Function(_TransactionInvalidConfirmation value)?
        invalidConfirmation,
    TResult Function(_TransactionInsufficientFunds value)? insufficientFunds,
    TResult Function(_TransactionServiceNotFound value)? serviceNotFound,
    TResult Function(_TransactionServiceAlreadyExists value)?
        serviceAlreadyExists,
    TResult Function(_TransactionUserRejected value)? userRejected,
    TResult Function(_TransactionUnknownAccount value)? unknownAccount,
    TResult Function(_TransactionRPCError value)? rpcError,
    TResult Function(_TransactionOtherError value)? other,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransactionErrorCopyWith<$Res> {
  factory $TransactionErrorCopyWith(
          TransactionError value, $Res Function(TransactionError) then) =
      _$TransactionErrorCopyWithImpl<$Res, TransactionError>;
}

/// @nodoc
class _$TransactionErrorCopyWithImpl<$Res, $Val extends TransactionError>
    implements $TransactionErrorCopyWith<$Res> {
  _$TransactionErrorCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$TransactionTimeoutImplCopyWith<$Res> {
  factory _$$TransactionTimeoutImplCopyWith(_$TransactionTimeoutImpl value,
          $Res Function(_$TransactionTimeoutImpl) then) =
      __$$TransactionTimeoutImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$TransactionTimeoutImplCopyWithImpl<$Res>
    extends _$TransactionErrorCopyWithImpl<$Res, _$TransactionTimeoutImpl>
    implements _$$TransactionTimeoutImplCopyWith<$Res> {
  __$$TransactionTimeoutImplCopyWithImpl(_$TransactionTimeoutImpl _value,
      $Res Function(_$TransactionTimeoutImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$TransactionTimeoutImpl extends _TransactionTimeout {
  const _$TransactionTimeoutImpl() : super._();

  @override
  String toString() {
    return 'TransactionError.timeout()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$TransactionTimeoutImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() timeout,
    required TResult Function() connectivity,
    required TResult Function() consensusNotReached,
    required TResult Function() invalidTransaction,
    required TResult Function() invalidConfirmation,
    required TResult Function() insufficientFunds,
    required TResult Function() serviceNotFound,
    required TResult Function() serviceAlreadyExists,
    required TResult Function() userRejected,
    required TResult Function(String accountName) unknownAccount,
    required TResult Function(int code, String message, Object? data) rpcError,
    required TResult Function(int? code, Object? data, String? message) other,
  }) {
    return timeout();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? timeout,
    TResult? Function()? connectivity,
    TResult? Function()? consensusNotReached,
    TResult? Function()? invalidTransaction,
    TResult? Function()? invalidConfirmation,
    TResult? Function()? insufficientFunds,
    TResult? Function()? serviceNotFound,
    TResult? Function()? serviceAlreadyExists,
    TResult? Function()? userRejected,
    TResult? Function(String accountName)? unknownAccount,
    TResult? Function(int code, String message, Object? data)? rpcError,
    TResult? Function(int? code, Object? data, String? message)? other,
  }) {
    return timeout?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? timeout,
    TResult Function()? connectivity,
    TResult Function()? consensusNotReached,
    TResult Function()? invalidTransaction,
    TResult Function()? invalidConfirmation,
    TResult Function()? insufficientFunds,
    TResult Function()? serviceNotFound,
    TResult Function()? serviceAlreadyExists,
    TResult Function()? userRejected,
    TResult Function(String accountName)? unknownAccount,
    TResult Function(int code, String message, Object? data)? rpcError,
    TResult Function(int? code, Object? data, String? message)? other,
    required TResult orElse(),
  }) {
    if (timeout != null) {
      return timeout();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_TransactionTimeout value) timeout,
    required TResult Function(_TransactionConnectionError value) connectivity,
    required TResult Function(_TransactionConsensusNotReachedError value)
        consensusNotReached,
    required TResult Function(_TransactionInvalid value) invalidTransaction,
    required TResult Function(_TransactionInvalidConfirmation value)
        invalidConfirmation,
    required TResult Function(_TransactionInsufficientFunds value)
        insufficientFunds,
    required TResult Function(_TransactionServiceNotFound value)
        serviceNotFound,
    required TResult Function(_TransactionServiceAlreadyExists value)
        serviceAlreadyExists,
    required TResult Function(_TransactionUserRejected value) userRejected,
    required TResult Function(_TransactionUnknownAccount value) unknownAccount,
    required TResult Function(_TransactionRPCError value) rpcError,
    required TResult Function(_TransactionOtherError value) other,
  }) {
    return timeout(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_TransactionTimeout value)? timeout,
    TResult? Function(_TransactionConnectionError value)? connectivity,
    TResult? Function(_TransactionConsensusNotReachedError value)?
        consensusNotReached,
    TResult? Function(_TransactionInvalid value)? invalidTransaction,
    TResult? Function(_TransactionInvalidConfirmation value)?
        invalidConfirmation,
    TResult? Function(_TransactionInsufficientFunds value)? insufficientFunds,
    TResult? Function(_TransactionServiceNotFound value)? serviceNotFound,
    TResult? Function(_TransactionServiceAlreadyExists value)?
        serviceAlreadyExists,
    TResult? Function(_TransactionUserRejected value)? userRejected,
    TResult? Function(_TransactionUnknownAccount value)? unknownAccount,
    TResult? Function(_TransactionRPCError value)? rpcError,
    TResult? Function(_TransactionOtherError value)? other,
  }) {
    return timeout?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_TransactionTimeout value)? timeout,
    TResult Function(_TransactionConnectionError value)? connectivity,
    TResult Function(_TransactionConsensusNotReachedError value)?
        consensusNotReached,
    TResult Function(_TransactionInvalid value)? invalidTransaction,
    TResult Function(_TransactionInvalidConfirmation value)?
        invalidConfirmation,
    TResult Function(_TransactionInsufficientFunds value)? insufficientFunds,
    TResult Function(_TransactionServiceNotFound value)? serviceNotFound,
    TResult Function(_TransactionServiceAlreadyExists value)?
        serviceAlreadyExists,
    TResult Function(_TransactionUserRejected value)? userRejected,
    TResult Function(_TransactionUnknownAccount value)? unknownAccount,
    TResult Function(_TransactionRPCError value)? rpcError,
    TResult Function(_TransactionOtherError value)? other,
    required TResult orElse(),
  }) {
    if (timeout != null) {
      return timeout(this);
    }
    return orElse();
  }
}

abstract class _TransactionTimeout extends TransactionError {
  const factory _TransactionTimeout() = _$TransactionTimeoutImpl;
  const _TransactionTimeout._() : super._();
}

/// @nodoc
abstract class _$$TransactionConnectionErrorImplCopyWith<$Res> {
  factory _$$TransactionConnectionErrorImplCopyWith(
          _$TransactionConnectionErrorImpl value,
          $Res Function(_$TransactionConnectionErrorImpl) then) =
      __$$TransactionConnectionErrorImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$TransactionConnectionErrorImplCopyWithImpl<$Res>
    extends _$TransactionErrorCopyWithImpl<$Res,
        _$TransactionConnectionErrorImpl>
    implements _$$TransactionConnectionErrorImplCopyWith<$Res> {
  __$$TransactionConnectionErrorImplCopyWithImpl(
      _$TransactionConnectionErrorImpl _value,
      $Res Function(_$TransactionConnectionErrorImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$TransactionConnectionErrorImpl extends _TransactionConnectionError {
  const _$TransactionConnectionErrorImpl() : super._();

  @override
  String toString() {
    return 'TransactionError.connectivity()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TransactionConnectionErrorImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() timeout,
    required TResult Function() connectivity,
    required TResult Function() consensusNotReached,
    required TResult Function() invalidTransaction,
    required TResult Function() invalidConfirmation,
    required TResult Function() insufficientFunds,
    required TResult Function() serviceNotFound,
    required TResult Function() serviceAlreadyExists,
    required TResult Function() userRejected,
    required TResult Function(String accountName) unknownAccount,
    required TResult Function(int code, String message, Object? data) rpcError,
    required TResult Function(int? code, Object? data, String? message) other,
  }) {
    return connectivity();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? timeout,
    TResult? Function()? connectivity,
    TResult? Function()? consensusNotReached,
    TResult? Function()? invalidTransaction,
    TResult? Function()? invalidConfirmation,
    TResult? Function()? insufficientFunds,
    TResult? Function()? serviceNotFound,
    TResult? Function()? serviceAlreadyExists,
    TResult? Function()? userRejected,
    TResult? Function(String accountName)? unknownAccount,
    TResult? Function(int code, String message, Object? data)? rpcError,
    TResult? Function(int? code, Object? data, String? message)? other,
  }) {
    return connectivity?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? timeout,
    TResult Function()? connectivity,
    TResult Function()? consensusNotReached,
    TResult Function()? invalidTransaction,
    TResult Function()? invalidConfirmation,
    TResult Function()? insufficientFunds,
    TResult Function()? serviceNotFound,
    TResult Function()? serviceAlreadyExists,
    TResult Function()? userRejected,
    TResult Function(String accountName)? unknownAccount,
    TResult Function(int code, String message, Object? data)? rpcError,
    TResult Function(int? code, Object? data, String? message)? other,
    required TResult orElse(),
  }) {
    if (connectivity != null) {
      return connectivity();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_TransactionTimeout value) timeout,
    required TResult Function(_TransactionConnectionError value) connectivity,
    required TResult Function(_TransactionConsensusNotReachedError value)
        consensusNotReached,
    required TResult Function(_TransactionInvalid value) invalidTransaction,
    required TResult Function(_TransactionInvalidConfirmation value)
        invalidConfirmation,
    required TResult Function(_TransactionInsufficientFunds value)
        insufficientFunds,
    required TResult Function(_TransactionServiceNotFound value)
        serviceNotFound,
    required TResult Function(_TransactionServiceAlreadyExists value)
        serviceAlreadyExists,
    required TResult Function(_TransactionUserRejected value) userRejected,
    required TResult Function(_TransactionUnknownAccount value) unknownAccount,
    required TResult Function(_TransactionRPCError value) rpcError,
    required TResult Function(_TransactionOtherError value) other,
  }) {
    return connectivity(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_TransactionTimeout value)? timeout,
    TResult? Function(_TransactionConnectionError value)? connectivity,
    TResult? Function(_TransactionConsensusNotReachedError value)?
        consensusNotReached,
    TResult? Function(_TransactionInvalid value)? invalidTransaction,
    TResult? Function(_TransactionInvalidConfirmation value)?
        invalidConfirmation,
    TResult? Function(_TransactionInsufficientFunds value)? insufficientFunds,
    TResult? Function(_TransactionServiceNotFound value)? serviceNotFound,
    TResult? Function(_TransactionServiceAlreadyExists value)?
        serviceAlreadyExists,
    TResult? Function(_TransactionUserRejected value)? userRejected,
    TResult? Function(_TransactionUnknownAccount value)? unknownAccount,
    TResult? Function(_TransactionRPCError value)? rpcError,
    TResult? Function(_TransactionOtherError value)? other,
  }) {
    return connectivity?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_TransactionTimeout value)? timeout,
    TResult Function(_TransactionConnectionError value)? connectivity,
    TResult Function(_TransactionConsensusNotReachedError value)?
        consensusNotReached,
    TResult Function(_TransactionInvalid value)? invalidTransaction,
    TResult Function(_TransactionInvalidConfirmation value)?
        invalidConfirmation,
    TResult Function(_TransactionInsufficientFunds value)? insufficientFunds,
    TResult Function(_TransactionServiceNotFound value)? serviceNotFound,
    TResult Function(_TransactionServiceAlreadyExists value)?
        serviceAlreadyExists,
    TResult Function(_TransactionUserRejected value)? userRejected,
    TResult Function(_TransactionUnknownAccount value)? unknownAccount,
    TResult Function(_TransactionRPCError value)? rpcError,
    TResult Function(_TransactionOtherError value)? other,
    required TResult orElse(),
  }) {
    if (connectivity != null) {
      return connectivity(this);
    }
    return orElse();
  }
}

abstract class _TransactionConnectionError extends TransactionError {
  const factory _TransactionConnectionError() =
      _$TransactionConnectionErrorImpl;
  const _TransactionConnectionError._() : super._();
}

/// @nodoc
abstract class _$$TransactionConsensusNotReachedErrorImplCopyWith<$Res> {
  factory _$$TransactionConsensusNotReachedErrorImplCopyWith(
          _$TransactionConsensusNotReachedErrorImpl value,
          $Res Function(_$TransactionConsensusNotReachedErrorImpl) then) =
      __$$TransactionConsensusNotReachedErrorImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$TransactionConsensusNotReachedErrorImplCopyWithImpl<$Res>
    extends _$TransactionErrorCopyWithImpl<$Res,
        _$TransactionConsensusNotReachedErrorImpl>
    implements _$$TransactionConsensusNotReachedErrorImplCopyWith<$Res> {
  __$$TransactionConsensusNotReachedErrorImplCopyWithImpl(
      _$TransactionConsensusNotReachedErrorImpl _value,
      $Res Function(_$TransactionConsensusNotReachedErrorImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$TransactionConsensusNotReachedErrorImpl
    extends _TransactionConsensusNotReachedError {
  const _$TransactionConsensusNotReachedErrorImpl() : super._();

  @override
  String toString() {
    return 'TransactionError.consensusNotReached()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TransactionConsensusNotReachedErrorImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() timeout,
    required TResult Function() connectivity,
    required TResult Function() consensusNotReached,
    required TResult Function() invalidTransaction,
    required TResult Function() invalidConfirmation,
    required TResult Function() insufficientFunds,
    required TResult Function() serviceNotFound,
    required TResult Function() serviceAlreadyExists,
    required TResult Function() userRejected,
    required TResult Function(String accountName) unknownAccount,
    required TResult Function(int code, String message, Object? data) rpcError,
    required TResult Function(int? code, Object? data, String? message) other,
  }) {
    return consensusNotReached();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? timeout,
    TResult? Function()? connectivity,
    TResult? Function()? consensusNotReached,
    TResult? Function()? invalidTransaction,
    TResult? Function()? invalidConfirmation,
    TResult? Function()? insufficientFunds,
    TResult? Function()? serviceNotFound,
    TResult? Function()? serviceAlreadyExists,
    TResult? Function()? userRejected,
    TResult? Function(String accountName)? unknownAccount,
    TResult? Function(int code, String message, Object? data)? rpcError,
    TResult? Function(int? code, Object? data, String? message)? other,
  }) {
    return consensusNotReached?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? timeout,
    TResult Function()? connectivity,
    TResult Function()? consensusNotReached,
    TResult Function()? invalidTransaction,
    TResult Function()? invalidConfirmation,
    TResult Function()? insufficientFunds,
    TResult Function()? serviceNotFound,
    TResult Function()? serviceAlreadyExists,
    TResult Function()? userRejected,
    TResult Function(String accountName)? unknownAccount,
    TResult Function(int code, String message, Object? data)? rpcError,
    TResult Function(int? code, Object? data, String? message)? other,
    required TResult orElse(),
  }) {
    if (consensusNotReached != null) {
      return consensusNotReached();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_TransactionTimeout value) timeout,
    required TResult Function(_TransactionConnectionError value) connectivity,
    required TResult Function(_TransactionConsensusNotReachedError value)
        consensusNotReached,
    required TResult Function(_TransactionInvalid value) invalidTransaction,
    required TResult Function(_TransactionInvalidConfirmation value)
        invalidConfirmation,
    required TResult Function(_TransactionInsufficientFunds value)
        insufficientFunds,
    required TResult Function(_TransactionServiceNotFound value)
        serviceNotFound,
    required TResult Function(_TransactionServiceAlreadyExists value)
        serviceAlreadyExists,
    required TResult Function(_TransactionUserRejected value) userRejected,
    required TResult Function(_TransactionUnknownAccount value) unknownAccount,
    required TResult Function(_TransactionRPCError value) rpcError,
    required TResult Function(_TransactionOtherError value) other,
  }) {
    return consensusNotReached(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_TransactionTimeout value)? timeout,
    TResult? Function(_TransactionConnectionError value)? connectivity,
    TResult? Function(_TransactionConsensusNotReachedError value)?
        consensusNotReached,
    TResult? Function(_TransactionInvalid value)? invalidTransaction,
    TResult? Function(_TransactionInvalidConfirmation value)?
        invalidConfirmation,
    TResult? Function(_TransactionInsufficientFunds value)? insufficientFunds,
    TResult? Function(_TransactionServiceNotFound value)? serviceNotFound,
    TResult? Function(_TransactionServiceAlreadyExists value)?
        serviceAlreadyExists,
    TResult? Function(_TransactionUserRejected value)? userRejected,
    TResult? Function(_TransactionUnknownAccount value)? unknownAccount,
    TResult? Function(_TransactionRPCError value)? rpcError,
    TResult? Function(_TransactionOtherError value)? other,
  }) {
    return consensusNotReached?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_TransactionTimeout value)? timeout,
    TResult Function(_TransactionConnectionError value)? connectivity,
    TResult Function(_TransactionConsensusNotReachedError value)?
        consensusNotReached,
    TResult Function(_TransactionInvalid value)? invalidTransaction,
    TResult Function(_TransactionInvalidConfirmation value)?
        invalidConfirmation,
    TResult Function(_TransactionInsufficientFunds value)? insufficientFunds,
    TResult Function(_TransactionServiceNotFound value)? serviceNotFound,
    TResult Function(_TransactionServiceAlreadyExists value)?
        serviceAlreadyExists,
    TResult Function(_TransactionUserRejected value)? userRejected,
    TResult Function(_TransactionUnknownAccount value)? unknownAccount,
    TResult Function(_TransactionRPCError value)? rpcError,
    TResult Function(_TransactionOtherError value)? other,
    required TResult orElse(),
  }) {
    if (consensusNotReached != null) {
      return consensusNotReached(this);
    }
    return orElse();
  }
}

abstract class _TransactionConsensusNotReachedError extends TransactionError {
  const factory _TransactionConsensusNotReachedError() =
      _$TransactionConsensusNotReachedErrorImpl;
  const _TransactionConsensusNotReachedError._() : super._();
}

/// @nodoc
abstract class _$$TransactionInvalidImplCopyWith<$Res> {
  factory _$$TransactionInvalidImplCopyWith(_$TransactionInvalidImpl value,
          $Res Function(_$TransactionInvalidImpl) then) =
      __$$TransactionInvalidImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$TransactionInvalidImplCopyWithImpl<$Res>
    extends _$TransactionErrorCopyWithImpl<$Res, _$TransactionInvalidImpl>
    implements _$$TransactionInvalidImplCopyWith<$Res> {
  __$$TransactionInvalidImplCopyWithImpl(_$TransactionInvalidImpl _value,
      $Res Function(_$TransactionInvalidImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$TransactionInvalidImpl extends _TransactionInvalid {
  const _$TransactionInvalidImpl() : super._();

  @override
  String toString() {
    return 'TransactionError.invalidTransaction()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$TransactionInvalidImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() timeout,
    required TResult Function() connectivity,
    required TResult Function() consensusNotReached,
    required TResult Function() invalidTransaction,
    required TResult Function() invalidConfirmation,
    required TResult Function() insufficientFunds,
    required TResult Function() serviceNotFound,
    required TResult Function() serviceAlreadyExists,
    required TResult Function() userRejected,
    required TResult Function(String accountName) unknownAccount,
    required TResult Function(int code, String message, Object? data) rpcError,
    required TResult Function(int? code, Object? data, String? message) other,
  }) {
    return invalidTransaction();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? timeout,
    TResult? Function()? connectivity,
    TResult? Function()? consensusNotReached,
    TResult? Function()? invalidTransaction,
    TResult? Function()? invalidConfirmation,
    TResult? Function()? insufficientFunds,
    TResult? Function()? serviceNotFound,
    TResult? Function()? serviceAlreadyExists,
    TResult? Function()? userRejected,
    TResult? Function(String accountName)? unknownAccount,
    TResult? Function(int code, String message, Object? data)? rpcError,
    TResult? Function(int? code, Object? data, String? message)? other,
  }) {
    return invalidTransaction?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? timeout,
    TResult Function()? connectivity,
    TResult Function()? consensusNotReached,
    TResult Function()? invalidTransaction,
    TResult Function()? invalidConfirmation,
    TResult Function()? insufficientFunds,
    TResult Function()? serviceNotFound,
    TResult Function()? serviceAlreadyExists,
    TResult Function()? userRejected,
    TResult Function(String accountName)? unknownAccount,
    TResult Function(int code, String message, Object? data)? rpcError,
    TResult Function(int? code, Object? data, String? message)? other,
    required TResult orElse(),
  }) {
    if (invalidTransaction != null) {
      return invalidTransaction();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_TransactionTimeout value) timeout,
    required TResult Function(_TransactionConnectionError value) connectivity,
    required TResult Function(_TransactionConsensusNotReachedError value)
        consensusNotReached,
    required TResult Function(_TransactionInvalid value) invalidTransaction,
    required TResult Function(_TransactionInvalidConfirmation value)
        invalidConfirmation,
    required TResult Function(_TransactionInsufficientFunds value)
        insufficientFunds,
    required TResult Function(_TransactionServiceNotFound value)
        serviceNotFound,
    required TResult Function(_TransactionServiceAlreadyExists value)
        serviceAlreadyExists,
    required TResult Function(_TransactionUserRejected value) userRejected,
    required TResult Function(_TransactionUnknownAccount value) unknownAccount,
    required TResult Function(_TransactionRPCError value) rpcError,
    required TResult Function(_TransactionOtherError value) other,
  }) {
    return invalidTransaction(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_TransactionTimeout value)? timeout,
    TResult? Function(_TransactionConnectionError value)? connectivity,
    TResult? Function(_TransactionConsensusNotReachedError value)?
        consensusNotReached,
    TResult? Function(_TransactionInvalid value)? invalidTransaction,
    TResult? Function(_TransactionInvalidConfirmation value)?
        invalidConfirmation,
    TResult? Function(_TransactionInsufficientFunds value)? insufficientFunds,
    TResult? Function(_TransactionServiceNotFound value)? serviceNotFound,
    TResult? Function(_TransactionServiceAlreadyExists value)?
        serviceAlreadyExists,
    TResult? Function(_TransactionUserRejected value)? userRejected,
    TResult? Function(_TransactionUnknownAccount value)? unknownAccount,
    TResult? Function(_TransactionRPCError value)? rpcError,
    TResult? Function(_TransactionOtherError value)? other,
  }) {
    return invalidTransaction?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_TransactionTimeout value)? timeout,
    TResult Function(_TransactionConnectionError value)? connectivity,
    TResult Function(_TransactionConsensusNotReachedError value)?
        consensusNotReached,
    TResult Function(_TransactionInvalid value)? invalidTransaction,
    TResult Function(_TransactionInvalidConfirmation value)?
        invalidConfirmation,
    TResult Function(_TransactionInsufficientFunds value)? insufficientFunds,
    TResult Function(_TransactionServiceNotFound value)? serviceNotFound,
    TResult Function(_TransactionServiceAlreadyExists value)?
        serviceAlreadyExists,
    TResult Function(_TransactionUserRejected value)? userRejected,
    TResult Function(_TransactionUnknownAccount value)? unknownAccount,
    TResult Function(_TransactionRPCError value)? rpcError,
    TResult Function(_TransactionOtherError value)? other,
    required TResult orElse(),
  }) {
    if (invalidTransaction != null) {
      return invalidTransaction(this);
    }
    return orElse();
  }
}

abstract class _TransactionInvalid extends TransactionError {
  const factory _TransactionInvalid() = _$TransactionInvalidImpl;
  const _TransactionInvalid._() : super._();
}

/// @nodoc
abstract class _$$TransactionInvalidConfirmationImplCopyWith<$Res> {
  factory _$$TransactionInvalidConfirmationImplCopyWith(
          _$TransactionInvalidConfirmationImpl value,
          $Res Function(_$TransactionInvalidConfirmationImpl) then) =
      __$$TransactionInvalidConfirmationImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$TransactionInvalidConfirmationImplCopyWithImpl<$Res>
    extends _$TransactionErrorCopyWithImpl<$Res,
        _$TransactionInvalidConfirmationImpl>
    implements _$$TransactionInvalidConfirmationImplCopyWith<$Res> {
  __$$TransactionInvalidConfirmationImplCopyWithImpl(
      _$TransactionInvalidConfirmationImpl _value,
      $Res Function(_$TransactionInvalidConfirmationImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$TransactionInvalidConfirmationImpl
    extends _TransactionInvalidConfirmation {
  const _$TransactionInvalidConfirmationImpl() : super._();

  @override
  String toString() {
    return 'TransactionError.invalidConfirmation()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TransactionInvalidConfirmationImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() timeout,
    required TResult Function() connectivity,
    required TResult Function() consensusNotReached,
    required TResult Function() invalidTransaction,
    required TResult Function() invalidConfirmation,
    required TResult Function() insufficientFunds,
    required TResult Function() serviceNotFound,
    required TResult Function() serviceAlreadyExists,
    required TResult Function() userRejected,
    required TResult Function(String accountName) unknownAccount,
    required TResult Function(int code, String message, Object? data) rpcError,
    required TResult Function(int? code, Object? data, String? message) other,
  }) {
    return invalidConfirmation();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? timeout,
    TResult? Function()? connectivity,
    TResult? Function()? consensusNotReached,
    TResult? Function()? invalidTransaction,
    TResult? Function()? invalidConfirmation,
    TResult? Function()? insufficientFunds,
    TResult? Function()? serviceNotFound,
    TResult? Function()? serviceAlreadyExists,
    TResult? Function()? userRejected,
    TResult? Function(String accountName)? unknownAccount,
    TResult? Function(int code, String message, Object? data)? rpcError,
    TResult? Function(int? code, Object? data, String? message)? other,
  }) {
    return invalidConfirmation?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? timeout,
    TResult Function()? connectivity,
    TResult Function()? consensusNotReached,
    TResult Function()? invalidTransaction,
    TResult Function()? invalidConfirmation,
    TResult Function()? insufficientFunds,
    TResult Function()? serviceNotFound,
    TResult Function()? serviceAlreadyExists,
    TResult Function()? userRejected,
    TResult Function(String accountName)? unknownAccount,
    TResult Function(int code, String message, Object? data)? rpcError,
    TResult Function(int? code, Object? data, String? message)? other,
    required TResult orElse(),
  }) {
    if (invalidConfirmation != null) {
      return invalidConfirmation();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_TransactionTimeout value) timeout,
    required TResult Function(_TransactionConnectionError value) connectivity,
    required TResult Function(_TransactionConsensusNotReachedError value)
        consensusNotReached,
    required TResult Function(_TransactionInvalid value) invalidTransaction,
    required TResult Function(_TransactionInvalidConfirmation value)
        invalidConfirmation,
    required TResult Function(_TransactionInsufficientFunds value)
        insufficientFunds,
    required TResult Function(_TransactionServiceNotFound value)
        serviceNotFound,
    required TResult Function(_TransactionServiceAlreadyExists value)
        serviceAlreadyExists,
    required TResult Function(_TransactionUserRejected value) userRejected,
    required TResult Function(_TransactionUnknownAccount value) unknownAccount,
    required TResult Function(_TransactionRPCError value) rpcError,
    required TResult Function(_TransactionOtherError value) other,
  }) {
    return invalidConfirmation(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_TransactionTimeout value)? timeout,
    TResult? Function(_TransactionConnectionError value)? connectivity,
    TResult? Function(_TransactionConsensusNotReachedError value)?
        consensusNotReached,
    TResult? Function(_TransactionInvalid value)? invalidTransaction,
    TResult? Function(_TransactionInvalidConfirmation value)?
        invalidConfirmation,
    TResult? Function(_TransactionInsufficientFunds value)? insufficientFunds,
    TResult? Function(_TransactionServiceNotFound value)? serviceNotFound,
    TResult? Function(_TransactionServiceAlreadyExists value)?
        serviceAlreadyExists,
    TResult? Function(_TransactionUserRejected value)? userRejected,
    TResult? Function(_TransactionUnknownAccount value)? unknownAccount,
    TResult? Function(_TransactionRPCError value)? rpcError,
    TResult? Function(_TransactionOtherError value)? other,
  }) {
    return invalidConfirmation?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_TransactionTimeout value)? timeout,
    TResult Function(_TransactionConnectionError value)? connectivity,
    TResult Function(_TransactionConsensusNotReachedError value)?
        consensusNotReached,
    TResult Function(_TransactionInvalid value)? invalidTransaction,
    TResult Function(_TransactionInvalidConfirmation value)?
        invalidConfirmation,
    TResult Function(_TransactionInsufficientFunds value)? insufficientFunds,
    TResult Function(_TransactionServiceNotFound value)? serviceNotFound,
    TResult Function(_TransactionServiceAlreadyExists value)?
        serviceAlreadyExists,
    TResult Function(_TransactionUserRejected value)? userRejected,
    TResult Function(_TransactionUnknownAccount value)? unknownAccount,
    TResult Function(_TransactionRPCError value)? rpcError,
    TResult Function(_TransactionOtherError value)? other,
    required TResult orElse(),
  }) {
    if (invalidConfirmation != null) {
      return invalidConfirmation(this);
    }
    return orElse();
  }
}

abstract class _TransactionInvalidConfirmation extends TransactionError {
  const factory _TransactionInvalidConfirmation() =
      _$TransactionInvalidConfirmationImpl;
  const _TransactionInvalidConfirmation._() : super._();
}

/// @nodoc
abstract class _$$TransactionInsufficientFundsImplCopyWith<$Res> {
  factory _$$TransactionInsufficientFundsImplCopyWith(
          _$TransactionInsufficientFundsImpl value,
          $Res Function(_$TransactionInsufficientFundsImpl) then) =
      __$$TransactionInsufficientFundsImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$TransactionInsufficientFundsImplCopyWithImpl<$Res>
    extends _$TransactionErrorCopyWithImpl<$Res,
        _$TransactionInsufficientFundsImpl>
    implements _$$TransactionInsufficientFundsImplCopyWith<$Res> {
  __$$TransactionInsufficientFundsImplCopyWithImpl(
      _$TransactionInsufficientFundsImpl _value,
      $Res Function(_$TransactionInsufficientFundsImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$TransactionInsufficientFundsImpl extends _TransactionInsufficientFunds {
  const _$TransactionInsufficientFundsImpl() : super._();

  @override
  String toString() {
    return 'TransactionError.insufficientFunds()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TransactionInsufficientFundsImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() timeout,
    required TResult Function() connectivity,
    required TResult Function() consensusNotReached,
    required TResult Function() invalidTransaction,
    required TResult Function() invalidConfirmation,
    required TResult Function() insufficientFunds,
    required TResult Function() serviceNotFound,
    required TResult Function() serviceAlreadyExists,
    required TResult Function() userRejected,
    required TResult Function(String accountName) unknownAccount,
    required TResult Function(int code, String message, Object? data) rpcError,
    required TResult Function(int? code, Object? data, String? message) other,
  }) {
    return insufficientFunds();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? timeout,
    TResult? Function()? connectivity,
    TResult? Function()? consensusNotReached,
    TResult? Function()? invalidTransaction,
    TResult? Function()? invalidConfirmation,
    TResult? Function()? insufficientFunds,
    TResult? Function()? serviceNotFound,
    TResult? Function()? serviceAlreadyExists,
    TResult? Function()? userRejected,
    TResult? Function(String accountName)? unknownAccount,
    TResult? Function(int code, String message, Object? data)? rpcError,
    TResult? Function(int? code, Object? data, String? message)? other,
  }) {
    return insufficientFunds?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? timeout,
    TResult Function()? connectivity,
    TResult Function()? consensusNotReached,
    TResult Function()? invalidTransaction,
    TResult Function()? invalidConfirmation,
    TResult Function()? insufficientFunds,
    TResult Function()? serviceNotFound,
    TResult Function()? serviceAlreadyExists,
    TResult Function()? userRejected,
    TResult Function(String accountName)? unknownAccount,
    TResult Function(int code, String message, Object? data)? rpcError,
    TResult Function(int? code, Object? data, String? message)? other,
    required TResult orElse(),
  }) {
    if (insufficientFunds != null) {
      return insufficientFunds();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_TransactionTimeout value) timeout,
    required TResult Function(_TransactionConnectionError value) connectivity,
    required TResult Function(_TransactionConsensusNotReachedError value)
        consensusNotReached,
    required TResult Function(_TransactionInvalid value) invalidTransaction,
    required TResult Function(_TransactionInvalidConfirmation value)
        invalidConfirmation,
    required TResult Function(_TransactionInsufficientFunds value)
        insufficientFunds,
    required TResult Function(_TransactionServiceNotFound value)
        serviceNotFound,
    required TResult Function(_TransactionServiceAlreadyExists value)
        serviceAlreadyExists,
    required TResult Function(_TransactionUserRejected value) userRejected,
    required TResult Function(_TransactionUnknownAccount value) unknownAccount,
    required TResult Function(_TransactionRPCError value) rpcError,
    required TResult Function(_TransactionOtherError value) other,
  }) {
    return insufficientFunds(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_TransactionTimeout value)? timeout,
    TResult? Function(_TransactionConnectionError value)? connectivity,
    TResult? Function(_TransactionConsensusNotReachedError value)?
        consensusNotReached,
    TResult? Function(_TransactionInvalid value)? invalidTransaction,
    TResult? Function(_TransactionInvalidConfirmation value)?
        invalidConfirmation,
    TResult? Function(_TransactionInsufficientFunds value)? insufficientFunds,
    TResult? Function(_TransactionServiceNotFound value)? serviceNotFound,
    TResult? Function(_TransactionServiceAlreadyExists value)?
        serviceAlreadyExists,
    TResult? Function(_TransactionUserRejected value)? userRejected,
    TResult? Function(_TransactionUnknownAccount value)? unknownAccount,
    TResult? Function(_TransactionRPCError value)? rpcError,
    TResult? Function(_TransactionOtherError value)? other,
  }) {
    return insufficientFunds?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_TransactionTimeout value)? timeout,
    TResult Function(_TransactionConnectionError value)? connectivity,
    TResult Function(_TransactionConsensusNotReachedError value)?
        consensusNotReached,
    TResult Function(_TransactionInvalid value)? invalidTransaction,
    TResult Function(_TransactionInvalidConfirmation value)?
        invalidConfirmation,
    TResult Function(_TransactionInsufficientFunds value)? insufficientFunds,
    TResult Function(_TransactionServiceNotFound value)? serviceNotFound,
    TResult Function(_TransactionServiceAlreadyExists value)?
        serviceAlreadyExists,
    TResult Function(_TransactionUserRejected value)? userRejected,
    TResult Function(_TransactionUnknownAccount value)? unknownAccount,
    TResult Function(_TransactionRPCError value)? rpcError,
    TResult Function(_TransactionOtherError value)? other,
    required TResult orElse(),
  }) {
    if (insufficientFunds != null) {
      return insufficientFunds(this);
    }
    return orElse();
  }
}

abstract class _TransactionInsufficientFunds extends TransactionError {
  const factory _TransactionInsufficientFunds() =
      _$TransactionInsufficientFundsImpl;
  const _TransactionInsufficientFunds._() : super._();
}

/// @nodoc
abstract class _$$TransactionServiceNotFoundImplCopyWith<$Res> {
  factory _$$TransactionServiceNotFoundImplCopyWith(
          _$TransactionServiceNotFoundImpl value,
          $Res Function(_$TransactionServiceNotFoundImpl) then) =
      __$$TransactionServiceNotFoundImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$TransactionServiceNotFoundImplCopyWithImpl<$Res>
    extends _$TransactionErrorCopyWithImpl<$Res,
        _$TransactionServiceNotFoundImpl>
    implements _$$TransactionServiceNotFoundImplCopyWith<$Res> {
  __$$TransactionServiceNotFoundImplCopyWithImpl(
      _$TransactionServiceNotFoundImpl _value,
      $Res Function(_$TransactionServiceNotFoundImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$TransactionServiceNotFoundImpl extends _TransactionServiceNotFound {
  const _$TransactionServiceNotFoundImpl() : super._();

  @override
  String toString() {
    return 'TransactionError.serviceNotFound()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TransactionServiceNotFoundImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() timeout,
    required TResult Function() connectivity,
    required TResult Function() consensusNotReached,
    required TResult Function() invalidTransaction,
    required TResult Function() invalidConfirmation,
    required TResult Function() insufficientFunds,
    required TResult Function() serviceNotFound,
    required TResult Function() serviceAlreadyExists,
    required TResult Function() userRejected,
    required TResult Function(String accountName) unknownAccount,
    required TResult Function(int code, String message, Object? data) rpcError,
    required TResult Function(int? code, Object? data, String? message) other,
  }) {
    return serviceNotFound();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? timeout,
    TResult? Function()? connectivity,
    TResult? Function()? consensusNotReached,
    TResult? Function()? invalidTransaction,
    TResult? Function()? invalidConfirmation,
    TResult? Function()? insufficientFunds,
    TResult? Function()? serviceNotFound,
    TResult? Function()? serviceAlreadyExists,
    TResult? Function()? userRejected,
    TResult? Function(String accountName)? unknownAccount,
    TResult? Function(int code, String message, Object? data)? rpcError,
    TResult? Function(int? code, Object? data, String? message)? other,
  }) {
    return serviceNotFound?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? timeout,
    TResult Function()? connectivity,
    TResult Function()? consensusNotReached,
    TResult Function()? invalidTransaction,
    TResult Function()? invalidConfirmation,
    TResult Function()? insufficientFunds,
    TResult Function()? serviceNotFound,
    TResult Function()? serviceAlreadyExists,
    TResult Function()? userRejected,
    TResult Function(String accountName)? unknownAccount,
    TResult Function(int code, String message, Object? data)? rpcError,
    TResult Function(int? code, Object? data, String? message)? other,
    required TResult orElse(),
  }) {
    if (serviceNotFound != null) {
      return serviceNotFound();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_TransactionTimeout value) timeout,
    required TResult Function(_TransactionConnectionError value) connectivity,
    required TResult Function(_TransactionConsensusNotReachedError value)
        consensusNotReached,
    required TResult Function(_TransactionInvalid value) invalidTransaction,
    required TResult Function(_TransactionInvalidConfirmation value)
        invalidConfirmation,
    required TResult Function(_TransactionInsufficientFunds value)
        insufficientFunds,
    required TResult Function(_TransactionServiceNotFound value)
        serviceNotFound,
    required TResult Function(_TransactionServiceAlreadyExists value)
        serviceAlreadyExists,
    required TResult Function(_TransactionUserRejected value) userRejected,
    required TResult Function(_TransactionUnknownAccount value) unknownAccount,
    required TResult Function(_TransactionRPCError value) rpcError,
    required TResult Function(_TransactionOtherError value) other,
  }) {
    return serviceNotFound(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_TransactionTimeout value)? timeout,
    TResult? Function(_TransactionConnectionError value)? connectivity,
    TResult? Function(_TransactionConsensusNotReachedError value)?
        consensusNotReached,
    TResult? Function(_TransactionInvalid value)? invalidTransaction,
    TResult? Function(_TransactionInvalidConfirmation value)?
        invalidConfirmation,
    TResult? Function(_TransactionInsufficientFunds value)? insufficientFunds,
    TResult? Function(_TransactionServiceNotFound value)? serviceNotFound,
    TResult? Function(_TransactionServiceAlreadyExists value)?
        serviceAlreadyExists,
    TResult? Function(_TransactionUserRejected value)? userRejected,
    TResult? Function(_TransactionUnknownAccount value)? unknownAccount,
    TResult? Function(_TransactionRPCError value)? rpcError,
    TResult? Function(_TransactionOtherError value)? other,
  }) {
    return serviceNotFound?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_TransactionTimeout value)? timeout,
    TResult Function(_TransactionConnectionError value)? connectivity,
    TResult Function(_TransactionConsensusNotReachedError value)?
        consensusNotReached,
    TResult Function(_TransactionInvalid value)? invalidTransaction,
    TResult Function(_TransactionInvalidConfirmation value)?
        invalidConfirmation,
    TResult Function(_TransactionInsufficientFunds value)? insufficientFunds,
    TResult Function(_TransactionServiceNotFound value)? serviceNotFound,
    TResult Function(_TransactionServiceAlreadyExists value)?
        serviceAlreadyExists,
    TResult Function(_TransactionUserRejected value)? userRejected,
    TResult Function(_TransactionUnknownAccount value)? unknownAccount,
    TResult Function(_TransactionRPCError value)? rpcError,
    TResult Function(_TransactionOtherError value)? other,
    required TResult orElse(),
  }) {
    if (serviceNotFound != null) {
      return serviceNotFound(this);
    }
    return orElse();
  }
}

abstract class _TransactionServiceNotFound extends TransactionError {
  const factory _TransactionServiceNotFound() =
      _$TransactionServiceNotFoundImpl;
  const _TransactionServiceNotFound._() : super._();
}

/// @nodoc
abstract class _$$TransactionServiceAlreadyExistsImplCopyWith<$Res> {
  factory _$$TransactionServiceAlreadyExistsImplCopyWith(
          _$TransactionServiceAlreadyExistsImpl value,
          $Res Function(_$TransactionServiceAlreadyExistsImpl) then) =
      __$$TransactionServiceAlreadyExistsImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$TransactionServiceAlreadyExistsImplCopyWithImpl<$Res>
    extends _$TransactionErrorCopyWithImpl<$Res,
        _$TransactionServiceAlreadyExistsImpl>
    implements _$$TransactionServiceAlreadyExistsImplCopyWith<$Res> {
  __$$TransactionServiceAlreadyExistsImplCopyWithImpl(
      _$TransactionServiceAlreadyExistsImpl _value,
      $Res Function(_$TransactionServiceAlreadyExistsImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$TransactionServiceAlreadyExistsImpl
    extends _TransactionServiceAlreadyExists {
  const _$TransactionServiceAlreadyExistsImpl() : super._();

  @override
  String toString() {
    return 'TransactionError.serviceAlreadyExists()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TransactionServiceAlreadyExistsImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() timeout,
    required TResult Function() connectivity,
    required TResult Function() consensusNotReached,
    required TResult Function() invalidTransaction,
    required TResult Function() invalidConfirmation,
    required TResult Function() insufficientFunds,
    required TResult Function() serviceNotFound,
    required TResult Function() serviceAlreadyExists,
    required TResult Function() userRejected,
    required TResult Function(String accountName) unknownAccount,
    required TResult Function(int code, String message, Object? data) rpcError,
    required TResult Function(int? code, Object? data, String? message) other,
  }) {
    return serviceAlreadyExists();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? timeout,
    TResult? Function()? connectivity,
    TResult? Function()? consensusNotReached,
    TResult? Function()? invalidTransaction,
    TResult? Function()? invalidConfirmation,
    TResult? Function()? insufficientFunds,
    TResult? Function()? serviceNotFound,
    TResult? Function()? serviceAlreadyExists,
    TResult? Function()? userRejected,
    TResult? Function(String accountName)? unknownAccount,
    TResult? Function(int code, String message, Object? data)? rpcError,
    TResult? Function(int? code, Object? data, String? message)? other,
  }) {
    return serviceAlreadyExists?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? timeout,
    TResult Function()? connectivity,
    TResult Function()? consensusNotReached,
    TResult Function()? invalidTransaction,
    TResult Function()? invalidConfirmation,
    TResult Function()? insufficientFunds,
    TResult Function()? serviceNotFound,
    TResult Function()? serviceAlreadyExists,
    TResult Function()? userRejected,
    TResult Function(String accountName)? unknownAccount,
    TResult Function(int code, String message, Object? data)? rpcError,
    TResult Function(int? code, Object? data, String? message)? other,
    required TResult orElse(),
  }) {
    if (serviceAlreadyExists != null) {
      return serviceAlreadyExists();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_TransactionTimeout value) timeout,
    required TResult Function(_TransactionConnectionError value) connectivity,
    required TResult Function(_TransactionConsensusNotReachedError value)
        consensusNotReached,
    required TResult Function(_TransactionInvalid value) invalidTransaction,
    required TResult Function(_TransactionInvalidConfirmation value)
        invalidConfirmation,
    required TResult Function(_TransactionInsufficientFunds value)
        insufficientFunds,
    required TResult Function(_TransactionServiceNotFound value)
        serviceNotFound,
    required TResult Function(_TransactionServiceAlreadyExists value)
        serviceAlreadyExists,
    required TResult Function(_TransactionUserRejected value) userRejected,
    required TResult Function(_TransactionUnknownAccount value) unknownAccount,
    required TResult Function(_TransactionRPCError value) rpcError,
    required TResult Function(_TransactionOtherError value) other,
  }) {
    return serviceAlreadyExists(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_TransactionTimeout value)? timeout,
    TResult? Function(_TransactionConnectionError value)? connectivity,
    TResult? Function(_TransactionConsensusNotReachedError value)?
        consensusNotReached,
    TResult? Function(_TransactionInvalid value)? invalidTransaction,
    TResult? Function(_TransactionInvalidConfirmation value)?
        invalidConfirmation,
    TResult? Function(_TransactionInsufficientFunds value)? insufficientFunds,
    TResult? Function(_TransactionServiceNotFound value)? serviceNotFound,
    TResult? Function(_TransactionServiceAlreadyExists value)?
        serviceAlreadyExists,
    TResult? Function(_TransactionUserRejected value)? userRejected,
    TResult? Function(_TransactionUnknownAccount value)? unknownAccount,
    TResult? Function(_TransactionRPCError value)? rpcError,
    TResult? Function(_TransactionOtherError value)? other,
  }) {
    return serviceAlreadyExists?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_TransactionTimeout value)? timeout,
    TResult Function(_TransactionConnectionError value)? connectivity,
    TResult Function(_TransactionConsensusNotReachedError value)?
        consensusNotReached,
    TResult Function(_TransactionInvalid value)? invalidTransaction,
    TResult Function(_TransactionInvalidConfirmation value)?
        invalidConfirmation,
    TResult Function(_TransactionInsufficientFunds value)? insufficientFunds,
    TResult Function(_TransactionServiceNotFound value)? serviceNotFound,
    TResult Function(_TransactionServiceAlreadyExists value)?
        serviceAlreadyExists,
    TResult Function(_TransactionUserRejected value)? userRejected,
    TResult Function(_TransactionUnknownAccount value)? unknownAccount,
    TResult Function(_TransactionRPCError value)? rpcError,
    TResult Function(_TransactionOtherError value)? other,
    required TResult orElse(),
  }) {
    if (serviceAlreadyExists != null) {
      return serviceAlreadyExists(this);
    }
    return orElse();
  }
}

abstract class _TransactionServiceAlreadyExists extends TransactionError {
  const factory _TransactionServiceAlreadyExists() =
      _$TransactionServiceAlreadyExistsImpl;
  const _TransactionServiceAlreadyExists._() : super._();
}

/// @nodoc
abstract class _$$TransactionUserRejectedImplCopyWith<$Res> {
  factory _$$TransactionUserRejectedImplCopyWith(
          _$TransactionUserRejectedImpl value,
          $Res Function(_$TransactionUserRejectedImpl) then) =
      __$$TransactionUserRejectedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$TransactionUserRejectedImplCopyWithImpl<$Res>
    extends _$TransactionErrorCopyWithImpl<$Res, _$TransactionUserRejectedImpl>
    implements _$$TransactionUserRejectedImplCopyWith<$Res> {
  __$$TransactionUserRejectedImplCopyWithImpl(
      _$TransactionUserRejectedImpl _value,
      $Res Function(_$TransactionUserRejectedImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$TransactionUserRejectedImpl extends _TransactionUserRejected {
  const _$TransactionUserRejectedImpl() : super._();

  @override
  String toString() {
    return 'TransactionError.userRejected()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TransactionUserRejectedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() timeout,
    required TResult Function() connectivity,
    required TResult Function() consensusNotReached,
    required TResult Function() invalidTransaction,
    required TResult Function() invalidConfirmation,
    required TResult Function() insufficientFunds,
    required TResult Function() serviceNotFound,
    required TResult Function() serviceAlreadyExists,
    required TResult Function() userRejected,
    required TResult Function(String accountName) unknownAccount,
    required TResult Function(int code, String message, Object? data) rpcError,
    required TResult Function(int? code, Object? data, String? message) other,
  }) {
    return userRejected();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? timeout,
    TResult? Function()? connectivity,
    TResult? Function()? consensusNotReached,
    TResult? Function()? invalidTransaction,
    TResult? Function()? invalidConfirmation,
    TResult? Function()? insufficientFunds,
    TResult? Function()? serviceNotFound,
    TResult? Function()? serviceAlreadyExists,
    TResult? Function()? userRejected,
    TResult? Function(String accountName)? unknownAccount,
    TResult? Function(int code, String message, Object? data)? rpcError,
    TResult? Function(int? code, Object? data, String? message)? other,
  }) {
    return userRejected?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? timeout,
    TResult Function()? connectivity,
    TResult Function()? consensusNotReached,
    TResult Function()? invalidTransaction,
    TResult Function()? invalidConfirmation,
    TResult Function()? insufficientFunds,
    TResult Function()? serviceNotFound,
    TResult Function()? serviceAlreadyExists,
    TResult Function()? userRejected,
    TResult Function(String accountName)? unknownAccount,
    TResult Function(int code, String message, Object? data)? rpcError,
    TResult Function(int? code, Object? data, String? message)? other,
    required TResult orElse(),
  }) {
    if (userRejected != null) {
      return userRejected();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_TransactionTimeout value) timeout,
    required TResult Function(_TransactionConnectionError value) connectivity,
    required TResult Function(_TransactionConsensusNotReachedError value)
        consensusNotReached,
    required TResult Function(_TransactionInvalid value) invalidTransaction,
    required TResult Function(_TransactionInvalidConfirmation value)
        invalidConfirmation,
    required TResult Function(_TransactionInsufficientFunds value)
        insufficientFunds,
    required TResult Function(_TransactionServiceNotFound value)
        serviceNotFound,
    required TResult Function(_TransactionServiceAlreadyExists value)
        serviceAlreadyExists,
    required TResult Function(_TransactionUserRejected value) userRejected,
    required TResult Function(_TransactionUnknownAccount value) unknownAccount,
    required TResult Function(_TransactionRPCError value) rpcError,
    required TResult Function(_TransactionOtherError value) other,
  }) {
    return userRejected(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_TransactionTimeout value)? timeout,
    TResult? Function(_TransactionConnectionError value)? connectivity,
    TResult? Function(_TransactionConsensusNotReachedError value)?
        consensusNotReached,
    TResult? Function(_TransactionInvalid value)? invalidTransaction,
    TResult? Function(_TransactionInvalidConfirmation value)?
        invalidConfirmation,
    TResult? Function(_TransactionInsufficientFunds value)? insufficientFunds,
    TResult? Function(_TransactionServiceNotFound value)? serviceNotFound,
    TResult? Function(_TransactionServiceAlreadyExists value)?
        serviceAlreadyExists,
    TResult? Function(_TransactionUserRejected value)? userRejected,
    TResult? Function(_TransactionUnknownAccount value)? unknownAccount,
    TResult? Function(_TransactionRPCError value)? rpcError,
    TResult? Function(_TransactionOtherError value)? other,
  }) {
    return userRejected?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_TransactionTimeout value)? timeout,
    TResult Function(_TransactionConnectionError value)? connectivity,
    TResult Function(_TransactionConsensusNotReachedError value)?
        consensusNotReached,
    TResult Function(_TransactionInvalid value)? invalidTransaction,
    TResult Function(_TransactionInvalidConfirmation value)?
        invalidConfirmation,
    TResult Function(_TransactionInsufficientFunds value)? insufficientFunds,
    TResult Function(_TransactionServiceNotFound value)? serviceNotFound,
    TResult Function(_TransactionServiceAlreadyExists value)?
        serviceAlreadyExists,
    TResult Function(_TransactionUserRejected value)? userRejected,
    TResult Function(_TransactionUnknownAccount value)? unknownAccount,
    TResult Function(_TransactionRPCError value)? rpcError,
    TResult Function(_TransactionOtherError value)? other,
    required TResult orElse(),
  }) {
    if (userRejected != null) {
      return userRejected(this);
    }
    return orElse();
  }
}

abstract class _TransactionUserRejected extends TransactionError {
  const factory _TransactionUserRejected() = _$TransactionUserRejectedImpl;
  const _TransactionUserRejected._() : super._();
}

/// @nodoc
abstract class _$$TransactionUnknownAccountImplCopyWith<$Res> {
  factory _$$TransactionUnknownAccountImplCopyWith(
          _$TransactionUnknownAccountImpl value,
          $Res Function(_$TransactionUnknownAccountImpl) then) =
      __$$TransactionUnknownAccountImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String accountName});
}

/// @nodoc
class __$$TransactionUnknownAccountImplCopyWithImpl<$Res>
    extends _$TransactionErrorCopyWithImpl<$Res,
        _$TransactionUnknownAccountImpl>
    implements _$$TransactionUnknownAccountImplCopyWith<$Res> {
  __$$TransactionUnknownAccountImplCopyWithImpl(
      _$TransactionUnknownAccountImpl _value,
      $Res Function(_$TransactionUnknownAccountImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accountName = null,
  }) {
    return _then(_$TransactionUnknownAccountImpl(
      accountName: null == accountName
          ? _value.accountName
          : accountName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$TransactionUnknownAccountImpl extends _TransactionUnknownAccount {
  const _$TransactionUnknownAccountImpl({required this.accountName})
      : super._();

  @override
  final String accountName;

  @override
  String toString() {
    return 'TransactionError.unknownAccount(accountName: $accountName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TransactionUnknownAccountImpl &&
            (identical(other.accountName, accountName) ||
                other.accountName == accountName));
  }

  @override
  int get hashCode => Object.hash(runtimeType, accountName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TransactionUnknownAccountImplCopyWith<_$TransactionUnknownAccountImpl>
      get copyWith => __$$TransactionUnknownAccountImplCopyWithImpl<
          _$TransactionUnknownAccountImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() timeout,
    required TResult Function() connectivity,
    required TResult Function() consensusNotReached,
    required TResult Function() invalidTransaction,
    required TResult Function() invalidConfirmation,
    required TResult Function() insufficientFunds,
    required TResult Function() serviceNotFound,
    required TResult Function() serviceAlreadyExists,
    required TResult Function() userRejected,
    required TResult Function(String accountName) unknownAccount,
    required TResult Function(int code, String message, Object? data) rpcError,
    required TResult Function(int? code, Object? data, String? message) other,
  }) {
    return unknownAccount(accountName);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? timeout,
    TResult? Function()? connectivity,
    TResult? Function()? consensusNotReached,
    TResult? Function()? invalidTransaction,
    TResult? Function()? invalidConfirmation,
    TResult? Function()? insufficientFunds,
    TResult? Function()? serviceNotFound,
    TResult? Function()? serviceAlreadyExists,
    TResult? Function()? userRejected,
    TResult? Function(String accountName)? unknownAccount,
    TResult? Function(int code, String message, Object? data)? rpcError,
    TResult? Function(int? code, Object? data, String? message)? other,
  }) {
    return unknownAccount?.call(accountName);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? timeout,
    TResult Function()? connectivity,
    TResult Function()? consensusNotReached,
    TResult Function()? invalidTransaction,
    TResult Function()? invalidConfirmation,
    TResult Function()? insufficientFunds,
    TResult Function()? serviceNotFound,
    TResult Function()? serviceAlreadyExists,
    TResult Function()? userRejected,
    TResult Function(String accountName)? unknownAccount,
    TResult Function(int code, String message, Object? data)? rpcError,
    TResult Function(int? code, Object? data, String? message)? other,
    required TResult orElse(),
  }) {
    if (unknownAccount != null) {
      return unknownAccount(accountName);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_TransactionTimeout value) timeout,
    required TResult Function(_TransactionConnectionError value) connectivity,
    required TResult Function(_TransactionConsensusNotReachedError value)
        consensusNotReached,
    required TResult Function(_TransactionInvalid value) invalidTransaction,
    required TResult Function(_TransactionInvalidConfirmation value)
        invalidConfirmation,
    required TResult Function(_TransactionInsufficientFunds value)
        insufficientFunds,
    required TResult Function(_TransactionServiceNotFound value)
        serviceNotFound,
    required TResult Function(_TransactionServiceAlreadyExists value)
        serviceAlreadyExists,
    required TResult Function(_TransactionUserRejected value) userRejected,
    required TResult Function(_TransactionUnknownAccount value) unknownAccount,
    required TResult Function(_TransactionRPCError value) rpcError,
    required TResult Function(_TransactionOtherError value) other,
  }) {
    return unknownAccount(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_TransactionTimeout value)? timeout,
    TResult? Function(_TransactionConnectionError value)? connectivity,
    TResult? Function(_TransactionConsensusNotReachedError value)?
        consensusNotReached,
    TResult? Function(_TransactionInvalid value)? invalidTransaction,
    TResult? Function(_TransactionInvalidConfirmation value)?
        invalidConfirmation,
    TResult? Function(_TransactionInsufficientFunds value)? insufficientFunds,
    TResult? Function(_TransactionServiceNotFound value)? serviceNotFound,
    TResult? Function(_TransactionServiceAlreadyExists value)?
        serviceAlreadyExists,
    TResult? Function(_TransactionUserRejected value)? userRejected,
    TResult? Function(_TransactionUnknownAccount value)? unknownAccount,
    TResult? Function(_TransactionRPCError value)? rpcError,
    TResult? Function(_TransactionOtherError value)? other,
  }) {
    return unknownAccount?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_TransactionTimeout value)? timeout,
    TResult Function(_TransactionConnectionError value)? connectivity,
    TResult Function(_TransactionConsensusNotReachedError value)?
        consensusNotReached,
    TResult Function(_TransactionInvalid value)? invalidTransaction,
    TResult Function(_TransactionInvalidConfirmation value)?
        invalidConfirmation,
    TResult Function(_TransactionInsufficientFunds value)? insufficientFunds,
    TResult Function(_TransactionServiceNotFound value)? serviceNotFound,
    TResult Function(_TransactionServiceAlreadyExists value)?
        serviceAlreadyExists,
    TResult Function(_TransactionUserRejected value)? userRejected,
    TResult Function(_TransactionUnknownAccount value)? unknownAccount,
    TResult Function(_TransactionRPCError value)? rpcError,
    TResult Function(_TransactionOtherError value)? other,
    required TResult orElse(),
  }) {
    if (unknownAccount != null) {
      return unknownAccount(this);
    }
    return orElse();
  }
}

abstract class _TransactionUnknownAccount extends TransactionError {
  const factory _TransactionUnknownAccount(
      {required final String accountName}) = _$TransactionUnknownAccountImpl;
  const _TransactionUnknownAccount._() : super._();

  String get accountName;
  @JsonKey(ignore: true)
  _$$TransactionUnknownAccountImplCopyWith<_$TransactionUnknownAccountImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$TransactionRPCErrorImplCopyWith<$Res> {
  factory _$$TransactionRPCErrorImplCopyWith(_$TransactionRPCErrorImpl value,
          $Res Function(_$TransactionRPCErrorImpl) then) =
      __$$TransactionRPCErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int code, String message, Object? data});
}

/// @nodoc
class __$$TransactionRPCErrorImplCopyWithImpl<$Res>
    extends _$TransactionErrorCopyWithImpl<$Res, _$TransactionRPCErrorImpl>
    implements _$$TransactionRPCErrorImplCopyWith<$Res> {
  __$$TransactionRPCErrorImplCopyWithImpl(_$TransactionRPCErrorImpl _value,
      $Res Function(_$TransactionRPCErrorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? message = null,
    Object? data = freezed,
  }) {
    return _then(_$TransactionRPCErrorImpl(
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as int,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      data: freezed == data ? _value.data : data,
    ));
  }
}

/// @nodoc

class _$TransactionRPCErrorImpl extends _TransactionRPCError {
  const _$TransactionRPCErrorImpl(
      {required this.code, required this.message, this.data})
      : super._();

  @override
  final int code;
  @override
  final String message;
  @override
  final Object? data;

  @override
  String toString() {
    return 'TransactionError.rpcError(code: $code, message: $message, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TransactionRPCErrorImpl &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.message, message) || other.message == message) &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, code, message, const DeepCollectionEquality().hash(data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TransactionRPCErrorImplCopyWith<_$TransactionRPCErrorImpl> get copyWith =>
      __$$TransactionRPCErrorImplCopyWithImpl<_$TransactionRPCErrorImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() timeout,
    required TResult Function() connectivity,
    required TResult Function() consensusNotReached,
    required TResult Function() invalidTransaction,
    required TResult Function() invalidConfirmation,
    required TResult Function() insufficientFunds,
    required TResult Function() serviceNotFound,
    required TResult Function() serviceAlreadyExists,
    required TResult Function() userRejected,
    required TResult Function(String accountName) unknownAccount,
    required TResult Function(int code, String message, Object? data) rpcError,
    required TResult Function(int? code, Object? data, String? message) other,
  }) {
    return rpcError(code, message, data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? timeout,
    TResult? Function()? connectivity,
    TResult? Function()? consensusNotReached,
    TResult? Function()? invalidTransaction,
    TResult? Function()? invalidConfirmation,
    TResult? Function()? insufficientFunds,
    TResult? Function()? serviceNotFound,
    TResult? Function()? serviceAlreadyExists,
    TResult? Function()? userRejected,
    TResult? Function(String accountName)? unknownAccount,
    TResult? Function(int code, String message, Object? data)? rpcError,
    TResult? Function(int? code, Object? data, String? message)? other,
  }) {
    return rpcError?.call(code, message, data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? timeout,
    TResult Function()? connectivity,
    TResult Function()? consensusNotReached,
    TResult Function()? invalidTransaction,
    TResult Function()? invalidConfirmation,
    TResult Function()? insufficientFunds,
    TResult Function()? serviceNotFound,
    TResult Function()? serviceAlreadyExists,
    TResult Function()? userRejected,
    TResult Function(String accountName)? unknownAccount,
    TResult Function(int code, String message, Object? data)? rpcError,
    TResult Function(int? code, Object? data, String? message)? other,
    required TResult orElse(),
  }) {
    if (rpcError != null) {
      return rpcError(code, message, data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_TransactionTimeout value) timeout,
    required TResult Function(_TransactionConnectionError value) connectivity,
    required TResult Function(_TransactionConsensusNotReachedError value)
        consensusNotReached,
    required TResult Function(_TransactionInvalid value) invalidTransaction,
    required TResult Function(_TransactionInvalidConfirmation value)
        invalidConfirmation,
    required TResult Function(_TransactionInsufficientFunds value)
        insufficientFunds,
    required TResult Function(_TransactionServiceNotFound value)
        serviceNotFound,
    required TResult Function(_TransactionServiceAlreadyExists value)
        serviceAlreadyExists,
    required TResult Function(_TransactionUserRejected value) userRejected,
    required TResult Function(_TransactionUnknownAccount value) unknownAccount,
    required TResult Function(_TransactionRPCError value) rpcError,
    required TResult Function(_TransactionOtherError value) other,
  }) {
    return rpcError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_TransactionTimeout value)? timeout,
    TResult? Function(_TransactionConnectionError value)? connectivity,
    TResult? Function(_TransactionConsensusNotReachedError value)?
        consensusNotReached,
    TResult? Function(_TransactionInvalid value)? invalidTransaction,
    TResult? Function(_TransactionInvalidConfirmation value)?
        invalidConfirmation,
    TResult? Function(_TransactionInsufficientFunds value)? insufficientFunds,
    TResult? Function(_TransactionServiceNotFound value)? serviceNotFound,
    TResult? Function(_TransactionServiceAlreadyExists value)?
        serviceAlreadyExists,
    TResult? Function(_TransactionUserRejected value)? userRejected,
    TResult? Function(_TransactionUnknownAccount value)? unknownAccount,
    TResult? Function(_TransactionRPCError value)? rpcError,
    TResult? Function(_TransactionOtherError value)? other,
  }) {
    return rpcError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_TransactionTimeout value)? timeout,
    TResult Function(_TransactionConnectionError value)? connectivity,
    TResult Function(_TransactionConsensusNotReachedError value)?
        consensusNotReached,
    TResult Function(_TransactionInvalid value)? invalidTransaction,
    TResult Function(_TransactionInvalidConfirmation value)?
        invalidConfirmation,
    TResult Function(_TransactionInsufficientFunds value)? insufficientFunds,
    TResult Function(_TransactionServiceNotFound value)? serviceNotFound,
    TResult Function(_TransactionServiceAlreadyExists value)?
        serviceAlreadyExists,
    TResult Function(_TransactionUserRejected value)? userRejected,
    TResult Function(_TransactionUnknownAccount value)? unknownAccount,
    TResult Function(_TransactionRPCError value)? rpcError,
    TResult Function(_TransactionOtherError value)? other,
    required TResult orElse(),
  }) {
    if (rpcError != null) {
      return rpcError(this);
    }
    return orElse();
  }
}

abstract class _TransactionRPCError extends TransactionError {
  const factory _TransactionRPCError(
      {required final int code,
      required final String message,
      final Object? data}) = _$TransactionRPCErrorImpl;
  const _TransactionRPCError._() : super._();

  int get code;
  String get message;
  Object? get data;
  @JsonKey(ignore: true)
  _$$TransactionRPCErrorImplCopyWith<_$TransactionRPCErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$TransactionOtherErrorImplCopyWith<$Res> {
  factory _$$TransactionOtherErrorImplCopyWith(
          _$TransactionOtherErrorImpl value,
          $Res Function(_$TransactionOtherErrorImpl) then) =
      __$$TransactionOtherErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int? code, Object? data, String? message});
}

/// @nodoc
class __$$TransactionOtherErrorImplCopyWithImpl<$Res>
    extends _$TransactionErrorCopyWithImpl<$Res, _$TransactionOtherErrorImpl>
    implements _$$TransactionOtherErrorImplCopyWith<$Res> {
  __$$TransactionOtherErrorImplCopyWithImpl(_$TransactionOtherErrorImpl _value,
      $Res Function(_$TransactionOtherErrorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = freezed,
    Object? data = freezed,
    Object? message = freezed,
  }) {
    return _then(_$TransactionOtherErrorImpl(
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as int?,
      data: freezed == data ? _value.data : data,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$TransactionOtherErrorImpl extends _TransactionOtherError {
  const _$TransactionOtherErrorImpl({this.code, this.data, this.message})
      : super._();

  @override
  final int? code;
  @override
  final Object? data;
  @override
  final String? message;

  @override
  String toString() {
    return 'TransactionError.other(code: $code, data: $data, message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TransactionOtherErrorImpl &&
            (identical(other.code, code) || other.code == code) &&
            const DeepCollectionEquality().equals(other.data, data) &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, code, const DeepCollectionEquality().hash(data), message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TransactionOtherErrorImplCopyWith<_$TransactionOtherErrorImpl>
      get copyWith => __$$TransactionOtherErrorImplCopyWithImpl<
          _$TransactionOtherErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() timeout,
    required TResult Function() connectivity,
    required TResult Function() consensusNotReached,
    required TResult Function() invalidTransaction,
    required TResult Function() invalidConfirmation,
    required TResult Function() insufficientFunds,
    required TResult Function() serviceNotFound,
    required TResult Function() serviceAlreadyExists,
    required TResult Function() userRejected,
    required TResult Function(String accountName) unknownAccount,
    required TResult Function(int code, String message, Object? data) rpcError,
    required TResult Function(int? code, Object? data, String? message) other,
  }) {
    return other(code, data, message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? timeout,
    TResult? Function()? connectivity,
    TResult? Function()? consensusNotReached,
    TResult? Function()? invalidTransaction,
    TResult? Function()? invalidConfirmation,
    TResult? Function()? insufficientFunds,
    TResult? Function()? serviceNotFound,
    TResult? Function()? serviceAlreadyExists,
    TResult? Function()? userRejected,
    TResult? Function(String accountName)? unknownAccount,
    TResult? Function(int code, String message, Object? data)? rpcError,
    TResult? Function(int? code, Object? data, String? message)? other,
  }) {
    return other?.call(code, data, message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? timeout,
    TResult Function()? connectivity,
    TResult Function()? consensusNotReached,
    TResult Function()? invalidTransaction,
    TResult Function()? invalidConfirmation,
    TResult Function()? insufficientFunds,
    TResult Function()? serviceNotFound,
    TResult Function()? serviceAlreadyExists,
    TResult Function()? userRejected,
    TResult Function(String accountName)? unknownAccount,
    TResult Function(int code, String message, Object? data)? rpcError,
    TResult Function(int? code, Object? data, String? message)? other,
    required TResult orElse(),
  }) {
    if (other != null) {
      return other(code, data, message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_TransactionTimeout value) timeout,
    required TResult Function(_TransactionConnectionError value) connectivity,
    required TResult Function(_TransactionConsensusNotReachedError value)
        consensusNotReached,
    required TResult Function(_TransactionInvalid value) invalidTransaction,
    required TResult Function(_TransactionInvalidConfirmation value)
        invalidConfirmation,
    required TResult Function(_TransactionInsufficientFunds value)
        insufficientFunds,
    required TResult Function(_TransactionServiceNotFound value)
        serviceNotFound,
    required TResult Function(_TransactionServiceAlreadyExists value)
        serviceAlreadyExists,
    required TResult Function(_TransactionUserRejected value) userRejected,
    required TResult Function(_TransactionUnknownAccount value) unknownAccount,
    required TResult Function(_TransactionRPCError value) rpcError,
    required TResult Function(_TransactionOtherError value) other,
  }) {
    return other(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_TransactionTimeout value)? timeout,
    TResult? Function(_TransactionConnectionError value)? connectivity,
    TResult? Function(_TransactionConsensusNotReachedError value)?
        consensusNotReached,
    TResult? Function(_TransactionInvalid value)? invalidTransaction,
    TResult? Function(_TransactionInvalidConfirmation value)?
        invalidConfirmation,
    TResult? Function(_TransactionInsufficientFunds value)? insufficientFunds,
    TResult? Function(_TransactionServiceNotFound value)? serviceNotFound,
    TResult? Function(_TransactionServiceAlreadyExists value)?
        serviceAlreadyExists,
    TResult? Function(_TransactionUserRejected value)? userRejected,
    TResult? Function(_TransactionUnknownAccount value)? unknownAccount,
    TResult? Function(_TransactionRPCError value)? rpcError,
    TResult? Function(_TransactionOtherError value)? other,
  }) {
    return other?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_TransactionTimeout value)? timeout,
    TResult Function(_TransactionConnectionError value)? connectivity,
    TResult Function(_TransactionConsensusNotReachedError value)?
        consensusNotReached,
    TResult Function(_TransactionInvalid value)? invalidTransaction,
    TResult Function(_TransactionInvalidConfirmation value)?
        invalidConfirmation,
    TResult Function(_TransactionInsufficientFunds value)? insufficientFunds,
    TResult Function(_TransactionServiceNotFound value)? serviceNotFound,
    TResult Function(_TransactionServiceAlreadyExists value)?
        serviceAlreadyExists,
    TResult Function(_TransactionUserRejected value)? userRejected,
    TResult Function(_TransactionUnknownAccount value)? unknownAccount,
    TResult Function(_TransactionRPCError value)? rpcError,
    TResult Function(_TransactionOtherError value)? other,
    required TResult orElse(),
  }) {
    if (other != null) {
      return other(this);
    }
    return orElse();
  }
}

abstract class _TransactionOtherError extends TransactionError {
  const factory _TransactionOtherError(
      {final int? code,
      final Object? data,
      final String? message}) = _$TransactionOtherErrorImpl;
  const _TransactionOtherError._() : super._();

  int? get code;
  Object? get data;
  String? get message;
  @JsonKey(ignore: true)
  _$$TransactionOtherErrorImplCopyWith<_$TransactionOtherErrorImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$TransactionConfirmation {
  String get transactionAddress => throw _privateConstructorUsedError;
  int get nbConfirmations => throw _privateConstructorUsedError;
  int get maxConfirmations => throw _privateConstructorUsedError;
  double get ratio => throw _privateConstructorUsedError;
  bool get ratioEqualIncluded => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TransactionConfirmationCopyWith<TransactionConfirmation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransactionConfirmationCopyWith<$Res> {
  factory $TransactionConfirmationCopyWith(TransactionConfirmation value,
          $Res Function(TransactionConfirmation) then) =
      _$TransactionConfirmationCopyWithImpl<$Res, TransactionConfirmation>;
  @useResult
  $Res call(
      {String transactionAddress,
      int nbConfirmations,
      int maxConfirmations,
      double ratio,
      bool ratioEqualIncluded});
}

/// @nodoc
class _$TransactionConfirmationCopyWithImpl<$Res,
        $Val extends TransactionConfirmation>
    implements $TransactionConfirmationCopyWith<$Res> {
  _$TransactionConfirmationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? transactionAddress = null,
    Object? nbConfirmations = null,
    Object? maxConfirmations = null,
    Object? ratio = null,
    Object? ratioEqualIncluded = null,
  }) {
    return _then(_value.copyWith(
      transactionAddress: null == transactionAddress
          ? _value.transactionAddress
          : transactionAddress // ignore: cast_nullable_to_non_nullable
              as String,
      nbConfirmations: null == nbConfirmations
          ? _value.nbConfirmations
          : nbConfirmations // ignore: cast_nullable_to_non_nullable
              as int,
      maxConfirmations: null == maxConfirmations
          ? _value.maxConfirmations
          : maxConfirmations // ignore: cast_nullable_to_non_nullable
              as int,
      ratio: null == ratio
          ? _value.ratio
          : ratio // ignore: cast_nullable_to_non_nullable
              as double,
      ratioEqualIncluded: null == ratioEqualIncluded
          ? _value.ratioEqualIncluded
          : ratioEqualIncluded // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TransactionConfirmationImplCopyWith<$Res>
    implements $TransactionConfirmationCopyWith<$Res> {
  factory _$$TransactionConfirmationImplCopyWith(
          _$TransactionConfirmationImpl value,
          $Res Function(_$TransactionConfirmationImpl) then) =
      __$$TransactionConfirmationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String transactionAddress,
      int nbConfirmations,
      int maxConfirmations,
      double ratio,
      bool ratioEqualIncluded});
}

/// @nodoc
class __$$TransactionConfirmationImplCopyWithImpl<$Res>
    extends _$TransactionConfirmationCopyWithImpl<$Res,
        _$TransactionConfirmationImpl>
    implements _$$TransactionConfirmationImplCopyWith<$Res> {
  __$$TransactionConfirmationImplCopyWithImpl(
      _$TransactionConfirmationImpl _value,
      $Res Function(_$TransactionConfirmationImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? transactionAddress = null,
    Object? nbConfirmations = null,
    Object? maxConfirmations = null,
    Object? ratio = null,
    Object? ratioEqualIncluded = null,
  }) {
    return _then(_$TransactionConfirmationImpl(
      transactionAddress: null == transactionAddress
          ? _value.transactionAddress
          : transactionAddress // ignore: cast_nullable_to_non_nullable
              as String,
      nbConfirmations: null == nbConfirmations
          ? _value.nbConfirmations
          : nbConfirmations // ignore: cast_nullable_to_non_nullable
              as int,
      maxConfirmations: null == maxConfirmations
          ? _value.maxConfirmations
          : maxConfirmations // ignore: cast_nullable_to_non_nullable
              as int,
      ratio: null == ratio
          ? _value.ratio
          : ratio // ignore: cast_nullable_to_non_nullable
              as double,
      ratioEqualIncluded: null == ratioEqualIncluded
          ? _value.ratioEqualIncluded
          : ratioEqualIncluded // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$TransactionConfirmationImpl extends _TransactionConfirmation {
  const _$TransactionConfirmationImpl(
      {required this.transactionAddress,
      this.nbConfirmations = 0,
      this.maxConfirmations = 0,
      this.ratio = 0.0,
      this.ratioEqualIncluded = true})
      : super._();

  @override
  final String transactionAddress;
  @override
  @JsonKey()
  final int nbConfirmations;
  @override
  @JsonKey()
  final int maxConfirmations;
  @override
  @JsonKey()
  final double ratio;
  @override
  @JsonKey()
  final bool ratioEqualIncluded;

  @override
  String toString() {
    return 'TransactionConfirmation(transactionAddress: $transactionAddress, nbConfirmations: $nbConfirmations, maxConfirmations: $maxConfirmations, ratio: $ratio, ratioEqualIncluded: $ratioEqualIncluded)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TransactionConfirmationImpl &&
            (identical(other.transactionAddress, transactionAddress) ||
                other.transactionAddress == transactionAddress) &&
            (identical(other.nbConfirmations, nbConfirmations) ||
                other.nbConfirmations == nbConfirmations) &&
            (identical(other.maxConfirmations, maxConfirmations) ||
                other.maxConfirmations == maxConfirmations) &&
            (identical(other.ratio, ratio) || other.ratio == ratio) &&
            (identical(other.ratioEqualIncluded, ratioEqualIncluded) ||
                other.ratioEqualIncluded == ratioEqualIncluded));
  }

  @override
  int get hashCode => Object.hash(runtimeType, transactionAddress,
      nbConfirmations, maxConfirmations, ratio, ratioEqualIncluded);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TransactionConfirmationImplCopyWith<_$TransactionConfirmationImpl>
      get copyWith => __$$TransactionConfirmationImplCopyWithImpl<
          _$TransactionConfirmationImpl>(this, _$identity);
}

abstract class _TransactionConfirmation extends TransactionConfirmation {
  const factory _TransactionConfirmation(
      {required final String transactionAddress,
      final int nbConfirmations,
      final int maxConfirmations,
      final double ratio,
      final bool ratioEqualIncluded}) = _$TransactionConfirmationImpl;
  const _TransactionConfirmation._() : super._();

  @override
  String get transactionAddress;
  @override
  int get nbConfirmations;
  @override
  int get maxConfirmations;
  @override
  double get ratio;
  @override
  bool get ratioEqualIncluded;
  @override
  @JsonKey(ignore: true)
  _$$TransactionConfirmationImplCopyWith<_$TransactionConfirmationImpl>
      get copyWith => throw _privateConstructorUsedError;
}
