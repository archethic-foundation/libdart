library test.api_test;

// Package imports:
import 'package:archethic_lib_dart/src/model/transaction_input.dart';
import 'package:test/test.dart';

// Project imports:
import 'package:archethic_lib_dart/src/model/balance.dart';
import 'package:archethic_lib_dart/src/model/node.dart';
import 'package:archethic_lib_dart/src/model/transaction.dart';
import 'package:archethic_lib_dart/src/model/transaction_fee.dart';
import 'package:archethic_lib_dart/src/services/api_service.dart';
import 'package:archethic_lib_dart/src/utils/utils.dart';

void main() {
  group('api', () {
    test('getTransactionIndex', () async {
      final Map<String, int> transaction =
          await ApiService('http://localhost:4000').getTransactionIndex([
        '009D337E3557833E116750524738E07063256F27ECA993AF8011DAFE4E69A37A7D'
      ]);
      expect(transaction.values.first, 1);
    });

    test('getLastTransaction', () async {
      final Map<String, Transaction> transaction =
          await ApiService('http://localhost:4000').getLastTransaction([
        '009D337E3557833E116750524738E07063256F27ECA993AF8011DAFE4E69A37A7D'
      ]);
      expect(transaction.values.first, 1);
    });

    test('getStorageNoncePublicKey', () async {
      final String storageNoncePublicKey =
          await ApiService('http://localhost:4000').getStorageNoncePublicKey();

      expect(
        storageNoncePublicKey,
        '00004BA72C106818CC3A75961559CA03B10ECCFFCD6684062F4BE0355C153055595D',
      );
    });

    test('fetchBalance', () async {
      final Map<String, Balance> balanceMap =
          await ApiService('http://localhost:4000').fetchBalance([
        '00AE1C7EABBB5282B1DFEA4A330947D5D9A954F942700C28A06BCA8F2A1CDF800D'
      ]);

      expect(
        balanceMap[
                '_00AE1C7EABBB5282B1DFEA4A330947D5D9A954F942700C28A06BCA8F2A1CDF800D']!
            .uco,
        0,
      );
    });

    test('getTransactionContent', () async {
      final Map<String, String> contentMap =
          await ApiService('http://localhost:4000').getTransactionContent([
        '00AE1C7EABBB5282B1DFEA4A330947D5D9A954F942700C28A06BCA8F2A1CDF800D'
      ]);

      expect(
        contentMap[
            '_00AE1C7EABBB5282B1DFEA4A330947D5D9A954F942700C28A06BCA8F2A1CDF800D'],
        'B0B116A90BBA010076A5A8A4B33AE08D325CD509D6DBEBD336364999D5357D6DD6392B07AD64E0EE0047304502207A6663334659C8FFB7695433B93D18EC5ECF487AB1CF2324573974028E5DBE71022100AB52E547E945B59EB850E586A0CFD2F1378938E8EAFFF8C9F283A607DC517B75',
      );
    });

    test('getTransactions', () async {
      final Map<String, List<Transaction>> transactionChainList =
          await ApiService('https://mainnet.archethic.net')
              .getTransactionChain([
        '00002069A888AC669759D7415589AA5BDADDF556C2042C38C0C9F04C44041DA590E1',
        '0000D41D014920B1C9D8D207604F2C60AA3AB7728F11F93284A662A024508A99E92C'
      ]);

      expect(
        transactionChainList.keys.first,
        '00002069A888AC669759D7415589AA5BDADDF556C2042C38C0C9F04C44041DA590E1',
      );
    });

    test('getNodeList', () async {
      final List<Node> nodes =
          await ApiService('http://localhost:4000').getNodeList();

      expect(
        nodes[0].ip,
        '127.0.0.1',
      );
    });

    test('networkTransactions', () async {
      final List<Transaction> transactionsList =
          await ApiService('http://localhost:4000')
              .networkTransactions('oracle_summary', 1);

      expect(
        transactionsList[0].type,
        'oracle_summary',
      );
    });

    test('transactionInputs', () async {
      final Map<String, List<TransactionInput>> transactionInputsList =
          await ApiService('https://mainnet.archethic.net')
              .getTransactionInputs([
        '00002069A888AC669759D7415589AA5BDADDF556C2042C38C0C9F04C44041DA590E1',
        '0000D41D014920B1C9D8D207604F2C60AA3AB7728F11F93284A662A024508A99E92C'
      ]);

      expect(
        transactionInputsList.keys.first,
        '00002069A888AC669759D7415589AA5BDADDF556C2042C38C0C9F04C44041DA590E1',
      );
    });

    test('getTransactionFees', () async {
      final Transaction tx = Transaction(
              address:
                  '0000b426c48c85f7d04e3bb222dabc7e5aa17680c1932755cd7ad21f5d870c0c54f9',
              type: 'transfer',
              data: Transaction.initData(),
              originSignature:
                  '3045022024f8d254671af93f8b9c11b5a2781a4a7535d2e89bad69d6b1f142f8f4bcf489022100c364e10f5f846b2534a7ace4aeaa1b6c8cb674f842b9f8bc78225dfa61cabec6',
              previousPublicKey:
                  '000071e1b5d4b89eddf2322c69bbf1c5591f7361b24cb3c4c464f6b5eb688fe50f7a',
              previousSignature:
                  '9b209dd92c6caffbb5c39d12263f05baebc9fe3c36cb0f4dde04c96f1237b75a3a2973405c6d9d5e65d8a970a37bafea57b919febad46b0cceb04a7ffa4b6b00',
              version: 1)
          .addUCOTransfer(
              '0000b1d3750edb9381c96b1a975a55b5b4e4fb37bfab104c10b0b6c9a00433ec4646',
              toBigInt(10.03))
          .build('myseed', 0)
          .originSign(kOriginPrivateKey);
      final TransactionFee transactionFee =
          await ApiService('http://localhost:4000').getTransactionFee(tx);
      expect(
        transactionFee.fee!.toStringAsPrecision(2),
        '0.17',
      );
    });

    test('addOriginKey', () async {
      final String json = await ApiService('http://localhost:4000').addOriginKey(
          originPublicKey:
              '010104AB41291F847A601055AEDD1AF24FF76FA970D6441E2DCA3818A8319B004C96B27B8FEB1DA31A044BA0A4800B4353359735719EBB3A05F98393A9CC599C3FAFD6',
          certificate: '0x');
      expect(
        true,
        true,
      );
    });
  }, tags: <String>['noCI']);
}
