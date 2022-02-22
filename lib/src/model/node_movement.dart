/// SPDX-License-Identifier: AGPL-3.0-or-later

/// [NodeMovement] represents node transaction movement

class NodeMovement {
  NodeMovement({
    this.amount,
    this.to,
  });

  /// Amount: reward (UCO)
  double? amount;

  /// To: node public key
  String? to;

  factory NodeMovement.fromJson(Map<String, dynamic> json) => NodeMovement(
        amount: json['amount']?.toDouble(),
        to: json['to'],
      );

  Map<String, dynamic> toJson() => {
        'amount': amount,
        'to': to,
      };
}
