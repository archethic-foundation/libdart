/*
 * Determines if a string is an hexadecimal
 * @param {String} inputString Potential hexadecimal string
 */
import 'dart:typed_data';

import 'package:convert/convert.dart';
import 'package:pointycastle/pointycastle.dart';

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

BigInt? recoverFromSignature(
    int recId, ECSignature sig, Uint8List msg, ECDomainParameters params) {
  final n = params.n;
  final i = BigInt.from(recId ~/ 2);
  final x = sig.r + (i * n);

  //Parameter q of curve
  final prime = BigInt.parse(
      'fffffffffffffffffffffffffffffffffffffffffffffffffffffffefffffc2f',
      radix: 16);
  if (x.compareTo(prime) >= 0) return null;

  final R = _decompressKey(x, (recId & 1) == 1, params.curve);
  if (!(R! * n)!.isInfinity) return null;

  final e = decodeBigInt(msg);

  final eInv = (BigInt.zero - e) % n;
  final rInv = sig.r.modInverse(n);
  final srInv = (rInv * sig.s) % n;
  final eInvrInv = (rInv * eInv) % n;

  final q = (params.G * eInvrInv)! + (R * srInv);

  final bytes = q!.getEncoded(false);
  return decodeBigInt(bytes.sublist(1));
}

ECPoint? _decompressKey(BigInt xBN, bool yBit, ECCurve c) {
  List<int> x9IntegerToBytes(BigInt s, int qLength) {
    final bytes = encodeBigInt(s);

    if (qLength < bytes.length) {
      return bytes.sublist(0, bytes.length - qLength);
    } else if (qLength > bytes.length) {
      final tmp = List<int>.filled(qLength, 0);

      final offset = qLength - bytes.length;
      for (var i = 0; i < bytes.length; i++) {
        tmp[i + offset] = bytes[i];
      }

      return tmp;
    }

    return bytes;
  }

  final compEnc = x9IntegerToBytes(xBN, 1 + ((c.fieldSize + 7) ~/ 8));
  compEnc[0] = yBit ? 0x03 : 0x02;
  return c.decodePoint(compEnc);
}

Uint8List padUint8ListTo32(Uint8List data) {
  assert(data.length <= 32);
  if (data.length == 32) return data;

  // todo there must be a faster way to do this?
  return Uint8List(32)..setRange(32 - data.length, 32, data);
}
