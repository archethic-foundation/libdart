library test.address_test;

// Package imports:
import 'package:test/test.dart';

// Project imports:
import 'package:archethic_lib_dart/src/services/address_service.dart';

void main() {
  group('Address', () {
    group('deriveAddress', () {
      test('should derive a address by using a seed and index', () {
        expect(AddressService('').deriveAddress('mysuperseed', 0),
            '0096d8b2047ba29d617ba2d29076fb6995f33543e01f350e8828e75794bc7c0217');
      });
    });
    group('deriveAddressCurvePrepended', () {
      test(
          'should derive address with default curve i.e ed25519 prepended by using seed and index',
          () {
        expect(
            AddressService('')
                .deriveAddress('mysuperseed', 0, curve: 'ed25519'),
            '00005154a2d9110f4230b60ee833ce8ec0dff7e88d4c8e66c2323a756649fcdcfa6d');
      });
      test(
          'should derive address with Nist-P256 curve prepended by using seed and index',
          () {
        expect(
            AddressService('').deriveAddress('mysuperseed', 0,
                curve: 'secp256k1', hashAlgo: 'sha256'),
            '00005154a2d9110f4230b60ee833ce8ec0dff7e88d4c8e66c2323a756649fcdcfa6d');
      });
      test(
          'should derive address with secp256k1 curve prepended by using seed and index',
          () {
        expect(
            AddressService('').deriveAddress('mysuperseed', 0,
                curve: 'P256', hashAlgo: 'sha256'),
            '010096d8b2047ba29d617ba2d29076fb6995f33543e01f350e8828e75794bc7c0217');
      });
    });
  }, tags: ['noCI']);
}
