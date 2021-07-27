// Package imports:
import 'package:http/http.dart' as http show Response, get;
import 'package:logger/logger.dart';

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
  Logger logger = Logger();

  /// Get Uniris Coin info
  Future<CoinsResponse> getCoinsResponse() async {
    CoinsResponse? coinsResponse;
    final Map<String, String> requestHeaders = {
      'Content-type': 'application/json'
    };

    try {
      final http.Response responseHttp = await http.get(
          Uri.parse('https://api.coingecko.com/api/v3/coins/uniris'),
          headers: requestHeaders);
      if (responseHttp.statusCode == 200) {
        coinsResponse = coinsResponseFromJson(responseHttp.body);
      }
    } catch (e) {
      logger.e(e.toString());
    }
    return coinsResponse!;
  }

  /// Get Uniris Coin infos (Prices, Marketcaps, Total Volumes)
  /// @param {String} currency
  /// @param {int} nbDays
  Future<CoinsPriceResponse> getCoinsChart(String currency, int nbDays) async {
    CoinsPriceResponse? coinsPriceResponse;
    final Map<String, String> requestHeaders = {
      'Content-type': 'application/json'
    };

    try {
      final http.Response responseHttp = await http.get(
          Uri.parse(
              'https://api.coingecko.com/api/v3/coins/uniris/market_chart?vs_currency=' +
                  currency +
                  '&days=' +
                  nbDays.toString()),
          headers: requestHeaders);
      if (responseHttp.statusCode == 200) {
        coinsPriceResponse = coinsPriceResponseFromJson(responseHttp.body);
      }
    } catch (e) {
      logger.e(e.toString());
    }
    return coinsPriceResponse!;
  }

  /// Get Uniris Coin infos (BTC Price, Local Currency Price)
  /// @param {String} currency
  Future<SimplePriceResponse> getSimplePrice(String currency) async {
    final SimplePriceResponse simplePriceResponse = SimplePriceResponse();
    simplePriceResponse.currency = currency;
    final Map<String, String> requestHeaders = {
      'Content-type': 'application/json'
    };

    try {
      http.Response responseHttp = await http.get(
          Uri.parse(
              'https://api.coingecko.com/api/v3/simple/price?ids=uniris&vs_currencies=BTC'),
          headers: requestHeaders);
      if (responseHttp.statusCode == 200) {
        final SimplePriceBtcResponse simplePriceBtcResponse =
            simplePriceBtcResponseFromJson(responseHttp.body);
        simplePriceResponse.btcPrice = simplePriceBtcResponse.uniris!.btc;
      }

      responseHttp = await http.get(
          Uri.parse(
              'https://api.coingecko.com/api/v3/simple/price?ids=uniris&vs_currencies=' +
                  currency),
          headers: requestHeaders);
      if (responseHttp.statusCode == 200) {
        switch (currency.toUpperCase()) {
          case 'ARS':
            final SimplePriceArsResponse simplePriceLocalResponse =
                simplePriceArsResponseFromJson(responseHttp.body);
            simplePriceResponse.localCurrencyPrice =
                simplePriceLocalResponse.uniris!.ars;
            break;
          case 'AUD':
            final SimplePriceAudResponse simplePriceLocalResponse =
                simplePriceAudResponseFromJson(responseHttp.body);
            simplePriceResponse.localCurrencyPrice =
                simplePriceLocalResponse.uniris!.aud;
            break;
          case 'BRL':
            final SimplePriceBrlResponse simplePriceLocalResponse =
                simplePriceBrlResponseFromJson(responseHttp.body);
            simplePriceResponse.localCurrencyPrice =
                simplePriceLocalResponse.uniris!.brl;
            break;
          case 'CAD':
            final SimplePriceCadResponse simplePriceLocalResponse =
                simplePriceCadResponseFromJson(responseHttp.body);
            simplePriceResponse.localCurrencyPrice =
                simplePriceLocalResponse.uniris!.cad;
            break;
          case 'CHF':
            final SimplePriceChfResponse simplePriceLocalResponse =
                simplePriceChfResponseFromJson(responseHttp.body);
            simplePriceResponse.localCurrencyPrice =
                simplePriceLocalResponse.uniris!.chf;
            break;
          case 'CLP':
            final SimplePriceClpResponse simplePriceLocalResponse =
                simplePriceClpResponseFromJson(responseHttp.body);
            simplePriceResponse.localCurrencyPrice =
                simplePriceLocalResponse.uniris!.clp;
            break;
          case 'CNY':
            final SimplePriceCnyResponse simplePriceLocalResponse =
                simplePriceCnyResponseFromJson(responseHttp.body);
            simplePriceResponse.localCurrencyPrice =
                simplePriceLocalResponse.uniris!.cny;
            break;
          case 'CZK':
            final SimplePriceCzkResponse simplePriceLocalResponse =
                simplePriceCzkResponseFromJson(responseHttp.body);
            simplePriceResponse.localCurrencyPrice =
                simplePriceLocalResponse.uniris!.czk;
            break;
          case 'DKK':
            final SimplePriceDkkResponse simplePriceLocalResponse =
                simplePriceDkkResponseFromJson(responseHttp.body);
            simplePriceResponse.localCurrencyPrice =
                simplePriceLocalResponse.uniris!.dkk;
            break;
          case 'EUR':
            final SimplePriceEurResponse simplePriceLocalResponse =
                simplePriceEurResponseFromJson(responseHttp.body);
            simplePriceResponse.localCurrencyPrice =
                simplePriceLocalResponse.uniris!.eur;
            break;
          case 'GBP':
            final SimplePriceGbpResponse simplePriceLocalResponse =
                simplePriceGbpResponseFromJson(responseHttp.body);
            simplePriceResponse.localCurrencyPrice =
                simplePriceLocalResponse.uniris!.gbp;
            break;
          case 'HKD':
            final SimplePriceHkdResponse simplePriceLocalResponse =
                simplePriceHkdResponseFromJson(responseHttp.body);
            simplePriceResponse.localCurrencyPrice =
                simplePriceLocalResponse.uniris!.hkd;
            break;
          case 'HUF':
            final SimplePriceHufResponse simplePriceLocalResponse =
                simplePriceHufResponseFromJson(responseHttp.body);
            simplePriceResponse.localCurrencyPrice =
                simplePriceLocalResponse.uniris!.huf;
            break;
          case 'IDR':
            final SimplePriceIdrResponse simplePriceLocalResponse =
                simplePriceIdrResponseFromJson(responseHttp.body);
            simplePriceResponse.localCurrencyPrice =
                simplePriceLocalResponse.uniris!.idr;
            break;
          case 'ILS':
            final SimplePriceIlsResponse simplePriceLocalResponse =
                simplePriceIlsResponseFromJson(responseHttp.body);
            simplePriceResponse.localCurrencyPrice =
                simplePriceLocalResponse.uniris!.ils;
            break;
          case 'INR':
            final SimplePriceInrResponse simplePriceLocalResponse =
                simplePriceInrResponseFromJson(responseHttp.body);
            simplePriceResponse.localCurrencyPrice =
                simplePriceLocalResponse.uniris!.inr;
            break;
          case 'JPY':
            final SimplePriceJpyResponse simplePriceLocalResponse =
                simplePriceJpyResponseFromJson(responseHttp.body);
            simplePriceResponse.localCurrencyPrice =
                simplePriceLocalResponse.uniris!.jpy;
            break;
          case 'KRW':
            final SimplePriceKrwResponse simplePriceLocalResponse =
                simplePriceKrwResponseFromJson(responseHttp.body);
            simplePriceResponse.localCurrencyPrice =
                simplePriceLocalResponse.uniris!.krw;
            break;
          case 'KWD':
            final SimplePriceKwdResponse simplePriceLocalResponse =
                simplePriceKwdResponseFromJson(responseHttp.body);
            simplePriceResponse.localCurrencyPrice =
                simplePriceLocalResponse.uniris!.kwd;
            break;
          case 'MXN':
            final SimplePriceMxnResponse simplePriceLocalResponse =
                simplePriceMxnResponseFromJson(responseHttp.body);
            simplePriceResponse.localCurrencyPrice =
                simplePriceLocalResponse.uniris!.mxn;
            break;
          case 'MYR':
            final SimplePriceMyrResponse simplePriceLocalResponse =
                simplePriceMyrResponseFromJson(responseHttp.body);
            simplePriceResponse.localCurrencyPrice =
                simplePriceLocalResponse.uniris!.myr;
            break;
          case 'NOK':
            final SimplePriceNokResponse simplePriceLocalResponse =
                simplePriceNokResponseFromJson(responseHttp.body);
            simplePriceResponse.localCurrencyPrice =
                simplePriceLocalResponse.uniris!.nok;
            break;
          case 'NZD':
            final SimplePriceNzdResponse simplePriceLocalResponse =
                simplePriceNzdResponseFromJson(responseHttp.body);
            simplePriceResponse.localCurrencyPrice =
                simplePriceLocalResponse.uniris!.nzd;
            break;
          case 'PHP':
            final SimplePricePhpResponse simplePriceLocalResponse =
                simplePricePhpResponseFromJson(responseHttp.body);
            simplePriceResponse.localCurrencyPrice =
                simplePriceLocalResponse.uniris!.php;
            break;
          case 'PKR':
            final SimplePricePkrResponse simplePriceLocalResponse =
                simplePricePkrResponseFromJson(responseHttp.body);
            simplePriceResponse.localCurrencyPrice =
                simplePriceLocalResponse.uniris!.pkr;
            break;
          case 'PLN':
            final SimplePricePlnResponse simplePriceLocalResponse =
                simplePricePlnResponseFromJson(responseHttp.body);
            simplePriceResponse.localCurrencyPrice =
                simplePriceLocalResponse.uniris!.pln;
            break;
          case 'RUB':
            final SimplePriceRubResponse simplePriceLocalResponse =
                simplePriceRubResponseFromJson(responseHttp.body);
            simplePriceResponse.localCurrencyPrice =
                simplePriceLocalResponse.uniris!.rub;
            break;
          case 'SAR':
            final SimplePriceSarResponse simplePriceLocalResponse =
                simplePriceSarResponseFromJson(responseHttp.body);
            simplePriceResponse.localCurrencyPrice =
                simplePriceLocalResponse.uniris!.sar;
            break;
          case 'SEK':
            final SimplePriceSekResponse simplePriceLocalResponse =
                simplePriceSekResponseFromJson(responseHttp.body);
            simplePriceResponse.localCurrencyPrice =
                simplePriceLocalResponse.uniris!.sek;
            break;
          case 'SGD':
            final SimplePriceSgdResponse simplePriceLocalResponse =
                simplePriceSgdResponseFromJson(responseHttp.body);
            simplePriceResponse.localCurrencyPrice =
                simplePriceLocalResponse.uniris!.sgd;
            break;
          case 'THB':
            final SimplePriceThbResponse simplePriceLocalResponse =
                simplePriceThbResponseFromJson(responseHttp.body);
            simplePriceResponse.localCurrencyPrice =
                simplePriceLocalResponse.uniris!.thb;
            break;
          case 'TRY':
            final SimplePriceTryResponse simplePriceLocalResponse =
                simplePriceTryResponseFromJson(responseHttp.body);
            simplePriceResponse.localCurrencyPrice =
                simplePriceLocalResponse.uniris!.tryl;
            break;
          case 'TWD':
            final SimplePriceTwdResponse simplePriceLocalResponse =
                simplePriceTwdResponseFromJson(responseHttp.body);
            simplePriceResponse.localCurrencyPrice =
                simplePriceLocalResponse.uniris!.twd;
            break;
          case 'AED':
            final SimplePriceAedResponse simplePriceLocalResponse =
                simplePriceAedResponseFromJson(responseHttp.body);
            simplePriceResponse.localCurrencyPrice =
                simplePriceLocalResponse.uniris!.aed;
            break;
          case 'ZAR':
            final SimplePriceZarResponse simplePriceLocalResponse =
                simplePriceZarResponseFromJson(responseHttp.body);
            simplePriceResponse.localCurrencyPrice =
                simplePriceLocalResponse.uniris!.zar;
            break;
          case 'USD':
          default:
            final SimplePriceUsdResponse simplePriceLocalResponse =
                simplePriceUsdResponseFromJson(responseHttp.body);
            simplePriceResponse.localCurrencyPrice =
                simplePriceLocalResponse.uniris!.usd;
            break;
        }
      }
    } catch (e) {
      logger.e(e.toString());
    }

    return simplePriceResponse;
  }

  /// Get Uniris Coin infos (name, price, market, ... including exchange tickers)
  Future<CoinsCurrentDataResponse> getCoinsCurrentData() async {
    CoinsCurrentDataResponse? coinsCurrentDataResponse;
    final Map<String, String> requestHeaders = {
      'Content-type': 'application/json'
    };

    try {
      final http.Response responseHttp = await http.get(
          Uri.parse('https://api.coingecko.com/api/v3/coins/uniris'),
          headers: requestHeaders);
      if (responseHttp.statusCode == 200) {
        coinsCurrentDataResponse =
            coinsCurrentDataResponseFromJson(responseHttp.body);
      }
    } catch (e) {
      logger.e(e.toString());
    }

    return coinsCurrentDataResponse!;
  }
}
