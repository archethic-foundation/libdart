/// SPDX-License-Identifier: AGPL-3.0-or-later

// Dart imports:
import 'dart:typed_data' show Uint8List;

class Secret {
  Secret({
    required this.iv,
    required this.aesKey,
  });

  Uint8List iv;
  Uint8List aesKey;
}
