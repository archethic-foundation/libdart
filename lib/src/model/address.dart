import 'package:archethic_lib_dart/src/utils/utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

/// The [Address] scalar type represents a transaction's address.
/// The Address appears in a JSON response as Base16 formatted string.
/// The parsed address will be converted to a binary and any invalid address
/// with an invalid algorithm or invalid size will be rejected

part 'address.freezed.dart';
part 'address.g.dart';

const kAddressLength = 68;
// TODO(reddwarf03): add control structure
const kCurveType = <int>[0, 1, 2];
const kHashType = <int>[0, 1, 2, 3, 4];

@freezed
class Address with _$Address {
  const factory Address({
    String? address,
  }) = _Address;
  const Address._();

  factory Address.fromJson(Map<String, dynamic> json) =>
      _$AddressFromJson(json);

  bool isConform() {
    if (address == null) {
      return false;
    }
    if (!isHex(address!)) {
      return false;
    }
    if (address!.length != kAddressLength) {
      return false;
    }
    return true;
  }
}
