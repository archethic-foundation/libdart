import 'dart:typed_data';

class Secret {
  Uint8List iv;
  Uint8List aesKey;

  Secret({
    required this.iv,
    required this.aesKey,
  });
}
