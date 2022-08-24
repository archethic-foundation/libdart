/// SPDX-License-Identifier: AGPL-3.0-or-later

/// [UnspentOutput] represents the remaining unspent output of the transaction.

class UnspentOutputs {
  UnspentOutputs(
      {this.amount, this.tokenAddress, this.type, this.from, this.tokenId});

  /// Amount: asset amount
  int? amount;

  /// Token address: address of the token if the type is token
  String? tokenAddress;

  /// Type: UCO/Token
  String? type;

  /// From: transaction which send the amount of assets
  String? from;

  /// Token id: It is the id for a token which is allocated when the token is minted.
  int? tokenId;

  factory UnspentOutputs.fromJson(Map<String, dynamic> json) => UnspentOutputs(
        amount: json['amount']?.toInt(),
        tokenAddress: json['tokenAddress'],
        type: json['type'],
        from: json['from'],
        tokenId: json['tokenId']?.toInt(),
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'amount': amount,
        'tokenAddress': tokenAddress,
        'type': type,
        'from': from,
        'tokenId': tokenId
      };
}
