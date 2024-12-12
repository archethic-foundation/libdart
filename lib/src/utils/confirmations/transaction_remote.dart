// SPDX-License-Identifier: AGPL-3.0-or-later

import 'package:archethic_lib_dart/src/model/transaction.dart';
import 'package:archethic_lib_dart/src/utils/confirmations/transaction_event.dart';

typedef TransactionConfirmationHandler = Future<void> Function(
  TransactionConfirmation confirmation,
);
typedef TransactionErrorHandler = Future<void> Function(TransactionError error);

abstract class TransactionRemoteRepositoryInterface {
  const TransactionRemoteRepositoryInterface();

  Future<void> send({
    required Transaction transaction,
    Duration timeout = const Duration(seconds: 10),
    required TransactionConfirmationHandler onConfirmation,
    required TransactionErrorHandler onError,
  });
}
