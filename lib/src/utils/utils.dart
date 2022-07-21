/// SPDX-License-Identifier: AGPL-3.0-or-later

// Dart imports:
import 'dart:math';
import 'dart:typed_data' show Uint8List, Endian;

// Package imports:
import 'package:pinenacl/encoding.dart' show Base16Encoder;

/// Return the Initial Origin Private Key
const String kOriginPrivateKey =
    '01019280BDB84B8F8AEDBA205FE3552689964A5626EE2C60AA10E3BF22A91A036009';

/// Determines if a string is an hexadecimal
/// @param {String} inputString Potential hexadecimal string
bool isHex(String inputString) {
  final RegExp hexadecimal = RegExp(r'^[0-9a-fA-F]+$');
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

/// Encode a integer into a Uint8List (4 bytes)
/// @param {Number} number Number to encode
Uint8List encodeInt32(int number) {
  return Uint8List(4)..buffer.asByteData().setInt32(0, number, Endian.big);
}

/// Encode a BigInt into bytes using big-endian encoding.
/// It encodes the integer to a minimal twos-compliment integer as defined by
/// ASN.1 (8 bytes)
/// @param {Number} number Number to encode
Uint8List encodeBigInt(BigInt number) {
  final BigInt byteMask = BigInt.from(0xff);
  final Uint8List result = Uint8List(8);
  BigInt work = number;
  // big-endian
  for (int i = 0; i < 8; i++) {
    result[8 - i - 1] = (work & byteMask).toInt();
    work = work >> 8;
  }
  return result;
}

/// Decode a BigInt from bytes in big-endian encoding.
/// @param {Uint8List} Uint8List to decode
BigInt decodeBigInt(Uint8List bytes) {
  BigInt result = BigInt.from(0);
  //
  for (int i = 0; i < bytes.length; i++) {
    result += BigInt.from(bytes[bytes.length - i - 1]) << (8 * i);
  }
  return result;
}

/// Convert any number into a big int for 10^8 decimals
/// @param {BigInt} Number to convert
BigInt toBigInt(double? number) {
  if (number == null) {
    return BigInt.from(0);
  }
  number = number * pow(10, 8);
  return BigInt.from(number.toInt());
}

/// Convert any number into a byte array
Uint8List toByteArray(int value) {
  final BigInt byteMask = BigInt.from(0xff);
  BigInt number = BigInt.from(value);
  // Not handling negative numbers. Decide how you want to do that.
  final int size = (number.bitLength + 7) >> 3;
  if (size == 0) {
    return Uint8List.fromList([0]);
  }

  Uint8List result = Uint8List(size);
  for (int i = 0; i < size; i++) {
    result[size - i - 1] = (number & byteMask).toInt();
    number = number >> 8;
  }
  return result;
}
