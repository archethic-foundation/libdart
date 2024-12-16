// SPDX-License-Identifier: AGPL-3.0-or-later
import 'dart:async';

import 'package:archethic_lib_dart/src/model/oracle_chain/oracle_uco_price.dart';
import 'package:archethic_lib_dart/src/utils/oracle/archethic_oracle.dart';
import 'package:logging/logging.dart';

class OracleService {
  OracleService(this.endpoint);

  /// [endpoint] is the HTTP URL to a Archethic node (acting as welcome node)
  final String endpoint;

  late final _archethicOracle = ArchethicOracle(
    endpoint: endpoint,
  );

  final _logger = Logger('OracleService');

  /// Returns a value of Oracle Uco_Price in {OracleUcoPrice} from a timestamp.
  ///
  /// if [timestamp] = 0 or not precised, the last price is returned.
  Future<OracleUcoPrice> getOracleData({int timestamp = 0}) async {
    try {
      final result = await _archethicOracle.getOracleData(timestamp: timestamp);
      _logger.fine('getOracleData: $result');
      return result;
    } catch (e, stack) {
      _logger.severe(
        'getOracleData failed',
        e,
        stack,
      );
      return const OracleUcoPrice();
    }
  }

  /// Subscribe to notifications when a new oracle data is stored.
  Future<Stream<OracleUcoPrice>> subscribe() => _archethicOracle.subscribe();
}
