/// [OnChainWalletData] represents informations about a wallet stored on ArchEthic blockchain in encrypted form.
class OnChainWalletData {
  OnChainWalletData({
    this.encodedWalletKey,
    this.encryptedWallet,
  });

  String? encodedWalletKey;
  String? encryptedWallet;
}
