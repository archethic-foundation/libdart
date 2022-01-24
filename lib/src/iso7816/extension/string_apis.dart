// Dart imports:
import 'dart:convert';
import 'dart:core';
import 'dart:typed_data';

// Package imports:
import 'package:convert/convert.dart';

extension StringDecodeApis on String {
  Uint8List parseBase64() {
    return base64.decode(this);
  }

  Uint8List parseHex() {
    return Uint8List.fromList(hex.decoder.convert(this));
  }
}

extension StringYYMMDDateApi on String {
  DateTime parseDateYYMMDD() {
    if (length < 6) {
      throw const FormatException('invalid string length');
    }

    int y = int.parse(substring(0, 2)) + 2000;
    final int m = int.parse(substring(2, 4));
    final int d = int.parse(substring(4, 6));

    // Sub 100 years from parsed year if greater than 10 years and 5 months from now.
    final DateTime now = DateTime.now();
    final int tenYearsFromNow = now.year + 10;
    if (y > tenYearsFromNow || (y == tenYearsFromNow && now.month + 5 < m)) {
      y -= 100;
    }
    return DateTime(y, m, d);
  }
}