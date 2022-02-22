/// SPDX-License-Identifier: AGPL-3.0-or-later

/// [NftBalance] represents a NFT ledger balance.

class NftBalance {
  NftBalance({
    this.address,
    this.amount,
  });

  /// NFT: address of the NFT
  String? address;

  /// Amount: amount of NFT
  double? amount;

  factory NftBalance.fromJson(Map<String, dynamic> json) => NftBalance(
        address: json['address'],
        amount: json['amount']?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        'address': address,
        'amount': amount,
      };
}
