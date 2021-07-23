// Project imports:
import 'package:archethic_lib_dart/src/model/nft_transfer.dart';

/// [NFTLedger] represents the transfers to perform on the NFT ledger
class NFTLedger {
  NFTLedger({
    this.transfers,
  });

  List<NFTTransfer>? transfers;

  factory NFTLedger.fromJson(Map<String, dynamic> json) => NFTLedger(
        transfers: json['transfers'] == null
            ? null
            : List<NFTTransfer>.from(
                json['transfers'].map((x) => NFTTransfer.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        'transfers': List<dynamic>.from(transfers!.map((x) => x.toJson())),
      };
}
