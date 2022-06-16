/// SPDX-License-Identifier: AGPL-3.0-or-later

// Project imports:
import 'package:archethic_lib_dart/src/model/oracle_chain/oracle_uco_price.dart';
import 'package:archethic_lib_dart/src/model/transaction.dart';
import 'package:archethic_lib_dart/src/model/uco.dart';
import 'package:archethic_lib_dart/src/services/api_service.dart';

class OracleService {
  OracleService(this.endpoint);

  /// [endpoint] is the HTTP URL to a Archethic node (acting as welcome node)
  String? endpoint;

  /// return the last value of Oracle Uco_Price in {OracleUcoPrice}
  /// @param {String} seed TransactionChain seed
  /// @param {String} request List of informations to retrieve in the GraphQL Query
  Future<OracleUcoPrice> getLastOracleUcoPrice() async {
    final List<Transaction> txList = await ApiService(endpoint)
        .networkTransactions('oracle', 1, request: 'address');
    if (txList.isNotEmpty) {
      final Transaction transaction = await ApiService(endpoint)
          .getLastTransaction(txList[0].address!, request: 'data { content }');
      return oracleUcoPriceFromJson(transaction.data!.content!);
    } else {
      return OracleUcoPrice(uco: Uco(eur: 0, usd: 0));
    }
  }
}
