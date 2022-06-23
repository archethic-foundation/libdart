library test.api_coins_test;

// Package imports:
import 'package:test/test.dart';

// Project imports:
import 'package:archethic_lib_dart/src/model/coins/coins_current_data_response.dart';
import 'package:archethic_lib_dart/src/model/coins/coins_price_response.dart';
import 'package:archethic_lib_dart/src/model/coins/simple_price_response.dart';
import 'package:archethic_lib_dart/src/services/api_coins_service.dart';

void main() {
  group('api_coins', () {
    test('getTransactionIndex', () async {
      final CoinsPriceResponse coinsPriceResponse =
          await ApiCoinsService().getCoinsChart('EUR', 1);

      expect(coinsPriceResponse.error, null);
    });

    test('getSimplePrice', () async {
      final SimplePriceResponse simplePriceResponse =
          await ApiCoinsService().getSimplePrice('EUR');

      expect(simplePriceResponse.currency, 'EUR');
    });

    test('getCoinsCurrentData', () async {
      final CoinsCurrentDataResponse coinsCurrentDataResponse =
          await ApiCoinsService().getCoinsCurrentData();

      expect(coinsCurrentDataResponse.id, 'archethic');
    });
  });
}
