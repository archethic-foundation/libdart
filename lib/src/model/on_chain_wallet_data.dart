/// SPDX-License-Identifier: AGPL-3.0-or-later

/// [OnChainWalletData] represents informations about a wallet stored on Archethic blockchain in encrypted form.
class OnChainWalletData {
  OnChainWalletData({
    this.encodedWalletKey,
    this.encryptedWallet,
  });

  String? encodedWalletKey;
  String? encryptedWallet;
}
