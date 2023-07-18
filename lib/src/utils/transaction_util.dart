import 'dart:async';
import 'dart:developer';
import 'package:archethic_lib_dart/archethic_lib_dart.dart';

mixin TransactionMixin {
  Future<double> calculateFees({
    required Transaction transaction,
    required ApiService apiService,
    double slippage = 0.01,
  }) async {
    final transactionFee = await apiService.getTransactionFee(transaction);
    final fees = fromBigInt(transactionFee.fee) * slippage;
    log(
      'Transaction ${transaction.address} : $fees UCO',
    );
    return fees;
  }

  Future<void> sendTransactions({
    required List<Transaction> transactions,
    required ApiService apiService,
  }) async {
    var errorDetail = '';
    for (final transaction in transactions) {
      if (errorDetail.isNotEmpty) {
        break;
      }
      var next = false;
      String websocketEndpoint;
      switch (apiService.endpoint) {
        case 'https://mainnet.archethic.net':
        case 'https://testnet.archethic.net':
          websocketEndpoint =
              "${apiService.endpoint.replaceAll('https:', 'wss:').replaceAll('http:', 'wss:')}/socket/websocket";
          break;
        default:
          websocketEndpoint =
              "${apiService.endpoint.replaceAll('https:', 'wss:').replaceAll('http:', 'ws:')}/socket/websocket";
          break;
      }

      final transactionRepository = ArchethicTransactionSender(
        phoenixHttpEndpoint: '${apiService.endpoint}/socket/websocket',
        websocketEndpoint: websocketEndpoint,
        apiService: apiService,
      );
      log('Send ${transaction.address!.address}');

      await transactionRepository.send(
        transaction: transaction,
        onConfirmation: (confirmation) async {
          if (confirmation.isFullyConfirmed) {
            log('nbConfirmations: ${confirmation.nbConfirmations}, transactionAddress: ${confirmation.transactionAddress}, maxConfirmations: ${confirmation.maxConfirmations}');
            transactionRepository.close();
            if (confirmation.nbConfirmations >= confirmation.maxConfirmations) {
              next = true;
            }
          }
        },
        onError: (error) async {
          transactionRepository.close();
          error.maybeMap(
            connectivity: (_) {
              errorDetail = 'No connection';
            },
            consensusNotReached: (_) {
              errorDetail = 'Consensus not reached';
            },
            timeout: (_) {
              errorDetail = 'Timeout';
            },
            invalidConfirmation: (_) {
              errorDetail = 'Invalid Confirmation';
            },
            insufficientFunds: (_) {
              errorDetail = 'Insufficient funds';
            },
            other: (error) {
              errorDetail = error.message;
            },
            orElse: () {
              errorDetail = 'An error is occured';
            },
          );
        },
      );

      while (next == false && errorDetail.isEmpty) {
        await Future.delayed(const Duration(seconds: 1));
        log('wait...');
      }
    }

    if (errorDetail.isNotEmpty) {
      throw Exception(errorDetail);
    }
  }
}
