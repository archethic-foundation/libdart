/*
 * Determines if a string is an hexadecimal
 * @param {String} inputString Potential hexadecimal string
 */
import 'dart:typed_data' show Uint8List, ByteData, Endian;
import 'package:convert/convert.dart' show hex;

bool isHex(String inputString) {
  if (!RegExp('[0-9A-Fa-f]{6}').hasMatch(inputString)) {
    return false;
  }
  return true;
}

/*
 * Encode an hexadecimal string into a Uint8List
 * @param {Uint8List} hexString Hexadecimal string
 */
Uint8List hexToUint8List(String hexString) {
  final bytes = hex.decode(hexString);
  return Uint8List.fromList(bytes);
}

/*
 * Encode an Uint8List into an hexadecimal string
 * @param {Uint8List} bytes Uint8List
 */
String uint8ListToHex(Uint8List bytes) {
  return hex.encode(Uint8List.fromList(bytes));
}

/*
 * Concat a list of Uint8List
 * @param {Array} arrays Uint8List
 */
Uint8List concatUint8List(Iterable<Uint8List> list) =>
    Uint8List.fromList(list.expand((element) => element).toList());

/*
 * Encode a integer into a Uint8List (4 bytes)
 * @param {Number} number Number to encode
 */
Uint8List encodeInt32(int number) {
  return Uint8List(4)..buffer.asByteData().setInt32(0, number, Endian.big);
}

/*
 * Encode a big integer into a Uint8List (8 bytes)
 * @param {Number} number Number to encode
 */
Uint8List encodeBigInt(BigInt number) {
  var data = ByteData(8);
  var _bigInt = number;
  for (var i = 1; i <= data.lengthInBytes; i++) {
    data.setUint8(data.lengthInBytes - i, _bigInt.toUnsigned(8).toInt());
    _bigInt = _bigInt >> 8;
  }
  return data.buffer.asUint8List();
}

/*
 * Decode a BigInt from bytes in big-endian encoding.
 * @param {Uint8List} Uint8List to decode
 */
BigInt decodeBigInt(Uint8List bytes) {
  BigInt result = BigInt.from(0);
  //
  for (int i = 0; i < bytes.length; i++) {
    result += BigInt.from(bytes[bytes.length - i - 1]) << (8 * i);
  }
  return result;
}

/*
 * Encode a float into a Uint8List (8 bytes)
 * @param {Number} number Number to encode
 */
Uint8List encodeFloat64(double number) {
  var byteConvert = ByteData(8);
  byteConvert.setFloat64(0, number);
  return byteConvert.buffer.asUint8List();
}
