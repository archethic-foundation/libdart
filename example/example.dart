import 'package:archethic_lib_dart/archethic_lib_dart.dart' show deriveKeyPair;
import 'package:archethic_lib_dart/src/model/transaction.dart';
import 'package:archethic_lib_dart/src/utils/utils.dart';

void main(List<String> args) {
  /// It creates a new keypair into hexadecimal format
  // ignore: unused_local_variable
  final keypair = deriveKeyPair('mysuperpassphraseorseed', 0);

  /// Generate `address`, `timestamp`, `previousPublicKey`, `previousSignature`, `originSignature` of the transaction and
  /// serialize it using a custom binary protocol.
  final transaction = Transaction(
    type: 'transfer',
    data: Transaction.initData(),
  )
      .addUCOTransfer(
        '00b1d3750edb9381c96b1a975a55b5b4e4fb37bfab104c10b0b6c9a00433ec4646',
        toBigInt(0.420),
      )
      .build('mysuperpassphraseorseed', 0, curve: 'P256');
  transaction.convertToJSON();

  /// Sign the transaction with an origin device private key
  final originKeypair = deriveKeyPair('origin_seed', 0);
  final transaction2 = Transaction(
    type: 'transfer',
    data: Transaction.initData(),
  )
      .addUCOTransfer(
        '00b1d3750edb9381c96b1a975a55b5b4e4fb37bfab104c10b0b6c9a00433ec4646',
        toBigInt(0.420),
      )
      .build('mysuperpassphraseorseed', 0, curve: 'P256')
      .originSign(originKeypair.privateKey);
  transaction2.convertToJSON();

  /// Export the transaction generated into JSON
  final transaction3 = Transaction(
    type: 'transfer',
    data: Transaction.initData(),
  )
      .addUCOTransfer(
        '00b1d3750edb9381c96b1a975a55b5b4e4fb37bfab104c10b0b6c9a00433ec4646',
        toBigInt(0.420),
      )
      .build('mysuperpassphraseorseed', 0, curve: 'P256');
  transaction3.convertToJSON();
}
