/// SPDX-License-Identifier: AGPL-3.0-or-later
import 'package:freezed_annotation/freezed_annotation.dart';

/// [OnChainWalletData] represents informations about a wallet stored on Archethic blockchain in encrypted form.

part 'on_chain_wallet_data.freezed.dart';
part 'on_chain_wallet_data.g.dart';

@freezed
class OnChainWalletData with _$OnChainWalletData {
  const factory OnChainWalletData({
    String? encodedWalletKey,
    String? encryptedWallet,
  }) = _OnChainWalletData;
  const OnChainWalletData._();

  factory OnChainWalletData.fromJson(Map<String, dynamic> json) =>
      _$OnChainWalletDataFromJson(json);
}
