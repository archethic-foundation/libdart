//  Copyright © 2020 ZeroPass. All rights reserved.
import 'dart:typed_data';
import 'package:archethic_lib_dart/src/iso7816/extension/uint8list_apis.dart';
import 'package:archethic_lib_dart/src/iso7816/extension/int_apis.dart';

/// Class defines ISO/IEC 7816-4 response APDU
class ResponseAPDU {
  ResponseAPDU(this._sw, this._data);

  ResponseAPDU.fromBytes(final Uint8List apduBytes) {
    if (apduBytes == null) {
      throw ArgumentError.notNull('apduBytes');
    }
    if (apduBytes.length < 2) {
      throw ArgumentError('Invalid raw response APDU length');
    }

    if (apduBytes.length > 2) {
      _data = apduBytes.sublist(0, apduBytes.length - 2);
    }

    _sw = StatusWord.fromBytes(apduBytes, apduBytes.length - 2);
  }

  StatusWord? _sw;
  Uint8List? _data;

  StatusWord get status => _sw!;
  Uint8List get data => _data!;

  Uint8List toBytes() =>
      Uint8List.fromList((_data ?? Uint8List(0)) + _sw!.toBytes());
  String toString() => '$status data=${_data?.hex()}';
}

/// Class represents trailer status bytes of ISO/IEC 7816-4 response APDU.
class StatusWord {
  final int sw1;
  final int sw2;

  // Defined in ISO/IEC 7816-4 Figure 7 - Structural scheme of status bytes

  // Warnings
  static const StatusWord noInformationGiven = StatusWord(sw1: 0x62, sw2: 0x00);
  static const StatusWord possibleCorruptedData =
      StatusWord(sw1: 0x62, sw2: 0x81);
  static const StatusWord unexpectedEOF = StatusWord(sw1: 0x62, sw2: 0x82);
  static const StatusWord selectedFileInvalidated =
      StatusWord(sw1: 0x62, sw2: 0x83);
  static const StatusWord wrongFCIFormat = StatusWord(sw1: 0x62, sw2: 0x84);

  // Errors
  static const StatusWord wrongLength = StatusWord(sw1: 0x67, sw2: 0x00);
  static const StatusWord claFunctionNotSupported =
      StatusWord(sw1: 0x68, sw2: 0x00);
  static const StatusWord logicalChannelNotSupported =
      StatusWord(sw1: 0x68, sw2: 0x81);
  static const StatusWord secureMessagingNotSupported =
      StatusWord(sw1: 0x68, sw2: 0x82);
  static const StatusWord commandNotAllowed = StatusWord(sw1: 0x69, sw2: 0x00);
  static const StatusWord incompatibleFileStructureCommand =
      StatusWord(sw1: 0x69, sw2: 0x81);
  static const StatusWord securityStatusNotSatisfied =
      StatusWord(sw1: 0x69, sw2: 0x82);
  static const StatusWord authenticationMethodBlocked =
      StatusWord(sw1: 0x69, sw2: 0x83);
  static const StatusWord referencedDataInvalidated =
      StatusWord(sw1: 0x69, sw2: 0x84);
  static const StatusWord conditionsNotSatisfied =
      StatusWord(sw1: 0x69, sw2: 0x85);
  static const StatusWord commandNotAllowedNoEF =
      StatusWord(sw1: 0x69, sw2: 0x86);
  static const StatusWord smDataMissing = StatusWord(sw1: 0x69, sw2: 0x87);
  static const StatusWord smDataInvalid = StatusWord(sw1: 0x69, sw2: 0x88);
  static const StatusWord wrongParameters = StatusWord(sw1: 0x6A, sw2: 0x00);
  static const StatusWord invalidDataFieldParameters =
      StatusWord(sw1: 0x6A, sw2: 0x80);
  static const StatusWord notSupported = StatusWord(sw1: 0x6A, sw2: 0x81);
  static const StatusWord fileNotFound = StatusWord(sw1: 0x6A, sw2: 0x82);
  static const StatusWord recordNotFound = StatusWord(sw1: 0x6A, sw2: 0x83);
  static const StatusWord notEnoughSpaceInFile =
      StatusWord(sw1: 0x6A, sw2: 0x84);
  static const StatusWord lcInconsistentWithTLV =
      StatusWord(sw1: 0x6A, sw2: 0x85);
  static const StatusWord incorrectParameters =
      StatusWord(sw1: 0x6A, sw2: 0x86);
  static const StatusWord lcInconsistentWithParameters =
      StatusWord(sw1: 0x6A, sw2: 0x87);
  static const StatusWord referencedDataNotFound =
      StatusWord(sw1: 0x6A, sw2: 0x88);
  static const StatusWord wrongParameters2 = StatusWord(sw1: 0x6B, sw2: 0x00);
  static const StatusWord invalidInstructionCode =
      StatusWord(sw1: 0x6D, sw2: 0x00);
  static const StatusWord classNotSupported = StatusWord(sw1: 0x6E, sw2: 0x00);
  static const StatusWord noPreciseDiagnostics =
      StatusWord(sw1: 0x6F, sw2: 0x00);
  static const int sw1WrongLengthWithExactLength =
      0x6C; // An error incicating wrong length (wrong Le field), sw2 indicates the exact length

  // Normal processing - success
  static const StatusWord success = StatusWord(sw1: 0x90, sw2: 0x00);
  static const int sw1SuccessWithRemainingBytes =
      0x61; // This is considered as normal status e.g. success.
  // SW2 indicates a number of extra data bytes still available.
  // Can be returned by GET RESPONSE command (ISO 7816-4 section 7)

  static StatusWord remainingAvailableResponseBytes(int numBytes) {
    return StatusWord(
        sw1: sw1SuccessWithRemainingBytes, sw2: numBytes); // Normal execution
  }

  static StatusWord leWrongLength(int exactLength) {
    // Indicates wrong length of Le field. SW2 SW2 indicates the exact length.
    return StatusWord(sw1: sw1WrongLengthWithExactLength, sw2: exactLength);
  }

  int get value {
    return ByteData.view(toBytes().buffer).getUint16(0);
  }

  const StatusWord({required this.sw1, required this.sw2})
      : assert(sw1 < 256),
        assert(sw2 < 256);

  static StatusWord fromBytes(Uint8List data, [int offset = 0]) {
    if (data.length < 2) {
      throw ArgumentError.value(data, 'data', 'Argument length too small');
    }
    if (data.length - offset < 2) {
      throw ArgumentError.value(offset, 'offset', 'Argument out of bounds');
    }

    return StatusWord(sw1: data[offset], sw2: data[offset + 1]);
  }

  bool isSuccess() {
    return this == success || sw1 == sw1SuccessWithRemainingBytes;
  }

  bool isWarning() {
    return sw1 >= 0x62 && sw1 <= 0x63;
  }

  bool isError() {
    return sw1 >= 0x64 && sw1 != 0x90;
  }

  /*@override
  bool operator ==(rhs) {
    return sw1 == rhs.sw1 && sw2 == rhs.sw2;
  }*/

  @override
  int get hashCode => (sw1 << 8) + sw2;

  Uint8List toBytes() {
    return Uint8List.fromList(<int>[sw1, sw2]);
  }

  @override
  String toString() {
    return 'sw=${value.hex()}';
  }

  String description() {
    // ignore: case_expression_type_implements_equals
    switch (this) {
      case noInformationGiven:
        return 'No information given';
      case possibleCorruptedData:
        return 'Part of returned data my be corrupted';
      case unexpectedEOF:
        return 'End of file reached before reading Le bytes';
      case selectedFileInvalidated:
        return 'Selected file invalidated';
      case wrongFCIFormat:
        return 'FCI not formatted according to 5.1.5';
      case wrongLength:
        return 'Wrong length (e.g. wrong Le field)';
      case claFunctionNotSupported:
        return 'Functions in CLA not support';
      case logicalChannelNotSupported:
        return 'Logical channel not supported';
      case secureMessagingNotSupported:
        return 'Secure messaging not supported';
      case commandNotAllowed:
        return 'Command not allowed';
      case incompatibleFileStructureCommand:
        return 'Command incompatible with file structure';
      case securityStatusNotSatisfied:
        return 'Security status not satisfied';
      case authenticationMethodBlocked:
        return 'Authentication method blocked';
      case referencedDataInvalidated:
        return 'Referenced data invalidated';
      case conditionsNotSatisfied:
        return 'Conditions of use not satisfied';
      case commandNotAllowedNoEF:
        return 'Command not allowed (no current EF)';
      case smDataMissing:
        return 'Expected SM data objects missing'; // SM - Secure messaging
      case smDataInvalid:
        return 'SM data objects incorrect'; // SM - Secure messaging
      case wrongParameters:
        return 'Wrong parameter(s) P1-P2';
      case invalidDataFieldParameters:
        return 'Incorrect parameters in the data field';
      case notSupported:
        return 'Function not supported';
      case fileNotFound:
        return 'File not found';
      case recordNotFound:
        return 'Record not found';
      case notEnoughSpaceInFile:
        return 'Not enough memory space in the file';
      case lcInconsistentWithTLV:
        return 'Lc inconsistent with TLV structure';
      case incorrectParameters:
        return 'Incorrect parameters P1-P2';
      case lcInconsistentWithParameters:
        return 'Lc inconsistent with P1-P2';
      case referencedDataNotFound:
        return 'Referenced data not found';
      case wrongParameters2:
        return 'Wrong parameter(s) P1-P2';
      case invalidInstructionCode:
        return 'Instruction code not supported or invalid';
      case classNotSupported:
        return 'Class not supported';
      case noPreciseDiagnostics:
        return 'No precise diagnosis';
      case success:
        return 'Success';
      default:
        {
          if (sw1 == sw1WrongLengthWithExactLength) {
            // Wrong length (wrong Le field: 'XX' indicates the exact length).
            return 'Wrong length (exact length: $sw2)';
          } else if (sw1 == sw1SuccessWithRemainingBytes) {
            // SW2 indicates the number of response bytes still available
            return '$sw2 byte(s) are still available';
          }
          return toString();
        }
    }
  }
}
