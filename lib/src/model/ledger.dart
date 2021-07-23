// Project imports:
import 'package:archethic_lib_dart/src/model/nft_ledger.dart';
import 'package:archethic_lib_dart/src/model/uco_ledger.dart';

/// [Ledger] represents the ledger operations to perform
class Ledger {
  Ledger({
    this.nft,
    this.uco,
  });

  NFTLedger? nft;
  UCOLedger? uco;

  factory Ledger.fromJson(Map<String, dynamic> json) => Ledger(
        nft: NFTLedger.fromJson(json['nft']),
        uco: UCOLedger.fromJson(json['uco']),
      );

  Map<String, dynamic> toJson() => {
        'nft': nft!.toJson(),
        'uco': uco!.toJson(),
      };
}
