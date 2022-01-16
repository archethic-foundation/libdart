// Project imports:
import 'package:archethic_lib_dart/src/model/oracle_chain/oracle_uco_price.dart';
import 'package:archethic_lib_dart/src/model/transaction.dart';
import 'package:archethic_lib_dart/src/services/address_service.dart';
import 'package:archethic_lib_dart/src/services/api_service.dart';

class OracleService {
  OracleService(this.endpoint);

  /// [endpoint] is the HTTP URL to a ArchEthic node (acting as welcome node)
  String? endpoint;

  /// return the last value of Oracle Uco_Price in {OracleUcoPrice}
  /// @param {String} seed TransactionChain seed
  Future<OracleUcoPrice> getLastOracleUcoPrice(String address) async {
    String lastAddress =
        await AddressService(endpoint).lastAddressFromAddress(address);
    Transaction transaction =
        await ApiService(endpoint).getLastTransaction(lastAddress);
    return oracleUcoPriceFromJson(transaction.data!.contentDisplay!);
  }
}
