library test.keychain_test;

// Dart imports:
import 'dart:convert';
import 'dart:typed_data';

// Package imports:
import 'package:test/test.dart';

// Project imports:
import 'package:archethic_lib_dart/src/model/crypto/key_pair.dart';
import 'package:archethic_lib_dart/src/model/keychain.dart';
import 'package:archethic_lib_dart/src/model/transaction.dart';
import 'package:archethic_lib_dart/src/utils/crypto.dart' as crypto;
import 'package:archethic_lib_dart/src/utils/utils.dart';

void main() {
  group('keychain to DID', () {
    test('should encode the key material metadata', () {
      final Uint8List seed =
          Uint8List.fromList(utf8.encode('abcdefghijklmnopqrstuvwxyz'));

      final Keychain keychain = Keychain.serviceUCO(seed);
      final KeyPair keyPair = keychain.deriveKeypair('uco');

      final String address = crypto.deriveAddress(utf8.decode(seed), 0);

      final Map<String, dynamic> json = keychain.toDID();
      final String id = json['id'];
      final List<Map<String, dynamic>> verificationMethod =
          json['verificationMethod'];

      expect(id, 'did:archethic:$address');

      final List<Map<String, dynamic>> expected = <Map<String, dynamic>>[
        <String, dynamic>{
          'id': 'did:archethic:$address#key0',
          'type': 'JsonWebKey2020',
          'publicKeyJwk': keyToJWK(keyPair.publicKey).toJson()
        }
      ];

      expect(expected, verificationMethod);
    });
  });

  group('keychain encode', () {
    test('should encode the keychain into a binary', () {
      final Uint8List seed = Uint8List.fromList(utf8.encode('myseed'));

      final Keychain keychain = Keychain.serviceUCO(seed);

      final Uint8List expectedBinary = concatUint8List(<Uint8List>[
        Uint8List.fromList(<int>[0, 0, 0, 1]), // Version
        Uint8List.fromList(<int>[6]), // Seed size
        Uint8List.fromList(utf8.encode('myseed')),
        Uint8List.fromList(<int>[1]), // Nb of services
        Uint8List.fromList(<int>[3]), // Service name length: "UCO",
        Uint8List.fromList(utf8.encode('uco')),
        Uint8List.fromList(<int>[12]), // Derivation path length,
        Uint8List.fromList(utf8.encode('m/650\'/0\'/0\'')),
        Uint8List.fromList(<int>[0]), // Ed25519 curve
        Uint8List.fromList(<int>[0]) // SHA256 hash algo
      ]);

      expect(keychain.encode(), expectedBinary);
    });

    test('should decode keychain from a binary', () {
      final Uint8List binary = concatUint8List(<Uint8List>[
        Uint8List.fromList(<int>[0, 0, 0, 1]), // Version
        Uint8List.fromList(<int>[6]), // Seed size
        Uint8List.fromList(utf8.encode('myseed')),
        Uint8List.fromList(<int>[1]), // Nb of services
        Uint8List.fromList(<int>[3]), // Service name length: "UCO",
        Uint8List.fromList(utf8.encode('uco')),
        Uint8List.fromList(<int>[12]), // Derivation path length,
        Uint8List.fromList(utf8.encode('m/650\'/0\'/0\'')),
        Uint8List.fromList(<int>[0]), // Ed25519 curve
        Uint8List.fromList(<int>[0]) // SHA256 hash algo
      ]);

      final Keychain keychain = decodeKeychain(binary);

      expect(Uint8List.fromList(utf8.encode('myseed')), keychain.seed);
      expect(
          json.encode({
            'uco': {
              'derivationPath': 'm/650\'/0\'/0\'',
              'curve': 'ed25519',
              'hashAlgo': 'sha256'
            }
          }),
          json.encode(keychain.services!));
    });
  });

  group('buildTransaction', () {
    test('should build the transaction and the related signature', () {
      final Uint8List seed = Uint8List.fromList(utf8.encode('seed'));

      final Keychain keychain = Keychain.serviceUCO(seed);
      final Transaction tx = Transaction(
              type: 'transfer', data: Transaction.initData())
          .addUCOTransfer(
              '0000b1d3750edb9381c96b1a975a55b5b4e4fb37bfab104c10b0b6c9a00433ec4646',
              toBigInt(10.0));

      keychain.buildTransaction(tx, 'uco', 0);

      expect(tx.address,
          '0000a396a0dd89acf0767c3bd497a8d9c427080e1a2447065b001260f53513537174');
      expect(tx.previousPublicKey,
          '0000267377b086539c78a374bce8858f00bcc3f4124ae71bd61b87cc0edc60c2cceb');
      expect(
          crypto.verify(tx.previousSignature, tx.previousSignaturePayload(),
              tx.previousPublicKey),
          true);
    });

    test('should decode keychain from a binary', () {
      final Uint8List binary = concatUint8List(<Uint8List>[
        Uint8List.fromList(<int>[0, 0, 0, 1]), // Version
        Uint8List.fromList(<int>[6]), // Seed size
        Uint8List.fromList(utf8.encode('myseed')),
        Uint8List.fromList(<int>[1]), // Nb of services
        Uint8List.fromList(<int>[3]), // Service name length: "UCO",
        Uint8List.fromList(utf8.encode('uco')),
        Uint8List.fromList(<int>[12]), // Derivation path length,
        Uint8List.fromList(utf8.encode('m/650\'/0\'/0\'')),
        Uint8List.fromList(<int>[0]), // Ed25519 curve
        Uint8List.fromList(<int>[0]) // SHA256 hash algo
      ]);

      final Keychain keychain = decodeKeychain(binary);

      expect(Uint8List.fromList(utf8.encode('myseed')), keychain.seed);
      expect(
          json.encode({
            'uco': {
              'derivationPath': 'm/650\'/0\'/0\'',
              'curve': 'ed25519',
              'hashAlgo': 'sha256'
            }
          }),
          json.encode(keychain.services!));
    });
  });
}
