import 'package:archethic_lib_dart/archethic_lib_dart.dart';
import 'package:archethic_lib_dart/src/services/oracle_service.dart';
// Package imports:
import 'package:test/test.dart';

import 'utils.dart';

void main() {
  group(
    'oracle',
    tags: <String>[TestTags.noCI],
    () {
      test('getLastOracleUcoPrice', () async {
        final oracleUcoPrice = await OracleService(
          'https://mainnet.archethic.net',
        ).getOracleData();
        final oracleUcoPrice2 = await OracleService(
          'https://mainnet.archethic.net',
        ).getOracleData(
          timestamp: DateTime.now().millisecondsSinceEpoch ~/
              Duration.millisecondsPerSecond,
        );
        expect(oracleUcoPrice.uco!.eur, oracleUcoPrice2.uco!.eur);
        expect(oracleUcoPrice.uco!.usd, oracleUcoPrice2.uco!.usd);
      });

      /*test(
        'subscribeToOracleUpdates',
        () async {
          final oracleStream = await OracleService(
            'https://testnet.archethic.net',
          ).subscribe();

          final data = await oracleStream.first.timeout(
            const Duration(minutes: 2),
          );
          log('Oracle value: ${data.timestamp} - ${data.uco!.usd} USD');
        },
      );*/
    },
  );
}
