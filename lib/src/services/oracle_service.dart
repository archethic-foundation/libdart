/// SPDX-License-Identifier: AGPL-3.0-or-later
import 'dart:async';

// Project imports:
import 'package:archethic_lib_dart/src/model/oracle_chain/oracle_uco_price.dart';
import 'package:archethic_lib_dart/src/model/response/oracle_data_response.dart';
import 'package:archethic_lib_dart/src/model/uco.dart';
import 'package:archethic_lib_dart/src/utils/logs.dart';
// Package imports:
import 'package:http/http.dart' as http show post;

class OracleService {
  OracleService(this.endpoint);

  /// [endpoint] is the HTTP URL to a Archethic node (acting as welcome node)
  String? endpoint;

  /// return a value of Oracle Uco_Price in {OracleUcoPrice} from a timestamp
  /// if timestamp = 0 or not precised, the last price is returned
  /// @param {int} timestamp
  Future<OracleUcoPrice> getOracleData({int timestamp = 0}) async {
    final completer = Completer<OracleUcoPrice>();
    var oracleUcoPrice = OracleUcoPrice(uco: Uco(eur: 0, usd: 0));
    final requestHeaders = <String, String>{
      'Content-type': 'application/json',
      'Accept': 'application/json',
    };
    var body = '';

    try {
      if (timestamp == 0) {
        body =
            '{"query": "query { oracleData { timestamp services { uco { eur, usd } } } }"}';
      } else {
        body =
            '{"query": "query { oracleData(timestamp: $timestamp) { timestamp services { uco { eur, usd } } } }"}';
      }

      log('getOracleData: requestHttp.body=$body');
      final responseHttp = await http.post(
        Uri.parse('${endpoint!}/api'),
        body: body,
        headers: requestHeaders,
      );
      log('getOracleData: responseHttp.body=${responseHttp.body}');
      if (responseHttp.statusCode == 200) {
        final oracleDataResponse =
            oracleDataResponseFromJson(responseHttp.body);
        if (oracleDataResponse.data != null &&
            oracleDataResponse.data!.oracleData != null &&
            oracleDataResponse.data!.oracleData!.services != null &&
            oracleDataResponse.data!.oracleData!.services!.uco != null) {
          oracleUcoPrice = OracleUcoPrice(
            uco: Uco(
              eur: oracleDataResponse.data!.oracleData!.services!.uco!.eur,
              usd: oracleDataResponse.data!.oracleData!.services!.uco!.usd,
            ),
          );
        }
      }
    } catch (e) {
      log('getOracleData: error=$e');
    }

    completer.complete(oracleUcoPrice);
    return completer.future;
  }
}
