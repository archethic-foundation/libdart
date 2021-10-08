library test.api_test;

// Package imports:
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
  }, tags: ['noCI']);
}
