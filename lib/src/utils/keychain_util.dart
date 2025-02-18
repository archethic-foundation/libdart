import 'dart:convert';
import 'dart:typed_data';

import 'package:archethic_lib_dart/src/model/keychain.dart';
import 'package:archethic_lib_dart/src/model/transaction.dart';
import 'package:archethic_lib_dart/src/services/api_service.dart';
import 'package:archethic_lib_dart/src/utils/crypto.dart';
import 'package:archethic_lib_dart/src/utils/utils.dart';
import 'package:logging/logging.dart';

/// A mixin providing utility methods to interact with the Archethic blockchain keychain.
///
/// This mixin includes functions to verify the existence of a keychain, retrieve keychain addresses,
/// and perform related cryptographic operations.
mixin KeychainUtil {
  final _logger = Logger('KeychainUtil');

  /// Checks if a keychain exists for the given public key on the specified endpoint.
  ///
  /// - [endpoint]: The API endpoint to query.
  /// - [pubkey]: The public key as a `Uint8List`.
  ///
  /// Returns `true` if the keychain exists, `false` otherwise.
  Future<bool> checkKeychain(String endpoint, Uint8List pubkey) async {
    final genesisAddress = await _findKeychainGenesisAddress(endpoint, pubkey);
    if (genesisAddress == null || genesisAddress.isEmpty) {
      return false;
    }
    final transaction = await _searchKeychain(endpoint, genesisAddress);
    if (transaction == null) {
      return false;
    }

    return true;
  }

  /// Retrieves the list of keychain addresses associated with the given public key.
  ///
  /// - [endpoint]: The API endpoint to query.
  /// - [pubkey]: The public key as a `Uint8List`.
  ///
  /// Returns a list of keychain addresses as hexadecimal strings.
  Future<List<String>> keychainAddresses(
    String endpoint,
    Uint8List pubkey,
  ) async {
    // We hardcode the curve ID (0 = ed25519 by default)
    final genesisAddress = await _findKeychainGenesisAddress(endpoint, pubkey);
    if (genesisAddress == null || genesisAddress.isEmpty) {
      return [];
    }

    final transaction = await _searchKeychain(endpoint, genesisAddress);
    if (transaction == null ||
        transaction.data == null ||
        transaction.data!.content == null) {
      return [];
    }

    final publicKeys = <String>[];
    final json = jsonDecode(transaction.data!.content!);

    if (json.containsKey('verificationMethod')) {
      for (final method in json['verificationMethod']) {
        if (method is Map<String, dynamic> &&
            method.containsKey('publicKeyJwk')) {
          final publicKeyJwk = method['publicKeyJwk'];
          if (publicKeyJwk is Map<String, dynamic> &&
              publicKeyJwk.containsKey('x')) {
            try {
              final publicKey = jwkToKey(publicKeyJwk);
              publicKeys.add(uint8ListToHex(publicKey));
            } catch (e) {
              _logger.severe(
                'Error converting JWK to public key: $e',
              );
            }
          }
        }
      }
    }

    final addressList = <String>[];
    for (final publicKey in publicKeys) {
      addressList.add(
        '00${uint8ListToHex(hash(hexToUint8List(publicKey)))}',
      );
    }

    return addressList;
  }

  /// Finds the genesis address for a keychain associated with the given public key.
  ///
  /// - [endpoint]: The API endpoint to query.
  /// - [pubkey]: The public key as a `Uint8List`.
  ///
  /// Returns the genesis address as a `String`, or `null` if not found.
  Future<String?> _findKeychainGenesisAddress(
    String endpoint,
    Uint8List pubkey,
  ) async {
    // We hardcode the curve ID (0 = ed25519 by default)
    final address = '00${uint8ListToHex(hash(pubkey))}';
    final genesisAddress = await ApiService(endpoint).getGenesisAddress(
      address,
    );
    return genesisAddress.address;
  }

  /// Searches for the keychain transaction using its genesis address.
  ///
  /// - [endpoint]: The API endpoint to query.
  /// - [genesisAddress]: The genesis address of the keychain.
  ///
  /// Returns a `Transaction` object if found, or `null` otherwise.
  Future<Transaction?> _searchKeychain(
    String endpoint,
    String genesisAddress,
  ) async {
    final transactionMap = await ApiService(endpoint).getLastTransaction(
      [genesisAddress],
      request: 'address data { content } type',
    );

    if (transactionMap[genesisAddress] == null ||
        transactionMap[genesisAddress]!.type != 'keychain') {
      return null;
    }
    return transactionMap[genesisAddress];
  }
}
