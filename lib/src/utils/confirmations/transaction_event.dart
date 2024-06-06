import 'package:archethic_lib_dart/src/utils/transaction_error_util.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'transaction_event.freezed.dart';

@freezed
class TransactionError with _$TransactionError implements Exception {
  const TransactionError._();
  const factory TransactionError.timeout() = _TransactionTimeout;
  const factory TransactionError.connectivity() = _TransactionConnectionError;
  const factory TransactionError.consensusNotReached() =
      _TransactionConsensusNotReachedError;
  const factory TransactionError.invalidTransaction() = _TransactionInvalid;
  const factory TransactionError.invalidConfirmation() =
      _TransactionInvalidConfirmation;
  const factory TransactionError.insufficientFunds() =
      _TransactionInsufficientFunds;
  const factory TransactionError.serviceNotFound() =
      _TransactionServiceNotFound;
  const factory TransactionError.serviceAlreadyExists() =
      _TransactionServiceAlreadyExists;
  const factory TransactionError.userRejected() = _TransactionUserRejected;
  const factory TransactionError.unknownAccount({
    required String accountName,
  }) = _TransactionUnknownAccount;
  const factory TransactionError.rpcError({
    required int code,
    required String message,
    Object? data,
  }) = _TransactionRPCError;
  const factory TransactionError.other({
    int? code,
    Object? data,
    String? message,
  }) = _TransactionOtherError;

  String get messageLabel => map(
        timeout: (_) => 'connection timeout',
        connectivity: (_) => 'connectivity issue',
        consensusNotReached: (_) => 'consensus not reached',
        invalidTransaction: (_) => 'invalid transaction',
        invalidConfirmation: (_) => 'invalid confirmation',
        insufficientFunds: (_) => 'insufficient funds',
        serviceNotFound: (_) => 'service not found',
        serviceAlreadyExists: (_) => 'service already exists in the keychain',
        userRejected: (_) => 'user rejected',
        unknownAccount: (_) => 'unknown account',
        rpcError: (_) => 'JSON RPC error',
        other: (other) {
          if (other.data != null && other.data is Map<String, dynamic>) {
            final detailedMessage = extractTransactionErrorMessages(
              other.data! as Map<String, dynamic>,
            );
            if (detailedMessage.isNotEmpty) {
              return '${other.message}$detailedMessage';
            }
          }
          return other.message ?? 'other error';
        },
      );
}

@freezed
class TransactionConfirmation with _$TransactionConfirmation {
  const factory TransactionConfirmation({
    required String transactionAddress,
    @Default(0) int nbConfirmations,
    @Default(0) int maxConfirmations,
    @Default(0.0) double ratio,
    @Default(true) bool ratioEqualIncluded,
  }) = _TransactionConfirmation;

  const TransactionConfirmation._();

  bool get isFullyConfirmed => nbConfirmations >= maxConfirmations;
  bool get isEnoughConfirmed => isEnoughConfirmations(
        nbConfirmations,
        maxConfirmations,
        ratio,
        ratioEqualIncluded: ratioEqualIncluded,
      );

  static bool isEnoughConfirmations(
    int nbConfirmations,
    int maxConfirmations,
    double ratio, {
    bool ratioEqualIncluded = true,
  }) {
    if (ratioEqualIncluded) {
      if (nbConfirmations / maxConfirmations >= ratio) {
        return true;
      } else {
        return false;
      }
    } else {
      if (nbConfirmations / maxConfirmations > ratio) {
        return true;
      } else {
        return false;
      }
    }
  }
}
