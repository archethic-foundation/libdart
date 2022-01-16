/// [UnspentOutput] represents the remaining unspent output of the transaction.

class UnspentOutputs {
  UnspentOutputs({
    this.amount,
    this.nftAddress,
    this.type,
    this.from,
  });

  /// Amount: asset amount
  double? amount;

  /// NFT address: address of the NFT if the type is NFT
  String? nftAddress;

  /// Type: UCO/NFT
  String? type;

  /// From: transaction which send the amount of assets
  String? from;

  factory UnspentOutputs.fromJson(Map<String, dynamic> json) => UnspentOutputs(
        amount: json['amount']?.toDouble(),
        nftAddress: json['nftAddress'],
        type: json['type'],
        from: json['from'],
      );

  Map<String, dynamic> toJson() => {
        'amount': amount,
        'nftAddress': nftAddress,
        'type': type,
        'from': from,
      };
}
