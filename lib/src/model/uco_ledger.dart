/// SPDX-License-Identifier: AGPL-3.0-or-later

// Project imports:
import 'package:archethic_lib_dart/src/model/uco_transfer.dart';

/// [UCOLedger] represents the transfers to perform on the UCO ledger
class UCOLedger {
  UCOLedger({
    this.transfers,
  });

  factory UCOLedger.fromJson(Map<String, dynamic> json) => UCOLedger(
        transfers: json['transfers'] == null
            ? null
            : List<UCOTransfer>.from(
                json['transfers'].map((dynamic x) => UCOTransfer.fromJson(x)),),
      );

  List<UCOTransfer>? transfers;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'transfers':
            List<dynamic>.from(transfers!.map((UCOTransfer x) => x.toJson())),
      };
}
