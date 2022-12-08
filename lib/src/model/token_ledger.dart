/// SPDX-License-Identifier: AGPL-3.0-or-later

// Project imports:
import 'package:archethic_lib_dart/src/model/token_transfer.dart';

/// [TokenLedger] represents the transfers to perform on the token ledger
class TokenLedger {
  TokenLedger({
    this.transfers,
  });

  factory TokenLedger.fromJson(Map<String, dynamic> json) => TokenLedger(
        transfers: json['transfers'] == null
            ? null
            : List<TokenTransfer>.from(json['transfers']
                .map((dynamic x) => TokenTransfer.fromJson(x)),),
      );

  List<TokenTransfer>? transfers;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'transfers':
            List<dynamic>.from(transfers!.map((TokenTransfer x) => x.toJson())),
      };
}
