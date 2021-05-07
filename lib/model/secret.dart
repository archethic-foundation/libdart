import 'dart:typed_data' show Uint8List;

class Secret {
  Uint8List iv;
  Uint8List aesKey;

  Secret({
    required this.iv,
    required this.aesKey,
  });
}
