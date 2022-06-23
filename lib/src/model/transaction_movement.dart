/// SPDX-License-Identifier: AGPL-3.0-or-later

/// [TransactionMovement] represents ledger transaction movement.
class TransactionMovement {
  TransactionMovement({
    this.amount,
    this.tokenAddress,
    this.to,
    this.type,
  });

  /// Amount: asset amount
  double? amount;

  /// Token address: address of the token if the type is token
  String? tokenAddress;

  /// To: asset transfer recipient
  String? to;

  /// Type: UCO/Token
  String? type;

  factory TransactionMovement.fromJson(Map<String, dynamic> json) =>
      TransactionMovement(
        amount: json['amount']?.toDouble(),
        tokenAddress: json['tokenAddress'],
        to: json['to'],
        type: json['type'],
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'amount': amount,
        'tokenAddress': tokenAddress,
        'to': to,
        'type': type,
      };
}
