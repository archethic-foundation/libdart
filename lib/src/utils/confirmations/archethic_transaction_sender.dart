import 'dart:async';
import 'dart:developer';

import 'package:archethic_lib_dart/archethic_lib_dart.dart';
import 'package:graphql/client.dart';

/// [TransactionSenderInterface] which talks to the Phoenix API.
class ArchethicTransactionSender
    with ArchethicTransactionParser
    implements TransactionSenderInterface {
  ArchethicTransactionSender({
    required this.phoenixHttpEndpoint,
    required this.websocketEndpoint,
    required this.apiService,
  });

  final String phoenixHttpEndpoint;
  final String websocketEndpoint;
  final ApiService apiService;

  PhoenixLink? _phoenixLink;
  HttpLink? _phoenixHttpLink;
  GraphQLClient? _client;

  StreamSubscription? _transactionConfirmedSubscription;
  StreamSubscription? _transactionErrorSubscription;
  Timer? _timer;

  @override
  void close() {
    _timer?.cancel();
    _phoenixLink?.dispose();
    _phoenixHttpLink?.dispose();
    _transactionConfirmedSubscription?.cancel();
    _transactionErrorSubscription?.cancel();
  }

  /// Sends a transaction and listens to confirmations.
  ///
  /// Sender auto-closes in the following situations :
  ///     - when transaction is fully confirmed
  ///     - when timeout is reached
  ///     - when transaction fails
  @override
  Future<void> send({
    required Transaction transaction,
    Duration timeout = const Duration(seconds: 60),
    required TransactionConfirmationHandler onConfirmation,
    required TransactionErrorHandler onError,
  }) async {
    _timer = Timer(
      timeout,
      () {
        onError(const TransactionError.timeout());
        close();
      },
    );

    await _connect(
      phoenixHttpEndpoint,
      websocketEndpoint,
    );

    _listenTransactionConfirmed(
      transaction.address!.address!,
      onConfirmation,
      onError,
    );
    _listenTransactionError(
      transaction.address!.address!,
      onError,
    );

    await _sendTransaction(
      transaction: transaction,
      onError: onError,
    );
  }

  Future<void> _connect(
    String phoenixHttpEndpoint,
    String websocketEndpoint,
  ) async {
    assert(
      _client == null,
      'Connection already established. That instance of [SubscriptionChannel] must not be reused.',
    );

    _phoenixHttpLink = HttpLink(
      phoenixHttpEndpoint,
    );

    _phoenixLink = await PhoenixLink.fromWebsocketUri(
      uri: websocketEndpoint,
    );

    final link = Link.split(
      (request) => request.isSubscription,
      _phoenixLink!,
      _phoenixHttpLink!,
    );
    _client = GraphQLClient(
      link: link,
      cache: GraphQLCache(),
    );
  }

  Stream<QueryResult<T>> _subscribe<T>(String operation) async* {
    assert(
      _client != null,
      'You must call [connect] before [subscribing].',
    );
    final subscriptionDocument = gql(operation);
    yield* _client!.subscribe(
      SubscriptionOptions(
        document: subscriptionDocument,
      ),
    );
  }

  Future<void> _sendTransaction({
    required Transaction transaction,
    required TransactionErrorHandler onError,
  }) async {
    try {
      final transactionStatus = await apiService.sendTx(transaction);

      if (transactionStatus.status == 'invalid') {
        close();
        await onError(
          const TransactionError.invalidTransaction(),
        );
      }
    } on ArchethicConnectionException {
      close();
      await onError(
        const TransactionError.connectivity(),
      );
    } on ArchethicJsonRPCException catch (e) {
      close();
      await onError(
        TransactionError.rpcError(
          code: e.code,
          message: e.message,
          data: e.data,
        ),
      );
    } on Exception {
      close();
      await onError(
        const TransactionError.other(),
      );
    }
  }

  void _listenTransactionError(
    String address,
    TransactionErrorHandler onError,
  ) {
    _transactionErrorSubscription = _subscribe<TransactionError>(
      'subscription { transactionError(address: "$address") { context, error { code, data, message } } }',
    ).listen(
      (result) {
        close();
        final transactionError = _errorDtoToModel(result.data);
        log(
          '>>> Transaction KO $address <<< (${transactionError.messageLabel})',
        );
        onError(
          transactionError,
        );
      },
    );
  }

  void _listenTransactionConfirmed(
    String address,
    TransactionConfirmationHandler onConfirmation,
    TransactionErrorHandler onError,
  ) {
    _transactionConfirmedSubscription = _subscribe(
      'subscription { transactionConfirmed(address: "$address") { nbConfirmations, maxConfirmations } }',
    ).listen(
      (result) async {
        final transactionEvent = _confirmationDtoToModel(
          transactionAddress: address,
          data: result.data,
        );
        if (transactionEvent == null) {
          await onError(const TransactionError.invalidConfirmation());
          return;
        }

        log(
          '>>> Transaction confirmed $address <<< ${transactionEvent.nbConfirmations} / ${transactionEvent.maxConfirmations}',
        );

        if (transactionEvent.isFullyConfirmed) close();

        await onConfirmation(
          transactionEvent,
        );
      },
    );
  }
}

/// Handles conversion from Archethic DTOs to Models
mixin ArchethicTransactionParser {
  TransactionError _errorDtoToModel(Map<String, dynamic>? data) {
    try {
      final transactionError = data?['transactionError'];
      if (transactionError['error'] != null) {
        final error = transactionError?['error'];
        final code = error['code'] as int;
        switch (code) {
          case -31000:
            return const TransactionError.insufficientFunds();
          case -31501:
            return const TransactionError.consensusNotReached();
          case -31502:
            return const TransactionError.timeout();
          default:
        }

        return TransactionError.other(
          code: error['code'] as int,
          data: error['data'],
          message: error['message'],
        );
      }
      return const TransactionError.other();
    } catch (e) {
      return const TransactionError.other();
    }
  }

  TransactionConfirmation? _confirmationDtoToModel({
    required String transactionAddress,
    Map<String, dynamic>? data,
  }) {
    final transactionConfirmation = data?['transactionConfirmed'];
    if (transactionConfirmation == null) return null;

    final nbConfirmations = transactionConfirmation?['nbConfirmations'] ?? 0;
    final maxConfirmations = transactionConfirmation?['maxConfirmations'] ?? 0;
    return TransactionConfirmation(
      transactionAddress: transactionAddress,
      nbConfirmations: nbConfirmations,
      maxConfirmations: maxConfirmations,
    );
  }
}
