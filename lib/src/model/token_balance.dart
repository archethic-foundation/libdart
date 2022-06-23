/// SPDX-License-Identifier: AGPL-3.0-or-later

/// [TokenBalance] represents a token ledger balance.

class TokenBalance {
  TokenBalance({
    this.address,
    this.amount,
  });

  /// token: address of the token
  String? address;

  /// Amount: amount of token
  double? amount;

  factory TokenBalance.fromJson(Map<String, dynamic> json) => TokenBalance(
        address: json['address'],
        amount: json['amount']?.toDouble(),
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'address': address,
        'amount': amount,
      };
}
