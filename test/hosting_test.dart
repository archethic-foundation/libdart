library test.hosting_test;

// Package imports:
import 'package:test/test.dart';

void main() {
  group(
    'archive test',
    () {
      /*test('should analyze Archive lib', () {
      //String endpoint = 'https://testnet.archethic.net';
      String endpoint = 'http://127.0.0.1:4000';
      String seed =
          '0edb9381c96b1a975a55b5b4e4fb37bfab104c10b0b6c9a00433ec4646';
      String address = crypto.deriveAddress(seed, 0);
      print('address: ' + address);
      final inputStream = InputFileStream('Archive.zip');
      final archive = ZipDecoder().decodeBuffer(inputStream);
      HostingService(endpoint).deployWebSite(
          seed,
          '01009280BDB84B8F8AEDBA205FE3552689964A5626EE2C60AA10E3BF22A91A036009',
          archive);
      expect(true, true);
    });*/
    },
    tags: <String>['noCI'],
  );
}
