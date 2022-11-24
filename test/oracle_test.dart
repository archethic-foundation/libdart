library test.oracle_test;

import 'package:archethic_lib_dart/src/model/oracle_chain/oracle_uco_price.dart';
import 'package:archethic_lib_dart/src/services/oracle_service.dart';
import 'package:test/test.dart';

void main() {
  group('oracle', () {
    test('getLastOracleUcoPrice', () async {
      final OracleUcoPrice oracleUcoPrice =
          await OracleService('http://localhost:4000').getOracleData();
      final OracleUcoPrice oracleUcoPrice2 =
          await OracleService('http://localhost:4000').getOracleData(
              timestamp: DateTime.now().millisecondsSinceEpoch ~/
                  Duration.millisecondsPerSecond);
      expect(oracleUcoPrice.uco!.eur, oracleUcoPrice2.uco!.eur);
      expect(oracleUcoPrice.uco!.usd, oracleUcoPrice2.uco!.usd);
    });
  }, tags: <String>['noCI']);
}
