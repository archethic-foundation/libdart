import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'package:archethic_lib_dart/archethic_lib_dart.dart';
import 'package:archethic_lib_dart/src/model/response/oracle_data_response.dart';
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
    required OracleUpdatesHandler onUpdate,
  }) async {
    await _connect(
      phoenixHttpEndpoint,
      websocketEndpoint,
    );

    _listenOracleUpdates(
      onUpdate,
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
    OracleUpdatesHandler onUpdate,
  ) {
    _oracleUpdatesSubscription = _subscribe<OracleUcoPrice>(
      'subscription { oracleUpdate { timestamp, services { uco { eur, usd } } } }',
    ).listen(
      (result) {
        close();
        var oracleUcoPrice = const OracleUcoPrice(uco: Uco(eur: 0, usd: 0));
        final oracleDataResponse =
            oracleDataResponseFromJson(jsonEncode(result.data));
        if (oracleDataResponse.data != null &&
            oracleDataResponse.data!.oracleData != null &&
            oracleDataResponse.data!.oracleData!.services != null &&
            oracleDataResponse.data!.oracleData!.services!.uco != null) {
          oracleUcoPrice = OracleUcoPrice(
            timestamp: oracleDataResponse.data!.oracleData!.timestamp,
            uco: Uco(
              eur: oracleDataResponse.data!.oracleData!.services!.uco!.eur,
              usd: oracleDataResponse.data!.oracleData!.services!.uco!.usd,
            ),
          );
        }

        log(
          '>>> Oracle update <<< ($oracleUcoPrice)',
        );
        onUpdate(
          oracleUcoPrice,
        );
      },
    );
  }
}

typedef OracleUpdatesHandler = Future<void> Function(
  OracleUcoPrice update,
);
