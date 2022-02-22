/// SPDX-License-Identifier: AGPL-3.0-or-later

class SimplePriceResponse {
  SimplePriceResponse({
    this.currency,
    this.localCurrencyPrice,
  });

  String? currency;
  double? localCurrencyPrice;
}
