/// SPDX-License-Identifier: AGPL-3.0-or-later

/// [UCOTransfer] represents the an asset transfer
class UCOTransfer {
  UCOTransfer({
    this.amount,
    this.to,
  });

  int? amount;
  String? to;

  factory UCOTransfer.fromJson(Map<String, dynamic> json) => UCOTransfer(
        amount: json['amount']?.toDouble(),
        to: json['to'],
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'amount': amount,
        'to': to,
      };
}
