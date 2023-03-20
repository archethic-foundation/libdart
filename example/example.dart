// ignore_for_file: unused_local_variable
import 'package:archethic_lib_dart/src/model/transaction.dart';
import 'package:archethic_lib_dart/src/utils/crypto.dart';
import 'package:archethic_lib_dart/src/utils/utils.dart';
import 'package:pinenacl/encoding.dart';

void main(List<String> args) {
  /// It creates a new keypair into hexadecimal format
  final keypair =
      deriveKeyPair('mysuperpassphraseorseed', 0, isSeedHexa: false);

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
      .build('mysuperpassphraseorseed', 0, curve: 'P256')
    ..convertToJSON();

  /// Sign the transaction with an origin device private key
  final originKeypair = deriveKeyPair('origin_seed', 0, isSeedHexa: false);
  final transaction2 = Transaction(
    type: 'transfer',
    data: Transaction.initData(),
  )
      .addUCOTransfer(
        '00b1d3750edb9381c96b1a975a55b5b4e4fb37bfab104c10b0b6c9a00433ec4646',
        toBigInt(0.420),
      )
      .build('mysuperpassphraseorseed', 0, curve: 'P256')
      .originSign(
        uint8ListToHex(
          Uint8List.fromList(originKeypair.privateKey!),
        ),
      )..convertToJSON();

  /// Export the transaction generated into JSON
  final transaction3 = Transaction(
    type: 'transfer',
    data: Transaction.initData(),
  )
      .addUCOTransfer(
        '00b1d3750edb9381c96b1a975a55b5b4e4fb37bfab104c10b0b6c9a00433ec4646',
        toBigInt(0.420),
      )
      .build('mysuperpassphraseorseed', 0, curve: 'P256')
    ..convertToJSON();
}
