/// SPDX-License-Identifier: AGPL-3.0-or-later

// Project imports:
import 'package:archethic_lib_dart/src/model/transaction.dart';

class NFTService {
  /// Prepare a transaction to create a NFT
  /// @param {int} [initialSupply] of the NFT
  /// @param {String} [name] of the NFT
  /// @param {String} [seed] TransactionChain seed
  /// @param {int} [index] Number of transaction in the chain
  /// @param {String} [curve] Elliptic curve to use ("ed25519", "P256", "secp256k1")
  /// @param {} [originPrivateKey] The origin signature to able to perform the ProofOfWork and authorize the transaction
  Transaction prepareNewNFT(int initialSupply, String name, String seed,
      int index, String curve, String originPrivateKey,
      {String? typeMime, String? documentHex}) {
    String content = 'initial supply: $initialSupply\nname: $name';
    if (typeMime != null && documentHex != null) {
      content = content + '\ntypeMime: $typeMime\ndocument: $documentHex';
    }
    return Transaction(type: 'nft', data: Transaction.initData())
        .setContent(content)
        .build(seed, index, curve)
        .originSign(originPrivateKey);
  }
}
