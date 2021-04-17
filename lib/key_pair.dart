import 'dart:typed_data';

class KeyPair {
  Uint8List privateKey;
  Uint8List publicKey;

  KeyPair({
    required this.privateKey,
    required this.publicKey,
  });
}
