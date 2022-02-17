import 'dart:math';
import 'dart:typed_data';
import 'package:archethic_lib_dart/src/utils/utils.dart';
import 'package:elliptic/elliptic.dart' as elliptic
    show Curve, getSecp256k1, PrivateKey, PublicKey;
import 'package:elliptic/ecdh.dart' as ecdh show computeSecret;
import 'package:pointycastle/export.dart' show Digest;
import 'package:pointycastle/export.dart' as pc;

/// Archethic Onchain Wallet Generator and Encoder, using V1 specifications
/// from https://hackmd.io/@219_ne6IRI6utatg6Fc8ZA/B1g0TU0uK
/// or https://archethic-foundation.github.io/archethic-docs/build/clients/wallet-spec
String walletEncoder(String originPublicKey) {
  final Digest sha256 = Digest('SHA-256');
  final Digest sha512 = Digest('SHA-512');

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
  String encodedWallet =
      version + masterSeed + totalServices + bip44 + walletCurve;
  // print(encodedWallet);

  /// Wallet Key (AES256 CTR) for encrypting Onchain Wallet (32 bytes)
  // print('Wallet Key (AES256 CTR) for encrypting Onchain Wallet (32 bytes)');
  String walletEncryptionKey = uint8ListToHex(Uint8List.fromList(
      List<int>.generate(32, (int i) => Random.secure().nextInt(256))));
  // print(walletEncryptionKey);

  /// IV encrypting Onchain Wallet (SHA256(SHA256(Wallet Key)))[0:16]
  // print('IV encrypting Onchain Wallet (SHA256(SHA256(Wallet Key)))[0:16]');
  final Uint8List _walletEncryptionKeyEncrypted =
      sha256.process(sha256.process(hexToUint8List(walletEncryptionKey)));
  final String walletEncryptionIv =
      uint8ListToHex(_walletEncryptionKeyEncrypted.sublist(0, 16))
          .toUpperCase();
  // print(walletEncryptionIv);

  /// Encryption of Encoded Wallet (AES256 CTR)
  // print('Encryption of Encoded Wallet (AES256 CTR)');
  final pc.CTRStreamCipher ctr = pc.CTRStreamCipher(pc.AESEngine())
    ..init(
        false,
        pc.ParametersWithIV(
            pc.KeyParameter(hexToUint8List(walletEncryptionKey)),
            hexToUint8List(walletEncryptionIv)));
  String encryptedWallet =
      uint8ListToHex(ctr.process(hexToUint8List(encodedWallet))).toUpperCase();
  // print(encryptedWallet);

  /// ECDH Curve (0:ed25519, 1:nistp256, 2:secp256k1)
  // print('ECDH Curve (0:ed25519, 1:nistp256, 2:secp256k1)');
  const String ecdhCurve = '02';
  // print(ecdhCurve);

  /// Ephemeral Public Key
  // print('Ephemeral Public Key');
  elliptic.PrivateKey ephemeralPrivKey = curve.generatePrivateKey();
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

  final Uint8List _ecdhSecretEncrypted =
      sha512.process(sha512.process(ecdhSecret));

  /// AES256 CBC Key: SHA512(SHA512(ECDH Point x))[0:32]
  // print('AES256 CBC Key: SHA512(SHA512(ECDH Point x))[0:32]');
  final String aesKey = uint8ListToHex(_ecdhSecretEncrypted.sublist(0, 32));
  // print(aesKey);

  /// IV: SHA512(SHA512(ECDH Point x))[32:48]
  // print('IV: SHA512(SHA512(ECDH Point x))[32:48]');
  final String iv = uint8ListToHex(_ecdhSecretEncrypted.sublist(32, 48));
  // print(iv);

  /// Encryption of Wallet Key (AES256 CBC)
  // print('Encryption of Wallet Key (AES256 CBC)');
  final pc.CBCBlockCipher cbc = pc.CBCBlockCipher(pc.AESEngine())
    ..init(
        true,
        pc.ParametersWithIV(
            pc.KeyParameter(hexToUint8List(aesKey)), hexToUint8List(iv)));
  final Uint8List encryptedWalletKey =
      Uint8List(hexToUint8List(walletEncryptionKey).length); // allocate space
  var offset = 0;
  while (offset < hexToUint8List(walletEncryptionKey).length) {
    offset += cbc.processBlock(hexToUint8List(walletEncryptionKey), offset,
        encryptedWalletKey, offset);
  }

  // print(uint8ListToHex(encryptedWalletKey));

  /// Authentication Seed: SHA512(SHA512(ECDH Point x))[48:64]
  // print('Authentication Seed: SHA512(SHA512(ECDH Point x))[48:64]');
  final String authSeed =
      uint8ListToHex(_ecdhSecretEncrypted.sublist(48, 64)).toUpperCase();
  // print(authSeed);

  /// Authentication Key: SHA256(Authentication Seed)
  // print('Authentication Key: SHA256(Authentication Seed)');
  final Uint8List authKey = sha256.process(hexToUint8List(authSeed));
  // print(uint8ListToHex(authKey));

  /// Authentication Tag: HMAC256(Authentication Key, Encrypted Wallet Key)[0:16]
  // print(
  //    'Authentication Tag: HMAC256(Authentication Key, Encrypted Wallet Key)[0:16]');

  final pc.HMac hmac = pc.HMac(pc.SHA256Digest(), 64)
    ..init(pc.KeyParameter(authKey));
  final String authTag =
      uint8ListToHex(hmac.process((encryptedWalletKey)).sublist(0, 16));
  // print(authTag);

  /// Encoding of Encrypted Wallet Key(ephemeral public key, authentication tag, encrypted wallet key):
  // print(
  //    'Encoding of Encrypted Wallet Key(ephemeral public key, authentication tag, encrypted wallet key)');
  final String encodedWalletKey =
      ephemeralPubKey.toHex() + authTag + uint8ListToHex(encryptedWalletKey);
  // print(encodedWalletKey);

  return encodedWalletKey;
}
