/// SPDX-License-Identifier: AGPL-3.0-or-later

// Project imports:
import 'package:archethic_lib_dart/src/model/nft_balance.dart';

/// [Balance] represents a ledger balance.
class Balance {
  Balance({
    this.nft,
    this.uco,
  });

  /// NFT: NFT balances
  List<NftBalance>? nft;

  /// UCO: uco balance
  double? uco;

  factory Balance.fromJson(Map<String, dynamic> json) => Balance(
        nft: json['nft'] == null
            ? null
            : List<NftBalance>.from(
                json['nft'].map((x) => NftBalance.fromJson(x))),
        uco: json['uco']?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        'nft': List<dynamic>.from(nft!.map((x) => x.toJson())),
        'uco': uco,
      };
}
