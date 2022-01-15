// Package imports:
import 'package:test/test.dart';

// Project imports:
import 'package:archethic_lib_dart/src/iso7816/command_apdu.dart';
import 'package:archethic_lib_dart/src/iso7816/extension/string_apis.dart';

void main() {
  test('Command APDU test', () {
    // Get ArchEthic Account Address
    expect(CommandAPDU(cla: 0xe0, ins: 0x04, p1: 0, p2: 0).toBytes(),
        "e0040000".parseHex());
  });
}
