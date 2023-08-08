library test.api_test;

import 'package:archethic_lib_dart/archethic_lib_dart.dart';
import 'package:archethic_lib_dart/src/model/address.dart';
import 'package:archethic_lib_dart/src/model/smart_contracts/sm_call_function_request.dart';
import 'package:archethic_lib_dart/src/model/transaction.dart';
import 'package:archethic_lib_dart/src/services/api_service.dart';
import 'package:archethic_lib_dart/src/utils/utils.dart';
import 'package:test/test.dart';

void main() {
  group(
    'api',
    () {
      test('getTransactionIndex', () async {
        final transaction = await ApiService('https://mainnet.archethic.net')
            .getTransactionIndex([
          '000022372EFF37915F6CAE040A4DE3C8BB37863CB9531F314F404CB61B6C17CB7CD6'
        ]);
        expect(
          transaction[
              '000022372EFF37915F6CAE040A4DE3C8BB37863CB9531F314F404CB61B6C17CB7CD6'],
          1,
        );
      });

      test('getLastTransaction', () async {
        final transaction = await ApiService('https://mainnet.archethic.net')
            .getLastTransaction([
          '000022372EFF37915F6CAE040A4DE3C8BB37863CB9531F314F404CB61B6C17CB7CD6'
        ]);
        expect(
          transaction[
                  '000022372EFF37915F6CAE040A4DE3C8BB37863CB9531F314F404CB61B6C17CB7CD6']!
              .chainLength,
          1,
        );
      });

      test('getStorageNoncePublicKey', () async {
        final storageNoncePublicKey =
            await ApiService('https://mainnet.archethic.net')
                .getStorageNoncePublicKey();

        expect(
          storageNoncePublicKey,
          '000122A6CD9ED07E46835D6E88E5BD0BEE84C3F5E5DBF8E916AD9B2EC912C44AFEC2',
        );
      });

      test('fetchBalance', () async {
        final balanceMap = await ApiService('https://mainnet.archethic.net')
            .fetchBalance([
          '00006089F9810A02F22B0CB12DDD2468CAF538AEBE7BB8C168B23FC52769EEC94CFD'
        ]);

        expect(
          balanceMap[
                  '00006089F9810A02F22B0CB12DDD2468CAF538AEBE7BB8C168B23FC52769EEC94CFD']!
              .uco,
          999989992279095,
        );
      });

      test('getTransactionContent', () async {
        final contentMap = await ApiService('https://mainnet.archethic.net')
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
            await ApiService('https://mainnet.archethic.net')
                .getTransactionChain({
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
        final nodes =
            await ApiService('https://mainnet.archethic.net').getNodeList();

        expect(
          nodes[0].ip,
          '188.166.234.20',
        );
      });

      test('networkTransactions', () async {
        final transactionsList =
            await ApiService('https://mainnet.archethic.net')
                .networkTransactions('oracle_summary', 1);

        expect(
          transactionsList[0].type,
          'oracle_summary',
        );
      });

      test('transactionInputs', () async {
        final transactionInputsList =
            await ApiService('https://mainnet.archethic.net')
                .getTransactionInputs([
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
            .build('myseed', 0, isSeedHexa: false)
            .originSign(kOriginPrivateKey);
        final transactionFee =
            await ApiService('http://localhost:4000').getTransactionFee(tx);
        expect(
          transactionFee.fee!.toStringAsPrecision(2),
          18000000.toStringAsPrecision(2),
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

      test('getNearestEndpoints', () async {
        final endpoints = await ApiService('https://mainnet.archethic.net')
            .getNearestEndpoints();

        expect(
          endpoints[0].ip,
          '46.101.13.189',
        );
      });

      test('getToken', () async {
        final tokensMap = await ApiService('https://mainnet.archethic.net')
            .getToken([
          '0000260d70b23efc72ce7be2a7da00a0e2eeaa6b39bd3b6e39e5a6bc600303177ef6'
        ]);
        final token = tokensMap[
            '0000260d70b23efc72ce7be2a7da00a0e2eeaa6b39bd3b6e39e5a6bc600303177ef6'];

        expect(
          token!.collection.length,
          6765,
        );
        expect(
          token.decimals,
          8,
        );
      });

      test('getGenesisAddress', () async {
        final genesisAddress =
            await ApiService('https://mainnet.archethic.net').getGenesisAddress(
          '000028EA842DFEB23513DB55329495635B547AB8E2AC11860A0C7231E225FCF6FECA',
        );

        expect(
          genesisAddress.address,
          '00006586369937206500EDB352063A6E5D5CF1650B9AAB89F453825F53EF8E44DEE3',
        );
      });

      test('callSMFunction', () async {
        final smCallFunctionResponse =
            await ApiService('http://127.0.0.1:4000').callSMFunction(
          jsonRPCRequest: SMCallFunctionRequest(
            method: 'contract_fun',
            params: SMCallFunctionParams(
              contract:
                  '0000a9f3bc500d0ed7d923e983eafc080113633456f53c400814e1d4f34c5fa67220',
              function: 'get_chargeable_htlc',
              args: [
                1692394056,
                '0000a3b7b1d4830a09a5459cb24db36c3d791f337260a11892b5e2e9c382da577f7a',
                '000085f677b365906a5103959e5fa289622b22ed93062b65120b55133da78242ae3e',
                '4BC2DA9ABC1B5667529E3C35141026CB1E1A6DD0376E871C77D2824164F696EF',
                'UCO',
                4.56
              ],
            ),
          ),
        );

        expect(
          smCallFunctionResponse.startsWith(
            '@version 1',
          ),
          true,
        );
      });

      test('callSMFunctionError', () async {
        try {
          await ApiService('http://127.0.0.1:4000').callSMFunction(
            jsonRPCRequest: SMCallFunctionRequest(
              method: 'contract_fun',
              params: SMCallFunctionParams(
                contract:
                    '0000a9f3bc500d0ed7d923e983eafc080113633456f53c400814e1d4f34c5fa67220',
                function: 'get_chargeable_htlc',
                args: [
                  '0000a3b7b1d4830a09a5459cb24db36c3d791f337260a11892b5e2e9c382da577f7a',
                  '000085f677b365906a5103959e5fa289622b22ed93062b65120b55133da78242ae3e',
                  '4BC2DA9ABC1B5667529E3C35141026CB1E1A6DD0376E871C77D2824164F696EF',
                  'UCO',
                  4.56
                ],
              ),
            ),
          );
        } catch (e) {
          if (e is ArchethicJsonRPCException) {
            expect(
              e.code,
              252,
            );
          }
        }
      });
    },
    tags: <String>['noCI'],
  );
}
