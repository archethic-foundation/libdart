/// SPDX-License-Identifier: AGPL-3.0-or-later

// Project imports:
import 'package:archethic_lib_dart/src/utils/utils.dart';

/// [UCOTransfer] represents the an asset transfer
class UCOTransfer {
  UCOTransfer({
    this.amount,
    this.to,
  });

  BigInt? amount;
  String? to;

  factory UCOTransfer.fromJson(Map<String, dynamic> json) => UCOTransfer(
        amount:
            json['amount'] == null ? null : toBigInt(json['amount'].toDouble()),
        to: json['to'],
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'amount': amount,
        'to': to,
      };
}
