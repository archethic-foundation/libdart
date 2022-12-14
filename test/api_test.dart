library test.api_test;

import 'package:archethic_lib_dart/src/model/address.dart';
import 'package:archethic_lib_dart/src/model/transaction.dart';
import 'package:archethic_lib_dart/src/services/api_service.dart';
import 'package:archethic_lib_dart/src/utils/utils.dart';
import 'package:test/test.dart';

void main() {
  group(
    'api',
    () {
      test('getTransactionIndex', () async {
        final transaction = await ApiService('http://localhost:4000')
            .getTransactionIndex([
          '000068A9CC4F77F39C3CAAB4B38302B1ED61117BFD6F937FF9892599F5C78E893B4D'
        ]);
        expect(
          transaction[
              '000068A9CC4F77F39C3CAAB4B38302B1ED61117BFD6F937FF9892599F5C78E893B4D'],
          1,
        );
      });

      test('getLastTransaction', () async {
        final transaction = await ApiService('http://localhost:4000')
            .getLastTransaction([
          '000068A9CC4F77F39C3CAAB4B38302B1ED61117BFD6F937FF9892599F5C78E893B4D'
        ]);
        expect(
          transaction[
                  '000068A9CC4F77F39C3CAAB4B38302B1ED61117BFD6F937FF9892599F5C78E893B4D']!
              .chainLength,
          1,
        );
      });

      test('getStorageNoncePublicKey', () async {
        final storageNoncePublicKey = await ApiService('http://localhost:4000')
            .getStorageNoncePublicKey();

        expect(
          storageNoncePublicKey,
          '00008D6D0FD165FEF6966E4E6ACE0DDF2A9CA4E24F5ADBFF5CFB370B477A058DB769',
        );
      });

      test('fetchBalance', () async {
        final balanceMap = await ApiService('http://localhost:4000')
            .fetchBalance([
          '000068A9CC4F77F39C3CAAB4B38302B1ED61117BFD6F937FF9892599F5C78E893B4D'
        ]);

        expect(
          balanceMap[
                  '000068A9CC4F77F39C3CAAB4B38302B1ED61117BFD6F937FF9892599F5C78E893B4D']!
              .uco,
          999989992279095,
        );
      });

      test('getTransactionContent', () async {
        final contentMap = await ApiService('http://localhost:4000')
            .getTransactionContent({
          '0000B06B97CD3F7CFCD7815ADA2BAEC2D207EBA44E6344AD3EB15F5815A04D74C0CD':
              ''
        });

        expect(
          contentMap[
              '0000B06B97CD3F7CFCD7815ADA2BAEC2D207EBA44E6344AD3EB15F5815A04D74C0CD'],
          '{"uco":{"eur":0.122813,"usd":0.129662}}',
        );
      });

      test('getTransactions', () async {
        final transactionChainListMap =
            await ApiService('http://localhost:4000').getTransactionChain({
          '00008D6D0FD165FEF6966E4E6ACE0DDF2A9CA4E24F5ADBFF5CFB370B477A058DB769':
              '',
          '0000D41D014920B1C9D8D207604F2C60AA3AB7728F11F93284A662A024508A99E92C':
              ''
        });

        expect(
          transactionChainListMap.keys.first,
          '00008D6D0FD165FEF6966E4E6ACE0DDF2A9CA4E24F5ADBFF5CFB370B477A058DB769',
        );
      });

      test('getNodeList', () async {
        final nodes = await ApiService('http://localhost:4000').getNodeList();

        expect(
          nodes[0].ip,
          '127.0.0.1',
        );
      });

      test('networkTransactions', () async {
        final transactionsList = await ApiService('http://localhost:4000')
            .networkTransactions('oracle_summary', 1);

        expect(
          transactionsList[0].type,
          'oracle_summary',
        );
      });

      test('transactionInputs', () async {
        final transactionInputsList =
            await ApiService('http://localhost:4000').getTransactionInputs([
          '00008D6D0FD165FEF6966E4E6ACE0DDF2A9CA4E24F5ADBFF5CFB370B477A058DB769',
          '0000D41D014920B1C9D8D207604F2C60AA3AB7728F11F93284A662A024508A99E92C'
        ]);

        expect(
          transactionInputsList.keys.first,
          '00008D6D0FD165FEF6966E4E6ACE0DDF2A9CA4E24F5ADBFF5CFB370B477A058DB769',
        );
      });

      test('getTransactionFees', () async {
        final tx = Transaction(
          address: const Address(
            address:
                '0000b426c48c85f7d04e3bb222dabc7e5aa17680c1932755cd7ad21f5d870c0c54f9',
          ),
          type: 'transfer',
          data: Transaction.initData(),
          originSignature:
              '3045022024f8d254671af93f8b9c11b5a2781a4a7535d2e89bad69d6b1f142f8f4bcf489022100c364e10f5f846b2534a7ace4aeaa1b6c8cb674f842b9f8bc78225dfa61cabec6',
          previousPublicKey:
              '000071e1b5d4b89eddf2322c69bbf1c5591f7361b24cb3c4c464f6b5eb688fe50f7a',
          previousSignature:
              '9b209dd92c6caffbb5c39d12263f05baebc9fe3c36cb0f4dde04c96f1237b75a3a2973405c6d9d5e65d8a970a37bafea57b919febad46b0cceb04a7ffa4b6b00',
        )
            .addUCOTransfer(
              '0000b1d3750edb9381c96b1a975a55b5b4e4fb37bfab104c10b0b6c9a00433ec4646',
              toBigInt(10.03),
            )
            .build('myseed', 0)
            .originSign(kOriginPrivateKey);
        final transactionFee =
            await ApiService('http://localhost:4000').getTransactionFee(tx);
        expect(
          transactionFee.fee!.toStringAsPrecision(2),
          '0.17',
        );
      });

      test('addOriginKey', () async {
        await ApiService('http://localhost:4000').addOriginKey(
          originPublicKey:
              '010104AB41291F847A601055AEDD1AF24FF76FA970D6441E2DCA3818A8319B004C96B27B8FEB1DA31A044BA0A4800B4353359735719EBB3A05F98393A9CC599C3FAFD6',
          certificate: '0x',
        );
        expect(
          true,
          true,
        );
      });
    },
    tags: <String>['noCI'],
  );
}
