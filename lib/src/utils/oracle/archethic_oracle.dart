import 'dart:async';
import 'dart:developer';

import 'package:archethic_lib_dart/src/model/oracle_chain/oracle_uco_price.dart';
import 'package:archethic_lib_dart/src/model/uco.dart';
import 'package:archethic_lib_dart/src/utils/confirmations/phoenix_link.dart';
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
  HttpLink? _phoenixHttpLink;
  PhoenixLink? _phoenixLink;

  StreamSubscription? _oracleUpdatesSubscription;
  Timer? _timer;

  void close() {
    _timer?.cancel();
    _timer = null;
    _phoenixHttpLink?.dispose();
    _phoenixHttpLink = null;
    _phoenixLink?.dispose();
    _phoenixLink = null;
    _channel?.close();
    _channel = null;
    _oracleUpdatesSubscription?.cancel();
    _oracleUpdatesSubscription = null;
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

  void _listenOracleUpdates(
    Function(OracleUcoPrice?) onUpdate,
  ) {
    assert(
      _oracleUpdatesSubscription == null,
      'Subscription to oracle updates already created with that client.',
    );
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
