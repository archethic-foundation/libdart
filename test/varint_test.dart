import 'package:archethic_lib_dart/src/utils/varint.dart' as varint;
import 'package:test/test.dart';

void main() {
  group('VarInt', () {
    test('should serialize/deserialize', () {
      final testCases = [
        0,
        (1 << 8) - 1,
        1 << 8,
        (1 << 16) - 1,
        1 << 16,
        (1 << 24) - 1,
        1 << 24,
        (1 << 32) - 1,
        1 << 32,
        (1 << 40) - 1,
        1 << 40,
      ];

      for (final testCase in testCases) {
        final serialized = varint.serialize(testCase);
        final iterator = serialized.asMap().entries.iterator;
        final deserialized = varint.deserialize(iterator);

        expect(deserialized, equals(testCase));
      }
    });
  });
}
