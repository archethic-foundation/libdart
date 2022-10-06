library test.oracle_test;

import 'package:archethic_lib_dart/src/services/oracle_service.dart';
// Package imports:
import 'package:test/test.dart';

void main() {
  group(
    'oracle',
    () {
      test('getLastOracleUcoPrice', () async {
        final oracleUcoPrice =
            await OracleService('http://localhost:4000').getOracleData();
        final oracleUcoPrice2 =
            await OracleService('http://localhost:4000').getOracleData(
          timestamp: DateTime.now().millisecondsSinceEpoch ~/
              Duration.millisecondsPerSecond,
        );
        expect(oracleUcoPrice.uco!.eur, oracleUcoPrice2.uco!.eur);
        expect(oracleUcoPrice.uco!.usd, oracleUcoPrice2.uco!.usd);
      });
    },
    tags: <String>['noCI'],
  );
}
