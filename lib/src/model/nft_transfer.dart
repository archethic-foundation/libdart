// Project imports:
import 'package:archethic_lib_dart/src/utils.dart';

/// [NFTTransfer] represents the an asset transfer
class NFTTransfer {
  NFTTransfer({
    this.amount,
    this.to,
    this.nft,
  });

  BigInt? amount;
  String? to;
  String? nft;

  factory NFTTransfer.fromJson(Map<String, dynamic> json) => NFTTransfer(
        amount:
            json['amount'] == null ? null : toBigInt(json['amount'].toDouble()),
        to: json['to'],
        nft: json['nft'],
      );

  Map<String, dynamic> toJson() => {
        'amount': amount,
        'to': to,
        'nft': nft,
      };
}
