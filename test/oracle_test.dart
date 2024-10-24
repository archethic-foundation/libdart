library test.oracle_test;

// Project imports:
import 'dart:async';
import 'dart:developer';

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

      test(
        'subscribeToOracleUpdates',
        () async {
          final completer = Completer<void>();

          await OracleService('https://testnet.archethic.net')
              .subscribeToOracleUpdates((data) {
            if (data == null) {
              log('Oracle value null');
            } else {
              log('Oracle value: ${data.timestamp} - ${data.uco!.usd} USD');
            }

            if (!completer.isCompleted) {
              completer.complete();
            }
          });

          await Future.delayed(const Duration(minutes: 1), () {
            if (!completer.isCompleted) {
              log('Timeout reached');
              completer.complete();
            }
          });
        },
        timeout: const Timeout(
          Duration(minutes: 2),
        ),
      );

      test(
        'unsubscribeToOracleUpdates',
        () async {
          log('${DateTime.now().toIso8601String()} Start');

          var updatesAfterUnsubscribe = false;

          final oracleService =
              await OracleService('https://mainnet.archethic.net')
                  .subscribeToOracleUpdates((data) {
            if (data == null) {
              log('${DateTime.now().toIso8601String()} Oracle value null');
            } else {
              log('${DateTime.now().toIso8601String()} Oracle value: ${data.timestamp} - ${data.uco!.usd} USD');
            }
            updatesAfterUnsubscribe = true;
          });

          await Future.delayed(const Duration(minutes: 2), () {
            log('${DateTime.now().toIso8601String()} Unsubscribe Oracle');
            oracleService.close();
            updatesAfterUnsubscribe = false;
          });

          await Future.delayed(const Duration(minutes: 2), () {
            log('${DateTime.now().toIso8601String()} Checking for updates after unsubscribe');
          });

          expect(
            updatesAfterUnsubscribe,
            isFalse,
            reason: 'Updates received after unsubscription',
          );

          log('${DateTime.now().toIso8601String()} End');
        },
        timeout: const Timeout(
          Duration(minutes: 10),
        ),
      );
    },
  );
}
