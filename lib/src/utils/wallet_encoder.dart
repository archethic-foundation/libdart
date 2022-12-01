/// SPDX-License-Identifier: AGPL-3.0-or-later

// Dart imports:
import 'dart:developer' as dev;
import 'dart:math';
import 'dart:typed_data';

// Package imports:
import 'package:elliptic/ecdh.dart' as ecdh show computeSecret;

// Project imports:
import 'package:archethic_lib_dart/src/model/on_chain_wallet_data.dart';
import 'package:archethic_lib_dart/src/utils/utils.dart';

import 'package:elliptic/elliptic.dart' as elliptic
    show Curve, getSecp256k1, PrivateKey, PublicKey;
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
OnChainWalletData walletEncoder(String originPublicKey) {
  final pc.Digest sha256 = pc.Digest('SHA-256');
  final pc.Digest sha512 = pc.Digest('SHA-512');

  const String version = '01';

  /// Master Seed for Onchain Wallet (32 bytes)
  // print('Master Seed for Onchain Wallet (32 bytes)');
  final String masterSeed = uint8ListToHex(Uint8List.fromList(
      List<int>.generate(32, (int i) => Random.secure().nextInt(256))));
  // print(masterSeed);

  const String totalServices = '01';
  const String coinType = '028A';
  const String account = '0000';

  /// BIP44 Path (4 bytes): [Coin type = 650, account = 0]
  // print('BIP44 Path (4 bytes): [Coin type = 650, account = 0]');
  const String bip44 = coinType + account;
  // print(bip44);

  /// Wallet Curve (0:ed25519, 1:nistp256, 2:secp256k1)
  // print('Wallet Curve (0:ed25519, 1:nistp256, 2:secp256k1)');
  const String walletCurve = '02';
  // print(walletCurve);

  final elliptic.Curve curve = elliptic.getSecp256k1();

  /// Encoded Wallet (version, master seed, number of services, bip44, wallet curve)
  // print(
  //    'Encoded Wallet (version, master seed, number of services, bip44, wallet curve)');
  final String encodedWallet =
      version + masterSeed + totalServices + bip44 + walletCurve;
  // print(encodedWallet);

  /// Wallet Key (AES256 CTR) for encrypting Onchain Wallet (32 bytes)
  // print('Wallet Key (AES256 CTR) for encrypting Onchain Wallet (32 bytes)');
  final String walletEncryptionKey = uint8ListToHex(Uint8List.fromList(
      List<int>.generate(32, (int i) => Random.secure().nextInt(256))));
  // print(walletEncryptionKey);

  /// IV encrypting Onchain Wallet (SHA256(SHA256(Wallet Key)))[0:16]
  // print('IV encrypting Onchain Wallet (SHA256(SHA256(Wallet Key)))[0:16]');
  final Uint8List walletEncryptionKeyEncrypted = sha256.process(
      sha256.process(Uint8List.fromList(hexToUint8List(walletEncryptionKey))));
  final String walletEncryptionIv =
      uint8ListToHex(walletEncryptionKeyEncrypted.sublist(0, 16)).toUpperCase();
  // print(walletEncryptionIv);

  /// Encryption of Encoded Wallet (AES256 CTR)
  // print('Encryption of Encoded Wallet (AES256 CTR)');
  final pc.CTRStreamCipher ctr = pc.CTRStreamCipher(pc.AESEngine())
    ..init(
        false,
        pc.ParametersWithIV(
            pc.KeyParameter(
                Uint8List.fromList(hexToUint8List(walletEncryptionKey))),
            Uint8List.fromList(hexToUint8List(walletEncryptionIv))));
  final String encryptedWallet = uint8ListToHex(
          ctr.process(Uint8List.fromList(hexToUint8List(encodedWallet))))
      .toUpperCase();
  // print(encryptedWallet);

  /// ECDH Curve (0:ed25519, 1:nistp256, 2:secp256k1)
  // print('ECDH Curve (0:ed25519, 1:nistp256, 2:secp256k1)');
  // const String ecdhCurve = '02';
  // print(ecdhCurve);

  /// Ephemeral Public Key
  // print('Ephemeral Public Key');
  final elliptic.PrivateKey ephemeralPrivKey = curve.generatePrivateKey();
  final elliptic.PublicKey ephemeralPubKey =
      curve.privateToPublicKey(ephemeralPrivKey);
  // print(ephemeralPubKey.toHex());

  /// Origin Device Public Key
  // print('Origin Device Public Key');
  final elliptic.PublicKey ledger =
      elliptic.PublicKey.fromHex(curve, originPublicKey.toUpperCase());
  // print(ledger.toHex());

  /// ECDH Point x: ECDH(Origin Device Public Key, Ephemeral Private Key)
  // print('ECDH Point x: ECDH(Origin Device Public Key, Ephemeral Private Key)');
  final Uint8List ecdhSecret =
      Uint8List.fromList(ecdh.computeSecret(ephemeralPrivKey, ledger));
  // print(uint8ListToHex(ecdhSecret));

  final Uint8List ecdhSecretEncrypted =
      sha512.process(sha512.process(ecdhSecret));

  /// AES256 CBC Key: SHA512(SHA512(ECDH Point x))[0:32]
  // print('AES256 CBC Key: SHA512(SHA512(ECDH Point x))[0:32]');
  final String aesKey = uint8ListToHex(ecdhSecretEncrypted.sublist(0, 32));
  // print(aesKey);

  /// IV: SHA512(SHA512(ECDH Point x))[32:48]
  // print('IV: SHA512(SHA512(ECDH Point x))[32:48]');
  final String iv = uint8ListToHex(ecdhSecretEncrypted.sublist(32, 48));
  // print(iv);

  /// Encryption of Wallet Key (AES256 CBC)
  // print('Encryption of Wallet Key (AES256 CBC)');
  final pc.CBCBlockCipher cbc = pc.CBCBlockCipher(pc.AESEngine())
    ..init(
        true,
        pc.ParametersWithIV(
            pc.KeyParameter(Uint8List.fromList(hexToUint8List(aesKey))),
            Uint8List.fromList(hexToUint8List(iv))));
  final Uint8List encryptedWalletKey = Uint8List(
      Uint8List.fromList(hexToUint8List(walletEncryptionKey))
          .length); // allocate space
  int offset = 0;
  while (
      offset < Uint8List.fromList(hexToUint8List(walletEncryptionKey)).length) {
    offset += cbc.processBlock(
        Uint8List.fromList(hexToUint8List(walletEncryptionKey)),
        offset,
        encryptedWalletKey,
        offset);
  }

  // print(uint8ListToHex(encryptedWalletKey));

  /// Authentication Seed: SHA512(SHA512(ECDH Point x))[48:64]
  // print('Authentication Seed: SHA512(SHA512(ECDH Point x))[48:64]');
  final String authSeed =
      uint8ListToHex(ecdhSecretEncrypted.sublist(48, 64)).toUpperCase();
  // print(authSeed);

  /// Authentication Key: SHA256(Authentication Seed)
  // print('Authentication Key: SHA256(Authentication Seed)');
  final Uint8List authKey =
      sha256.process(Uint8List.fromList(hexToUint8List(authSeed)));
  // print(uint8ListToHex(authKey));

  /// Authentication Tag: HMAC256(Authentication Key, Encrypted Wallet Key)[0:16]
  // print(
  //    'Authentication Tag: HMAC256(Authentication Key, Encrypted Wallet Key)[0:16]');

  final pc.HMac hmac = pc.HMac(pc.SHA256Digest(), 64)
    ..init(pc.KeyParameter(authKey));
  final String authTag =
      uint8ListToHex(hmac.process(encryptedWalletKey).sublist(0, 16));
  // print(authTag);

  /// Encoding of Encrypted Wallet Key(ephemeral public key, authentication tag, encrypted wallet key):
  // print(
  //    'Encoding of Encrypted Wallet Key(ephemeral public key, authentication tag, encrypted wallet key)');
  final String encodedWalletKey =
      ephemeralPubKey.toHex() + authTag + uint8ListToHex(encryptedWalletKey);
  // print(encodedWalletKey);

  final OnChainWalletData onChainWalletData = OnChainWalletData(
      encodedWalletKey: encodedWalletKey, encryptedWallet: encryptedWallet);

  final Uint8List payload = concatUint8List(<Uint8List>[
    Uint8List.fromList(hexToUint8List(onChainWalletData.encodedWalletKey!)),
    Uint8List.fromList(hexToUint8List(onChainWalletData.encryptedWallet!))
  ]);
  final Uint8List payloadLength = Uint8List.fromList(
      hexToUint8List(payload.lengthInBytes.toRadixString(16)));
  final Uint8List addressPayload =
      concatUint8List(<Uint8List>[payloadLength, payload]);
  dev.log('addressPayload: ${uint8ListToHex(addressPayload)}');

  return onChainWalletData;
}
