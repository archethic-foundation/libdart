import 'dart:async';
import 'dart:developer';
import 'package:archethic_lib_dart/archethic_lib_dart.dart';
import 'package:graphql/client.dart';
import 'package:phoenix_socket/phoenix_socket.dart';

class ArchethicOracle {
  ArchethicOracle({
    required this.phoenixHttpEndpoint,
    required this.websocketEndpoint,
  });

  final String phoenixHttpEndpoint;
  final String websocketEndpoint;

  PhoenixChannel? _channel;
  GraphQLClient? _client;

  StreamSubscription? _oracleUpdatesSubscription;
  Timer? _timer;

  void close() {
    _timer?.cancel();
    _channel?.close();
    _oracleUpdatesSubscription?.cancel();
  }

  /// Subscribe to oracle updates
  Future<void> subscribeToOracleUpdates({
    Function(OracleUcoPrice?)? onUpdate,
  }) async {
    await _connect(
      phoenixHttpEndpoint,
      websocketEndpoint,
    );

    _listenOracleUpdates(
      onUpdate!,
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

  void _listenOracleUpdates(
    Function(OracleUcoPrice?) onUpdate,
  ) {
    _oracleUpdatesSubscription = _subscribe<OracleUcoPrice>(
      'subscription { oracleUpdate { timestamp, services { uco { eur, usd } } } }',
    ).listen(
      (result) async {
        log('Oracle value: ${result.timestamp}');
        final oracleUcoPrice = _oracleUcoPriceDtoToModel(data: result.data);

        log(
          '>>> Oracle update <<< ($oracleUcoPrice)',
        );
        await onUpdate(
          oracleUcoPrice,
        );
      },
    );
  }

  OracleUcoPrice? _oracleUcoPriceDtoToModel({
    Map<String, dynamic>? data,
  }) {
    final oracleUpdate = data?['oracleUpdate'];
    if (oracleUpdate == null) return null;

    return OracleUcoPrice(
      timestamp: oracleUpdate?['timestamp'],
      uco: Uco(
        eur: oracleUpdate?['services']['uco']['eur'],
        usd: oracleUpdate?['services']['uco']['usd'],
      ),
    );
  }
}
