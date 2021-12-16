library test.yubico_test;

import 'package:archethic_lib_dart/src/services/yubico_service.dart';
import 'package:test/test.dart';

void main() {
  group('yubicoService', () {
    test('verifySignatures', () async {
      final String responseStatus = await YubicoService().verifyYubiCloudOTP(
          'vvccccccccccgdulirvfblfevltutjnnvhvknucncrjjltkgt',
          'oxz9kqh4=',
          '1');
      expect(responseStatus, 'OK');
    });
  }, tags: <String>['noCI']);
}
