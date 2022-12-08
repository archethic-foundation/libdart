/// SPDX-License-Identifier: AGPL-3.0-or-later

/// [TokenBalance] represents a token ledger balance.

class TokenBalance {
  TokenBalance({
    this.address,
    this.amount,
    this.tokenId,
  });

  factory TokenBalance.fromJson(Map<String, dynamic> json) => TokenBalance(
        address: json['address'],
        amount: json['amount']?.toInt(),
        tokenId: json['tokenId']?.toInt(),
      );

  /// token: address of the token
  String? address;

  /// Amount: amount of token
  int? amount;

  /// Token ID: ID of the token
  int? tokenId;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'address': address,
        'amount': amount,
        'tokenId': tokenId
      };
}
