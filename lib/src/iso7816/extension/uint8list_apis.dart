// Dart imports:
import 'dart:convert';
import 'dart:typed_data';

// Package imports:
import 'package:convert/convert.dart' as C;

extension Uint8ListEncodeApis on Uint8List {
  String base64() {
    return const Base64Codec().encode(this);
  }

  String hex() {
    return C.hex.encoder.convert(this);
  }
}
