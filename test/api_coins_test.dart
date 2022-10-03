library test.api_coins_test;

import 'package:archethic_lib_dart/src/services/api_coins_service.dart';
// Package imports:
import 'package:test/test.dart';

void main() {
  group('api_coins', () {
    test('getTransactionIndex', () async {
      final coinsPriceResponse =
          await ApiCoinsService().getCoinsChart('EUR', 1);

      expect(coinsPriceResponse.error, null);
    });

    test('getSimplePrice', () async {
      final simplePriceResponse =
          await ApiCoinsService().getSimplePrice('EUR');

      expect(simplePriceResponse.currency, 'EUR');
    });

    test('getCoinsCurrentData', () async {
      final coinsCurrentDataResponse =
          await ApiCoinsService().getCoinsCurrentData();

      expect(coinsCurrentDataResponse.id, 'archethic');
    });
  });
}
