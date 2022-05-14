/// SPDX-License-Identifier: AGPL-3.0-or-later

// Dart imports:
import 'dart:developer' as dev;

// Package imports:
import 'package:http/http.dart' as http show Response, get;

// Project imports:
import 'package:archethic_lib_dart/src/model/coins/coins_current_data_response.dart';
import 'package:archethic_lib_dart/src/model/coins/coins_price_response.dart';
import 'package:archethic_lib_dart/src/model/coins/coins_response.dart';
import 'package:archethic_lib_dart/src/model/coins/simple_price_response.dart';
import 'package:archethic_lib_dart/src/model/coins/simple_price_response_aed.dart';
import 'package:archethic_lib_dart/src/model/coins/simple_price_response_ars.dart';
import 'package:archethic_lib_dart/src/model/coins/simple_price_response_aud.dart';
import 'package:archethic_lib_dart/src/model/coins/simple_price_response_brl.dart';
import 'package:archethic_lib_dart/src/model/coins/simple_price_response_btc.dart';
import 'package:archethic_lib_dart/src/model/coins/simple_price_response_cad.dart';
import 'package:archethic_lib_dart/src/model/coins/simple_price_response_chf.dart';
import 'package:archethic_lib_dart/src/model/coins/simple_price_response_clp.dart';
import 'package:archethic_lib_dart/src/model/coins/simple_price_response_cny.dart';
import 'package:archethic_lib_dart/src/model/coins/simple_price_response_czk.dart';
import 'package:archethic_lib_dart/src/model/coins/simple_price_response_dkk.dart';
import 'package:archethic_lib_dart/src/model/coins/simple_price_response_eur.dart';
import 'package:archethic_lib_dart/src/model/coins/simple_price_response_gbp.dart';
import 'package:archethic_lib_dart/src/model/coins/simple_price_response_hkd.dart';
import 'package:archethic_lib_dart/src/model/coins/simple_price_response_huf.dart';
import 'package:archethic_lib_dart/src/model/coins/simple_price_response_idr.dart';
import 'package:archethic_lib_dart/src/model/coins/simple_price_response_ils.dart';
import 'package:archethic_lib_dart/src/model/coins/simple_price_response_inr.dart';
import 'package:archethic_lib_dart/src/model/coins/simple_price_response_jpy.dart';
import 'package:archethic_lib_dart/src/model/coins/simple_price_response_krw.dart';
import 'package:archethic_lib_dart/src/model/coins/simple_price_response_kwd.dart';
import 'package:archethic_lib_dart/src/model/coins/simple_price_response_mxn.dart';
import 'package:archethic_lib_dart/src/model/coins/simple_price_response_myr.dart';
import 'package:archethic_lib_dart/src/model/coins/simple_price_response_nok.dart';
import 'package:archethic_lib_dart/src/model/coins/simple_price_response_nzd.dart';
import 'package:archethic_lib_dart/src/model/coins/simple_price_response_php.dart';
import 'package:archethic_lib_dart/src/model/coins/simple_price_response_pkr.dart';
import 'package:archethic_lib_dart/src/model/coins/simple_price_response_pln.dart';
import 'package:archethic_lib_dart/src/model/coins/simple_price_response_rub.dart';
import 'package:archethic_lib_dart/src/model/coins/simple_price_response_sar.dart';
import 'package:archethic_lib_dart/src/model/coins/simple_price_response_sek.dart';
import 'package:archethic_lib_dart/src/model/coins/simple_price_response_sgd.dart';
import 'package:archethic_lib_dart/src/model/coins/simple_price_response_thb.dart';
import 'package:archethic_lib_dart/src/model/coins/simple_price_response_try.dart';
import 'package:archethic_lib_dart/src/model/coins/simple_price_response_twd.dart';
import 'package:archethic_lib_dart/src/model/coins/simple_price_response_usd.dart';
import 'package:archethic_lib_dart/src/model/coins/simple_price_response_zar.dart';

class ApiCoinsService {
  /// Get Archethic Coin info
  Future<CoinsResponse> getCoinsResponse() async {
    CoinsResponse? coinsResponse;
    final Map<String, String> requestHeaders = <String, String>{
      'Content-type': 'application/json'
    };

    try {
      final http.Response responseHttp = await http.get(
          Uri.parse('https://api.coingecko.com/api/v3/coins/archethic'),
          headers: requestHeaders);
      if (responseHttp.statusCode == 200) {
        coinsResponse = coinsResponseFromJson(responseHttp.body);
      }
    } catch (e) {
      dev.log(e.toString());
    }
    return coinsResponse!;
  }

  /// Get Archethic Coin infos (Prices, Marketcaps, Total Volumes)
  /// @param {String} currency
  /// @param {int} nbDays
  Future<CoinsPriceResponse> getCoinsChart(String currency, int nbDays) async {
    CoinsPriceResponse? coinsPriceResponse;
    final Map<String, String> requestHeaders = <String, String>{
      'Content-type': 'application/json'
    };

    try {
      final http.Response responseHttp = await http.get(
          Uri.parse(
              'https://api.coingecko.com/api/v3/coins/archethic/market_chart?vs_currency=$currency&days=$nbDays'),
          headers: requestHeaders);
      if (responseHttp.statusCode == 200) {
        coinsPriceResponse = coinsPriceResponseFromJson(responseHttp.body);
      }
    } catch (e) {
      dev.log(e.toString());
    }
    return coinsPriceResponse!;
  }

  /// Get Archethic Coin infos (BTC Price, Local Currency Price)
  /// @param {String} currency
  Future<SimplePriceResponse> getSimplePrice(String currency) async {
    final SimplePriceResponse simplePriceResponse = SimplePriceResponse();
    simplePriceResponse.currency = currency;
    final Map<String, String> requestHeaders = <String, String>{
      'Content-type': 'application/json'
    };

    try {
      final http.Response responseHttp = await http.get(
          Uri.parse(
              'https://api.coingecko.com/api/v3/simple/price?ids=archethic&vs_currencies=$currency'),
          headers: requestHeaders);
      if (responseHttp.statusCode == 200) {
        switch (currency.toUpperCase()) {
          case 'ARS':
            final SimplePriceArsResponse simplePriceLocalResponse =
                simplePriceArsResponseFromJson(responseHttp.body);
            simplePriceResponse.localCurrencyPrice =
                simplePriceLocalResponse.archethic!.ars;
            break;
          case 'AUD':
            final SimplePriceAudResponse simplePriceLocalResponse =
                simplePriceAudResponseFromJson(responseHttp.body);
            simplePriceResponse.localCurrencyPrice =
                simplePriceLocalResponse.archethic!.aud;
            break;
          case 'BRL':
            final SimplePriceBrlResponse simplePriceLocalResponse =
                simplePriceBrlResponseFromJson(responseHttp.body);
            simplePriceResponse.localCurrencyPrice =
                simplePriceLocalResponse.archethic!.brl;
            break;
          case 'BTC':
            final SimplePriceBtcResponse simplePriceLocalResponse =
                simplePriceBtcResponseFromJson(responseHttp.body);
            simplePriceResponse.localCurrencyPrice =
                simplePriceLocalResponse.archethic!.btc;
            break;
          case 'CAD':
            final SimplePriceCadResponse simplePriceLocalResponse =
                simplePriceCadResponseFromJson(responseHttp.body);
            simplePriceResponse.localCurrencyPrice =
                simplePriceLocalResponse.archethic!.cad;
            break;
          case 'CHF':
            final SimplePriceChfResponse simplePriceLocalResponse =
                simplePriceChfResponseFromJson(responseHttp.body);
            simplePriceResponse.localCurrencyPrice =
                simplePriceLocalResponse.archethic!.chf;
            break;
          case 'CLP':
            final SimplePriceClpResponse simplePriceLocalResponse =
                simplePriceClpResponseFromJson(responseHttp.body);
            simplePriceResponse.localCurrencyPrice =
                simplePriceLocalResponse.archethic!.clp;
            break;
          case 'CNY':
            final SimplePriceCnyResponse simplePriceLocalResponse =
                simplePriceCnyResponseFromJson(responseHttp.body);
            simplePriceResponse.localCurrencyPrice =
                simplePriceLocalResponse.archethic!.cny;
            break;
          case 'CZK':
            final SimplePriceCzkResponse simplePriceLocalResponse =
                simplePriceCzkResponseFromJson(responseHttp.body);
            simplePriceResponse.localCurrencyPrice =
                simplePriceLocalResponse.archethic!.czk;
            break;
          case 'DKK':
            final SimplePriceDkkResponse simplePriceLocalResponse =
                simplePriceDkkResponseFromJson(responseHttp.body);
            simplePriceResponse.localCurrencyPrice =
                simplePriceLocalResponse.archethic!.dkk;
            break;
          case 'EUR':
            final SimplePriceEurResponse simplePriceLocalResponse =
                simplePriceEurResponseFromJson(responseHttp.body);
            simplePriceResponse.localCurrencyPrice =
                simplePriceLocalResponse.archethic!.eur;
            break;
          case 'GBP':
            final SimplePriceGbpResponse simplePriceLocalResponse =
                simplePriceGbpResponseFromJson(responseHttp.body);
            simplePriceResponse.localCurrencyPrice =
                simplePriceLocalResponse.archethic!.gbp;
            break;
          case 'HKD':
            final SimplePriceHkdResponse simplePriceLocalResponse =
                simplePriceHkdResponseFromJson(responseHttp.body);
            simplePriceResponse.localCurrencyPrice =
                simplePriceLocalResponse.archethic!.hkd;
            break;
          case 'HUF':
            final SimplePriceHufResponse simplePriceLocalResponse =
                simplePriceHufResponseFromJson(responseHttp.body);
            simplePriceResponse.localCurrencyPrice =
                simplePriceLocalResponse.archethic!.huf;
            break;
          case 'IDR':
            final SimplePriceIdrResponse simplePriceLocalResponse =
                simplePriceIdrResponseFromJson(responseHttp.body);
            simplePriceResponse.localCurrencyPrice =
                simplePriceLocalResponse.archethic!.idr;
            break;
          case 'ILS':
            final SimplePriceIlsResponse simplePriceLocalResponse =
                simplePriceIlsResponseFromJson(responseHttp.body);
            simplePriceResponse.localCurrencyPrice =
                simplePriceLocalResponse.archethic!.ils;
            break;
          case 'INR':
            final SimplePriceInrResponse simplePriceLocalResponse =
                simplePriceInrResponseFromJson(responseHttp.body);
            simplePriceResponse.localCurrencyPrice =
                simplePriceLocalResponse.archethic!.inr;
            break;
          case 'JPY':
            final SimplePriceJpyResponse simplePriceLocalResponse =
                simplePriceJpyResponseFromJson(responseHttp.body);
            simplePriceResponse.localCurrencyPrice =
                simplePriceLocalResponse.archethic!.jpy;
            break;
          case 'KRW':
            final SimplePriceKrwResponse simplePriceLocalResponse =
                simplePriceKrwResponseFromJson(responseHttp.body);
            simplePriceResponse.localCurrencyPrice =
                simplePriceLocalResponse.archethic!.krw;
            break;
          case 'KWD':
            final SimplePriceKwdResponse simplePriceLocalResponse =
                simplePriceKwdResponseFromJson(responseHttp.body);
            simplePriceResponse.localCurrencyPrice =
                simplePriceLocalResponse.archethic!.kwd;
            break;
          case 'MXN':
            final SimplePriceMxnResponse simplePriceLocalResponse =
                simplePriceMxnResponseFromJson(responseHttp.body);
            simplePriceResponse.localCurrencyPrice =
                simplePriceLocalResponse.archethic!.mxn;
            break;
          case 'MYR':
            final SimplePriceMyrResponse simplePriceLocalResponse =
                simplePriceMyrResponseFromJson(responseHttp.body);
            simplePriceResponse.localCurrencyPrice =
                simplePriceLocalResponse.archethic!.myr;
            break;
          case 'NOK':
            final SimplePriceNokResponse simplePriceLocalResponse =
                simplePriceNokResponseFromJson(responseHttp.body);
            simplePriceResponse.localCurrencyPrice =
                simplePriceLocalResponse.archethic!.nok;
            break;
          case 'NZD':
            final SimplePriceNzdResponse simplePriceLocalResponse =
                simplePriceNzdResponseFromJson(responseHttp.body);
            simplePriceResponse.localCurrencyPrice =
                simplePriceLocalResponse.archethic!.nzd;
            break;
          case 'PHP':
            final SimplePricePhpResponse simplePriceLocalResponse =
                simplePricePhpResponseFromJson(responseHttp.body);
            simplePriceResponse.localCurrencyPrice =
                simplePriceLocalResponse.archethic!.php;
            break;
          case 'PKR':
            final SimplePricePkrResponse simplePriceLocalResponse =
                simplePricePkrResponseFromJson(responseHttp.body);
            simplePriceResponse.localCurrencyPrice =
                simplePriceLocalResponse.archethic!.pkr;
            break;
          case 'PLN':
            final SimplePricePlnResponse simplePriceLocalResponse =
                simplePricePlnResponseFromJson(responseHttp.body);
            simplePriceResponse.localCurrencyPrice =
                simplePriceLocalResponse.archethic!.pln;
            break;
          case 'RUB':
            final SimplePriceRubResponse simplePriceLocalResponse =
                simplePriceRubResponseFromJson(responseHttp.body);
            simplePriceResponse.localCurrencyPrice =
                simplePriceLocalResponse.archethic!.rub;
            break;
          case 'SAR':
            final SimplePriceSarResponse simplePriceLocalResponse =
                simplePriceSarResponseFromJson(responseHttp.body);
            simplePriceResponse.localCurrencyPrice =
                simplePriceLocalResponse.archethic!.sar;
            break;
          case 'SEK':
            final SimplePriceSekResponse simplePriceLocalResponse =
                simplePriceSekResponseFromJson(responseHttp.body);
            simplePriceResponse.localCurrencyPrice =
                simplePriceLocalResponse.archethic!.sek;
            break;
          case 'SGD':
            final SimplePriceSgdResponse simplePriceLocalResponse =
                simplePriceSgdResponseFromJson(responseHttp.body);
            simplePriceResponse.localCurrencyPrice =
                simplePriceLocalResponse.archethic!.sgd;
            break;
          case 'THB':
            final SimplePriceThbResponse simplePriceLocalResponse =
                simplePriceThbResponseFromJson(responseHttp.body);
            simplePriceResponse.localCurrencyPrice =
                simplePriceLocalResponse.archethic!.thb;
            break;
          case 'TRY':
            final SimplePriceTryResponse simplePriceLocalResponse =
                simplePriceTryResponseFromJson(responseHttp.body);
            simplePriceResponse.localCurrencyPrice =
                simplePriceLocalResponse.archethic!.tryl;
            break;
          case 'TWD':
            final SimplePriceTwdResponse simplePriceLocalResponse =
                simplePriceTwdResponseFromJson(responseHttp.body);
            simplePriceResponse.localCurrencyPrice =
                simplePriceLocalResponse.archethic!.twd;
            break;
          case 'AED':
            final SimplePriceAedResponse simplePriceLocalResponse =
                simplePriceAedResponseFromJson(responseHttp.body);
            simplePriceResponse.localCurrencyPrice =
                simplePriceLocalResponse.archethic!.aed;
            break;
          case 'ZAR':
            final SimplePriceZarResponse simplePriceLocalResponse =
                simplePriceZarResponseFromJson(responseHttp.body);
            simplePriceResponse.localCurrencyPrice =
                simplePriceLocalResponse.archethic!.zar;
            break;
          case 'USD':
          default:
            final SimplePriceUsdResponse simplePriceLocalResponse =
                simplePriceUsdResponseFromJson(responseHttp.body);
            simplePriceResponse.localCurrencyPrice =
                simplePriceLocalResponse.archethic!.usd;
            break;
        }
      }
    } catch (e) {
      dev.log(e.toString());
    }

    return simplePriceResponse;
  }

  /// Get Archethic Coin infos (name, price, market, ... including exchange tickers)
  Future<CoinsCurrentDataResponse> getCoinsCurrentData() async {
    CoinsCurrentDataResponse? coinsCurrentDataResponse;
    final Map<String, String> requestHeaders = <String, String>{
      'Content-type': 'application/json'
    };

    try {
      final http.Response responseHttp = await http.get(
          Uri.parse('https://api.coingecko.com/api/v3/coins/archethic'),
          headers: requestHeaders);
      if (responseHttp.statusCode == 200) {
        coinsCurrentDataResponse =
            coinsCurrentDataResponseFromJson(responseHttp.body);
      }
    } catch (e) {
      dev.log(e.toString());
    }

    return coinsCurrentDataResponse!;
  }
}
