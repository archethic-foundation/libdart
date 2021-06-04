import 'dart:typed_data' show Uint8List;

class KeyPair {
  KeyPair({
    required this.privateKey,
    required this.publicKey,
  });

  Uint8List privateKey;
  Uint8List publicKey;
}
