import 'dart:async';
import 'dart:developer';
import 'package:archethic_lib_dart/src/model/oracle_chain/oracle_uco_price.dart';
import 'package:archethic_lib_dart/src/utils/oracle/archethic_oracle.dart';

mixin OracleMixin {
  Future<OracleUcoPrice?> subscribeToOracleUpdates({
    required String endpoint,
  }) async {
    String websocketEndpoint;
    OracleUcoPrice? oracleUcoPrice;
    switch (endpoint) {
      case 'https://mainnet.archethic.net':
      case 'https://testnet.archethic.net':
        websocketEndpoint =
            "${endpoint.replaceAll('https:', 'wss:').replaceAll('http:', 'wss:')}/socket/websocket";
        break;
      default:
        websocketEndpoint =
            "${endpoint.replaceAll('https:', 'wss:').replaceAll('http:', 'ws:')}/socket/websocket";
        break;
    }

    final oracleRepository = ArchethicOracle(
      phoenixHttpEndpoint: '$endpoint/socket/websocket',
      websocketEndpoint: websocketEndpoint,
    );

    await oracleRepository.subscribeToOracleUpdates(
      onUpdate: (onUpdate) async {
        log(
          'timestamp: ${onUpdate.timestamp} uco: ${onUpdate.uco}',
          name: 'oracle',
        );
        oracleUcoPrice = onUpdate;
      },
    );
    return oracleUcoPrice;
  }
}
