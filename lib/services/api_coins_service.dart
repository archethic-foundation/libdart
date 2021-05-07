import 'dart:convert';
import 'dart:io';

import 'package:uniris_lib_dart/model/response/coins_price_response.dart';
import 'package:uniris_lib_dart/model/response/coins_response.dart';
import 'package:uniris_lib_dart/model/response/simple_price_response.dart';
import 'package:uniris_lib_dart/model/response/simple_price_response_aed.dart';
import 'package:uniris_lib_dart/model/response/simple_price_response_ars.dart';
import 'package:uniris_lib_dart/model/response/simple_price_response_aud.dart';
import 'package:uniris_lib_dart/model/response/simple_price_response_brl.dart';
import 'package:uniris_lib_dart/model/response/simple_price_response_btc.dart';
import 'package:uniris_lib_dart/model/response/simple_price_response_cad.dart';
import 'package:uniris_lib_dart/model/response/simple_price_response_chf.dart';
import 'package:uniris_lib_dart/model/response/simple_price_response_clp.dart';
import 'package:uniris_lib_dart/model/response/simple_price_response_cny.dart';
import 'package:uniris_lib_dart/model/response/simple_price_response_czk.dart';
import 'package:uniris_lib_dart/model/response/simple_price_response_dkk.dart';
import 'package:uniris_lib_dart/model/response/simple_price_response_eur.dart';
import 'package:uniris_lib_dart/model/response/simple_price_response_gbp.dart';
import 'package:uniris_lib_dart/model/response/simple_price_response_hkd.dart';
import 'package:uniris_lib_dart/model/response/simple_price_response_huf.dart';
import 'package:uniris_lib_dart/model/response/simple_price_response_idr.dart';
import 'package:uniris_lib_dart/model/response/simple_price_response_ils.dart';
import 'package:uniris_lib_dart/model/response/simple_price_response_inr.dart';
import 'package:uniris_lib_dart/model/response/simple_price_response_jpy.dart';
import 'package:uniris_lib_dart/model/response/simple_price_response_krw.dart';
import 'package:uniris_lib_dart/model/response/simple_price_response_kwd.dart';
import 'package:uniris_lib_dart/model/response/simple_price_response_mxn.dart';
import 'package:uniris_lib_dart/model/response/simple_price_response_myr.dart';
import 'package:uniris_lib_dart/model/response/simple_price_response_nok.dart';
import 'package:uniris_lib_dart/model/response/simple_price_response_nzd.dart';
import 'package:uniris_lib_dart/model/response/simple_price_response_php.dart';
import 'package:uniris_lib_dart/model/response/simple_price_response_pkr.dart';
import 'package:uniris_lib_dart/model/response/simple_price_response_pln.dart';
import 'package:uniris_lib_dart/model/response/simple_price_response_rub.dart';
import 'package:uniris_lib_dart/model/response/simple_price_response_sar.dart';
import 'package:uniris_lib_dart/model/response/simple_price_response_sek.dart';
import 'package:uniris_lib_dart/model/response/simple_price_response_sgd.dart';
import 'package:uniris_lib_dart/model/response/simple_price_response_thb.dart';
import 'package:uniris_lib_dart/model/response/simple_price_response_try.dart';
import 'package:uniris_lib_dart/model/response/simple_price_response_twd.dart';
import 'package:uniris_lib_dart/model/response/simple_price_response_usd.dart';
import 'package:uniris_lib_dart/model/response/simple_price_response_zar.dart';

class ApiCoinsService {

  /*
   * Get Uniris Coin info
  */
  Future<CoinsResponse> getCoinsResponse() async {
    CoinsResponse? coinsResponse;
    HttpClient httpClient = new HttpClient();
    try {
      HttpClientRequest request = await httpClient
          .getUrl(Uri.parse("https://api.coingecko.com/api/v3/coins/uniris"));
      request.headers.set('content-type', 'application/json');
      HttpClientResponse response = await request.close();
      if (response.statusCode == 200) {
        String reply = await response.transform(utf8.decoder).join();
        coinsResponse = coinsResponseFromJson(reply);
      }
    } catch (e, s) {} finally {
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
    HttpClient httpClient = new HttpClient();
    try {
      HttpClientRequest request = await httpClient.getUrl(Uri.parse(
          "https://api.coingecko.com/api/v3/coins/uniris/market_chart?vs_currency=" +
              currency +
              "&days=" +
              nbDays.toString()));
      request.headers.set('content-type', 'application/json');
      HttpClientResponse response = await request.close();
      if (response.statusCode == 200) {
        String reply = await response.transform(utf8.decoder).join();
        coinsPriceResponse = coinsPriceResponseFromJson(reply);
      }
    } catch (e, s) {} finally {
      httpClient.close();
    }
    return coinsPriceResponse!;
  }

  /*
   * Get Uniris Coin infos (BTC Price, Local Currency Price)
   * @param {String} currency
  */
  Future<SimplePriceResponse> getSimplePrice(String currency) async {
    //print("getSimplePrice");
    SimplePriceResponse simplePriceResponse = new SimplePriceResponse();
    simplePriceResponse.currency = currency;

    HttpClient httpClient = new HttpClient();
    try {
      HttpClientRequest request = await httpClient.getUrl(Uri.parse(
          "https://api.coingecko.com/api/v3/simple/price?ids=uniris&vs_currencies=BTC"));
      request.headers.set('content-type', 'application/json');
      HttpClientResponse response = await request.close();
      if (response.statusCode == 200) {
        String reply = await response.transform(utf8.decoder).join();
        SimplePriceBtcResponse simplePriceBtcResponse =
            simplePriceBtcResponseFromJson(reply);
        simplePriceResponse.btcPrice = simplePriceBtcResponse.uniris!.btc;
      }

      request = await httpClient.getUrl(Uri.parse(
          "https://api.coingecko.com/api/v3/simple/price?ids=uniris&vs_currencies=" +
              currency));
      request.headers.set('content-type', 'application/json');
      response = await request.close();
      if (response.statusCode == 200) {
        String reply = await response.transform(utf8.decoder).join();
        switch (currency.toUpperCase()) {
          case "ARS":
            SimplePriceArsResponse simplePriceLocalResponse =
                simplePriceArsResponseFromJson(reply);
            simplePriceResponse.localCurrencyPrice =
                simplePriceLocalResponse.uniris!.ars;
            break;
          case "AUD":
            SimplePriceAudResponse simplePriceLocalResponse =
                simplePriceAudResponseFromJson(reply);
            simplePriceResponse.localCurrencyPrice =
                simplePriceLocalResponse.uniris!.aud;
            break;
          case "BRL":
            SimplePriceBrlResponse simplePriceLocalResponse =
                simplePriceBrlResponseFromJson(reply);
            simplePriceResponse.localCurrencyPrice =
                simplePriceLocalResponse.uniris!.brl;
            break;
          case "CAD":
            SimplePriceCadResponse simplePriceLocalResponse =
                simplePriceCadResponseFromJson(reply);
            simplePriceResponse.localCurrencyPrice =
                simplePriceLocalResponse.uniris!.cad;
            break;
          case "CHF":
            SimplePriceChfResponse simplePriceLocalResponse =
                simplePriceChfResponseFromJson(reply);
            simplePriceResponse.localCurrencyPrice =
                simplePriceLocalResponse.uniris!.chf;
            break;
          case "CLP":
            SimplePriceClpResponse simplePriceLocalResponse =
                simplePriceClpResponseFromJson(reply);
            simplePriceResponse.localCurrencyPrice =
                simplePriceLocalResponse.uniris!.clp;
            break;
          case "CNY":
            SimplePriceCnyResponse simplePriceLocalResponse =
                simplePriceCnyResponseFromJson(reply);
            simplePriceResponse.localCurrencyPrice =
                simplePriceLocalResponse.uniris!.cny;
            break;
          case "CZK":
            SimplePriceCzkResponse simplePriceLocalResponse =
                simplePriceCzkResponseFromJson(reply);
            simplePriceResponse.localCurrencyPrice =
                simplePriceLocalResponse.uniris!.czk;
            break;
          case "DKK":
            SimplePriceDkkResponse simplePriceLocalResponse =
                simplePriceDkkResponseFromJson(reply);
            simplePriceResponse.localCurrencyPrice =
                simplePriceLocalResponse.uniris!.dkk;
            break;
          case "EUR":
            SimplePriceEurResponse simplePriceLocalResponse =
                simplePriceEurResponseFromJson(reply);
            simplePriceResponse.localCurrencyPrice =
                simplePriceLocalResponse.uniris!.eur;
            break;
          case "GBP":
            SimplePriceGbpResponse simplePriceLocalResponse =
                simplePriceGbpResponseFromJson(reply);
            simplePriceResponse.localCurrencyPrice =
                simplePriceLocalResponse.uniris!.gbp;
            break;
          case "HKD":
            SimplePriceHkdResponse simplePriceLocalResponse =
                simplePriceHkdResponseFromJson(reply);
            simplePriceResponse.localCurrencyPrice =
                simplePriceLocalResponse.uniris!.hkd;
            break;
          case "HUF":
            SimplePriceHufResponse simplePriceLocalResponse =
                simplePriceHufResponseFromJson(reply);
            simplePriceResponse.localCurrencyPrice =
                simplePriceLocalResponse.uniris!.huf;
            break;
          case "IDR":
            SimplePriceIdrResponse simplePriceLocalResponse =
                simplePriceIdrResponseFromJson(reply);
            simplePriceResponse.localCurrencyPrice =
                simplePriceLocalResponse.uniris!.idr;
            break;
          case "ILS":
            SimplePriceIlsResponse simplePriceLocalResponse =
                simplePriceIlsResponseFromJson(reply);
            simplePriceResponse.localCurrencyPrice =
                simplePriceLocalResponse.uniris!.ils;
            break;
          case "INR":
            SimplePriceInrResponse simplePriceLocalResponse =
                simplePriceInrResponseFromJson(reply);
            simplePriceResponse.localCurrencyPrice =
                simplePriceLocalResponse.uniris!.inr;
            break;
          case "JPY":
            SimplePriceJpyResponse simplePriceLocalResponse =
                simplePriceJpyResponseFromJson(reply);
            simplePriceResponse.localCurrencyPrice =
                simplePriceLocalResponse.uniris!.jpy;
            break;
          case "KRW":
            SimplePriceKrwResponse simplePriceLocalResponse =
                simplePriceKrwResponseFromJson(reply);
            simplePriceResponse.localCurrencyPrice =
                simplePriceLocalResponse.uniris!.krw;
            break;
          case "KWD":
            SimplePriceKwdResponse simplePriceLocalResponse =
                simplePriceKwdResponseFromJson(reply);
            simplePriceResponse.localCurrencyPrice =
                simplePriceLocalResponse.uniris!.kwd;
            break;
          case "MXN":
            SimplePriceMxnResponse simplePriceLocalResponse =
                simplePriceMxnResponseFromJson(reply);
            simplePriceResponse.localCurrencyPrice =
                simplePriceLocalResponse.uniris!.mxn;
            break;
          case "MYR":
            SimplePriceMyrResponse simplePriceLocalResponse =
                simplePriceMyrResponseFromJson(reply);
            simplePriceResponse.localCurrencyPrice =
                simplePriceLocalResponse.uniris!.myr;
            break;
          case "NOK":
            SimplePriceNokResponse simplePriceLocalResponse =
                simplePriceNokResponseFromJson(reply);
            simplePriceResponse.localCurrencyPrice =
                simplePriceLocalResponse.uniris!.nok;
            break;
          case "NZD":
            SimplePriceNzdResponse simplePriceLocalResponse =
                simplePriceNzdResponseFromJson(reply);
            simplePriceResponse.localCurrencyPrice =
                simplePriceLocalResponse.uniris!.nzd;
            break;
          case "PHP":
            SimplePricePhpResponse simplePriceLocalResponse =
                simplePricePhpResponseFromJson(reply);
            simplePriceResponse.localCurrencyPrice =
                simplePriceLocalResponse.uniris!.php;
            break;
          case "PKR":
            SimplePricePkrResponse simplePriceLocalResponse =
                simplePricePkrResponseFromJson(reply);
            simplePriceResponse.localCurrencyPrice =
                simplePriceLocalResponse.uniris!.pkr;
            break;
          case "PLN":
            SimplePricePlnResponse simplePriceLocalResponse =
                simplePricePlnResponseFromJson(reply);
            simplePriceResponse.localCurrencyPrice =
                simplePriceLocalResponse.uniris!.pln;
            break;
          case "RUB":
            SimplePriceRubResponse simplePriceLocalResponse =
                simplePriceRubResponseFromJson(reply);
            simplePriceResponse.localCurrencyPrice =
                simplePriceLocalResponse.uniris!.rub;
            break;
          case "SAR":
            SimplePriceSarResponse simplePriceLocalResponse =
                simplePriceSarResponseFromJson(reply);
            simplePriceResponse.localCurrencyPrice =
                simplePriceLocalResponse.uniris!.sar;
            break;
          case "SEK":
            SimplePriceSekResponse simplePriceLocalResponse =
                simplePriceSekResponseFromJson(reply);
            simplePriceResponse.localCurrencyPrice =
                simplePriceLocalResponse.uniris!.sek;
            break;
          case "SGD":
            SimplePriceSgdResponse simplePriceLocalResponse =
                simplePriceSgdResponseFromJson(reply);
            simplePriceResponse.localCurrencyPrice =
                simplePriceLocalResponse.uniris!.sgd;
            break;
          case "THB":
            SimplePriceThbResponse simplePriceLocalResponse =
                simplePriceThbResponseFromJson(reply);
            simplePriceResponse.localCurrencyPrice =
                simplePriceLocalResponse.uniris!.thb;
            break;
          case "TRY":
            SimplePriceTryResponse simplePriceLocalResponse =
                simplePriceTryResponseFromJson(reply);
            simplePriceResponse.localCurrencyPrice =
                simplePriceLocalResponse.uniris!.tryl;
            break;
          case "TWD":
            SimplePriceTwdResponse simplePriceLocalResponse =
                simplePriceTwdResponseFromJson(reply);
            simplePriceResponse.localCurrencyPrice =
                simplePriceLocalResponse.uniris!.twd;
            break;
          case "AED":
            SimplePriceAedResponse simplePriceLocalResponse =
                simplePriceAedResponseFromJson(reply);
            simplePriceResponse.localCurrencyPrice =
                simplePriceLocalResponse.uniris!.aed;
            break;
          case "ZAR":
            SimplePriceZarResponse simplePriceLocalResponse =
                simplePriceZarResponseFromJson(reply);
            simplePriceResponse.localCurrencyPrice =
                simplePriceLocalResponse.uniris!.zar;
            break;
          case "USD":
          default:
            SimplePriceUsdResponse simplePriceLocalResponse =
                simplePriceUsdResponseFromJson(reply);
            simplePriceResponse.localCurrencyPrice =
                simplePriceLocalResponse.uniris!.usd;
            break;
        }
      }
    } catch (e) {} finally {
      httpClient.close();
    }
    return simplePriceResponse;
  }
}
