/// SPDX-License-Identifier: AGPL-3.0-or-later
import 'dart:async';

import 'package:archethic_lib_dart/src/model/oracle_chain/oracle_uco_price.dart';
import 'package:archethic_lib_dart/src/model/response/oracle_data_response.dart';
import 'package:archethic_lib_dart/src/model/uco.dart';
import 'package:archethic_lib_dart/src/utils/logs.dart';
import 'package:archethic_lib_dart/src/utils/oracle/archethic_oracle.dart';
import 'package:http/http.dart' as http show post;

class OracleService {
  OracleService(this.endpoint, {this.logsActivation = true});

  /// [endpoint] is the HTTP URL to a Archethic node (acting as welcome node)
  String? endpoint;

  /// [logsActivation] manage log activation
  final bool logsActivation;

  /// return a value of Oracle Uco_Price in {OracleUcoPrice} from a timestamp
  /// if timestamp = 0 or not precised, the last price is returned
  /// @param {int} timestamp
  Future<OracleUcoPrice> getOracleData({int timestamp = 0}) async {
    final completer = Completer<OracleUcoPrice>();
    var oracleUcoPrice = const OracleUcoPrice(uco: Uco(eur: 0, usd: 0));
    final requestHeaders = <String, String>{
      'Content-type': 'application/json',
      'Accept': 'application/json',
    };
    var body = '';

    try {
      if (timestamp == 0) {
        body =
            '{"query": "query { oracleData { timestamp services { uco { eur, usd } } } }"}';
      } else {
        body =
            '{"query": "query { oracleData(timestamp: $timestamp) { timestamp services { uco { eur, usd } } } }"}';
      }

      log(
        'getOracleData: requestHttp.body=$body',
        logsActivation: logsActivation,
      );
      final responseHttp = await http.post(
        Uri.parse('${endpoint!}/api'),
        body: body,
        headers: requestHeaders,
      );
      log(
        'getOracleData: responseHttp.body=${responseHttp.body}',
        logsActivation: logsActivation,
      );
      if (responseHttp.statusCode == 200) {
        final oracleDataResponse =
            oracleDataResponseFromJson(responseHttp.body);
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
      }
    } catch (e) {
      log(
        'getOracleData: error=$e',
        logsActivation: logsActivation,
      );
    }

    completer.complete(oracleUcoPrice);
    return completer.future;
  }

  /// Subscribe to be notified when a new oracle data is stored
  Future<ArchethicOracle> subscribeToOracleUpdates(
    Function(OracleUcoPrice?) onUpdate,
  ) async {
    String websocketEndpoint;
    switch (endpoint) {
      case 'https://mainnet.archethic.net':
      case 'https://testnet.archethic.net':
        websocketEndpoint =
            "${endpoint!.replaceAll('https:', 'wss:').replaceAll('http:', 'wss:')}/socket/websocket";
        break;
      default:
        websocketEndpoint =
            "${endpoint!.replaceAll('https:', 'wss:').replaceAll('http:', 'ws:')}/socket/websocket";
        break;
    }

    final oracleRepository = ArchethicOracle(
      phoenixHttpEndpoint: '$endpoint/socket/websocket',
      websocketEndpoint: websocketEndpoint,
    );

    await oracleRepository.subscribeToOracleUpdates(
      onUpdate: onUpdate,
    );

    return oracleRepository;
  }

  /// Close the subscription
  void closeOracleUpdatesSubscription(ArchethicOracle archethicOracle) {
    archethicOracle.close();
  }
}
