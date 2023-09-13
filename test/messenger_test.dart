library messenger.api_test;

import 'dart:convert';
import 'dart:typed_data';

import 'package:archethic_lib_dart/src/model/crypto/key_pair.dart';
import 'package:archethic_lib_dart/src/model/keychain.dart';
import 'package:archethic_lib_dart/src/model/messaging/ae_discussion.dart';
import 'package:archethic_lib_dart/src/services/api_service.dart';
import 'package:archethic_lib_dart/src/services/messaging_service.dart';
import 'package:archethic_lib_dart/src/utils/utils.dart';
import 'package:test/test.dart';

void main() {
  group(
    'messenger',
    () {
      test('createNewSCTestnet', () async {
        final apiService = ApiService('https://testnet.archethic.net');
        final keychain = Keychain(
          seed: hexToUint8List(
            '8CAC8029F526FD4E4856E00161882F9F9F6B81B7C9221BB8529690FDCB642F03',
          ),
        ).copyWithService('uco', "m/650'/0/0");

        final tx = await MessagingService().createDiscussion(
          apiService: apiService,
          membersPubKey: [
            '0000A78DC064FAD98277B6B2FE0C2EB09B1292DE13DFFCE1AA3991F67803D14415F6',
            '0000FD5BCC80A8E7C689487597D3DE0FD9910B087910437E4D1AAB543E9CEDEF49F9',
            '0000C3B2EA5B16F1CF2791FA6F4536E90BFD00D3B5596575FEB5B2448A4C7DC2DEF0',
          ],
          discussionName: 'testGroup',
          adminsPubKey: [
            '0000A78DC064FAD98277B6B2FE0C2EB09B1292DE13DFFCE1AA3991F67803D14415F6',
          ],
          keychain: keychain,
          adminAddress:
              '00008C64EE10053C34E7B5679D3BD935616B45D910FDBBC46A2516709CBB375DF703',
          serviceName: 'archethic-wallet-ALICE',
        );

        expect(
          tx.version,
          1,
        );
      });

      test('updateSC', () async {
        final apiService = ApiService('http://localhost:4000');
        final keychain = Keychain(
          seed: hexToUint8List(
            'f743f0c292ae739fc63ffeea74e666bdf9d3308e687fe065071b501cc82c313e',
          ),
        )
            .copyWithService(
              'archethic-wallet-BOB',
              "m/650'/archethic-wallet-BOB/0",
            )
            .copyWithService(
              'archethic-wallet-ALICE',
              "m/650'/archethic-wallet-ALICE/0",
            );

        final tx = await MessagingService().updateDiscussion(
          apiService: apiService,
          membersPubKey: [
            '0000E94AD258D642D791DFA3F1FAFFB7D2BB13A898E15677B6997BD95FB127C22668',
            '00007A258D32E1245A3CA9CEFCB6B6363E1AB1DA49C15E9AD2B1014BF91F46397641',
          ],
          discussionName: 'testGroup',
          adminsPubKey: [
            '0000E94AD258D642D791DFA3F1FAFFB7D2BB13A898E15677B6997BD95FB127C22668',
          ],
          keychain: keychain,
          adminAddress:
              '00003826750A085421A06D07816F24FC4AB020F09E841B15DBF83913AC3B875ED693',
          serviceName: 'archethic-wallet-BOB',
          adminKeyPair: KeyPair(
            privateKey: hexToUint8List(
              '00002f48b41208d94b5cb07df768f2f4bbc2715731d1490c4cf7e483aad3b0f7a48f',
            ),
            publicKey: hexToUint8List(
              '0000e94ad258d642d791dfa3f1faffb7d2bb13a898e15677b6997bd95fb127c22668',
            ),
          ),
          discussionSCAddress:
              '00009460ca907f506474000302a8a15629ccf6a2d05498baf041b2a010ead7182cba',
        );

        expect(
          tx.version,
          1,
        );
      });

      test('sendMessageTestnet', () async {
        final apiService = ApiService('https://testnet.archethic.net');

        final keychain = Keychain(
          seed: hexToUint8List(
            '8CAC8029F526FD4E4856E00161882F9F9F6B81B7C9221BB8529690FDCB642F03',
          ),
        ).copyWithService('uco', "m/650'/0/0");

        await MessagingService().sendMessage(
          apiService: apiService,
          keychain: keychain,
          messageContent: 'First message',
          discussionSCAddress:
              '00000162D81A8BADB078C430693DF1D8ED6A9F6FC9D484A0CCCD5935E353D2275362',
          senderAddress:
              '00008C64EE10053C34E7B5679D3BD935616B45D910FDBBC46A2516709CBB375DF703',
          senderServiceName: 'archethic-wallet-ALICE',
          senderKeyPair: KeyPair(
            privateKey: Uint8List.fromList([]),
            publicKey: Uint8List.fromList([]),
          ),
        );
      });

      test('createNewSCLocal', () async {
        final apiService = ApiService('http://localhost:4000');

        final keychain = Keychain(
          seed: hexToUint8List(
            '8CAC8029F526FD4E4856E00161882F9F9F6B81B7C9221BB8529690FDCB642F03',
          ),
        ).copyWithService('uco', "m/650'/0/0");

        final tx = await MessagingService().createDiscussion(
          apiService: apiService,
          membersPubKey: [
            '00008601B566BA8580B03D4AF47C96DD36686FC7BBB0309D4BB6B5C54C0E7B97736E',
          ],
          discussionName: 'testGroup2',
          adminsPubKey: [
            '00008601B566BA8580B03D4AF47C96DD36686FC7BBB0309D4BB6B5C54C0E7B97736E',
          ],
          keychain: keychain,
          adminAddress:
              '00000162D81A8BADB078C430693DF1D8ED6A9F6FC9D484A0CCCD5935E353D2275362',
          serviceName: 'archethic-wallet-TEST',
        );

        expect(
          tx.version,
          1,
        );
      });

      test('sendMessageLocal', () async {
        final apiService = ApiService('http://localhost:4000');

        final keychain = Keychain(
          seed: hexToUint8List(
            '8CAC8029F526FD4E4856E00161882F9F9F6B81B7C9221BB8529690FDCB642F03',
          ),
        ).copyWithService('uco', "m/650'/0/0");

        await MessagingService().sendMessage(
          apiService: apiService,
          keychain: keychain,
          messageContent: '3ème message',
          discussionSCAddress:
              '000049d1b99645d0168c084983477b0db00e53ac8cc9957ef93bb56777ce0e8d82b1',
          senderAddress:
              '00000162D81A8BADB078C430693DF1D8ED6A9F6FC9D484A0CCCD5935E353D2275362',
          senderServiceName: 'archethic-wallet-TEST',
          senderKeyPair: KeyPair(
            privateKey: hexToUint8List(
              '000001b98027e90c0bd9020aee089a50c84da7185e6258d22d8f1b73c9e56e7f4134',
            ),
            publicKey: hexToUint8List(
              '00008601B566BA8580B03D4AF47C96DD36686FC7BBB0309D4BB6B5C54C0E7B97736E',
            ),
          ),
        );
      });

      test('readMessagesLocal', () async {
        final apiService = ApiService('http://localhost:4000');

        await MessagingService().readMessages(
          apiService: apiService,
          discussionSCAddress:
              '000049d1b99645d0168c084983477b0db00e53ac8cc9957ef93bb56777ce0e8d82b1',
          readerKeyPair: KeyPair(
            privateKey: hexToUint8List(
              '000001b98027e90c0bd9020aee089a50c84da7185e6258d22d8f1b73c9e56e7f4134',
            ),
            publicKey: hexToUint8List(
              '00008601B566BA8580B03D4AF47C96DD36686FC7BBB0309D4BB6B5C54C0E7B97736E',
            ),
          ),
        );
      });

      test('getMessageGroupLocal', () async {
        final apiService = ApiService('http://localhost:4000');

        final messageGroup = await MessagingService().getDiscussion(
          apiService: apiService,
          discussionSCAddress:
              '00004C24CFFC29B0DC509260B64055F2E40086BD0F48CC34BF26FE40D77DFC2D5E68',
          keyPair: KeyPair(
            privateKey: hexToUint8List(
              '0000969b5e894dda119e3717e540f60104640a987f2d5b7efa1c4268b58b0d2cfb2a',
            ),
            publicKey: hexToUint8List(
              '000087cdadbe3f19e5db8e434ca3c862600942a0e206e2c6c340ce1cdfde472e4c5c',
            ),
          ),
        );

        expect(
          messageGroup!.address,
          '00004C24CFFC29B0DC509260B64055F2E40086BD0F48CC34BF26FE40D77DFC2D5E68',
        );
      });

      test(
        'createSendReadLocal',
        () async {
          final apiService = ApiService('http://localhost:4000');

          final keychain = Keychain(
            seed: hexToUint8List(
              '8CAC8029F526FD4E4856E00161882F9F9F6B81B7C9221BB8529690FDCB642F03',
            ),
          ).copyWithService('uco', "m/650'/0/0");

          final tx = await MessagingService().createDiscussion(
            apiService: apiService,
            membersPubKey: [
              '00008601B566BA8580B03D4AF47C96DD36686FC7BBB0309D4BB6B5C54C0E7B97736E',
            ],
            discussionName: 'testGroup2',
            adminsPubKey: [
              '00008601B566BA8580B03D4AF47C96DD36686FC7BBB0309D4BB6B5C54C0E7B97736E',
            ],
            keychain: keychain,
            adminAddress:
                '00000162D81A8BADB078C430693DF1D8ED6A9F6FC9D484A0CCCD5935E353D2275362',
            serviceName: 'archethic-wallet-TEST',
          );

          await MessagingService().sendMessage(
            apiService: apiService,
            keychain: keychain,
            messageContent: '1er message',
            discussionSCAddress: tx.address!.address!,
            senderAddress:
                '00000162D81A8BADB078C430693DF1D8ED6A9F6FC9D484A0CCCD5935E353D2275362',
            senderServiceName: 'archethic-wallet-TEST',
            senderKeyPair: KeyPair(
              privateKey: hexToUint8List(
                '000001b98027e90c0bd9020aee089a50c84da7185e6258d22d8f1b73c9e56e7f4134',
              ),
              publicKey: hexToUint8List(
                '00008601B566BA8580B03D4AF47C96DD36686FC7BBB0309D4BB6B5C54C0E7B97736E',
              ),
            ),
          );

          await MessagingService().sendMessage(
            apiService: apiService,
            keychain: keychain,
            messageContent: '2ème message',
            discussionSCAddress: tx.address!.address!,
            senderAddress:
                '00000162D81A8BADB078C430693DF1D8ED6A9F6FC9D484A0CCCD5935E353D2275362',
            senderServiceName: 'archethic-wallet-TEST',
            senderKeyPair: KeyPair(
              privateKey: hexToUint8List(
                '000001b98027e90c0bd9020aee089a50c84da7185e6258d22d8f1b73c9e56e7f4134',
              ),
              publicKey: hexToUint8List(
                '00008601B566BA8580B03D4AF47C96DD36686FC7BBB0309D4BB6B5C54C0E7B97736E',
              ),
            ),
          );

          await MessagingService().readMessages(
            apiService: apiService,
            discussionSCAddress: tx.address!.address!,
            readerKeyPair: KeyPair(
              privateKey: hexToUint8List(
                '000001b98027e90c0bd9020aee089a50c84da7185e6258d22d8f1b73c9e56e7f4134',
              ),
              publicKey: hexToUint8List(
                '00008601B566BA8580B03D4AF47C96DD36686FC7BBB0309D4BB6B5C54C0E7B97736E',
              ),
            ),
          );
        },
      );

      test('discussionLastProperties', () async {
        final apiService = ApiService('http://localhost:4000');
        final content = await MessagingService().getDiscussionLastProperties(
          apiService: apiService,
          discussionSCAddress:
              '0000E2F3D9EA9431BBE4ED0ADA45AB1101B1F360716AA4FF190A17C6BB13A5C167D3',
          readerKeyPair: KeyPair(
            privateKey: hexToUint8List(
              '00002f48b41208d94b5cb07df768f2f4bbc2715731d1490c4cf7e483aad3b0f7a48f',
            ),
            publicKey: hexToUint8List(
              '0000e94ad258d642d791dfa3f1faffb7d2bb13a898e15677b6997bd95fb127c22668',
            ),
          ),
        );
        final aeDiscussion = AEDiscussion.fromJson(jsonDecode(content));

        expect(aeDiscussion.discussionName, 'ALICE');
      });
    },
    tags: <String>['noCI'],
  );
}
