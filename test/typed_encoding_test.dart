library test.typed_encoding;

import 'package:archethic_lib_dart/src/utils/typed_encoding.dart'
    as typed_encoding;
import 'package:test/test.dart';

void main() {
  group('TE', () {
    test('should serialize/deserialize a null', () {
      expect(
        typed_encoding.deserialize(typed_encoding.serialize(null)),
        isNull,
      );
    });

    test('should serialize/deserialize a bool', () {
      expect(
        typed_encoding.deserialize(typed_encoding.serialize(true)),
        isTrue,
      );
      expect(
        typed_encoding.deserialize(typed_encoding.serialize(false)),
        isFalse,
      );
    });

    test('should serialize/deserialize an integer', () {
      expect(
        typed_encoding.deserialize(typed_encoding.serialize(0)),
        equals(0),
      );
      expect(
        typed_encoding.deserialize(typed_encoding.serialize(1)),
        equals(1),
      );
      expect(
        typed_encoding.deserialize(typed_encoding.serialize(1 << 40)),
        equals(1 << 40),
      );
    });

    test('should serialize/deserialize a float', () {
      expect(
        typed_encoding.deserialize(typed_encoding.serialize(1.00000001)),
        equals(1.00000001),
      );
      expect(
        typed_encoding.deserialize(typed_encoding.serialize(1.99999999)),
        equals(1.99999999),
      );
    });

    test('should serialize/deserialize a str', () {
      expect(
        typed_encoding.deserialize(typed_encoding.serialize('hello')),
        equals('hello'),
      );
      expect(
        typed_encoding.deserialize(typed_encoding.serialize('world')),
        equals('world'),
      );
      expect(
        typed_encoding
            .deserialize(typed_encoding.serialize("un été à l'ombre")),
        equals("un été à l'ombre"),
      );
    });

    test('should serialize/deserialize a list', () {
      expect(
        typed_encoding.deserialize(typed_encoding.serialize([])),
        equals([]),
      );
      expect(
        typed_encoding.deserialize(typed_encoding.serialize([1, 2, 3])),
        equals([1, 2, 3]),
      );
      expect(
        typed_encoding.deserialize(typed_encoding.serialize(['1', true, 14])),
        equals(['1', true, 14]),
      );
    });

    test('should serialize/deserialize an object', () {
      expect(
        typed_encoding.deserialize(typed_encoding.serialize({})),
        equals({}),
      );
      expect(
        typed_encoding
            .deserialize(typed_encoding.serialize({'a': 1, 'foo': 'bar'})),
        equals({'a': 1, 'foo': 'bar'}),
      );
    });
  });
}
