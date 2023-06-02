import 'dart:async';
import 'dart:developer';
import 'package:archethic_lib_dart/archethic_lib_dart.dart';
import 'package:graphql/client.dart';
import 'package:phoenix_socket/phoenix_socket.dart';

class ArchethicTransactionSender with ArchethicTransactionParser {
  ArchethicTransactionSender({
    required this.phoenixHttpEndpoint,
    required this.websocketEndpoint,
  });

  final String phoenixHttpEndpoint;
  final String websocketEndpoint;

  PhoenixChannel? _channel;
  GraphQLClient? _client;

  StreamSubscription? _transactionConfirmedSubscription;
  StreamSubscription? _transactionErrorSubscription;
  Timer? _timer;

  void close() {
    _timer?.cancel();
    _channel?.close();
    _transactionConfirmedSubscription?.cancel();
    _transactionErrorSubscription?.cancel();
  }

  /// Sends a transaction and listens to confirmations.
  ///
  /// Sender auto-closes in the following situations :
  ///     - when transaction is fully confirmed
  ///     - when timeout is reached
  ///     - when transaction fails
  Future<void> send({
    required Transaction transaction,
    Duration timeout = const Duration(seconds: 60),
    required TransactionConfirmationHandler onConfirmation,
    required TransactionErrorHandler onError,
    required ApiService apiService,
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
      apiService: apiService,
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

    final phoenixHttpLink = HttpLink(
      phoenixHttpEndpoint,
    );

    _channel = await PhoenixLink.createChannel(
      websocketUri: websocketEndpoint,
    );
    final phoenixLink = PhoenixLink(
      channel: _channel!,
    );

    final link = Link.split(
      (request) => request.isSubscription,
      phoenixLink,
      phoenixHttpLink,
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
    required ApiService apiService,
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
      'subscription { transactionError(address: "$address") { context, reason} }',
    ).listen(
      (result) {
        close();
        final transactionError = _errorDtoToModel(result.data);
        log(
          '>>> Transaction KO $address <<< (${transactionError.message})',
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
      final reason = transactionError?['reason'];

      if (reason == 'Insufficient funds') {
        return const TransactionError.insufficientFunds();
      }

      if (reason == 'consensus not reached') {
        return const TransactionError.consensusNotReached();
      }

      if (reason == 'timeout' || reason == 'connection timeout') {
        return const TransactionError.timeout();
      }

      return TransactionError.other(reason: reason);
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
