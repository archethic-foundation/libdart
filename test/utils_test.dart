library test.utils_test;

import 'dart:typed_data';

import 'package:flutter_test/flutter_test.dart';
import 'package:uniris_lib_dart/utils.dart';
import 'package:pointycastle/src/utils.dart' as pc_utils;

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
          Uint8List.fromList([2, 83, 129, 239]));
    });
  });

  group('uint8ListToHex', () {
    test('should convert a Uint8List to hex', () {
      expect(uint8ListToHex(Uint8List.fromList([2, 83, 129, 239])),
          '025381ef');
    });
  });

  group('concatUint8List', () {
    test('should concat Uint8List arrays', () {
      expect(
          pc_utils.concatUint8List([
            Uint8List.fromList([1, 2, 3]),
            Uint8List.fromList([4, 5, 6])
          ]),
          Uint8List.fromList([1, 2, 3, 4, 5, 6]));
    });
  });

  group('encodeInt32', () {
    test('should encode an integer', () {
      expect(encodeInt32(212323839823),
          Uint8List.fromList([111, 124, 175, 79]));
    });
  });

  group('encodeBigInt', () {
    test('should encode an integer into a big integer on 8 bytes', () {
      expect(encodeBigInt(BigInt.from(212323839821021)),
          Uint8List.fromList([0, 0, 193, 27, 127, 12, 196, 221]));
    });
  });

  group('encodeFloat64', () {
    test('should encode an double into a 8 bytes array', () {
      expect(encodeFloat64(0.243829489482948),
          Uint8List.fromList([63, 207, 53, 206, 1, 144, 151, 247]));
    });
  });
}
