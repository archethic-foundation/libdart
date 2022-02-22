/// SPDX-License-Identifier: AGPL-3.0-or-later

// Project imports:
import 'package:archethic_lib_dart/src/model/oracle_chain/oracle_uco_price.dart';
import 'package:archethic_lib_dart/src/model/transaction.dart';
import 'package:archethic_lib_dart/src/model/uco.dart';
import 'package:archethic_lib_dart/src/services/api_service.dart';

class OracleService {
  OracleService(this.endpoint);

  /// [endpoint] is the HTTP URL to a ArchEthic node (acting as welcome node)
  String? endpoint;

  /// return the last value of Oracle Uco_Price in {OracleUcoPrice}
  /// @param {String} seed TransactionChain seed
  Future<OracleUcoPrice> getLastOracleUcoPrice() async {
    List<Transaction> txList =
        await ApiService(endpoint).networkTransactions('oracle', 1);
    if (txList.isNotEmpty) {
      Transaction transaction =
          await ApiService(endpoint).getLastTransaction(txList[0].address!);
      return oracleUcoPriceFromJson(transaction.data!.content!);
    } else {
      return OracleUcoPrice(uco: Uco(eur: 0, usd: 0));
    }
  }
}
