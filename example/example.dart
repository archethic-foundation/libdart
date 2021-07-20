import 'package:archethic_lib_dart/archethic_lib_dart.dart'
    show KeyPair, deriveKeyPair, TransactionBuilder;

void main(List<String> args) {
  /// It creates a new keypair into hexadecimal format
  KeyPair keypair = deriveKeyPair("mysuperpassphraseorseed", 0);

  /// Generate `address`, `timestamp`, `previousPublicKey`, `previousSignature`, `originSignature` of the transaction and
  /// serialize it using a custom binary protocol.
  var transaction = new TransactionBuilder("transfer")
      .addUCOTransfer(
          "00b1d3750edb9381c96b1a975a55b5b4e4fb37bfab104c10b0b6c9a00433ec4646",
          0.420)
      .build("mysuperpassphraseorseed", 0, 'P256');

  /// Sign the transaction with an origin device private key
  final KeyPair originKeypair = deriveKeyPair('origin_seed', 0);
  var transaction2 = new TransactionBuilder("transfer")
      .addUCOTransfer(
          "00b1d3750edb9381c96b1a975a55b5b4e4fb37bfab104c10b0b6c9a00433ec4646",
          0.420)
      .build("mysuperpassphraseorseed", 0, 'P256')
      .originSign(originKeypair.privateKey);

  /// Export the transaction generated into JSON
  var transaction3 = new TransactionBuilder("transfer")
      .addUCOTransfer(
          "00b1d3750edb9381c96b1a975a55b5b4e4fb37bfab104c10b0b6c9a00433ec4646",
          0.420)
      .build("mysuperpassphraseorseed", 0, 'P256')
      .toJSON();
}
