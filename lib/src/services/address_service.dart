/// SPDX-License-Identifier: AGPL-3.0-or-later

// Project imports:
import 'package:archethic_lib_dart/archethic_lib_dart.dart';

import 'package:archethic_lib_dart/src/utils/crypto.dart' as crypto
    show deriveAddress;

class AddressService {
  AddressService(this.endpoint);

  /// [endpoint] is the HTTP URL to a Archethic node (acting as welcome node)
  String? endpoint;

  /// Get the last address from seed
  /// @param {String} seed TransactionChain seed
  Future<String> lastAddressFromSeed(String seed) async {
    final String genesisAddress = crypto.deriveAddress(seed, 0);
    final String lastAddress = await lastAddressFromAddress(genesisAddress);
    return lastAddress;
  }

  /// Get the last address from address
  /// @param {String} address TransactionChain address
  Future<String> lastAddressFromAddress(String address) async {
    final Transaction transaction = await ApiService(endpoint!)
        .getLastTransaction(address, request: ' address ');
    return transaction.address == null ? '' : transaction.address!;
  }
}
