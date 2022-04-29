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
      expect(hexToUint8List('025381ef'),
          Uint8List.fromList(<int>[2, 83, 129, 239]));
    });
  });

  group('uint8ListToHex', () {
    test('should convert a Uint8List to hex', () {
      expect(uint8ListToHex(Uint8List.fromList(<int>[2, 83, 129, 239])),
          '025381ef');
    });
  });

  group('concatUint8List', () {
    test('should concat Uint8List arrays', () {
      expect(
          concatUint8List(<Uint8List>[
            Uint8List.fromList(<int>[1, 2, 3]),
            Uint8List.fromList(<int>[4, 5, 6])
          ]),
          Uint8List.fromList(<int>[1, 2, 3, 4, 5, 6]));
    });
  });

  group('encodeInt32', () {
    test('should encode an integer', () {
      expect(encodeInt32(212323839823),
          Uint8List.fromList(<int>[111, 124, 175, 79]));
    });
  });

  group('encodeBigInt', () {
    test('should encode an integer into a big integer on 8 bytes', () {
      expect(encodeBigInt(BigInt.from(212323839821021)),
          Uint8List.fromList(<int>[0, 0, 193, 27, 127, 12, 196, 221]));
    });
  });

  group('toBigInt', () {
    test('should convert a double into a big integer with 10^8', () {
      expect(toBigInt(1.234567), BigInt.from(123456700));
    });
  });
}
