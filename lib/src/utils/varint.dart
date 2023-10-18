import 'dart:typed_data';

import 'package:archethic_lib_dart/src/utils/utils.dart';

Uint8List serialize(int value) {
  final byteBuffer = toByteArray(value);
  final length = byteBuffer.length;

  return concatUint8List(
    <Uint8List>[
      Uint8List.fromList([length]),
      byteBuffer,
    ],
  );
}

int deserialize(Iterator<MapEntry<int, int>> iterator) {
  final length = nextUint8(iterator);

  final bytes = <int>[];
  for (var i = 0; i < length; i++) {
    bytes.add(nextUint8(iterator));
  }

  return uint8ListToInt(Uint8List.fromList(bytes));
}
