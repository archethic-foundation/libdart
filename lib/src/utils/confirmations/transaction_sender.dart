/// SPDX-License-Identifier: AGPL-3.0-or-later
import 'dart:async';

import 'package:archethic_lib_dart/src/model/transaction.dart';
import 'package:archethic_lib_dart/src/utils/confirmations/transaction_remote.dart';

// Project imports:

abstract class TransactionSenderInterface {
  const TransactionSenderInterface();

  /// Sends a transaction and listens to confirmations.
  ///
  /// Sender auto-closes in the following situations :
  ///     - when transaction is fully confirmed
  ///     - when timeout is reached
  ///     - when transaction fails
  Future<void> send({
    required Transaction transaction,
    Duration timeout = const Duration(seconds: 10),
    required TransactionConfirmationHandler onConfirmation,
    required TransactionErrorHandler onError,
  });

  /// Releases all PhoenixTransactionSender resources.
  void close();
}
