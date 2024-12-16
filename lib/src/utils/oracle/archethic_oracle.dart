import 'dart:async';
import 'dart:io';

import 'package:archethic_lib_dart/src/model/oracle_chain/oracle_uco_price.dart';
import 'package:archethic_lib_dart/src/model/response/oracle_data_response.dart';
import 'package:archethic_lib_dart/src/model/uco.dart';
import 'package:archethic_lib_dart/src/utils/confirmations/phoenix_link.dart';
import 'package:graphql/client.dart';
import 'package:http/http.dart' as http show post;

class ArchethicOracle {
  ArchethicOracle({
    required this.endpoint,
  }) {
    websocketEndpoint =
        "${endpoint.replaceAll('https:', 'wss:').replaceAll('http:', 'wss:')}/socket/websocket";

    phoenixHttpEndpoint = '$endpoint/socket/websocket';
  }

  final String endpoint;
  late final String phoenixHttpEndpoint;
  late final String websocketEndpoint;

  Future<Stream<OracleUcoPrice>> subscribe() async {
    final phoenixHttpLink = HttpLink(
      phoenixHttpEndpoint,
    );

    final phoenixLink = await PhoenixLink.fromWebsocketUri(
      uri: websocketEndpoint,
    );

    final link = Link.split(
      (request) => request.isSubscription,
      phoenixLink,
      phoenixHttpLink,
    );
    final client = GraphQLClient(
      link: link,
      cache: GraphQLCache(),
    );

    final subscriptionDocument = gql(
      'subscription { oracleUpdate { timestamp, services { uco { eur, usd } } } }',
    );
    return client
        .subscribe(
          SubscriptionOptions(
            document: subscriptionDocument,
          ),
        )
        .map((result) => _oracleUcoPriceDtoToModel(data: result.data))
        .where((valueOrNull) => valueOrNull != null)
        .cast();
  }

  Future<OracleUcoPrice> getOracleData({int timestamp = 0}) async {
    final requestHeaders = <String, String>{
      'Content-type': 'application/json',
      'Accept': 'application/json',
    };

    final body = timestamp == 0
        ? '{"query": "query { oracleData { timestamp services { uco { eur, usd } } } }"}'
        : '{"query": "query { oracleData(timestamp: $timestamp) { timestamp services { uco { eur, usd } } } }"}';

    final responseHttp = await http.post(
      Uri.parse('$endpoint/api'),
      body: body,
      headers: requestHeaders,
    );

    if (responseHttp.statusCode != 200) {
      throw HttpException(responseHttp.toString());
    }

    final oracleDataResponse = oracleDataResponseFromJson(
      responseHttp.body,
    );
    final uco = oracleDataResponse.data?.oracleData?.services?.uco;

    return OracleUcoPrice(
      timestamp: oracleDataResponse.data?.oracleData?.timestamp,
      uco: Uco(
        eur: uco!.eur,
        usd: uco.usd,
      ),
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
