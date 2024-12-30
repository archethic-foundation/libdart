import 'dart:typed_data';
import 'package:archethic_lib_dart/src/utils/utils.dart';
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
          Uint8List.fromList(<int>[4, 5, 6]),
        ]),
        Uint8List.fromList(<int>[1, 2, 3, 4, 5, 6]),
      );
    });
  });

  group('toBigInt', () {
    test('should convert a double into a big integer with 10^8', () {
      expect(toBigInt(1.234567), 123456700);
    });

    test('should convert a double into a big integer with 10^8', () {
      expect(toBigInt(9.95), 995000000);
    });

    test('should convert a double into a big integer with 10^8', () {
      expect(toBigInt(0.617714895), 61771489);
    });

    test('should return Big Int with 8 decimals by default', () {
      expect(toBigInt(12.5345), 1253450000);
    });

    test('test precision', () {
      expect(120139.69456927, fromBigInt(12013969456927));
    });
  });

  group('fromBigInt', () {
    test('should convert a big integer with 10^8 into double', () {
      expect(1.234567, fromBigInt(123456700));
    });

    test('should convert a big integer with 10^8 into double', () {
      expect(9.95, fromBigInt(995000000));
    });

    test('should convert a big integer with 10^8 into double', () {
      expect(0.61771489, fromBigInt(61771489));
    });

    test('should return 8 decimals number by default', () {
      expect(12.5345, fromBigInt(1253450000));
    });
  });

  group('toByteArray', () {
    test('should encode an integer into a Uint8List', () {
      expect(toByteArray(0), equals(Uint8List.fromList([0])));
      expect(toByteArray(123), equals(Uint8List.fromList(<int>[123])));
      expect(toByteArray(258), equals(Uint8List.fromList(<int>[1, 2])));
      expect(toByteArray(65535), equals(Uint8List.fromList(<int>[255, 255])));
      expect(toByteArray(65536), equals(Uint8List.fromList(<int>[1, 0, 0])));
      expect(toByteArray((1 << 8) - 1), equals(Uint8List.fromList([255])));
      expect(toByteArray(1 << 8), equals(Uint8List.fromList([1, 0])));
      expect(
        toByteArray((1 << 16) - 1),
        equals(Uint8List.fromList([255, 255])),
      );
      expect(toByteArray(1 << 16), equals(Uint8List.fromList([1, 0, 0])));
      expect(
        toByteArray((1 << 24) - 1),
        equals(Uint8List.fromList([255, 255, 255])),
      );
      expect(toByteArray(1 << 24), equals(Uint8List.fromList([1, 0, 0, 0])));
      expect(
        toByteArray((1 << 32) - 1),
        equals(Uint8List.fromList([255, 255, 255, 255])),
      );
      expect(toByteArray(1 << 32), equals(Uint8List.fromList([1, 0, 0, 0, 0])));
      expect(
        toByteArray((1 << 40) - 1),
        equals(Uint8List.fromList([255, 255, 255, 255, 255])),
      );
      expect(
        toByteArray(1 << 40),
        equals(Uint8List.fromList([1, 0, 0, 0, 0, 0])),
      );
    });
  });

  group('uint8ListToInt', () {
    test('should decode an integer from a Uint8List', () {
      expect(uint8ListToInt(Uint8List.fromList([0])), equals(0));
      expect(uint8ListToInt(Uint8List.fromList([255])), equals((1 << 8) - 1));
      expect(uint8ListToInt(Uint8List.fromList([1, 0])), equals(1 << 8));
      expect(
        uint8ListToInt(Uint8List.fromList([255, 255])),
        equals((1 << 16) - 1),
      );
      expect(uint8ListToInt(Uint8List.fromList([1, 0, 0])), equals(1 << 16));
      expect(
        uint8ListToInt(Uint8List.fromList([255, 255, 255])),
        equals((1 << 24) - 1),
      );
      expect(uint8ListToInt(Uint8List.fromList([1, 0, 0, 0])), equals(1 << 24));
      expect(
        uint8ListToInt(Uint8List.fromList([255, 255, 255, 255])),
        equals((1 << 32) - 1),
      );
      expect(
        uint8ListToInt(Uint8List.fromList([1, 0, 0, 0, 0])),
        equals(1 << 32),
      );
      expect(
        uint8ListToInt(Uint8List.fromList([255, 255, 255, 255, 255])),
        equals((1 << 40) - 1),
      );
      expect(
        uint8ListToInt(Uint8List.fromList([1, 0, 0, 0, 0, 0])),
        equals(1 << 40),
      );
    });
  });

  group('sortObjectKeysAsc', () {
    test('should return the same value if not an object', () {
      expect(sortObjectKeysAsc(1234), equals(1234));
      expect(sortObjectKeysAsc([]), equals([]));
      expect(sortObjectKeysAsc([1, 2]), equals([1, 2]));
      expect(sortObjectKeysAsc(''), equals(''));
      expect(sortObjectKeysAsc('abracadabra'), equals('abracadabra'));
    });

    test('should not change anything if already ordered', () {
      final a = sortObjectKeysAsc({
        'a': 'hello',
        'b': 'world',
      });
      expect(a.keys, equals(['a', 'b']));
    });

    test('should reorder the keys of root level', () {
      final a = sortObjectKeysAsc({
        'b': 'world',
        'a': 'hello',
      });
      expect(a.keys, equals(['a', 'b']));
    });

    test('should reorder the keys even when nested', () {
      final obj = sortObjectKeysAsc({
        'b': 'world',
        'a': {
          'b': [
            {
              'a': 1,
              'c': 2,
              'b': {
                'c': 'some',
                'a': 'thing',
                'b': 'here',
              },
            },
          ],
          'a': 'bar',
          'c': {
            'b': 'loulou',
            'a': 'riri',
            'c': 'fifi',
          },
        },
        'c': 'hello',
      });

      expect(obj.keys, equals(['a', 'b', 'c']));
      expect(obj['a'].keys, equals(['a', 'b', 'c']));
      expect(obj['a']['c'].keys, equals(['a', 'b', 'c']));
      expect(obj['a']['b'][0].keys, equals(['a', 'b', 'c']));
      expect(obj['a']['b'][0]['b'].keys, equals(['a', 'b', 'c']));
    });
  });
}
