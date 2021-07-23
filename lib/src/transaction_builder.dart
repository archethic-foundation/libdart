// Dart imports:
import 'dart:convert' show jsonEncode;
import 'dart:typed_data' show Uint8List;

// Project imports:
import 'package:archethic_lib_dart/src/model/authorized_key.dart';
import 'package:archethic_lib_dart/src/model/data.dart';
import 'package:archethic_lib_dart/src/model/transaction.dart';

class TransactionBuilder {
  TransactionBuilder(String txType) {
    if (!txTypes.containsKey(txType)) {
      throw 'Transaction type must be \'transfer\', \'hosting\', \'keychain_access\', \'keychain\',  \'nft\', \'code_proposal\', \'code_approval\'';
    }

    Transaction transaction = new Transaction(type: txType, version: cVersion);
    transaction.data = Data.fromJson({
      'content': Uint8List(0),
      'code': Uint8List(0),
      'keys': {'secret': Uint8List(0), 'authorizedKeys': {}},
      'ledger': {
        'uco': {'transfers': []},
        'nft': {'transfers': []}
      },
      'recipients': []
    });
  }

  /// Convert the transaction in JSON
  static String toJSON(Transaction transaction) {
    final String _json = jsonEncode({
      'version': transaction.version,
      'address': transaction.address!,
      'type': transaction.type,
      'data': {
        'content': transaction.data!.content!,
        'code': transaction.data!.code!,
        'keys': {
          'secret': transaction.data!.keys!.secret!,
          'authorizedKeys': hexAuthorizedKeys(transaction.data!.keys!.authorizedKeys!)
        },
        'ledger': {
          'uco': {
            'transfers':
                List<dynamic>.from(transaction.data!.ledger!.uco!.transfers!.map((x) {
              return {
                'to': x.to!,
                'amount': x.amount,
              };
            }))
          },
          'nft': {
            'transfers':
                List<dynamic>.from(transaction.data!.ledger!.nft!.transfers!.map((x) {
              return {'to': x.to!, 'amount': x.amount, 'nft': x.nft!};
            }))
          },
        },
        'recipients': List<dynamic>.from(transaction.data!.recipients!.map((x) => x)),
      },
      'previousPublicKey': transaction.previousPublicKey!,
      'previousSignature': transaction.previousSignature!,
      'originSignature': transaction.originSignature == null
          ? null
          : transaction.originSignature!
    });
    return _json;
  }
}

Map<dynamic, dynamic> hexAuthorizedKeys(List<AuthorizedKey> authorizedKeys) {
  final Map<dynamic, dynamic> authorizedKeysHex = {};
  authorizedKeys.forEach((authorizedKey) {
    authorizedKeysHex.putIfAbsent(
        authorizedKey.publicKey, () => authorizedKey.encryptedKey);
  });
  return authorizedKeysHex;
}
