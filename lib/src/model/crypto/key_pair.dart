/// SPDX-License-Identifier: AGPL-3.0-or-later

// Dart imports:
import 'dart:typed_data' show Uint8List;

/// Holds a key pair (private and public key)
class KeyPair {
  KeyPair({
    required this.privateKey,
    required this.publicKey,
  });

  Uint8List privateKey;
  Uint8List publicKey;
}
