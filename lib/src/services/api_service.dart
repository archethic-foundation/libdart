/// SPDX-License-Identifier: AGPL-3.0-or-later
import 'dart:async';
import 'dart:convert';
import 'dart:math';
import 'dart:typed_data';

import 'package:archethic_lib_dart/src/model/authorized_key.dart';
import 'package:archethic_lib_dart/src/model/balance.dart';
import 'package:archethic_lib_dart/src/model/exception/archethic_exception.dart';
import 'package:archethic_lib_dart/src/model/keychain.dart';
import 'package:archethic_lib_dart/src/model/node.dart';
import 'package:archethic_lib_dart/src/model/ownership.dart';
import 'package:archethic_lib_dart/src/model/response/network_transactions_response.dart';
import 'package:archethic_lib_dart/src/model/response/nodes_response.dart';
import 'package:archethic_lib_dart/src/model/response/origin_key_response.dart';
import 'package:archethic_lib_dart/src/model/shared_secrets.dart';
import 'package:archethic_lib_dart/src/model/token.dart';
import 'package:archethic_lib_dart/src/model/transaction.dart';
import 'package:archethic_lib_dart/src/model/transaction_fee.dart';
import 'package:archethic_lib_dart/src/model/transaction_input.dart';
import 'package:archethic_lib_dart/src/model/transaction_status.dart';
import 'package:archethic_lib_dart/src/utils/collection_utils.dart';
import 'package:archethic_lib_dart/src/utils/crypto.dart';
import 'package:archethic_lib_dart/src/utils/logs.dart';
import 'package:archethic_lib_dart/src/utils/utils.dart';
import 'package:graphql/client.dart';
import 'package:http/http.dart' as http;

class ApiService {
  ApiService(this.endpoint)
      : _client = GraphQLClient(
            link: HttpLink('$endpoint/api'),
            cache: GraphQLCache(),
            defaultPolicies: DefaultPolicies(
              query: Policies(
                fetch: FetchPolicy.noCache,
                error: ErrorPolicy.all,
              ),
            ));

  static const Map<String, String> kRequestHeaders = <String, String>{
    'Content-type': 'application/json',
    'Accept': 'application/json',
  };

  static const _responseKeysToIgnore = ['__typename'];

  final GraphQLClient _client;

  /// [endpoint] is the HTTP URL to a Archethic node (acting as welcome node)
  final String endpoint;

  /// Send a transaction to the network
  /// @param {Object} tx Transaction to send
  Future<TransactionStatus> sendTx(Transaction transaction) async {
    final completer = Completer<TransactionStatus>();

    var transactionStatus = TransactionStatus();
    log('sendTx: requestHttp.body=${transaction.convertToJSON()}');
    try {
      final responseHttp = await http.post(
        Uri.parse('$endpoint/api/transaction'),
        body: transaction.convertToJSON(),
        headers: kRequestHeaders,
      );
      log('sendTx: responseHttp.body=${responseHttp.body}');
      transactionStatus = transactionStatusFromJson(responseHttp.body);

      completer.complete(transactionStatus);
    } catch (e) {
      log(e.toString());
    }

    return completer.future;
  }

  /// Query the network to find the last transaction from a liste of addresses
  Future<Map<String, Transaction>> getLastTransaction(
    List<String> addresses, {
    String request = Transaction.kTransactionQueryAllFields,
  }) async {
    if (addresses.isEmpty) {
      return {};
    }

    final fragment = 'fragment fields on Transaction { $request }';
    final body = StringBuffer()..write('query { ');
    for (final address in addresses) {
      body.write(
        ' _$address: lastTransaction(address:"$address") { ...fields }',
      );
    }
    body.write(' } $fragment');
    log('getLastTransaction: requestHttp.body=$body');

    final result = await _client.query(
      QueryOptions(
        document: gql(body.toString()),
        parserFn: (data) {
          final transactions = data.mapValues(
            (value) => value == null
                ? null
                : Transaction.fromJson(value as Map<String, dynamic>),
            keysToIgnore: _responseKeysToIgnore,
          );
          return removeAliasPrefix(transactions) ?? {};
        },
      ),
    );

    if (result.exception?.linkException != null) {
      throw ArchethicConnectionException(
        result.exception!.linkException.toString(),
      );
    }

    return result.parsedData ?? {};
  }

  Future<Map<String, int>> getTransactionIndex(List<String> addresses) async {
    if (addresses.isEmpty) {
      return {};
    }

    final lastTransactionMap =
        await getLastTransaction(addresses, request: 'chainLength');

    final lastTransactionIndexMap = <String, int>{};
    lastTransactionMap.forEach((key, value) {
      lastTransactionIndexMap[key] = value.chainLength ?? 0;
    });

    return removeAliasPrefix<int>(lastTransactionIndexMap) ?? {};
  }

  Future<String> getStorageNoncePublicKey() async {
    const body = 'query {sharedSecrets {storageNoncePublicKey}}';
    log('getStorageNoncePublicKey: requestHttp.body=$body');

    final result = await _client.query(
      QueryOptions(
        document: gql(body),
        parserFn: (object) => SharedSecrets.fromJson(object),
      ),
    );

    if (result.exception?.linkException != null) {
      throw ArchethicConnectionException(
        result.exception!.linkException.toString(),
      );
    }

    return result.parsedData?.storageNoncePublicKey ?? '';
  }

  /// Query the network to find a balance from a list of addresses
  Future<Map<String, Balance>> fetchBalance(List<String> addresses,
      {String request = Transaction.kTransactionBalanceQueryAllFields}) async {
    if (addresses.isEmpty) {
      return {};
    }

    final fragment = 'fragment fields on Balance { $request }';
    final body = StringBuffer()..write('query { ');
    for (final address in addresses) {
      body.write(
        ' _$address: balance(address:"$address") { ...fields }',
      );
    }
    body.write(' } $fragment');
    log('fetchBalance: requestHttp.body=$body');

    final result = await _client.query(
      QueryOptions(
        document: gql(body.toString()),
        parserFn: (object) {
          final balances = object.mapValues(
            (value) => Balance.fromJson(value as Map<String, dynamic>),
            keysToIgnore: _responseKeysToIgnore,
          );
          return removeAliasPrefix(balances) ?? {};
        },
      ),
    );
    if (result.exception?.linkException != null) {
      throw ArchethicConnectionException(
        result.exception!.linkException.toString(),
      );
    }

    return result.parsedData ?? {};
  }

  /// Query the network to find a transaction from a list of addresses
  Future<Map<String, String>> getTransactionContent(
    List<String> addresses,
  ) async {
    if (addresses.isEmpty) {
      return {};
    }

    try {
      final transactionChainMap = await getTransactionChain(
        addresses,
        request: 'data { content }',
      );

      final contentMap = <String, String>{};

      transactionChainMap.forEach((key, value) {
        final transactionList = transactionChainMap[key];
        if (transactionList != null) {
          for (final element in transactionList) {
            if (element.data != null && element.data!.content != null) {
              contentMap[key] = element.data!.content!;
            }
          }
        }
      });

      return removeAliasPrefix<String>(contentMap) ?? {};
    } catch (e) {
      log('getTransactionContent: error=$e');
      rethrow;
    }
  }

  /// Query the network to find transaction chains from a list of addresses
  /// Returns the content scalar type represents transaction content [List<Transaction>]. Depending if the content can displayed it will be rendered as plain text otherwise in hexadecimal
  Future<Map<String, List<Transaction>>> getTransactionChain(
    List<String> addresses, {
    String request = Transaction.kTransactionQueryAllFields,
  }) async {
    if (addresses.isEmpty) {
      return {};
    }

    final fragment = 'fragment fields on Transaction { $request }';
    final body = StringBuffer()..write('query { ');
    // TODO(reddwarf03): Not good the '_' system to define alias but address format is not accepted by graphQL
    for (final address in addresses) {
      body.write(
          ' _$address: transactionChain(address:"$address") { ...fields }');
    }
    body.write('} $fragment');
    log('getTransactionChain: requestHttp.body=$body');

    final result = await _client.query(
      QueryOptions(
        document: gql(body.toString()),
        parserFn: (object) {
          final transactions = object.mapValues(
            (transactions) => (transactions as List<dynamic>)
                .map(
                  (transaction) =>
                      Transaction.fromJson(transaction as Map<String, dynamic>),
                )
                .toList(),
            keysToIgnore: _responseKeysToIgnore,
          );
          return removeAliasPrefix<List<Transaction>>(transactions) ?? {};
        },
      ),
    );

    if (result.exception?.linkException != null) {
      throw ArchethicConnectionException(
        result.exception!.linkException.toString(),
      );
    }

    return result.parsedData ?? {};
  }

  /// Query the node infos
  /// Returns a [List<Node>] with infos
  Future<List<Node>> getNodeList() async {
    const body =
        'query {nodes {authorized available averageAvailability firstPublicKey geoPatch ip lastPublicKey networkPatch port rewardAddress authorizationDate enrollmentDate}}';
    log('getNodeList: requestHttp.body=$body');

    final result = await _client.query(
      QueryOptions(
        document: gql(body),
        parserFn: (json) => NodesResponseData.fromJson(json).nodes!,
      ),
    );

    if (result.exception?.linkException != null) {
      throw ArchethicConnectionException(
        result.exception!.linkException.toString(),
      );
    }

    return result.parsedData ?? [];
  }

  /// Query the network to list the transaction on the type
  /// @param {String} The type of transaction
  /// @param {int} The page
  /// @param {String} request List of informations to retrieve in the GraphQL Query
  /// Returns the content scalar type represents transaction content [List<Transaction>]. Depending if the content can displayed it will be rendered as plain text otherwise in hexadecimal
  Future<List<Transaction>> networkTransactions(
    String type,
    int page, {
    String request = Transaction.kTransactionQueryAllFields,
  }) async {
    final body =
        'query { networkTransactions(type: "$type", page: $page) { $request } }';
    log('networkTransactions: requestHttp.body=$body');

    final result = await _client.query(
      QueryOptions(
        document: gql(body),
        parserFn: (json) {
          return TransactionsResponseData.fromJson(json).networkTransactions!;
        },
      ),
    );

    if (result.exception?.linkException != null) {
      throw ArchethicConnectionException(
        result.exception!.linkException.toString(),
      );
    }

    return result.parsedData ?? [];
  }

  /// Query the network to list the transaction inputs from a list of addresses
  Future<Map<String, List<TransactionInput>>> getTransactionInputs(
    List<String> addresses, {
    String request = Transaction.kTransactionInputQueryAllFields,
  }) async {
    if (addresses.isEmpty) {
      return {};
    }

    final fragment = 'fragment fields on TransactionInput { $request }';
    final body = StringBuffer()..write('query { ');
    for (final address in addresses) {
      body.write(
        ' _$address: transactionInputs(address:"$address") { ...fields } ',
      );
    }
    body.write(' } $fragment');
    log('getTransactionInputs: requestHttp.body=$body');

    final result = await _client.query(
      QueryOptions(
        document: gql(body.toString()),
        parserFn: (json) {
          final transactionInputs = json.mapValues(
            (transactionInputs) => (transactionInputs as List<dynamic>)
                .map(
                  (transactionInput) => TransactionInput.fromJson(
                      transactionInput as Map<String, dynamic>),
                )
                .toList(),
            keysToIgnore: _responseKeysToIgnore,
          );
          return removeAliasPrefix<List<TransactionInput>>(transactionInputs) ??
              {};
        },
      ),
    );

    if (result.exception?.linkException != null) {
      throw ArchethicConnectionException(
        result.exception!.linkException.toString(),
      );
    }

    return result.parsedData ?? {};
  }

  /// Query the network to find a transaction
  /// Returns all informations represent transaction content.
  Future<Map<String, Transaction>> getTransaction(
    List<String> addresses, {
    String request = Transaction.kTransactionQueryAllFields,
  }) async {
    if (addresses.isEmpty) {
      return {};
    }

    final fragment = 'fragment fields on Transaction { $request }';
    final body = StringBuffer()..write('query { ');
    for (final address in addresses) {
      body.write(
        ' _$address: transaction(address:"$address") { ...fields }',
      );
    }
    body.write('} $fragment');
    log('getTransaction: requestHttp.body=$body');
    final result = await _client.query(
      QueryOptions(
        document: gql(body.toString()),
        parserFn: (json) {
          final transactions = json.mapValues(
            (value) => Transaction.fromJson(value as Map<String, dynamic>),
            keysToIgnore: _responseKeysToIgnore,
          );
          return removeAliasPrefix<Transaction>(transactions) ?? {};
        },
      ),
    );

    if (result.exception?.linkException != null) {
      throw ArchethicConnectionException(
        result.exception!.linkException.toString(),
      );
    }

    return result.parsedData ?? {};
  }

  /// Get transaction fees
  /// @param {Object} tx Transaction to estimate fees
  Future<TransactionFee> getTransactionFee(Transaction transaction) async {
    log('getTransactionFee: requestHttp.body=${transaction.convertToJSON()}');
    final responseHttp = await http.post(
      Uri.parse('$endpoint/api/transaction_fee'),
      body: transaction.convertToJSON(),
      headers: kRequestHeaders,
    );
    log('getTransactionFee: responseHttp.body=${responseHttp.body}');
    return transactionFeeFromJson(responseHttp.body);
  }

  /// getTransactionOwnerships
  /// @param {List<String>} addresses
  Future<Map<String, List<Ownership>>> getTransactionOwnerships(
    List<String> addresses,
  ) async {
    if (addresses.isEmpty) {
      return {};
    }

    try {
      final transactionMap = await getTransaction(
        addresses,
        request:
            'data { ownerships { secret, authorizedPublicKeys { encryptedSecretKey, publicKey } } }',
      );

      final ownershipsMap = <String, List<Ownership>>{};

      transactionMap.forEach(
        (key, value) {
          if (value.data != null && value.data!.ownerships != null) {
            ownershipsMap[key] = value.data!.ownerships!;
          }
        },
      );

      return removeAliasPrefix<List<Ownership>>(ownershipsMap) ?? {};
    } catch (e) {
      log('getTransactionOwnerships: error=$e');
    }

    return {};
  }

  /// Create a new keychain and build a transaction
  /// @param {String} seed Keychain's seed
  /// @param {List<AuthorizedKey>} authorizedPublicKeys List of authorized public keys able to decrypt the keychain
  /// @param {Uint8List} originPrivateKey Origin private key to attest the transaction
  /// @param {String} service name
  /// @param {String} derivation path associated to service name
  Transaction newKeychainTransaction(
    String seed,
    List<String> authorizedPublicKeys,
    Uint8List originPrivateKey, {
    String? serviceName,
    String? derivationPath,
  }) {
    final keychain = Keychain(Uint8List.fromList(hexToUint8List(seed)));
    if (serviceName!.isNotEmpty && derivationPath!.isNotEmpty) {
      keychain.addService(serviceName, derivationPath);
    }

    final aesKey = uint8ListToHex(
      Uint8List.fromList(
        List<int>.generate(32, (int i) => Random.secure().nextInt(256)),
      ),
    );

    final authorizedKeys = List<AuthorizedKey>.empty(growable: true);
    for (final key in authorizedPublicKeys) {
      authorizedKeys.add(
        AuthorizedKey(
          encryptedSecretKey: uint8ListToHex(ecEncrypt(aesKey, key)),
          publicKey: key,
        ),
      );
    }

    return Transaction(type: 'keychain', data: Transaction.initData())
        .setContent(jsonEncode(keychain.toDID()))
        .addOwnership(aesEncrypt(keychain.encode(), aesKey), authorizedKeys)
        .build(seed, 0)
        .originSign(originPrivateKey);
  }

  /// Create a new access keychain and build a transaction
  /// @param {String} seed Access keychain's seed
  /// @param {Uint8List} keychainAddress Keychain's transaction address
  /// @param {Uint8List} originPrivateKey Origin private key to attest the transaction
  Transaction newAccessKeychainTransaction(
    String seed,
    Uint8List keychainAddress,
    Uint8List originPrivateKey,
  ) {
    final aesKey = uint8ListToHex(
      Uint8List.fromList(
        List<int>.generate(32, (int i) => Random.secure().nextInt(256)),
      ),
    );

    final keypair = deriveKeyPair(seed, 0);

    final encryptedSecretKey = ecEncrypt(aesKey, keypair.publicKey);

    final authorizedKeys = <AuthorizedKey>[
      AuthorizedKey(
        publicKey: uint8ListToHex(keypair.publicKey),
        encryptedSecretKey: uint8ListToHex(encryptedSecretKey),
      )
    ];

    return Transaction(type: 'keychain_access', data: Transaction.initData())
        .addOwnership(aesEncrypt(keychainAddress, aesKey), authorizedKeys)
        .build(seed, 0)
        .originSign(originPrivateKey);
  }

  /// Retrieve a keychain by using keychain access seed
  /// @param {String} seed Keychain's access seed
  Future<Keychain> getKeychain(String seed) async {
    final keypair = deriveKeyPair(seed, 0);
    final accessKeychainAddress = deriveAddress(seed, 1);

    try {
      final ownershipsMap =
          await getTransactionOwnerships([accessKeychainAddress]);
      if (ownershipsMap[accessKeychainAddress] == null ||
          ownershipsMap[accessKeychainAddress]!.isEmpty) {
        throw "Keychain doesn't exists";
      }

      final ownership = ownershipsMap[accessKeychainAddress]![0];
      final authorizedPublicKey = ownership.authorizedPublicKeys!.firstWhere(
        (AuthorizedKey authKey) =>
            authKey.publicKey!.toUpperCase() ==
            uint8ListToHex(keypair.publicKey).toUpperCase(),
      );

      final aesKey =
          ecDecrypt(authorizedPublicKey.encryptedSecretKey, keypair.privateKey);
      final keychainAddress = aesDecrypt(ownership.secret, aesKey);
      log('keychainAddress (getKeychain): ${uint8ListToHex(keychainAddress)}');

      final lastTransactionKeychainMap = await getLastTransaction(
        [uint8ListToHex(keychainAddress)],
        request: 'address',
      );

      final ownerships2Map = await getTransactionOwnerships(
        [lastTransactionKeychainMap[uint8ListToHex(keychainAddress)]!.address!],
      );

      final ownership2 = ownerships2Map[
          lastTransactionKeychainMap[uint8ListToHex(keychainAddress)]!
              .address!]![0];

      final authorizedPublicKey2 = ownership2.authorizedPublicKeys!.firstWhere(
        (AuthorizedKey publicKey) =>
            publicKey.publicKey!.toUpperCase() ==
            uint8ListToHex(keypair.publicKey).toUpperCase(),
      );
      final aesKey2 = ecDecrypt(
        authorizedPublicKey2.encryptedSecretKey,
        keypair.privateKey,
      );
      final keychain = aesDecrypt(ownership2.secret, aesKey2);
      return decodeKeychain(keychain);
    } catch (e) {
      if (e.toString() == "Keychain doesn't exists") {
        throw Exception(e.toString());
      } else {
        throw ArchethicConnectionException(e.toString());
      }
    }
  }

  String getOriginKey() {
    return kOriginPrivateKey;
  }

  /// Add a new origin key
  /// @param {String} originPublicKey origin public key to be added
  /// @param {String} certificate certificate of the origin public key
  Future<String> addOriginKey({
    String? originPublicKey,
    String? certificate,
  }) async {
    final body = jsonEncode(<String, String>{
      'origin_public_key': originPublicKey!,
      'certificate': certificate!
    });
    final responseHttp = await http.post(
      Uri.parse('$endpoint/api/origin_key'),
      body: body,
      headers: kRequestHeaders,
    );
    log('addOriginKey: requestHttp.body=$body');
    log('addOriginKey: responseHttp.body=${responseHttp.body}');

    return originKeyResponseFromJson(responseHttp.body).toString();
  }

  /// Query the network to find a token's data from a list of token addresses
  Future<Map<String, Token>> getToken(
    List<String> addresses, {
    String request = 'genesis, name, id, supply, symbol, type, properties',
  }) async {
    if (addresses.isEmpty) {
      return {};
    }

    final fragment = 'fragment fields on Token { $request }';
    final body = StringBuffer()..write('query { ');
    for (final address in addresses) {
      body.write(
        ' _$address: token(address:"$address") { ...fields }',
      );
    }
    body.write(' } $fragment');
    log('getToken: requestHttp.body=$body');

    final result = await _client.query(
      QueryOptions(
        document: gql(body.toString()),
        parserFn: (json) {
          final tokens = json.mapValues(
            (value) => Token.fromJson(value as Map<String, dynamic>),
            keysToIgnore: _responseKeysToIgnore,
          );
          return removeAliasPrefix<Token>(tokens) ?? {};
        },
      ),
    );

    if (result.exception?.linkException != null) {
      throw ArchethicConnectionException(
        result.exception!.linkException.toString(),
      );
    }

    return result.parsedData ?? {};
  }
}
