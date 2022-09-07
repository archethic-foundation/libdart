/// SPDX-License-Identifier: AGPL-3.0-or-later

/// [TokenTransfer] represents the an asset transfer
class TokenTransfer {
  TokenTransfer({this.amount, this.to, this.tokenAddress, this.tokenId});

  int? amount;
  String? to;
  String? tokenAddress;
  int? tokenId;

  factory TokenTransfer.fromJson(Map<String, dynamic> json) => TokenTransfer(
        amount: json['amount']?.toInt(),
        to: json['to'],
        tokenAddress: json['tokenAddress'],
        tokenId: json['tokenId']?.toInt(),
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'amount': amount,
        'to': to,
        'tokenAddress': tokenAddress,
        'tokenId': tokenId
      };
}
