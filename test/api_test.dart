import 'dart:developer';

import 'package:archethic_lib_dart/archethic_lib_dart.dart';
import 'package:test/test.dart';

import 'utils.dart';

void main() {
  group(
    'api',
    tags: <String>[TestTags.integration],
    () {
      test('getTransactionIndex', () async {
        final transaction = await ApiService('https://mainnet.archethic.net')
            .getTransactionIndex([
          '000022372EFF37915F6CAE040A4DE3C8BB37863CB9531F314F404CB61B6C17CB7CD6',
        ]);
        expect(
          transaction[
              '000022372EFF37915F6CAE040A4DE3C8BB37863CB9531F314F404CB61B6C17CB7CD6'],
          1,
        );
      });

      test(
          'getTransaction with unnamed recipient action should retrieve recipients addresses',
          () async {
        const txAddress =
            '0000C1ECB1CA7DDBD9786034ABCB4D379CAD267083078299B624FBB4C36D67812F57';
        final transaction =
            await ApiService('https://testnet.archethic.net').getTransaction([
          txAddress,
        ]);
        final tx = transaction[txAddress];
        expect(
          tx?.data?.recipients,
          [
            const Recipient(
              address:
                  '00000E7C4C2EB7A16DA0A15811317FA828D162122AD79E1356550E5ED19CF559BF3F',
            ),
          ],
        );
      });

      test(
          'getTransaction with named recipient action should retrieve recipients addresses, action and args',
          () async {
        const txAddress =
            '0000DD96605B92999936E6407FC450BA782F25A3DF027151191643E042C9E5E2E5B9';
        final transaction =
            await ApiService('https://testnet.archethic.net').getTransaction([
          txAddress,
        ]);
        final tx = transaction[txAddress];
        expect(
          tx?.data?.recipients,
          [
            const Recipient(
              address:
                  '000066E515A27E40AC5E668284449566ACE127D9D70E06F84A6E07FBBED3F4BAB2F6',
              action: 'hello_world',
              args: [],
            ),
          ],
        );
      });

      test('getLastTransaction', () async {
        final transaction = await ApiService('https://mainnet.archethic.net')
            .getLastTransaction([
          '000022372EFF37915F6CAE040A4DE3C8BB37863CB9531F314F404CB61B6C17CB7CD6',
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
        final balanceMap =
            await ApiService('https://testnet.archethic.net').fetchBalance([
          '0000ce09251f97c629cba7940e7a860488d60c02ddb47eaa43df30e37f06b9e34f9d',
        ]);

        expect(
          balanceMap[
                  '0000ce09251f97c629cba7940e7a860488d60c02ddb47eaa43df30e37f06b9e34f9d']!
              .uco,
          10000000000,
        );
      });

      test('getTransactionContent', () async {
        final contentMap = await ApiService('https://testnet.archethic.net')
            .getTransactionContent(
          [
            '0000C85F189C13846ED91FFE30B08EF3B0E009780DAEEF4581F8B3D717D99CC954C0',
          ],
        );

        expect(
          contentMap[
              '0000C85F189C13846ED91FFE30B08EF3B0E009780DAEEF4581F8B3D717D99CC954C0'],
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
              '',
        });

        expect(
          transactionChainListMap.keys.first,
          '00008D6D0FD165FEF6966E4E6ACE0DDF2A9CA4E24F5ADBFF5CFB370B477A058DB769',
        );
      });

      test('getTransactions with criteria', () async {
        final transactionChainListMap = await ApiService(
          'https://testnet.archethic.net',
        ).getTransactionChain(
          {
            '0000CE4172B09BD96E63BD64ABC758ED502D25EEDA16CA11764B58BFCC9155189E16':
                '',
          },
          fromCriteria: 1733849607,
        );

        expect(
          transactionChainListMap.values.first[0].address!.address!
              .toUpperCase(),
          '0000B88C609B25876633F3CDB5809E2B9396FF8A5DC5150D6925ADE9F0EDC4D8D3F5',
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
            await ApiService('https://testnet.archethic.net')
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
          '0000D41D014920B1C9D8D207604F2C60AA3AB7728F11F93284A662A024508A99E92C',
        ]);

        expect(
          transactionInputsList.keys.first,
          '00008D6D0FD165FEF6966E4E6ACE0DDF2A9CA4E24F5ADBFF5CFB370B477A058DB769',
        );
      });

      test('getTransactionFees', () async {
        final apiService = ApiService('https://testnet.archethic.net');
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
            .transaction
            .originSign(kOriginPrivateKey);
        final transactionFee = await apiService.getTransactionFee(tx);
        expect(
          transactionFee.fee,
          greaterThan(0),
        );
      });

      // test('addOriginKey', () async {
      //   await ApiService('https://testnet.archethic.net').addOriginKey(
      //     originPublicKey:
      //         '010104AB41291F847A601055AEDD1AF24FF76FA970D6441E2DCA3818A8319B004C96B27B8FEB1DA31A044BA0A4800B4353359735719EBB3A05F98393A9CC599C3FAFD6',
      //     certificate: '0x',
      //   );
      //   expect(
      //     true,
      //     true,
      //   );
      // });

      test('getNearestEndpoints', () async {
        final endpoints = await ApiService('https://mainnet.archethic.net')
            .getNearestEndpoints();

        expect(
          endpoints[0].ip,
          isValidIPAddress(),
        );
      });

      test('getToken', () async {
        final tokensMap =
            await ApiService('https://mainnet.archethic.net').getToken([
          '0000260d70b23efc72ce7be2a7da00a0e2eeaa6b39bd3b6e39e5a6bc600303177ef6',
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

      test('getBlockchainVersion', () async {
        final blockchainVersionModel =
            await ApiService('https://mainnet.archethic.net')
                .getBlockchainVersion();

        expect(
          blockchainVersionModel.version.transaction,
          '3',
        );
      });

      test('callSCFunction', () async {
        final smCallFunctionResponse =
            await ApiService('https://testnet.archethic.net').callSCFunction(
          jsonRPCRequest: SCCallFunctionRequest(
            method: 'contract_fun',
            params: SCCallFunctionParams(
              contract:
                  '000066CD867DA536A73D39CF05174387923358DC0009A29CC7162D4AED00675DAB55'
                      .toUpperCase(),
              function: 'get_pool_list',
              args: [],
            ),
          ),
        );
        log('smCallFunctionResponse: $smCallFunctionResponse');

        expect(
          true,
          true,
        );
      });

      test('callSCFunctionWithResolveLastFalse', () async {
        final smCallFunctionResponse =
            await ApiService('https://testnet.archethic.net').callSCFunction(
          jsonRPCRequest: SCCallFunctionRequest(
            method: 'contract_fun',
            params: SCCallFunctionParams(
              contract:
                  '0000A6BC173C4EDB141066FBB029C6E5696A4210241835460CB2964AB0D02449CEA6',
              function: 'info',
              args: [],
              resolveLast: false,
            ),
          ),
        );
        log('smCallFunctionResponse: $smCallFunctionResponse');

        expect(
          smCallFunctionResponse,
          '{ae_pool: 000066706D704329CA8C2A4153991E2DDACC968622CA10217CA14952EB7ABB966C30, evm_pool: CFBA4FA32527BFF23E073406C772E9A8B8D02650, status: 0}',
        );
      });

      test('callSCFunctionWithResolveLastTrue', () async {
        final smCallFunctionResponse =
            await ApiService('https://testnet.archethic.net').callSCFunction(
          jsonRPCRequest: SCCallFunctionRequest(
            method: 'contract_fun',
            params: SCCallFunctionParams(
              contract:
                  '0000A6BC173C4EDB141066FBB029C6E5696A4210241835460CB2964AB0D02449CEA6',
              function: 'info',
              args: [],
            ),
          ),
        );
        log('smCallFunctionResponse: $smCallFunctionResponse');

        expect(
          smCallFunctionResponse,
          '{ae_pool: 000066706D704329CA8C2A4153991E2DDACC968622CA10217CA14952EB7ABB966C30, evm_contract: 291682232D3F2AEB5D1925E31F7876BA194939FC, evm_pool: CFBA4FA32527BFF23E073406C772E9A8B8D02650, status: 1}',
        );
      });

      test('callSCFunction batch', () async {
        final smCallFunctionResponse =
            await ApiService('https://testnet.archethic.net')
                .callSCFunctionMulti(
          jsonRPCRequests: [
            SCCallFunctionRequest(
              method: 'contract_fun',
              params: SCCallFunctionParams(
                contract:
                    '000066CD867DA536A73D39CF05174387923358DC0009A29CC7162D4AED00675DAB55'
                        .toUpperCase(),
                function: 'get_pool_list',
                args: [],
              ),
            ),
            SCCallFunctionRequest(
              method: 'contract_fun',
              id: 2,
              params: SCCallFunctionParams(
                contract:
                    '000066CD867DA536A73D39CF05174387923358DC0009A29CC7162D4AED00675DAB55'
                        .toUpperCase(),
                function: 'get_pool_list',
                args: [],
              ),
            ),
            SCCallFunctionRequest(
              method: 'contract_fun',
              id: 3,
              params: SCCallFunctionParams(
                contract:
                    '000066CD867DA536A73D39CF05174387923358DC0009A29CC7162D4AED00675DAB55'
                        .toUpperCase(),
                function: 'get_pool_list',
                args: [],
              ),
            ),
            SCCallFunctionRequest(
              method: 'contract_fun',
              id: 4,
              params: SCCallFunctionParams(
                contract:
                    '000066CD867DA536A73D39CF05174387923358DC0009A29CC7162D4AED00675DAB55'
                        .toUpperCase(),
                function: 'get_pool_list',
                args: [],
              ),
            ),
            SCCallFunctionRequest(
              method: 'contract_fun',
              id: 5,
              params: SCCallFunctionParams(
                contract:
                    '000066CD867DA536A73D39CF05174387923358DC0009A29CC7162D4AED00675DAB55'
                        .toUpperCase(),
                function: 'get_pool_list',
                args: [],
              ),
            ),
            SCCallFunctionRequest(
              method: 'contract_fun',
              id: 6,
              params: SCCallFunctionParams(
                contract:
                    '000066CD867DA536A73D39CF05174387923358DC0009A29CC7162D4AED00675DAB55'
                        .toUpperCase(),
                function: 'get_pool_list',
                args: [],
              ),
            ),
            SCCallFunctionRequest(
              method: 'contract_fun',
              id: 7,
              params: SCCallFunctionParams(
                contract:
                    '000066CD867DA536A73D39CF05174387923358DC0009A29CC7162D4AED00675DAB55'
                        .toUpperCase(),
                function: 'get_pool_list',
                args: [],
              ),
            ),
            SCCallFunctionRequest(
              method: 'contract_fun',
              id: 8,
              params: SCCallFunctionParams(
                contract:
                    '000066CD867DA536A73D39CF05174387923358DC0009A29CC7162D4AED00675DAB55'
                        .toUpperCase(),
                function: 'get_pool_list',
                args: [],
              ),
            ),
            SCCallFunctionRequest(
              method: 'contract_fun',
              id: 9,
              params: SCCallFunctionParams(
                contract:
                    '000066CD867DA536A73D39CF05174387923358DC0009A29CC7162D4AED00675DAB55'
                        .toUpperCase(),
                function: 'get_pool_list',
                args: [],
              ),
            ),
            SCCallFunctionRequest(
              method: 'contract_fun',
              id: 10,
              params: SCCallFunctionParams(
                contract:
                    '000066CD867DA536A73D39CF05174387923358DC0009A29CC7162D4AED00675DAB55'
                        .toUpperCase(),
                function: 'get_pool_list',
                args: [],
              ),
            ),
            SCCallFunctionRequest(
              method: 'contract_fun',
              id: 11,
              params: SCCallFunctionParams(
                contract:
                    '000066CD867DA536A73D39CF05174387923358DC0009A29CC7162D4AED00675DAB55'
                        .toUpperCase(),
                function: 'get_pool_list',
                args: [],
              ),
            ),
            SCCallFunctionRequest(
              method: 'contract_fun',
              id: 12,
              params: SCCallFunctionParams(
                contract:
                    '000066CD867DA536A73D39CF05174387923358DC0009A29CC7162D4AED00675DAB55'
                        .toUpperCase(),
                function: 'get_pool_list',
                args: [],
              ),
            ),
            SCCallFunctionRequest(
              method: 'contract_fun',
              id: 13,
              params: SCCallFunctionParams(
                contract:
                    '000066CD867DA536A73D39CF05174387923358DC0009A29CC7162D4AED00675DAB55'
                        .toUpperCase(),
                function: 'get_pool_list',
                args: [],
              ),
            ),
            SCCallFunctionRequest(
              method: 'contract_fun',
              id: 14,
              params: SCCallFunctionParams(
                contract:
                    '000066CD867DA536A73D39CF05174387923358DC0009A29CC7162D4AED00675DAB55'
                        .toUpperCase(),
                function: 'get_pool_list',
                args: [],
              ),
            ),
            SCCallFunctionRequest(
              method: 'contract_fun',
              id: 15,
              params: SCCallFunctionParams(
                contract:
                    '000066CD867DA536A73D39CF05174387923358DC0009A29CC7162D4AED00675DAB55'
                        .toUpperCase(),
                function: 'get_pool_list',
                args: [],
              ),
            ),
            SCCallFunctionRequest(
              method: 'contract_fun',
              id: 16,
              params: SCCallFunctionParams(
                contract:
                    '000066CD867DA536A73D39CF05174387923358DC0009A29CC7162D4AED00675DAB55'
                        .toUpperCase(),
                function: 'get_pool_list',
                args: [],
              ),
            ),
            SCCallFunctionRequest(
              method: 'contract_fun',
              id: 17,
              params: SCCallFunctionParams(
                contract:
                    '000066CD867DA536A73D39CF05174387923358DC0009A29CC7162D4AED00675DAB55'
                        .toUpperCase(),
                function: 'get_pool_list',
                args: [],
              ),
            ),
            SCCallFunctionRequest(
              method: 'contract_fun',
              id: 18,
              params: SCCallFunctionParams(
                contract:
                    '000066CD867DA536A73D39CF05174387923358DC0009A29CC7162D4AED00675DAB55'
                        .toUpperCase(),
                function: 'get_pool_list',
                args: [],
              ),
            ),
            SCCallFunctionRequest(
              method: 'contract_fun',
              id: 19,
              params: SCCallFunctionParams(
                contract:
                    '000066CD867DA536A73D39CF05174387923358DC0009A29CC7162D4AED00675DAB55'
                        .toUpperCase(),
                function: 'get_pool_list',
                args: [],
              ),
            ),
            SCCallFunctionRequest(
              method: 'contract_fun',
              id: 20,
              params: SCCallFunctionParams(
                contract:
                    '000066CD867DA536A73D39CF05174387923358DC0009A29CC7162D4AED00675DAB55'
                        .toUpperCase(),
                function: 'get_pool_lllllllllist',
                args: [],
              ),
            ),
          ],
        );
        log('smCallFunctionResponse: $smCallFunctionResponse');

        expect(
          true,
          true,
        );
      });

      test('callSCFunctionError', () async {
        try {
          await ApiService('https://testnet.archethic.net').callSCFunction(
            jsonRPCRequest: SCCallFunctionRequest(
              method: 'contract_fun',
              params: SCCallFunctionParams(
                contract:
                    '0000a9f3bc500d0ed7d923e983eafc080113633456f53c400814e1d4f34c5fa67220',
                function: 'get_chargeable_htlc',
                args: [
                  '0000a3b7b1d4830a09a5459cb24db36c3d791f337260a11892b5e2e9c382da577f7a',
                  '000085f677b365906a5103959e5fa289622b22ed93062b65120b55133da78242ae3e',
                  '4BC2DA9ABC1B5667529E3C35141026CB1E1A6DD0376E871C77D2824164F696EF',
                  'UCO',
                  4.56,
                ],
              ),
            ),
          );
          fail('Should send an ArchethicJsonRPCException with code 252');
        } catch (e) {
          expect(e, isA<ArchethicJsonRPCException>());
          e as ArchethicJsonRPCException;
          expect(
            e.code,
            252,
          );
        }
      });
    },
  );

  test('chainUnspentOutputs', () async {
    final chainUnspentOutputsList =
        await ApiService('https://testnet.archethic.net').chainUnspentOutputs([
      '00000bc0eba2dbce4455b46f5e51afaaba6eb4c7fba1d4e2e6dabd55dc70f9a04d6f',
      '00003eeab3636e4017e961285f6f51c62db39a5ceb52dc5f1f8741b0b3b63ba00fd5',
    ]);

    expect(
      chainUnspentOutputsList.keys.first.length,
      greaterThan(0),
    );

    expect(
      chainUnspentOutputsList.keys.last.length,
      greaterThan(0),
    );

    expect(
      chainUnspentOutputsList.length,
      2,
    );
  });
}
