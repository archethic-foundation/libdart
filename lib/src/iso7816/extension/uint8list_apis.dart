// Dart imports:
import 'dart:convert';
import 'dart:typed_data';

// Package imports:
import 'package:convert/convert.dart' as c;

extension Uint8ListEncodeApis on Uint8List {
  String base64() {
    return const Base64Codec().encode(this);
  }

  String hex() {
    return c.hex.encoder.convert(this);
  }
}
