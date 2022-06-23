/// SPDX-License-Identifier: AGPL-3.0-or-later

// Project imports:
import 'package:archethic_lib_dart/src/utils/utils.dart';

/// [NFTTransfer] represents the an asset transfer
class NFTTransfer {
  NFTTransfer({this.amount, this.to, this.nft, this.nftId});

  BigInt? amount;
  String? to;
  String? nft;
  int? nftId;

  factory NFTTransfer.fromJson(Map<String, dynamic> json) => NFTTransfer(
        amount:
            json['amount'] == null ? null : toBigInt(json['amount'].toDouble()),
        to: json['to'],
        nft: json['nft'],
        nftId: json['nftId']?.toInt(),
      );

  Map<String, dynamic> toJson() =>
      <String, dynamic>{'amount': amount, 'to': to, 'nft': nft, 'nftId': nftId};
}
