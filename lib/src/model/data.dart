// Dart imports:
import 'dart:convert';

// Project imports:
import 'package:archethic_lib_dart/src/model/keys.dart';
import 'package:archethic_lib_dart/src/model/ledger.dart';
import 'package:archethic_lib_dart/src/utils.dart';

/// [TransactionData] represents the data section for every transaction.

class Data {
  Data({
    this.code,
    this.content,
    this.keys,
    this.ledger,
    this.recipients,
  });

  /// Code: smart contract code (hexadecimal),
  String? code;

  /// Content: free zone for data hosting (string or hexadecimal)
  String? content;

  /// ContentDisplay: convert Content to lisible string
  String? get contentDisplay => utf8.decode(hexToUint8List(content!));

  /// Keys: Secrets and authorized public keys to decrypt the secret
  Keys? keys;

  /// Ledger: asset transfers
  Ledger? ledger;

  /// Recipients: For non asset transfers, the list of recipients of the transaction (e.g Smart contract interactions)
  List<String>? recipients;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        code: json['code'],
        content: json['content'],
        keys: json['keys'] == null ? null : Keys.fromJson(json['keys']),
        ledger: json['ledger'] == null ? null : Ledger.fromJson(json['ledger']),
        recipients: json['recipients'] == null
            ? null
            : List<String>.from(json['recipients'].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        'code': code,
        'content': content,
        'keys': keys!.toJson(),
        'ledger': ledger!.toJson(),
        'recipients': List<dynamic>.from(recipients!.map((x) => x)),
      };
}
