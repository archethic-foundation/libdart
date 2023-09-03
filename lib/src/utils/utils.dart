/// SPDX-License-Identifier: AGPL-3.0-or-later

// Dart imports:
import 'dart:math';
import 'dart:typed_data' show Uint8List;

// Package imports:
import 'package:pinenacl/encoding.dart' show Base16Encoder;

/// Return the Initial Origin Private Key
const String kOriginPrivateKey =
    '01019280BDB84B8F8AEDBA205FE3552689964A5626EE2C60AA10E3BF22A91A036009';

/// Determines if a string is an hexadecimal
/// @param {String} inputString Potential hexadecimal string
bool isHex(String inputString) {
  final hexadecimal = RegExp(r'^([0-9A-Fa-f])*$');
  if (!hexadecimal.hasMatch(inputString)) {
    return false;
  }
  return true;
}

/// Encode an hexadecimal string into a Uint8List
/// @param {Uint8List} hexString Hexadecimal string
Uint8List hexToUint8List(String hexString) {
  final List<int> bytes = Base16Encoder.instance.decode(hexString);
  return Uint8List.fromList(bytes);
}

/// Encode an Uint8List into an hexadecimal string
/// @param {Uint8List} bytes Uint8List
String uint8ListToHex(Uint8List bytes) {
  return Base16Encoder.instance.encode(Uint8List.fromList(bytes));
}

/// Concat a list of Uint8List
/// @param {Array} arrays Uint8List
Uint8List concatUint8List(Iterable<Uint8List> list) =>
    Uint8List.fromList(list.expand((Uint8List element) => element).toList());

/// Convert any number into a big int for 10^8 decimals
/// @param {num} Number to convert
int toBigInt(num? number) {
  if (number == null) {
    return 0;
  }
  return (number * 100000000).round();
}

/// Convert big int of 10^8 decimals to any number
/// @param {int} Number to convert
num fromBigInt(int? number) {
  if (number == null) {
    return 0;
  }
  return number / 100000000;
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
