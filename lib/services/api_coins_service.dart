// Dart imports:
import 'dart:convert';
import 'dart:io';

// Project imports:
import 'package:archethic_lib_dart/model/response/coins_current_data_response.dart';
import 'package:archethic_lib_dart/model/response/coins_price_response.dart';
import 'package:archethic_lib_dart/model/response/coins_response.dart';
import 'package:archethic_lib_dart/model/response/simple_price_response.dart';
import 'package:archethic_lib_dart/model/response/simple_price_response_aed.dart';
import 'package:archethic_lib_dart/model/response/simple_price_response_ars.dart';
import 'package:archethic_lib_dart/model/response/simple_price_response_aud.dart';
import 'package:archethic_lib_dart/model/response/simple_price_response_brl.dart';
import 'package:archethic_lib_dart/model/response/simple_price_response_btc.dart';
import 'package:archethic_lib_dart/model/response/simple_price_response_cad.dart';
import 'package:archethic_lib_dart/model/response/simple_price_response_chf.dart';
import 'package:archethic_lib_dart/model/response/simple_price_response_clp.dart';
import 'package:archethic_lib_dart/model/response/simple_price_response_cny.dart';
import 'package:archethic_lib_dart/model/response/simple_price_response_czk.dart';
import 'package:archethic_lib_dart/model/response/simple_price_response_dkk.dart';
import 'package:archethic_lib_dart/model/response/simple_price_response_eur.dart';
import 'package:archethic_lib_dart/model/response/simple_price_response_gbp.dart';
import 'package:archethic_lib_dart/model/response/simple_price_response_hkd.dart';
import 'package:archethic_lib_dart/model/response/simple_price_response_huf.dart';
import 'package:archethic_lib_dart/model/response/simple_price_response_idr.dart';
import 'package:archethic_lib_dart/model/response/simple_price_response_ils.dart';
import 'package:archethic_lib_dart/model/response/simple_price_response_inr.dart';
import 'package:archethic_lib_dart/model/response/simple_price_response_jpy.dart';
import 'package:archethic_lib_dart/model/response/simple_price_response_krw.dart';
import 'package:archethic_lib_dart/model/response/simple_price_response_kwd.dart';
import 'package:archethic_lib_dart/model/response/simple_price_response_mxn.dart';
import 'package:archethic_lib_dart/model/response/simple_price_response_myr.dart';
import 'package:archethic_lib_dart/model/response/simple_price_response_nok.dart';
import 'package:archethic_lib_dart/model/response/simple_price_response_nzd.dart';
import 'package:archethic_lib_dart/model/response/simple_price_response_php.dart';
import 'package:archethic_lib_dart/model/response/simple_price_response_pkr.dart';
import 'package:archethic_lib_dart/model/response/simple_price_response_pln.dart';
import 'package:archethic_lib_dart/model/response/simple_price_response_rub.dart';
import 'package:archethic_lib_dart/model/response/simple_price_response_sar.dart';
import 'package:archethic_lib_dart/model/response/simple_price_response_sek.dart';
import 'package:archethic_lib_dart/model/response/simple_price_response_sgd.dart';
import 'package:archethic_lib_dart/model/response/simple_price_response_thb.dart';
import 'package:archethic_lib_dart/model/response/simple_price_response_try.dart';
import 'package:archethic_lib_dart/model/response/simple_price_response_twd.dart';
import 'package:archethic_lib_dart/model/response/simple_price_response_usd.dart';
import 'package:archethic_lib_dart/model/response/simple_price_response_zar.dart';

class ApiCoinsService {
  /*
   * Get Uniris Coin info
  */
  Future<CoinsResponse> getCoinsResponse() async {
    CoinsResponse? coinsResponse;
    final HttpClient httpClient = HttpClient();
    try {
      final HttpClientRequest request = await httpClient
          .getUrl(Uri.parse('https://api.coingecko.com/api/v3/coins/uniris'));
      request.headers.set('content-type', 'application/json');
      final HttpClientResponse response = await request.close();
      if (response.statusCode == 200) {
        final String reply = await response.transform(utf8.decoder).join();
        coinsResponse = coinsResponseFromJson(reply);
      }
    } finally {
      httpClient.close();
    }
    return coinsResponse!;
  }

  /*
   * Get Uniris Coin infos (Prices, Marketcaps, Total Volumes)
   * @param {String} currency
   * @param {int} nbDays
  */
  Future<CoinsPriceResponse> getCoinsChart(String currency, int nbDays) async {
    CoinsPriceResponse? coinsPriceResponse;
    final HttpClient httpClient = HttpClient();
    try {
      final HttpClientRequest request = await httpClient.getUrl(Uri.parse(
          'https://api.coingecko.com/api/v3/coins/uniris/market_chart?vs_currency=' +
              currency +
              '&days=' +
              nbDays.toString()));
      request.headers.set('content-type', 'application/json');
      final HttpClientResponse response = await request.close();
      if (response.statusCode == 200) {
        final String reply = await response.transform(utf8.decoder).join();
        coinsPriceResponse = coinsPriceResponseFromJson(reply);
      }
    } finally {
      httpClient.close();
    }
    return coinsPriceResponse!;
  }

  /*
   * Get Uniris Coin infos (BTC Price, Local Currency Price)
   * @param {String} currency
  */
  Future<SimplePriceResponse> getSimplePrice(String currency) async {
    final SimplePriceResponse simplePriceResponse = SimplePriceResponse();
    simplePriceResponse.currency = currency;

    final HttpClient httpClient = HttpClient();
    try {
      HttpClientRequest request = await httpClient.getUrl(Uri.parse(
          'https://api.coingecko.com/api/v3/simple/price?ids=uniris&vs_currencies=BTC'));
      request.headers.set('content-type', 'application/json');
      HttpClientResponse response = await request.close();
      if (response.statusCode == 200) {
        final String reply = await response.transform(utf8.decoder).join();
        final SimplePriceBtcResponse simplePriceBtcResponse =
            simplePriceBtcResponseFromJson(reply);
        simplePriceResponse.btcPrice = simplePriceBtcResponse.uniris!.btc;
      }

      request = await httpClient.getUrl(Uri.parse(
          'https://api.coingecko.com/api/v3/simple/price?ids=uniris&vs_currencies=' +
              currency));
      request.headers.set('content-type', 'application/json');
      response = await request.close();
      if (response.statusCode == 200) {
        final String reply = await response.transform(utf8.decoder).join();
        switch (currency.toUpperCase()) {
          case 'ARS':
            final SimplePriceArsResponse simplePriceLocalResponse =
                simplePriceArsResponseFromJson(reply);
            simplePriceResponse.localCurrencyPrice =
                simplePriceLocalResponse.uniris!.ars;
            break;
          case 'AUD':
            final SimplePriceAudResponse simplePriceLocalResponse =
                simplePriceAudResponseFromJson(reply);
            simplePriceResponse.localCurrencyPrice =
                simplePriceLocalResponse.uniris!.aud;
            break;
          case 'BRL':
            final SimplePriceBrlResponse simplePriceLocalResponse =
                simplePriceBrlResponseFromJson(reply);
            simplePriceResponse.localCurrencyPrice =
                simplePriceLocalResponse.uniris!.brl;
            break;
          case 'CAD':
            final SimplePriceCadResponse simplePriceLocalResponse =
                simplePriceCadResponseFromJson(reply);
            simplePriceResponse.localCurrencyPrice =
                simplePriceLocalResponse.uniris!.cad;
            break;
          case 'CHF':
            final SimplePriceChfResponse simplePriceLocalResponse =
                simplePriceChfResponseFromJson(reply);
            simplePriceResponse.localCurrencyPrice =
                simplePriceLocalResponse.uniris!.chf;
            break;
          case 'CLP':
            final SimplePriceClpResponse simplePriceLocalResponse =
                simplePriceClpResponseFromJson(reply);
            simplePriceResponse.localCurrencyPrice =
                simplePriceLocalResponse.uniris!.clp;
            break;
          case 'CNY':
            final SimplePriceCnyResponse simplePriceLocalResponse =
                simplePriceCnyResponseFromJson(reply);
            simplePriceResponse.localCurrencyPrice =
                simplePriceLocalResponse.uniris!.cny;
            break;
          case 'CZK':
            final SimplePriceCzkResponse simplePriceLocalResponse =
                simplePriceCzkResponseFromJson(reply);
            simplePriceResponse.localCurrencyPrice =
                simplePriceLocalResponse.uniris!.czk;
            break;
          case 'DKK':
            final SimplePriceDkkResponse simplePriceLocalResponse =
                simplePriceDkkResponseFromJson(reply);
            simplePriceResponse.localCurrencyPrice =
                simplePriceLocalResponse.uniris!.dkk;
            break;
          case 'EUR':
            final SimplePriceEurResponse simplePriceLocalResponse =
                simplePriceEurResponseFromJson(reply);
            simplePriceResponse.localCurrencyPrice =
                simplePriceLocalResponse.uniris!.eur;
            break;
          case 'GBP':
            final SimplePriceGbpResponse simplePriceLocalResponse =
                simplePriceGbpResponseFromJson(reply);
            simplePriceResponse.localCurrencyPrice =
                simplePriceLocalResponse.uniris!.gbp;
            break;
          case 'HKD':
            final SimplePriceHkdResponse simplePriceLocalResponse =
                simplePriceHkdResponseFromJson(reply);
            simplePriceResponse.localCurrencyPrice =
                simplePriceLocalResponse.uniris!.hkd;
            break;
          case 'HUF':
            final SimplePriceHufResponse simplePriceLocalResponse =
                simplePriceHufResponseFromJson(reply);
            simplePriceResponse.localCurrencyPrice =
                simplePriceLocalResponse.uniris!.huf;
            break;
          case 'IDR':
            final SimplePriceIdrResponse simplePriceLocalResponse =
                simplePriceIdrResponseFromJson(reply);
            simplePriceResponse.localCurrencyPrice =
                simplePriceLocalResponse.uniris!.idr;
            break;
          case 'ILS':
            final SimplePriceIlsResponse simplePriceLocalResponse =
                simplePriceIlsResponseFromJson(reply);
            simplePriceResponse.localCurrencyPrice =
                simplePriceLocalResponse.uniris!.ils;
            break;
          case 'INR':
            final SimplePriceInrResponse simplePriceLocalResponse =
                simplePriceInrResponseFromJson(reply);
            simplePriceResponse.localCurrencyPrice =
                simplePriceLocalResponse.uniris!.inr;
            break;
          case 'JPY':
            final SimplePriceJpyResponse simplePriceLocalResponse =
                simplePriceJpyResponseFromJson(reply);
            simplePriceResponse.localCurrencyPrice =
                simplePriceLocalResponse.uniris!.jpy;
            break;
          case 'KRW':
            final SimplePriceKrwResponse simplePriceLocalResponse =
                simplePriceKrwResponseFromJson(reply);
            simplePriceResponse.localCurrencyPrice =
                simplePriceLocalResponse.uniris!.krw;
            break;
          case 'KWD':
            final SimplePriceKwdResponse simplePriceLocalResponse =
                simplePriceKwdResponseFromJson(reply);
            simplePriceResponse.localCurrencyPrice =
                simplePriceLocalResponse.uniris!.kwd;
            break;
          case 'MXN':
            final SimplePriceMxnResponse simplePriceLocalResponse =
                simplePriceMxnResponseFromJson(reply);
            simplePriceResponse.localCurrencyPrice =
                simplePriceLocalResponse.uniris!.mxn;
            break;
          case 'MYR':
            final SimplePriceMyrResponse simplePriceLocalResponse =
                simplePriceMyrResponseFromJson(reply);
            simplePriceResponse.localCurrencyPrice =
                simplePriceLocalResponse.uniris!.myr;
            break;
          case 'NOK':
            final SimplePriceNokResponse simplePriceLocalResponse =
                simplePriceNokResponseFromJson(reply);
            simplePriceResponse.localCurrencyPrice =
                simplePriceLocalResponse.uniris!.nok;
            break;
          case 'NZD':
            final SimplePriceNzdResponse simplePriceLocalResponse =
                simplePriceNzdResponseFromJson(reply);
            simplePriceResponse.localCurrencyPrice =
                simplePriceLocalResponse.uniris!.nzd;
            break;
          case 'PHP':
            final SimplePricePhpResponse simplePriceLocalResponse =
                simplePricePhpResponseFromJson(reply);
            simplePriceResponse.localCurrencyPrice =
                simplePriceLocalResponse.uniris!.php;
            break;
          case 'PKR':
            final SimplePricePkrResponse simplePriceLocalResponse =
                simplePricePkrResponseFromJson(reply);
            simplePriceResponse.localCurrencyPrice =
                simplePriceLocalResponse.uniris!.pkr;
            break;
          case 'PLN':
            final SimplePricePlnResponse simplePriceLocalResponse =
                simplePricePlnResponseFromJson(reply);
            simplePriceResponse.localCurrencyPrice =
                simplePriceLocalResponse.uniris!.pln;
            break;
          case 'RUB':
            final SimplePriceRubResponse simplePriceLocalResponse =
                simplePriceRubResponseFromJson(reply);
            simplePriceResponse.localCurrencyPrice =
                simplePriceLocalResponse.uniris!.rub;
            break;
          case 'SAR':
            final SimplePriceSarResponse simplePriceLocalResponse =
                simplePriceSarResponseFromJson(reply);
            simplePriceResponse.localCurrencyPrice =
                simplePriceLocalResponse.uniris!.sar;
            break;
          case 'SEK':
            final SimplePriceSekResponse simplePriceLocalResponse =
                simplePriceSekResponseFromJson(reply);
            simplePriceResponse.localCurrencyPrice =
                simplePriceLocalResponse.uniris!.sek;
            break;
          case 'SGD':
            final SimplePriceSgdResponse simplePriceLocalResponse =
                simplePriceSgdResponseFromJson(reply);
            simplePriceResponse.localCurrencyPrice =
                simplePriceLocalResponse.uniris!.sgd;
            break;
          case 'THB':
            final SimplePriceThbResponse simplePriceLocalResponse =
                simplePriceThbResponseFromJson(reply);
            simplePriceResponse.localCurrencyPrice =
                simplePriceLocalResponse.uniris!.thb;
            break;
          case 'TRY':
            final SimplePriceTryResponse simplePriceLocalResponse =
                simplePriceTryResponseFromJson(reply);
            simplePriceResponse.localCurrencyPrice =
                simplePriceLocalResponse.uniris!.tryl;
            break;
          case 'TWD':
            final SimplePriceTwdResponse simplePriceLocalResponse =
                simplePriceTwdResponseFromJson(reply);
            simplePriceResponse.localCurrencyPrice =
                simplePriceLocalResponse.uniris!.twd;
            break;
          case 'AED':
            final SimplePriceAedResponse simplePriceLocalResponse =
                simplePriceAedResponseFromJson(reply);
            simplePriceResponse.localCurrencyPrice =
                simplePriceLocalResponse.uniris!.aed;
            break;
          case 'ZAR':
            final SimplePriceZarResponse simplePriceLocalResponse =
                simplePriceZarResponseFromJson(reply);
            simplePriceResponse.localCurrencyPrice =
                simplePriceLocalResponse.uniris!.zar;
            break;
          case 'USD':
          default:
            final SimplePriceUsdResponse simplePriceLocalResponse =
                simplePriceUsdResponseFromJson(reply);
            simplePriceResponse.localCurrencyPrice =
                simplePriceLocalResponse.uniris!.usd;
            break;
        }
      }
    } finally {
      httpClient.close();
    }
    return simplePriceResponse;
  }

  /*
   * Get Uniris Coin infos (name, price, market, ... including exchange tickers)
  */
  Future<CoinsCurrentDataResponse> getCoinsCurrentData() async {
    CoinsCurrentDataResponse? coinsCurrentDataResponse;
    final HttpClient httpClient = HttpClient();
    try {
      final HttpClientRequest request = await httpClient
          .getUrl(Uri.parse('https://api.coingecko.com/api/v3/coins/uniris'));
      request.headers.set('content-type', 'application/json');
      final HttpClientResponse response = await request.close();
      if (response.statusCode == 200) {
        final String reply = await response.transform(utf8.decoder).join();
        coinsCurrentDataResponse = coinsCurrentDataResponseFromJson(reply);
      }
    } catch (e) {
      print(e);
    } finally {
      httpClient.close();
    }
    return coinsCurrentDataResponse!;
  }
}
