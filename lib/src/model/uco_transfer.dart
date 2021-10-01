/// [UCOTransfer] represents the an asset transfer
class UCOTransfer {
  UCOTransfer({
    this.amount,
    this.to,
  });

  BigInt? amount;
  String? to;

  factory UCOTransfer.fromJson(Map<String, dynamic> json) => UCOTransfer(
        amount: json['amount'] == null
            ? null
            : BigInt.from(json['amount'].toDouble()),
        to: json['to'],
      );

  Map<String, dynamic> toJson() => {
        'amount': amount,
        'to': to,
      };
}
