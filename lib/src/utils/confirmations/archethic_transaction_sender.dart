import 'dart:async';
import 'dart:developer';

import 'package:archethic_lib_dart/src/model/exception/archethic_exception.dart';
import 'package:archethic_lib_dart/src/model/exception/archethic_json_rpc_exception.dart';
import 'package:archethic_lib_dart/src/model/transaction.dart';
import 'package:archethic_lib_dart/src/services/api_service.dart';
import 'package:archethic_lib_dart/src/utils/confirmations/phoenix_link.dart';
import 'package:archethic_lib_dart/src/utils/confirmations/transaction_event.dart';
import 'package:archethic_lib_dart/src/utils/confirmations/transaction_remote.dart';
import 'package:archethic_lib_dart/src/utils/confirmations/transaction_sender.dart';
import 'package:graphql/client.dart';

bool _defaultIsEnoughConfirmation(TransactionConfirmation confirmation) =>
    confirmation.isEnoughConfirmed;

/// [TransactionSenderInterface] which talks to the Phoenix API.
class ArchethicTransactionSender
    with ArchethicTransactionParser
    implements TransactionSenderInterface {
  ArchethicTransactionSender({
    required this.apiService,
  }) {
    phoenixHttpEndpoint = '${apiService.endpoint}/socket/websocket';
    websocketEndpoint =
        "${apiService.endpoint.replaceAll('https:', 'wss:').replaceAll('http:', 'ws:')}/socket/websocket";
  }

  late final String phoenixHttpEndpoint;
  late final String websocketEndpoint;
  final ApiService apiService;

  PhoenixLink? _phoenixLink;
  HttpLink? _phoenixHttpLink;
  GraphQLClient? _client;

  StreamSubscription? _transactionConfirmedSubscription;
  StreamSubscription? _transactionErrorSubscription;
  Timer? _timer;
  Completer<TransactionConfirmation?>? _completer;

  @override
  void close() {
    if (_completer?.isCompleted == false) {
      _completer!.complete(null);
    }
    _reset();
  }

  @override
  Future<TransactionConfirmation?> send({
    required Transaction transaction,
    bool Function(TransactionConfirmation) isEnoughConfirmations =
        _defaultIsEnoughConfirmation,
    Duration timeout = const Duration(minutes: 70),
    TransactionConfirmationHandler? onConfirmation,
  }) async {
    assert(
      _completer == null,
      'ArchethicTransactionSender already in use. Call [close()] or create a new one.',
    );
    _completer = Completer<TransactionConfirmation?>();

    _timer = Timer(
      timeout,
      () {
        _onError(const TransactionError.timeout());
      },
    );

    unawaited(
      _send(
        transaction: transaction,
        isEnoughConfirmations: isEnoughConfirmations,
        onConfirmation: onConfirmation,
      ),
    );
    return _completer!.future;
  }

  Future<void> _send({
    required Transaction transaction,
    bool Function(TransactionConfirmation) isEnoughConfirmations =
        _defaultIsEnoughConfirmation,
    TransactionConfirmationHandler? onConfirmation,
  }) async {
    try {
      await _connect(
        phoenixHttpEndpoint,
        websocketEndpoint,
      );

      _listenTransactionConfirmed(
        transaction.address!.address!,
        (confirmation) async {
          if (onConfirmation != null) {
            unawaited(onConfirmation(confirmation));
          }
          if (isEnoughConfirmations(confirmation)) {
            _onComplete(confirmation);
          }
        },
        _onError,
      );
      _listenTransactionError(
        transaction.address!.address!,
        _onError,
      );

      await _sendTransaction(
        transaction: transaction,
        onError: _onError,
      );
    } on ArchethicConnectionException {
      await _onError(
        const TransactionError.connectivity(),
      );
    } on ArchethicJsonRPCException catch (e) {
      await _onError(
        TransactionError.rpcError(
          code: e.code,
          message: e.message,
          data: e.data,
        ),
      );
    } on Exception catch (e) {
      await _onError(
        TransactionError.other(message: e.toString()),
      );
    }
  }

  void _onComplete(TransactionConfirmation confirmation) {
    _completer?.complete(confirmation);
    _reset();
  }

  Future<void> _onError(TransactionError error) async {
    _completer?.completeError(error);
    _reset();
  }

  void _reset() {
    _timer?.cancel();
    _timer = null;
    _phoenixLink?.dispose();
    _phoenixLink = null;
    _phoenixHttpLink?.dispose();
    _phoenixHttpLink = null;
    _transactionConfirmedSubscription?.cancel();
    _transactionConfirmedSubscription = null;
    _transactionErrorSubscription?.cancel();
    _transactionErrorSubscription = null;
    _client = null;

    _completer = null;
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
    final transactionStatus = await apiService.sendTx(transaction);

    if (transactionStatus.status == 'invalid') {
      await onError(
        const TransactionError.invalidTransaction(),
      );
    }
  }

  void _listenTransactionError(
    String address,
    TransactionErrorHandler onError,
  ) {
    assert(
      _transactionErrorSubscription == null,
      'Already listening to transaction errors.',
    );

    _transactionErrorSubscription = _subscribe<TransactionError>(
      'subscription { transactionError(address: "$address") { context, error { code, data, message } } }',
    ).listen(
      (result) {
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
    assert(
      _transactionConfirmedSubscription == null,
      'Already listening to transaction confirmations.',
    );

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
        await onConfirmation(transactionEvent);
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
