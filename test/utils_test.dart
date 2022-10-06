library test.utils_test;

// Dart imports:
import 'dart:typed_data';

// Project imports:
import 'package:archethic_lib_dart/src/utils/utils.dart';
// Package imports:
import 'package:test/test.dart';

void main() {
  group('isHex', () {
    test('should return true when the string is an hexadecimal', () {
      expect(isHex('0f2cb1a'), true);
    });
    test('should return false when the string is not an hexadecimal', () {
      expect(isHex('13z9=!ç'), false);
    });
  });

  group('hexToUint8List', () {
    test('should convert an hexadecimal to Uint8List', () {
      expect(
        Uint8List.fromList(hexToUint8List('025381ef')),
        Uint8List.fromList(<int>[2, 83, 129, 239]),
      );
    });
  });

  group('uint8ListToHex', () {
    test('should convert a Uint8List to hex', () {
      expect(
        uint8ListToHex(Uint8List.fromList(<int>[2, 83, 129, 239])),
        '025381ef',
      );
    });
  });

  group('concatUint8List', () {
    test('should concat Uint8List arrays', () {
      expect(
        concatUint8List(<Uint8List>[
          Uint8List.fromList(<int>[1, 2, 3]),
          Uint8List.fromList(<int>[4, 5, 6])
        ]),
        Uint8List.fromList(<int>[1, 2, 3, 4, 5, 6]),
      );
    });
  });

  group('toBigInt', () {
    test('should convert a double into a big integer with 10^8', () {
      expect(toBigInt(1.234567), 123456700);
    });
  });

  group('toByteArray', () {
    test('should encode an integer into a Uint8List', () {
      expect(toByteArray(0), <int>[0]);
      expect(toByteArray(123), <int>[123]);
      expect(toByteArray(258), <int>[1, 2]);
      expect(toByteArray(65535), <int>[255, 255]);
      expect(toByteArray(65536), <int>[1, 0, 0]);
    });
  });
}
