/// SPDX-License-Identifier: AGPL-3.0-or-later
import 'dart:developer' as dev;
import 'dart:typed_data';

// Project imports:
import 'package:archethic_lib_dart/src/model/on_chain_wallet_data.dart';
import 'package:archethic_lib_dart/src/utils/utils.dart';
// Package imports:
import 'package:elliptic/ecdh.dart' as ecdh show computeSecret;
import 'package:elliptic/elliptic.dart' as elliptic
    show getSecp256k1, PrivateKey, PublicKey;
import 'package:pointycastle/export.dart' as pc
    show
        Digest,
        CTRStreamCipher,
        AESEngine,
        ParametersWithIV,
        KeyParameter,
        CBCBlockCipher,
        SHA256Digest,
        HMac;

/// Archethic Onchain Wallet Generator and Encoder, using V1 specifications
/// https://archethic-foundation.github.io/archethic-docs/build/clients/wallet-spec
OnChainWalletData walletEncoderTest(String originPublicKey) {
  final sha256 = pc.Digest('SHA-256');
  final sha512 = pc.Digest('SHA-512');

  const version = '01';

  /// Master Seed for Onchain Wallet (32 bytes)
  dev.log('Master Seed for Onchain Wallet (32 bytes)');
  //final String masterSeed = uint8ListToHex(Uint8List.fromList(
  //    List<int>.generate(32, (int i) => Random.secure().nextInt(256))));

  const masterSeed =
      'BC22548FD73B17DFD101C03FE618EDF4EAEBF35DFC494EBCEAEFCE7814B63FA2';
  dev.log(masterSeed);

  const totalServices = '01';
  const coinType = '028A';
  const account = '0000';

  /// BIP44 Path (4 bytes): [Coin type = 650, account = 0]
  dev.log('BIP44 Path (4 bytes): [Coin type = 650, account = 0]');
  const bip44 = coinType + account;
  dev.log(bip44);

  /// Wallet Curve (0:ed25519, 1:nistp256, 2:secp256k1)
  dev.log('Wallet Curve (0:ed25519, 1:nistp256, 2:secp256k1)');
  const walletCurve = '02';
  dev.log(walletCurve);

  final curve = elliptic.getSecp256k1();

  /// Encoded Wallet (version, master seed, number of services, bip44, wallet curve)
  dev.log(
    'Encoded Wallet (version, master seed, number of services, bip44, wallet curve)',
  );
  const encodedWallet =
      version + masterSeed + totalServices + bip44 + walletCurve;
  dev.log(encodedWallet);

  /// Wallet Key (AES256 CTR) for encrypting Onchain Wallet (32 bytes)
  dev.log('Wallet Key (AES256 CTR) for encrypting Onchain Wallet (32 bytes)');
  //String walletEncryptionKey = uint8ListToHex(Uint8List.fromList(
  //    List<int>.generate(32, (int i) => Random.secure().nextInt(256))));
  const walletEncryptionKey =
      'D8711EE594202320A01A39AE26CA1ABCD3AE8FB1A226DAF2C0E509F4C7A1CEA0';
  dev.log(walletEncryptionKey);

  /// IV encrypting Onchain Wallet (SHA256(SHA256(Wallet Key)))[0:16]
  dev.log('IV encrypting Onchain Wallet (SHA256(SHA256(Wallet Key)))[0:16]');
  final walletEncryptionKeyEncrypted = sha256.process(
    sha256.process(Uint8List.fromList(hexToUint8List(walletEncryptionKey))),
  );
  final walletEncryptionIv =
      uint8ListToHex(walletEncryptionKeyEncrypted.sublist(0, 16)).toUpperCase();
  dev.log(walletEncryptionIv);

  /// Encryption of Encoded Wallet (AES256 CTR)
  dev.log('Encryption of Encoded Wallet (AES256 CTR)');
  final ctr = pc.CTRStreamCipher(pc.AESEngine())
    ..init(
      false,
      pc.ParametersWithIV(
        pc.KeyParameter(
          Uint8List.fromList(hexToUint8List(walletEncryptionKey)),
        ),
        Uint8List.fromList(hexToUint8List(walletEncryptionIv)),
      ),
    );
  final encryptedWallet = uint8ListToHex(
    ctr.process(Uint8List.fromList(hexToUint8List(encodedWallet))),
  ).toUpperCase();
  dev.log(encryptedWallet);

  /// ECDH Curve (0:ed25519, 1:nistp256, 2:secp256k1)
  dev.log('ECDH Curve (0:ed25519, 1:nistp256, 2:secp256k1)');
  const ecdhCurve = '02';
  dev.log(ecdhCurve);

  /// Ephemeral Public Key
  dev.log('Ephemeral Public Key');
  //elliptic.PrivateKey ephemeralPrivKey = curve.generatePrivateKey();
  //final elliptic.PublicKey ephemeralPubKey =
  //    curve.privateToPublicKey(ephemeralPrivKey);
  final ephemeralPrivKey = elliptic.PrivateKey.fromHex(
    curve,
    '7E7CA9D1191E1E822A268B71D7B389D2ECDD2A8F5048EEAA4517CD7BD436ADC5',
  );
  final ephemeralPubKey = curve.privateToPublicKey(ephemeralPrivKey);
  dev.log(ephemeralPubKey.toHex());

  /// Origin Device Public Key
  dev.log('Origin Device Public Key');
  final ledger =
      elliptic.PublicKey.fromHex(curve, originPublicKey.toUpperCase());
  dev.log(ledger.toHex());

  /// ECDH Point x: ECDH(Origin Device Public Key, Ephemeral Private Key)
  dev.log(
    'ECDH Point x: ECDH(Origin Device Public Key, Ephemeral Private Key)',
  );
  final ecdhSecret =
      Uint8List.fromList(ecdh.computeSecret(ephemeralPrivKey, ledger));
  dev.log(uint8ListToHex(ecdhSecret));

  final ecdhSecretEncrypted = sha512.process(sha512.process(ecdhSecret));

  /// AES256 CBC Key: SHA512(SHA512(ECDH Point x))[0:32]
  dev.log('AES256 CBC Key: SHA512(SHA512(ECDH Point x))[0:32]');
  final aesKey = uint8ListToHex(ecdhSecretEncrypted.sublist(0, 32));
  dev.log(aesKey);

  /// IV: SHA512(SHA512(ECDH Point x))[32:48]
  dev.log('IV: SHA512(SHA512(ECDH Point x))[32:48]');
  final iv = uint8ListToHex(ecdhSecretEncrypted.sublist(32, 48));
  dev.log(iv);

  /// Encryption of Wallet Key (AES256 CBC)
  dev.log('Encryption of Wallet Key (AES256 CBC)');
  final cbc = pc.CBCBlockCipher(pc.AESEngine())
    ..init(
      true,
      pc.ParametersWithIV(
        pc.KeyParameter(Uint8List.fromList(hexToUint8List(aesKey))),
        Uint8List.fromList(hexToUint8List(iv)),
      ),
    );
  final encryptedWalletKey = Uint8List(
    Uint8List.fromList(hexToUint8List(walletEncryptionKey)).length,
  ); // allocate space
  var offset = 0;
  while (
      offset < Uint8List.fromList(hexToUint8List(walletEncryptionKey)).length) {
    offset += cbc.processBlock(
      Uint8List.fromList(hexToUint8List(walletEncryptionKey)),
      offset,
      encryptedWalletKey,
      offset,
    );
  }

  dev.log(uint8ListToHex(encryptedWalletKey));

  /// Authentication Seed: SHA512(SHA512(ECDH Point x))[48:64]
  dev.log('Authentication Seed: SHA512(SHA512(ECDH Point x))[48:64]');
  final authSeed =
      uint8ListToHex(ecdhSecretEncrypted.sublist(48, 64)).toUpperCase();
  dev.log(authSeed);

  /// Authentication Key: SHA256(Authentication Seed)
  dev.log('Authentication Key: SHA256(Authentication Seed)');
  final authKey = sha256.process(Uint8List.fromList(hexToUint8List(authSeed)));
  dev.log(uint8ListToHex(authKey));

  /// Authentication Tag: HMAC256(Authentication Key, Encrypted Wallet Key)[0:16]
  dev.log(
    'Authentication Tag: HMAC256(Authentication Key, Encrypted Wallet Key)[0:16]',
  );

  final hmac = pc.HMac(pc.SHA256Digest(), 64)..init(pc.KeyParameter(authKey));
  final authTag =
      uint8ListToHex(hmac.process(encryptedWalletKey).sublist(0, 16));
  dev.log(authTag);

  /// Encoding of Encrypted Wallet Key(ephemeral public key, authentication tag, encrypted wallet key):
  dev.log(
    'Encoding of Encrypted Wallet Key(ephemeral public key, authentication tag, encrypted wallet key)',
  );
  final encodedWalletKey =
      ephemeralPubKey.toHex() + authTag + uint8ListToHex(encryptedWalletKey);
  dev.log(encodedWalletKey);

  final onChainWalletData = OnChainWalletData(
    encodedWalletKey: encodedWalletKey,
    encryptedWallet: encryptedWallet,
  );

  var payload = concatUint8List(<Uint8List>[
    Uint8List.fromList(hexToUint8List(onChainWalletData.encodedWalletKey!)),
    Uint8List.fromList(hexToUint8List(onChainWalletData.encryptedWallet!)),
  ]);
  var payloadLength = Uint8List.fromList(
    hexToUint8List(payload.lengthInBytes.toRadixString(16)),
  );
  final addressPayload = concatUint8List(<Uint8List>[payloadLength, payload]);
  dev.log('addressPayload: ${uint8ListToHex(addressPayload)}');

  final txHash = sha256.process(Uint8List.fromList('ARCHETHIC'.codeUnits));
  dev.log('txHash: ${uint8ListToHex(txHash)}');

  payload = concatUint8List(<Uint8List>[txHash, payload]);
  payloadLength = Uint8List.fromList(
    hexToUint8List(payload.lengthInBytes.toRadixString(16)),
  );
  final signPayload = concatUint8List(<Uint8List>[payloadLength, payload]);
  dev.log('signPayload: ${uint8ListToHex(signPayload)}');
  return onChainWalletData;
}
