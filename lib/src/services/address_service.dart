// Dart imports:
import 'dart:typed_data';

// Project imports:
import 'package:archethic_lib_dart/src/model/crypto/key_pair.dart';
import 'package:archethic_lib_dart/src/model/transaction.dart';
import 'package:archethic_lib_dart/src/services/api_service.dart';

import 'package:archethic_lib_dart/src/crypto.dart' as crypto
    show deriveKeyPair, hash;

import 'package:archethic_lib_dart/src/utils.dart'
    show uint8ListToHex, concatUint8List;

class AddressService {
  AddressService(this.endpoint);

  /// [endpoint] is the HTTP URL to a ArchEthic node (acting as welcome node)
  String? endpoint;

  /// Derive an address
  /// @param {String} seed TransactionChain seed
  /// @param {int} index Number of transaction in the chain
  /// @param {String} curve  Elliptic curve to use ("ed25519", "P256", "secp256k1")
  /// @param {String} hashAlgo  Hash algorithm ("sha256", "sha512", "sha3-256", "sha3-512", "blake2b")
  String deriveAddress(String seed, int index,
      {String curve = 'ed25519', String hashAlgo = 'sha256'}) {
    final KeyPair keypair = crypto.deriveKeyPair(seed, index, curve: curve);
    switch (curve) {
      case 'ed25519':
        return uint8ListToHex(concatUint8List([
          Uint8List.fromList([0]),
          crypto.hash(keypair.publicKey, algo: hashAlgo)
        ]));
      case 'P256':
        return uint8ListToHex(concatUint8List([
          Uint8List.fromList([1]),
          crypto.hash(keypair.publicKey, algo: hashAlgo)
        ]));
      case 'secp256k1':
        return uint8ListToHex(concatUint8List([
          Uint8List.fromList([2]),
          crypto.hash(keypair.publicKey, algo: hashAlgo)
        ]));
      default:
        throw 'Curve not supported';
    }
  }

  /// Get the last address from seed
  /// @param {String} seed TransactionChain seed
  Future<String> lastAddressFromSeed(String seed) async {
    final String genesisAddress = deriveAddress(seed, 0);
    final String lastAddress = await lastAddressFromAddress(genesisAddress);
    return lastAddress;
  }

  /// Get the last address from address
  /// @param {String} address TransactionChain address
  Future<String> lastAddressFromAddress(String address) async {
    final Transaction transaction =
        await ApiService(endpoint!).getLastTransaction(address);
    return transaction.address == null ? '' : transaction.address!;
  }
}
