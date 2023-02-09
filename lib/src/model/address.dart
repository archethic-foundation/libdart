import 'dart:typed_data';

import 'package:archethic_lib_dart/src/utils/utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pointycastle/export.dart' show Digest;

/// The [Address] scalar type represents a transaction's address.
/// The Address appears in a JSON response as Base16 formatted string.
/// The parsed address will be converted to a binary and any invalid address
/// with an invalid algorithm or invalid size will be rejected

part 'address.freezed.dart';

const kAddressLength = 68;
const kCurveType = <int>[0, 1, 2];
const kHashType = <int>[0, 1, 2, 3, 4];

class AddressJsonConverter extends JsonConverter<Address, String> {
  const AddressJsonConverter();
  @override
  Address fromJson(String json) => Address(address: json);
  @override
  String toJson(Address object) => object.address ?? '';
}

@freezed
class Address with _$Address {
  const factory Address({
    String? address,
  }) = _Address;
  const Address._();

  /// Verify the structure of an address
  /// @param {String} address to control
  bool isValid() {
    if (address == null) {
      return false;
    }
    if (address!.length != kAddressLength) {
      return false;
    }
    if (address!.length >= 4 && isHex(address!)) {
      final curveType = address!.substring(0, 2);
      if (curveType != '00' && curveType != '01' && curveType != '02') {
        return false;
      }
      var digestSize = 0;
      switch (address!.substring(2, 4)) {

        /// 00 = sha256
        case '00':
          digestSize = Digest('SHA-256').digestSize;
          break;

        /// 01 = sha512
        case '01':
          digestSize = Digest('SHA-512').digestSize;
          break;

        /// 02 = sha3-256
        case '02':
          digestSize = Digest('SHA3-256').digestSize;
          break;

        /// 03 = sha3-512
        case '03':
          digestSize = Digest('SHA3-512').digestSize;
          break;

        /// 04 = blake2b
        case '04':
          digestSize = Digest('Blake2b').digestSize;
          break;
        default:
          return false;
      }
      try {
        if (Uint8List.fromList(hexToUint8List(address!.substring(4))).length !=
            digestSize) {
          return false;
        } else {
          return true;
        }
      } catch (e) {
        return false;
      }
    } else {
      return false;
    }
  }
}
