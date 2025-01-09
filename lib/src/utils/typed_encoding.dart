import 'dart:convert';
import 'dart:typed_data';

import 'package:archethic_lib_dart/src/utils/utils.dart';
import 'package:archethic_lib_dart/src/utils/varint.dart' as varint;

enum DataType {
  typeInt,
  typeFloat,
  typeString,
  typeList,
  typeMap,
  typeBool,
  typeNull,
}

Uint8List serialize(dynamic data, [int version = 1]) {
  data = sortObjectKeysAsc(data);

  switch (version) {
    default:
      return doSerializeV1(data);
  }
}

dynamic deserialize(Uint8List encodedData, [int version = 1]) {
  final iter = encodedData.asMap().entries.iterator;

  switch (version) {
    default:
      return doDeserializeV1(iter);
  }
}

Uint8List doSerializeV1(dynamic data) {
  if (data == null) {
    return Uint8List.fromList([DataType.typeNull.index]);
  } else if (data == true) {
    return Uint8List.fromList([DataType.typeBool.index, 1]);
  } else if (data == false) {
    return Uint8List.fromList([DataType.typeBool.index, 0]);
  } else if (data is num) {
    final sign = data >= 0;

    if (data is int) {
      return concatUint8List([
        Uint8List.fromList([DataType.typeInt.index]),
        Uint8List.fromList([if (sign) 1 else 0]),
        varint.serialize(data.abs()),
      ]);
    } else {
      return concatUint8List([
        Uint8List.fromList([DataType.typeFloat.index]),
        Uint8List.fromList([if (sign) 1 else 0]),
        varint.serialize(toBigInt(data.abs())),
      ]);
    }
  } else if (data is String) {
    return concatUint8List([
      Uint8List.fromList([DataType.typeString.index]),
      varint.serialize(byteSize(data)),
      Uint8List.fromList(utf8.encode(data)),
    ]);
  } else if (data is List) {
    final serializedItems = data.map((item) => doSerializeV1(item));
    return concatUint8List([
      Uint8List.fromList([DataType.typeList.index]),
      varint.serialize(data.length),
      ...serializedItems,
    ]);
  } else if (data is Map) {
    final serializedKeyValues = data.entries.expand((entry) {
      final key = entry.key;
      final value = entry.value;
      return [doSerializeV1(key), doSerializeV1(value)];
    });

    return concatUint8List(
      [
        Uint8List.fromList([DataType.typeMap.index]),
        varint.serialize(data.length),
        ...serializedKeyValues,
      ],
    );
  } else if (data is Object) {
    final serializedKeyValues = data.tryToJson().entries.expand((entry) {
      final key = entry.key;
      final value = entry.value;
      return [doSerializeV1(key), doSerializeV1(value)];
    });

    return concatUint8List(
      [
        Uint8List.fromList([DataType.typeMap.index]),
        varint.serialize(data.tryToJson().length),
        ...serializedKeyValues,
      ],
    );
  } else {
    throw Exception('Unhandled data type');
  }
}

dynamic doDeserializeV1(Iterator<MapEntry<int, int>> iter) {
  final type = nextUint8(iter);

  switch (DataType.values[type]) {
    case DataType.typeNull:
      return null;
    case DataType.typeBool:
      return nextUint8(iter) == 1;
    case DataType.typeInt:
      return nextUint8(iter) == 1
          ? varint.deserialize(iter)
          : -varint.deserialize(iter);
    case DataType.typeFloat:
      return nextUint8(iter) == 1
          ? fromBigInt(varint.deserialize(iter))
          : -fromBigInt(varint.deserialize(iter));
    case DataType.typeString:
      final strLen = varint.deserialize(iter);

      final bytes = <int>[];
      for (var i = 0; i < strLen; i++) {
        bytes.add(nextUint8(iter));
      }

      return utf8.decode(Uint8List.fromList(bytes));
    case DataType.typeList:
      final listLen = varint.deserialize(iter);

      final list = <dynamic>[];
      for (var i = 0; i < listLen; i++) {
        list.add(doDeserializeV1(iter));
      }

      return list;
    case DataType.typeMap:
      final keysLen = varint.deserialize(iter);

      final map = <dynamic, dynamic>{};
      for (var i = 0; i < keysLen; i++) {
        final key = doDeserializeV1(iter);
        final value = doDeserializeV1(iter);
        map[key] = value;
      }

      return map;
  }
}

int byteSize(String str) {
  return utf8.encode(str).length;
}

extension TryToJsonExtension on Object? {
  dynamic tryToJson() {
    if (this == null) return null;

    if (this is Map) return this;
    if (this is List) return this;

    try {
      final dynamic result = (this as dynamic).toJson();
      return result;
    } catch (e) {
      throw Exception(
        'Object of type $runtimeType does not implement toJson',
      );
    }
  }
}
