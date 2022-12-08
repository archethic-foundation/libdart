/// SPDX-License-Identifier: AGPL-3.0-or-later
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
    final genesisAddress = crypto.deriveAddress(seed, 0);
    final lastAddressMap = await lastAddressFromAddress([genesisAddress]);

    return lastAddressMap[genesisAddress] ?? '';
  }

  /// Get the last addresses from a list of addresses
  /// @param {String} address TransactionChain address
  Future<Map<String, String>> lastAddressFromAddress(
    List<String> addresses,
  ) async {
    if (addresses.isEmpty) {
      return {};
    }

    final transactionMap = await ApiService(endpoint!)
        .getLastTransaction(addresses, request: ' address ');

    final lastAddressMap = <String, String>{};
    transactionMap.forEach((String key, Transaction value) {
      lastAddressMap[key] = value.address!.address!;
    });

    return removeAliasPrefix<String>(lastAddressMap) ?? {};
  }
}
