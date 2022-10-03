/// SPDX-License-Identifier: AGPL-3.0-or-later

// Project imports:
import 'package:archethic_lib_dart/src/model/token_ledger.dart';
import 'package:archethic_lib_dart/src/model/uco_ledger.dart';

/// [Ledger] represents the ledger operations to perform
class Ledger {
  Ledger({
    this.token,
    this.uco,
  });

  factory Ledger.fromJson(Map<String, dynamic> json) => Ledger(
        token:
            json['token'] == null ? null : TokenLedger.fromJson(json['token']),
        uco: json['uco'] == null ? null : UCOLedger.fromJson(json['uco']),
      );

  TokenLedger? token;
  UCOLedger? uco;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'token': token!.toJson(),
        'uco': uco!.toJson(),
      };
}
