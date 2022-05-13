/// SPDX-License-Identifier: AGPL-3.0-or-later

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
        nft: json['nft'] == null ? null : NFTLedger.fromJson(json['nft']),
        uco: json['uco'] == null ? null : UCOLedger.fromJson(json['uco']),
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'nft': nft!.toJson(),
        'uco': uco!.toJson(),
      };
}
