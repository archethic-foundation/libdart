library test.oracle_test;

// Project imports:
import 'dart:developer';

import 'package:archethic_lib_dart/src/services/oracle_service.dart';
// Package imports:
import 'package:test/test.dart';

void main() {
  group(
    'oracle',
    () {
      test('getLastOracleUcoPrice', () async {
        final oracleUcoPrice =
            await OracleService('https://mainnet.archethic.net')
                .getOracleData();
        final oracleUcoPrice2 =
            await OracleService('https://mainnet.archethic.net').getOracleData(
          timestamp: DateTime.now().millisecondsSinceEpoch ~/
              Duration.millisecondsPerSecond,
        );
        expect(oracleUcoPrice.uco!.eur, oracleUcoPrice2.uco!.eur);
        expect(oracleUcoPrice.uco!.usd, oracleUcoPrice2.uco!.usd);
      });

      test('subscribeToOracleUpdates', () async {
        await OracleService('https://mainnet.archethic.net')
            .subscribeToOracle((data) {
          if (data == null) {
            log('Oracle value null');
          } else {
            log('Oracle value: ${data.timestamp} - ${data.uco} UCO');
          }
        });
      });
    },
    tags: <String>['noCI'],
  );
}
