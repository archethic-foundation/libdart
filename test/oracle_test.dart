library test.oracle_test;

// Package imports:
import 'package:archethic_lib_dart/src/model/oracle_chain/oracle_uco_price.dart';
import 'package:archethic_lib_dart/src/services/oracle_service.dart';
import 'package:test/test.dart';

void main() {
  group('oracle', () {
    test('getLastOracleUcoPrice', () async {
      final OracleUcoPrice oracleUcoPrice =
          await OracleService('http://localhost:4000').getLastOracleUcoPrice();
      expect(oracleUcoPrice.uco!.eur, oracleUcoPrice.uco!.usd);
    });
  }, tags: ['noCI']);
}
