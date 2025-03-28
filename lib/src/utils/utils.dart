import 'dart:math';
import 'dart:typed_data';

import 'package:decimal/decimal.dart';
import 'package:pinenacl/encoding.dart' show Base16Encoder;

/// Return the Initial Origin Private Key.
const String kOriginPrivateKey =
    '01019280BDB84B8F8AEDBA205FE3552689964A5626EE2C60AA10E3BF22A91A036009';

/// Determines if a string is an hexadecimal.
bool isHex(String inputString) {
  final hexadecimal = RegExp(r'^([0-9A-Fa-f])*$');
  if (!hexadecimal.hasMatch(inputString)) {
    return false;
  }
  return true;
}

/// Encode an hexadecimal string into a Uint8List.
Uint8List hexToUint8List(String hexString) {
  final List<int> bytes = Base16Encoder.instance.decode(hexString);
  return Uint8List.fromList(bytes);
}

/// Encode an Uint8List into an hexadecimal string.
String uint8ListToHex(Uint8List bytes) {
  return Base16Encoder.instance.encode(Uint8List.fromList(bytes));
}

/// Concat a list of Uint8List.
Uint8List concatUint8List(Iterable<Uint8List> list) =>
    Uint8List.fromList(list.expand((Uint8List element) => element).toList());

/// Convert any number into a big int for 10^8 decimals.
int toBigInt(num? number) {
  if (number == null) {
    return 0;
  }
  return (Decimal.parse(number.toString()) * Decimal.parse('100000000'))
      .toDouble()
      .floor();
}

/// Convert big int of 10^8 decimals to any number.
num fromBigInt(int? number) {
  if (number == null) {
    return 0;
  }
  return (Decimal.parse(number.toString()) / Decimal.parse('100000000'))
      .toDouble();
}

/// Convert any number into a byte array
Uint8List toByteArray(int value, {int length = 0}) {
  final byteMask = BigInt.from(0xff);
  var number = BigInt.from(value);
  // Not handling negative numbers. Decide how you want to do that.
  int size;
  if (length > 0) {
    size = length;
  } else {
    size = (number.bitLength + 7) >> 3;
  }
  if (size == 0) {
    return Uint8List.fromList(<int>[0]);
  }

  // ignore: prefer_final_locals
  var result = Uint8List(size);
  for (var i = 0; i < size; i++) {
    result[size - i - 1] = (number & byteMask).toInt();
    number = number >> 8;
  }
  return result;
}

/// Remove alias prefix (underscore) used in graphQL requests
Map<String, T>? removeAliasPrefix<T>(Map<String, T?>? map) {
  if (map == null) {
    return null;
  }
  final mapResult = <String, T>{};
  map.forEach((key, value) {
    if (value != null) {
      mapResult[key.replaceFirst('_', '')] = value;
    }
  });
  return mapResult;
}

/// Generate a random seed
String generateRandomSeed() {
  var seed = '';
  const chars = 'abcdef0123456789';
  final rng = Random.secure();
  for (var i = 0; i < 64; i++) {
    // ignore: use_string_buffers
    seed += chars[rng.nextInt(chars.length)];
  }
  return seed;
}

/// Generate a random AESKey
String generateRandomAESKey({int length = 32}) {
  return uint8ListToHex(
    Uint8List.fromList(
      List<int>.generate(length, (int i) => Random.secure().nextInt(256)),
    ),
  );
}

/// Return the next Uint8 from an iterator of Uint8Array.
///
/// There is an assumption on success.
int nextUint8(Iterator<MapEntry<int, int>> iterator) {
  if (iterator.moveNext()) {
    return iterator.current.value;
  } else {
    throw StateError('No more elements in the iterator.');
  }
}

/// Decode byte array (4 bytes) into a integer.
int uint8ListToInt(Uint8List bytes) {
  var value = 0;
  for (var i = 0; i < bytes.length; i++) {
    value = (value * 256) + bytes[i];
  }
  return value;
}

dynamic sortObjectKeysAsc(dynamic term) {
  if (term is List) {
    return term.map((item) => sortObjectKeysAsc(item)).toList();
  } else if (term is Map) {
    // In Dart, maps have keys that are always strings, so we can sort them
    final sortedMap = Map.fromEntries(
      term.entries.toList()..sort((a, b) => a.key.compareTo(b.key)),
    );
    return sortedMap
        .map((key, value) => MapEntry(key, sortObjectKeysAsc(value)));
  } else if (term is MapEntry) {
    // MapEntry is Dart specific, so we handle it separately
    return MapEntry(term.key, sortObjectKeysAsc(term.value));
  } else if (term is Map<String, dynamic>) {
    final sortedKeys = term.keys.toList()..sort();
    return Map.fromEntries(
      sortedKeys.map((key) => MapEntry(key, sortObjectKeysAsc(term[key]))),
    );
  } else {
    return term;
  }
}

Map<String, dynamic> removeNullValues(Map<String, dynamic> json) {
  return json
      .map((key, value) {
        if (value is Map<String, dynamic>) {
          return MapEntry(key, removeNullValues(value));
        } else if (value is List) {
          return MapEntry(
            key,
            value
                .map((e) => e is Map<String, dynamic> ? removeNullValues(e) : e)
                .where((e) => e != null)
                .toList(),
          );
        } else {
          return MapEntry(key, value);
        }
      })
      .entries
      .where((e) => e.value != null)
      .toMap();
}

bool verifyArchethicKey(String key) {
  if (!isHex(key)) {
    return false;
  }

  // Convert the hexadecimal public key to a byte list
  final pubKeyBytes = hexToUint8List(key);

  // Check that the total length of the public key is sufficient to contain curve and origin information
  if (pubKeyBytes.length < 2) {
    return false;
  }

  final pubKeyBuf = pubKeyBytes.sublist(2, pubKeyBytes.length);

  // Determine the expected length of the public key based on the curve
  int lengthBytes;
  switch (pubKeyBytes[0]) {
    case 0:
      lengthBytes = 32;
      break;
    case 1:
    case 2:
      lengthBytes = 65;
      break;
    case 3:
      lengthBytes = 48;
      break;
    default:
      lengthBytes = -1;
  }

  // Check that the length of the public key matches the expected length
  if (lengthBytes == -1 || pubKeyBuf.lengthInBytes != lengthBytes) {
    return false;
  }

  // Check that the origin is either 0 or 1
  if (pubKeyBytes[1] != 0 && pubKeyBytes[1] != 1) {
    return false;
  }

  // If all checks pass, the public key is valid
  return true;
}

extension MapExtension<K, V> on Iterable<MapEntry<K, V>> {
  Map<K, V> toMap() => {for (final entry in this) entry.key: entry.value};
}
