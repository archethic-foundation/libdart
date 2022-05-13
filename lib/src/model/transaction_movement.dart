/// SPDX-License-Identifier: AGPL-3.0-or-later

/// [TransactionMovement] represents ledger transaction movement.
class TransactionMovement {
  TransactionMovement({
    this.amount,
    this.nftAddress,
    this.to,
    this.type,
  });

  /// Amount: asset amount
  double? amount;

  /// NFT address: address of the NFT if the type is NFT
  String? nftAddress;

  /// To: asset transfer recipient
  String? to;

  /// Type: UCO/NFT
  String? type;

  factory TransactionMovement.fromJson(Map<String, dynamic> json) =>
      TransactionMovement(
        amount: json['amount']?.toDouble(),
        nftAddress: json['nftAddress'],
        to: json['to'],
        type: json['type'],
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'amount': amount,
        'nftAddress': nftAddress,
        'to': to,
        'type': type,
      };
}
