/// SPDX-License-Identifier: AGPL-3.0-or-later

/// [TransactionInput] represents the inputs from the transaction.

class TransactionInput {
  TransactionInput(
      {this.amount,
      this.from,
      this.tokenAddress,
      this.spent,
      this.timestamp,
      this.type,
      this.tokenId});

  /// Amount: asset amount
  int? amount;

  /// From: transaction which send the amount of assets
  String? from;

  /// token address: address of the token if the type is token
  String? tokenAddress;

  /// Spent: determines if the input has been spent
  bool? spent;

  /// Timestamp: Date time when the inputs was generated
  int? timestamp;

  /// Type: UCO/Token/Call
  String? type;

  /// Token id: It is the id for a token which is allocated when the token is minted.
  int? tokenId;

  factory TransactionInput.fromJson(Map<String, dynamic> json) =>
      TransactionInput(
        amount: json['amount']?.toInt(),
        from: json['from'],
        tokenAddress: json['tokenAddress'],
        spent: json['spent'],
        timestamp: json['timestamp'],
        type: json['type'],
        tokenId: json['tokenId']?.toInt(),
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'amount': amount,
        'from': from,
        'tokenAddress': tokenAddress,
        'spent': spent,
        'timestamp': timestamp,
        'type': type,
        'tokenId': tokenId
      };
}
