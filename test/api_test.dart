library test.api_test;

// Package imports:
import 'package:archethic_lib_dart/src/model/transaction_fee.dart';
import 'package:archethic_lib_dart/src/utils/utils.dart';
import 'package:test/test.dart';

// Project imports:
import 'package:archethic_lib_dart/src/model/balance.dart';
import 'package:archethic_lib_dart/src/model/node.dart';
import 'package:archethic_lib_dart/src/model/transaction.dart';
import 'package:archethic_lib_dart/src/services/api_service.dart';

void main() {
  group('api', () {
    test('getTransactionIndex', () async {
      final Transaction transaction = await ApiService('http://localhost:4000')
          .getLastTransaction(
              '009D337E3557833E116750524738E07063256F27ECA993AF8011DAFE4E69A37A7D');
      expect(transaction.chainLength, 1);
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
      final Balance balance = await ApiService('http://localhost:4000')
          .fetchBalance(
              '00AE1C7EABBB5282B1DFEA4A330947D5D9A954F942700C28A06BCA8F2A1CDF800D');

      expect(
        balance.uco,
        0,
      );
    });

    test('getTransactionContent', () async {
      final String content = await ApiService('http://localhost:4000')
          .getTransactionContent(
              '00AE1C7EABBB5282B1DFEA4A330947D5D9A954F942700C28A06BCA8F2A1CDF800D');

      expect(
        content,
        'B0B116A90BBA010076A5A8A4B33AE08D325CD509D6DBEBD336364999D5357D6DD6392B07AD64E0EE0047304502207A6663334659C8FFB7695433B93D18EC5ECF487AB1CF2324573974028E5DBE71022100AB52E547E945B59EB850E586A0CFD2F1378938E8EAFFF8C9F283A607DC517B75',
      );
    });

    test('getTransactions', () async {
      final List<Transaction> transactionChain =
          await ApiService('http://localhost:4000').getTransactionChain(
              '009D337E3557833E116750524738E07063256F27ECA993AF8011DAFE4E69A37A7D',
              0);

      expect(
        transactionChain[0].address,
        '009D337E3557833E116750524738E07063256F27ECA993AF8011DAFE4E69A37A7D',
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

    test('getTransactionFees', () async {
      final Transaction tx = Transaction(
              address:
                  '009e059e8171643b959284fe542909f3b32198b8fc25b3e50447589b84341c1d67',
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
              '00b1d3750edb9381c96b1a975a55b5b4e4fb37bfab104c10b0b6c9a00433ec4646',
              toBigInt(10.03));
      TransactionFee transactionFee =
          await ApiService('http://localhost:4000').getTransactionFee(tx);
      expect(
        transactionFee.fee!,
        0.71883831,
      );
    });
  }, tags: ['noCI']);
}
