library test.transaction_test;

import 'dart:convert';
import 'dart:typed_data';
import 'package:archethic_lib_dart/src/model/address.dart';
import 'package:archethic_lib_dart/src/model/authorized_key.dart';
import 'package:archethic_lib_dart/src/model/transaction.dart';
import 'package:archethic_lib_dart/src/services/api_service.dart';
import 'package:archethic_lib_dart/src/utils/crypto.dart' as crypto;
import 'package:archethic_lib_dart/src/utils/utils.dart';
import 'package:test/test.dart';

void main() {
  group('Transaction', () {
    test('should assign type when create a new transaction instance', () {
      final tx = Transaction(type: 'transfer', data: Transaction.initData());
      expect(tx.type, 'transfer');
    });

    group('setCode', () {
      test('should insert the code into the transaction data', () {
        final tx = Transaction(type: 'transfer', data: Transaction.initData())
            .setCode('my smart contract code');
        expect(tx.data!.code, 'my smart contract code');
      });
    });

    group('setContent', () {
      test('should insert the content into the transaction data', () {
        final tx = Transaction(type: 'transfer', data: Transaction.initData())
            .setContent('my super content');
        expect(tx.data!.content, 'my super content');
      });
    });

    group('addOwnership', () {
      test(
          'should add an ownership with a secret and its authorized keys into the transaction data',
          () {
        final tx = Transaction(type: 'transfer', data: Transaction.initData())
            .addOwnership(
                '00501fa2db78bcf8ceca129e6139d7e38bf0d61eb905441056b9ebe6f1d1feaf88',
                <AuthorizedKey>[
              const AuthorizedKey(
                publicKey:
                    '0001B1D3750EDB9381C96B1A975A55B5B4E4FB37BFAB104C10B0B6C9A00433EC4646',
                encryptedSecretKey:
                    '00501fa2db78bcf8ceca129e6139d7e38bf0d61eb905441056b9ebe6f1d1feaf88',
              )
            ]).build('seed', 0, curve: 'P256', isSeedHexa: false);
        final dynamic parsedTx = json.decode(tx.convertToJSON());
        expect(
            parsedTx['data']['ownerships'][0]['authorizedKeys'],
            <Map<String, String>>[
              <String, String>{
                'publicKey':
                    '0001B1D3750EDB9381C96B1A975A55B5B4E4FB37BFAB104C10B0B6C9A00433EC4646',
                'encryptedSecretKey':
                    '00501fa2db78bcf8ceca129e6139d7e38bf0d61eb905441056b9ebe6f1d1feaf88'
              }
            ]);

        expect(
          tx.data!.ownerships[0].secret,
          '00501fa2db78bcf8ceca129e6139d7e38bf0d61eb905441056b9ebe6f1d1feaf88',
        );
      });
    });

    group('addUCOTransfer', () {
      test('should add an uco transfer to the transaction data', () {
        final tx = Transaction(type: 'transfer', data: Transaction.initData())
            .addUCOTransfer(
          '0000b1d3750edb9381c96b1a975a55b5b4e4fb37bfab104c10b0b6c9a00433ec4646',
          toBigInt(10.03),
        );
        expect(tx.data!.ledger!.uco!.transfers.length, 1);
        expect(
          tx.data!.ledger!.uco!.transfers[0].to,
          '0000b1d3750edb9381c96b1a975a55b5b4e4fb37bfab104c10b0b6c9a00433ec4646',
        );
        expect(tx.data!.ledger!.uco!.transfers[0].amount, toBigInt(10.03));
      });
    });
    group('addTokenTransfer', () {
      test('should add a token transfer to the transaction data', () {
        final tx = Transaction(type: 'transfer', data: Transaction.initData())
            .addTokenTransfer(
          '0000b1d3750edb9381c96b1a975a55b5b4e4fb37bfab104c10b0b6c9a00433ec4646',
          toBigInt(10.03),
          '0000b1d3750edb9381c96b1a975a55b5b4e4fb37bfab104c10b0b6c9a00433ec4646',
        );
        expect(tx.data!.ledger!.token!.transfers.length, 1);
        expect(
          tx.data!.ledger!.token!.transfers[0].to,
          '0000b1d3750edb9381c96b1a975a55b5b4e4fb37bfab104c10b0b6c9a00433ec4646',
        );
        expect(tx.data!.ledger!.token!.transfers[0].amount, toBigInt(10.03));
        expect(
          tx.data!.ledger!.token!.transfers[0].tokenAddress,
          '0000b1d3750edb9381c96b1a975a55b5b4e4fb37bfab104c10b0b6c9a00433ec4646',
        );
      });
    });

    group('previousSignaturePayload', () {
      test('should generate binary encoding of the transaction before signing',
          () {
        const code = '''
              condition inherit: [
                uco_transferred: 0.020
              ]

              actions triggered by: transaction do
                  set_type transfer
                  add_uco_ledger to: "000056E763190B28B4CF9AAF3324CF379F27DE9EF7850209FB59AA002D71BA09788A", amount: 0.020
              end
            ''';
        const content =
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec sit amet leo egestas, lobortis lectus a, dignissim orci.';
        final secret = uint8ListToHex(Uint8List.fromList('mysecret'.codeUnits));
        final keypair = crypto.deriveKeyPair('seed', 0, isSeedHexa: false);
        final nextKeypair = crypto.deriveKeyPair('seed', 1, isSeedHexa: false);
        final address = crypto.hash(nextKeypair.publicKey);

        final tx = Transaction(
          type: 'transfer',
          data: Transaction.initData(),
          address: Address(address: uint8ListToHex(address)),
          previousPublicKey:
              uint8ListToHex(Uint8List.fromList(keypair.publicKey!)),
        )
            .addOwnership(secret, <AuthorizedKey>[
              const AuthorizedKey(
                publicKey:
                    '0001b1d3750edb9381c96b1a975a55b5b4e4fb37bfab104c10b0b6c9a00433ec4646',
                encryptedSecretKey:
                    '00501fa2db78bcf8ceca129e6139d7e38bf0d61eb905441056b9ebe6f1d1feaf88',
              )
            ])
            .addUCOTransfer(
              '0000b1d3750edb9381c96b1a975a55b5b4e4fb37bfab104c10b0b6c9a00433ec4646',
              toBigInt(0.2020),
            )
            .addTokenTransfer(
              '0000b1d3750edb9381c96b1a975a55b5b4e4fb37bfab104c10b0b6c9a00433ec4646',
              toBigInt(100),
              '0000501fa2db78bcf8ceca129e6139d7e38bf0d61eb905441056b9ebe6f1d1feaf88',
            )
            .setCode(code)
            .setContent(content)
            .addRecipient(
              '0000501fa2db78bcf8ceca129e6139d7e38bf0d61eb905441056b9ebe6f1d1feaf88',
            );

        final payload = tx.previousSignaturePayload();
        final expectedBinary = concatUint8List(<Uint8List>[
          toByteArray(1, length: 4),
          Uint8List.fromList(hexToUint8List(tx.address!.address!)),
          Uint8List.fromList(<int>[253]),
          //Code size
          toByteArray(code.length, length: 4),
          Uint8List.fromList(utf8.encode(code)),
          //Content size
          toByteArray(content.length, length: 4),
          Uint8List.fromList(utf8.encode(content)),
          //Nb of bytes to encode nb of ownerships
          Uint8List.fromList(<int>[1]),
          //Nb of ownerships
          Uint8List.fromList(<int>[1]),
          //Secret size
          toByteArray(
            Uint8List.fromList(hexToUint8List(secret)).lengthInBytes,
            length: 4,
          ),
          Uint8List.fromList(Uint8List.fromList(hexToUint8List(secret))),
          // Nb of byte to encode nb of authorized keys
          Uint8List.fromList(<int>[1]),
          // Nb of authorized keys
          Uint8List.fromList(<int>[1]),
          // Authorized keys encoding
          concatUint8List(<Uint8List>[
            Uint8List.fromList(
              hexToUint8List(
                '0001b1d3750edb9381c96b1a975a55b5b4e4fb37bfab104c10b0b6c9a00433ec4646',
              ),
            ),
            Uint8List.fromList(
              hexToUint8List(
                '00501fa2db78bcf8ceca129e6139d7e38bf0d61eb905441056b9ebe6f1d1feaf88',
              ),
            )
          ]),
          // Nb of bytes to encode nb of uco transfers
          Uint8List.fromList(<int>[1]),
          // Nb of uco transfers
          Uint8List.fromList(<int>[1]),
          concatUint8List(<Uint8List>[
            Uint8List.fromList(
              hexToUint8List(
                '0000b1d3750edb9381c96b1a975a55b5b4e4fb37bfab104c10b0b6c9a00433ec4646',
              ),
            ),
            toByteArray(toBigInt(0.2020), length: 8)
          ]),
          // Nb of byte to encode nb of Token transfers
          Uint8List.fromList(<int>[1]),
          // Nb of token transfers
          Uint8List.fromList(<int>[1]),
          concatUint8List(<Uint8List>[
            Uint8List.fromList(
              hexToUint8List(
                '0000501fa2db78bcf8ceca129e6139d7e38bf0d61eb905441056b9ebe6f1d1feaf88',
              ),
            ),
            Uint8List.fromList(
              hexToUint8List(
                '0000b1d3750edb9381c96b1a975a55b5b4e4fb37bfab104c10b0b6c9a00433ec4646',
              ),
            ),
            toByteArray(toBigInt(100), length: 8),
            Uint8List.fromList(<int>[1]),
            Uint8List.fromList(<int>[0])
          ]),
          // Nb of byte to encode nb of recipients
          Uint8List.fromList(<int>[1]),
          // Nb of recipients
          Uint8List.fromList(<int>[1]),
          Uint8List.fromList(
            hexToUint8List(
              '0000501fa2db78bcf8ceca129e6139d7e38bf0d61eb905441056b9ebe6f1d1feaf88',
            ),
          )
        ]);
        expect(payload, expectedBinary);
      });
    });

    group('setPreviousSignatureAndPreviousPublicKey', () {
      test(
          'should set previous signature and previous public key in transaction builder',
          () {
        const examplePublicKey =
            '0101044d91a0a1a7cf06a2902d3842f82d2791bcbf3ee6f6dc8de0f90e53e9991c3cb33684b7b9e66f26e7c9f5302f73c69897be5f301de9a63521a08ac4ef34c18728';
        const exampleSignature =
            '3044022009ed5124c35feb3449f4287eb5a885dec06f10491146bf73d44684f5a2ced8d7022049e1fb29fcd6e622a8cd2e120931ab038987edbdc44e7a9ec12e5a290599a97e';

        final tx = Transaction(type: 'transfer', data: Transaction.initData())
            .setPreviousSignatureAndPreviousPublicKey(
          exampleSignature,
          examplePublicKey,
        );
        expect(tx.previousPublicKey, examplePublicKey);
        expect(tx.previousSignature, exampleSignature);
      });
    });

    group('setAddress', () {
      test('should set this.address in transaction builder', () {
        const exampleAddress =
            '0000501fa2db78bcf8ceca129e6139d7e38bf0d61eb905441056b9ebe6f1d1feaf88';
        final tx = Transaction(type: 'transfer', data: Transaction.initData())
            .setAddress(const Address(address: exampleAddress));
        expect(tx.address!.address, exampleAddress);
      });
    });

    group('build', () {
      test('should build the transaction and the related signature', () {
        final tx = Transaction(type: 'transfer', data: Transaction.initData())
            .addUCOTransfer(
              '0000b1d3750edb9381c96b1a975a55b5b4e4fb37bfab104c10b0b6c9a00433ec4646',
              toBigInt(10.0),
            )
            .build('seed', 0, isSeedHexa: false);
        expect(
          tx.address!.address,
          '00001ff1733caa91336976ee7cef5aff6bb26c7682213b8e6770ab82272f966dac35',
        );
        expect(
          tx.previousPublicKey,
          '000161d6cd8da68207bd01198909c139c130a3df3a8bd20f4bacb123c46354ccd52c',
        );
        expect(
          crypto.verify(
            tx.previousSignature,
            tx.previousSignaturePayload(),
            tx.previousPublicKey,
          ),
          true,
        );
      });
    });

    group('originSignaturePayload', () {
      test('should generate binary encoding of the transaction before signing',
          () {
        const code = '''
condition inherit: [
                            uco_transferred: 0.020
                          ]
                          
                          actions triggered by: transaction do
                              set_type transfer
                              add_uco_ledger to: "000056E763190B28B4CF9AAF3324CF379F27DE9EF7850209FB59AA002D71BA09788A", amount: 0.020
                          end
      ''';
        const content =
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec sit amet leo egestas, lobortis lectus a, dignissim orci.';
        final secret = uint8ListToHex(Uint8List.fromList('mysecret'.codeUnits));
        final tx = Transaction(type: 'transfer', data: Transaction.initData())
            .addOwnership(secret, <AuthorizedKey>[
              const AuthorizedKey(
                publicKey:
                    '0001b1d3750edb9381c96b1a975a55b5b4e4fb37bfab104c10b0b6c9a00433ec4646',
                encryptedSecretKey:
                    '00501fa2db78bcf8ceca129e6139d7e38bf0d61eb905441056b9ebe6f1d1feaf88',
              )
            ])
            .addUCOTransfer(
              '0000b1d3750edb9381c96b1a975a55b5b4e4fb37bfab104c10b0b6c9a00433ec4646',
              toBigInt(0.2020),
            )
            .addTokenTransfer(
              '0000b1d3750edb9381c96b1a975a55b5b4e4fb37bfab104c10b0b6c9a00433ec4646',
              toBigInt(100),
              '0000501fa2db78bcf8ceca129e6139d7e38bf0d61eb905441056b9ebe6f1d1feaf88',
            )
            .setCode(code)
            .setContent(content)
            .addRecipient(
              '0000501fa2db78bcf8ceca129e6139d7e38bf0d61eb905441056b9ebe6f1d1feaf88',
            )
            .build('seed', 0, curve: 'P256', isSeedHexa: false);

        final transactionKeyPair =
            crypto.deriveKeyPair('seed', 0, curve: 'P256', isSeedHexa: false);
        final previousSig = crypto.sign(
          tx.previousSignaturePayload(),
          transactionKeyPair.privateKey,
        );
        final payload = tx.originSignaturePayload();
        final expectedBinary = concatUint8List(<Uint8List>[
          // Version
          toByteArray(1, length: 4),
          Uint8List.fromList(hexToUint8List(tx.address!.address!)),
          Uint8List.fromList(<int>[253]),
          //Code size
          toByteArray(code.length, length: 4),
          Uint8List.fromList(utf8.encode(code)),
          //Content size
          toByteArray(content.length, length: 4),
          Uint8List.fromList(utf8.encode(content)),
          // Nb of byte to encode nb of ownerships
          Uint8List.fromList(<int>[1]),
          //Nb of ownerships
          Uint8List.fromList(<int>[1]),
          //Secret size
          toByteArray(
            Uint8List.fromList(hexToUint8List(secret)).lengthInBytes,
            length: 4,
          ),
          Uint8List.fromList(Uint8List.fromList(hexToUint8List(secret))),
          // Nb of bytes to encode nb of authorized key
          Uint8List.fromList(<int>[1]),
          // Nb of authorized keys
          Uint8List.fromList(<int>[1]),
          // Authorized keys encoding
          concatUint8List(<Uint8List>[
            Uint8List.fromList(
              hexToUint8List(
                '0001B1D3750EDB9381C96B1A975A55B5B4E4FB37BFAB104C10B0B6C9A00433EC4646',
              ),
            ),
            Uint8List.fromList(
              hexToUint8List(
                '00501fa2db78bcf8ceca129e6139d7e38bf0d61eb905441056b9ebe6f1d1feaf88',
              ),
            )
          ]),
          // Nb of bytes to encode nb of uco transfers
          Uint8List.fromList(<int>[1]),
          // Nb of uco transfers
          Uint8List.fromList(<int>[1]),
          concatUint8List(<Uint8List>[
            Uint8List.fromList(
              hexToUint8List(
                '0000b1d3750edb9381c96b1a975a55b5b4e4fb37bfab104c10b0b6c9a00433ec4646',
              ),
            ),
            toByteArray(toBigInt(0.2020), length: 8)
          ]),
          // Nb of bytes to encode nb of Token transfers
          Uint8List.fromList(<int>[1]),
          // Nb of token transfers
          Uint8List.fromList(<int>[1]),
          concatUint8List(<Uint8List>[
            Uint8List.fromList(
              hexToUint8List(
                '0000501fa2db78bcf8ceca129e6139d7e38bf0d61eb905441056b9ebe6f1d1feaf88',
              ),
            ),
            Uint8List.fromList(
              hexToUint8List(
                '0000b1d3750edb9381c96b1a975a55b5b4e4fb37bfab104c10b0b6c9a00433ec4646',
              ),
            ),
            toByteArray(toBigInt(100), length: 8),
            Uint8List.fromList(<int>[1]),
            Uint8List.fromList(<int>[0]),
          ]),
          // Nb of bytes to encode nb of recipients
          Uint8List.fromList(<int>[1]),
          // Nb of recipients
          Uint8List.fromList(<int>[1]),
          Uint8List.fromList(
            hexToUint8List(
              '0000501fa2db78bcf8ceca129e6139d7e38bf0d61eb905441056b9ebe6f1d1feaf88',
            ),
          ),
          Uint8List.fromList(transactionKeyPair.publicKey!),
          Uint8List.fromList(<int>[previousSig.length]),
          previousSig
        ]);
        expect(payload, expectedBinary);
      });
    });

    group('originSign', () {
      test('should sign the transaction with a origin private key', () {
        final originKeypair =
            crypto.deriveKeyPair('origin_seed', 0, isSeedHexa: false);

        final tx = Transaction(type: 'transfer', data: Transaction.initData())
            .build('seed', 0, isSeedHexa: false)
            .originSign(
              uint8ListToHex(Uint8List.fromList(originKeypair.privateKey!)),
            );
        expect(
          crypto.verify(
            tx.originSignature,
            tx.originSignaturePayload(),
            originKeypair.publicKey,
          ),
          true,
        );
      });
    });

    group('toJSON', () {
      test('should return a JSON from the transaction', () {
        final originKeypair =
            crypto.deriveKeyPair('origin_seed', 0, isSeedHexa: false);
        final transactionKeyPair =
            crypto.deriveKeyPair('seed', 0, isSeedHexa: false);

        final tx = Transaction(type: 'transfer', data: Transaction.initData())
            .addUCOTransfer(
              '0000b1d3750edb9381c96b1a975a55b5b4e4fb37bfab104c10b0b6c9a00433ec4646',
              toBigInt(0.2193),
            )
            .addOwnership(
                uint8ListToHex(Uint8List.fromList(<int>[0, 1, 2, 3, 4])),
                <AuthorizedKey>[
                  const AuthorizedKey(
                    publicKey:
                        '0001b1d3750edb9381c96b1a975a55b5b4e4fb37bfab104c10b0b6c9a00433ec4646',
                    encryptedSecretKey:
                        '00501fa2db78bcf8ceca129e6139d7e38bf0d61eb905441056b9ebe6f1d1feaf88',
                  )
                ])
            .build('seed', 0, isSeedHexa: false)
            .originSign(
              uint8ListToHex(Uint8List.fromList(originKeypair.privateKey!)),
            );

        final Map<String, dynamic> parsedTx = json.decode(tx.convertToJSON());

        final previousSig = crypto.sign(
          tx.previousSignaturePayload(),
          transactionKeyPair.privateKey,
        );
        final originSig =
            crypto.sign(tx.originSignaturePayload(), originKeypair.privateKey);

        expect(
          parsedTx['address'],
          crypto.deriveAddress('seed', 1, isSeedHexa: false),
        );
        expect(parsedTx['type'], 'transfer');
        expect(
          parsedTx['previousPublicKey'],
          uint8ListToHex(transactionKeyPair.publicKey!),
        );
        expect(parsedTx['previousSignature'], uint8ListToHex(previousSig));
        expect(parsedTx['originSignature'], uint8ListToHex(originSig));
        expect(
            parsedTx['data']['ownerships'][0]['authorizedKeys'],
            <Map<String, String>>[
              <String, String>{
                'publicKey':
                    '0001B1D3750EDB9381C96B1A975A55B5B4E4FB37BFAB104C10B0B6C9A00433EC4646',
                'encryptedSecretKey':
                    '00501fa2db78bcf8ceca129e6139d7e38bf0d61eb905441056b9ebe6f1d1feaf88'
              }
            ]);
        expect(
            parsedTx['data']['ledger']['uco']['transfers'][0], <String, Object>{
          'to':
              '0000b1d3750edb9381c96b1a975a55b5b4e4fb37bfab104c10b0b6c9a00433ec4646',
          'amount': toBigInt(0.2193)
        });
      });
    });
  });

  group(
    'send tx',
    () {
      test('should send transaction with special characters', () async {
        const seed =
            '60A6418E261C715D9C5E897EC8E018B8BD6C022DE214201177DEBEFE6DE1ECA1';
        final originPrivateKey =
            ApiService('https://mainnet.archethic.net').getOriginKey();

        const text = 'Hello👋';
        final tx = Transaction(type: 'transfer', data: Transaction.initData())
            .setContent(text)
            .addUCOTransfer(
              '0000b1d3750edb9381c96b1a975a55b5b4e4fb37bfab104c10b0b6c9a00433ec4646',
              toBigInt(0.00000001),
            )
            .build(seed, 0)
            .originSign(originPrivateKey);

        await ApiService('https://mainnet.archethic.net').sendTx(tx);

        await ApiService('https://mainnet.archethic.net')
            .getTransactionContent({
          '000057cb7d188385325a30fddf5bca487ee1db525b7a3dc31a595d6f3425c06c93ce':
              ''
        });
        expect(true, true);
      });
    },
    tags: <String>['noCI'],
  );
}
