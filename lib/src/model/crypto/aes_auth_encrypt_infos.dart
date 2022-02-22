/// SPDX-License-Identifier: AGPL-3.0-or-later

// Dart imports:
import 'dart:typed_data' show Uint8List;

class AesAuthEncryptInfos {
  AesAuthEncryptInfos({
    required this.tag,
    required this.encrypted,
  });

  Uint8List tag;
  Uint8List encrypted;
}
