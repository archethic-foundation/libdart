// Project imports:
import 'package:archethic_lib_dart/src/model/ledger.dart';
import 'package:archethic_lib_dart/src/model/ownership.dart';

/// [TransactionData] represents the data section for every transaction.

class Data {
  Data({
    this.code,
    this.content,
    this.ownerships,
    this.ledger,
    this.recipients,
  });

  /// Code: smart contract code (hexadecimal),
  String? code;

  /// Content: free zone for data hosting (string or hexadecimal)
  String? content;

  /// Ownership: authorization/delegations containing list of secrets and their authorized public keys to proof the ownership
  List<Ownership>? ownerships;

  /// Ledger: asset transfers
  Ledger? ledger;

  /// Recipients: For non asset transfers, the list of recipients of the transaction (e.g Smart contract interactions)
  List<String>? recipients;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        code: json['code'],
        content: json['content'],
        ownerships: json['ownerships'] == null
            ? null
            : List<Ownership>.from(json['ownerships'].map((x) => x)),
        ledger: json['ledger'] == null ? null : Ledger.fromJson(json['ledger']),
        recipients: json['recipients'] == null
            ? null
            : List<String>.from(json['recipients'].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        'code': code,
        'content': content,
        'ownerships': List<dynamic>.from(ownerships!.map((x) => x)),
        'ledger': ledger!.toJson(),
        'recipients': List<dynamic>.from(recipients!.map((x) => x)),
      };
}
