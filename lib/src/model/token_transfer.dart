/// SPDX-License-Identifier: AGPL-3.0-or-later

// Project imports:
import 'package:archethic_lib_dart/src/utils/utils.dart';

/// [TokenTransfer] represents the an asset transfer
class TokenTransfer {
  TokenTransfer({this.amount, this.to, this.token, this.tokenId});

  BigInt? amount;
  String? to;
  String? token;
  int? tokenId;

  factory TokenTransfer.fromJson(Map<String, dynamic> json) => TokenTransfer(
        amount:
            json['amount'] == null ? null : toBigInt(json['amount'].toDouble()),
        to: json['to'],
        token: json['token'],
        tokenId: json['tokenId']?.toInt(),
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'amount': amount,
        'to': to,
        'token': token,
        'tokenId': tokenId
      };
}
