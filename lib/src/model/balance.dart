/// SPDX-License-Identifier: AGPL-3.0-or-later

// Project imports:
import 'package:archethic_lib_dart/src/model/token_balance.dart';

/// [Balance] represents a ledger balance.
class Balance {
  Balance({
    this.token,
    this.uco,
  });

  /// Token: Token balances
  List<TokenBalance>? token;

  /// UCO: uco balance
  double? uco;

  factory Balance.fromJson(Map<String, dynamic> json) => Balance(
        token: json['token'] == null
            ? null
            : List<TokenBalance>.from(
                json['token'].map((dynamic x) => TokenBalance.fromJson(x))),
        uco: json['uco']?.toDouble(),
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'token': List<dynamic>.from(token!.map((TokenBalance x) => x.toJson())),
        'uco': uco,
      };
}
