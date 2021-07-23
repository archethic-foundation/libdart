/// [TransactionInput] represents the inputs from the transaction.

class TransactionInput {
  TransactionInput({
    this.amount,
    this.from,
    this.nftAddress,
    this.spent,
    this.timestamp,
    this.type,
  });

  /// Amount: asset amount
  double? amount;

  /// From: transaction which send the amount of assets
  String? from;

  /// NFT address: address of the NFT if the type is NFT
  String? nftAddress;

  /// Spent: determines if the input has been spent
  bool? spent;

  /// Timestamp: Date time when the inputs was generated
  int? timestamp;

  /// Type: UCO/NFT/Call
  String? type;

  factory TransactionInput.fromJson(Map<String, dynamic> json) =>
      TransactionInput(
        amount: json['amount'] == null ? null : json['amount'].toDouble(),
        from: json['from'],
        nftAddress: json['nftAddress'],
        spent: json['spent'],
        timestamp: json['timestamp'],
        type: json['type'],
      );

  Map<String, dynamic> toJson() => {
        'amount': amount,
        'from': from,
        'nftAddress': nftAddress,
        'spent': spent,
        'timestamp': timestamp,
        'type': type,
      };
}
