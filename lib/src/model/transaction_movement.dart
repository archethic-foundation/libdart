/// SPDX-License-Identifier: AGPL-3.0-or-later

/// [TransactionMovement] represents ledger transaction movement.
class TransactionMovement {
  TransactionMovement(
      {this.amount, this.tokenAddress, this.to, this.type, this.tokenId});

  /// Amount: asset amount
  int? amount;

  /// Token address: address of the token if the type is token
  String? tokenAddress;

  /// To: asset transfer recipient
  String? to;

  /// Type: UCO/Token
  String? type;

  /// Token id: It is the id for a token which is allocated when the token is minted.
  int? tokenId;

  factory TransactionMovement.fromJson(Map<String, dynamic> json) =>
      TransactionMovement(
        amount: json['amount']?.toInt(),
        tokenAddress: json['tokenAddress'],
        to: json['to'],
        type: json['type'],
        tokenId: json['tokenId']?.toInt(),
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'amount': amount,
        'tokenAddress': tokenAddress,
        'to': to,
        'type': type,
        'tokenId': tokenId
      };
}
