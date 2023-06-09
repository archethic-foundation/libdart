library messenger.api_test;

import 'dart:typed_data';

import 'package:archethic_lib_dart/src/model/crypto/key_pair.dart';
import 'package:archethic_lib_dart/src/model/keychain.dart';
import 'package:archethic_lib_dart/src/services/api_service.dart';
import 'package:archethic_lib_dart/src/utils/messenger_util.dart';
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

        final tx = await TestMessengerMixin().createNewSC(
          apiService: apiService,
          usersPubKey: [
            '0000A78DC064FAD98277B6B2FE0C2EB09B1292DE13DFFCE1AA3991F67803D14415F6',
            '0000FD5BCC80A8E7C689487597D3DE0FD9910B087910437E4D1AAB543E9CEDEF49F9',
            '0000C3B2EA5B16F1CF2791FA6F4536E90BFD00D3B5596575FEB5B2448A4C7DC2DEF0'
          ],
          groupName: 'testGroup',
          adminsPubKey: [
            '0000A78DC064FAD98277B6B2FE0C2EB09B1292DE13DFFCE1AA3991F67803D14415F6'
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

      test('sendMessageTestnet', () async {
        final apiService = ApiService('https://testnet.archethic.net');

        final keychain = Keychain(
          seed: hexToUint8List(
            '8CAC8029F526FD4E4856E00161882F9F9F6B81B7C9221BB8529690FDCB642F03',
          ),
        ).copyWithService('uco', "m/650'/0/0");

        await TestMessengerMixin().sendMessage(
          apiService: apiService,
          keychain: keychain,
          messageContent: 'First message',
          scAddress:
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

        final tx = await TestMessengerMixin().createNewSC(
          apiService: apiService,
          usersPubKey: [
            '00008601B566BA8580B03D4AF47C96DD36686FC7BBB0309D4BB6B5C54C0E7B97736E'
          ],
          groupName: 'testGroup2',
          adminsPubKey: [
            '00008601B566BA8580B03D4AF47C96DD36686FC7BBB0309D4BB6B5C54C0E7B97736E'
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

        await TestMessengerMixin().sendMessage(
          apiService: apiService,
          keychain: keychain,
          messageContent: '3ème message',
          scAddress:
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

        await TestMessengerMixin().readMessages(
          apiService: apiService,
          scAddress:
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

      test(
        'createSendReadLocal',
        () async {
          final apiService = ApiService('http://localhost:4000');

          final keychain = Keychain(
            seed: hexToUint8List(
              '8CAC8029F526FD4E4856E00161882F9F9F6B81B7C9221BB8529690FDCB642F03',
            ),
          ).copyWithService('uco', "m/650'/0/0");

          final tx = await TestMessengerMixin().createNewSC(
            apiService: apiService,
            usersPubKey: [
              '00008601B566BA8580B03D4AF47C96DD36686FC7BBB0309D4BB6B5C54C0E7B97736E'
            ],
            groupName: 'testGroup2',
            adminsPubKey: [
              '00008601B566BA8580B03D4AF47C96DD36686FC7BBB0309D4BB6B5C54C0E7B97736E'
            ],
            keychain: keychain,
            adminAddress:
                '00000162D81A8BADB078C430693DF1D8ED6A9F6FC9D484A0CCCD5935E353D2275362',
            serviceName: 'archethic-wallet-TEST',
          );

          await TestMessengerMixin().sendMessage(
            apiService: apiService,
            keychain: keychain,
            messageContent: '1er message',
            scAddress: tx.address!.address!,
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

          await TestMessengerMixin().sendMessage(
            apiService: apiService,
            keychain: keychain,
            messageContent: '2ème message',
            scAddress: tx.address!.address!,
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

          await TestMessengerMixin().readMessages(
            apiService: apiService,
            scAddress: tx.address!.address!,
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
    },
    tags: <String>['noCI'],
  );
}

class TestMessengerMixin with MessengerMixin {}
