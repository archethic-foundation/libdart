/// SPDX-License-Identifier: AGPL-3.0-or-later
import 'dart:async';

import 'package:archethic_lib_dart/archethic_lib_dart.dart';

// Project imports:

abstract class TransactionSenderInterface {
  const TransactionSenderInterface();

  /// Sends a transaction and listens to confirmations.
  ///
  /// Sender auto-closes in the following situations :
  ///     - when transaction has enough confirmations
  ///     - when timeout is reached
  ///     - when transaction fails
  ///
  /// Caller can be notified of incoming confirmations using [onConfirmation]
  Future<TransactionConfirmation?> send({
    required Transaction transaction,
    bool Function(TransactionConfirmation) isEnoughConfirmations,
    Duration timeout = const Duration(seconds: 10),
    TransactionConfirmationHandler? onConfirmation,
  });

  /// Releases all PhoenixTransactionSender resources.
  void close();
}
