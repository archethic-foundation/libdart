/// SPDX-License-Identifier: AGPL-3.0-or-later
import 'dart:async';
import 'dart:convert';
import 'dart:math';
import 'dart:typed_data';

import 'package:archethic_lib_dart/src/model/address.dart';
import 'package:archethic_lib_dart/src/model/authorized_key.dart';
import 'package:archethic_lib_dart/src/model/balance.dart';
import 'package:archethic_lib_dart/src/model/blockchain_version.dart';
import 'package:archethic_lib_dart/src/model/endpoint.dart';
import 'package:archethic_lib_dart/src/model/exception/archethic_exception.dart';
import 'package:archethic_lib_dart/src/model/keychain.dart';
import 'package:archethic_lib_dart/src/model/node.dart';
import 'package:archethic_lib_dart/src/model/ownership.dart';
import 'package:archethic_lib_dart/src/model/response/genesis_address_response.dart';
import 'package:archethic_lib_dart/src/model/response/nearest_endpoints_response.dart';
import 'package:archethic_lib_dart/src/model/response/network_transactions_response.dart';
import 'package:archethic_lib_dart/src/model/response/nodes_response.dart';
import 'package:archethic_lib_dart/src/model/response/origin_key_response.dart';
import 'package:archethic_lib_dart/src/model/shared_secrets.dart';
import 'package:archethic_lib_dart/src/model/smart_contracts/sc_call_function_request.dart';
import 'package:archethic_lib_dart/src/model/token.dart';
import 'package:archethic_lib_dart/src/model/transaction.dart';
import 'package:archethic_lib_dart/src/model/transaction_fee.dart';
import 'package:archethic_lib_dart/src/model/transaction_input.dart';
import 'package:archethic_lib_dart/src/model/transaction_status.dart';
import 'package:archethic_lib_dart/src/services/graph_ql_client_logger.dart';
import 'package:archethic_lib_dart/src/utils/collection_utils.dart';
import 'package:archethic_lib_dart/src/utils/crypto.dart';
import 'package:archethic_lib_dart/src/utils/json_rpc_util.dart';
import 'package:archethic_lib_dart/src/utils/logs.dart';
import 'package:archethic_lib_dart/src/utils/utils.dart';
import 'package:graphql/client.dart';
import 'package:http/http.dart' as http;

class ApiService with JsonRPCUtil {
  ApiService(
    this.endpoint, {
    this.logsActivation = true,
  }) : _client = GraphQLClient(
          link: HttpLink('$endpoint/api'),
          cache: GraphQLCache(),
          defaultPolicies: DefaultPolicies(
            query: Policies(
              fetch: FetchPolicy.noCache,
              error: ErrorPolicy.all,
            ),
          ),
        );

  static const Map<String, String> kRequestHeaders = <String, String>{
    'Content-type': 'application/json',
    'Accept': 'application/json',
  };

  static const _responseKeysToIgnore = ['__typename'];

  final GraphQLClient _client;

  /// [endpoint] is the HTTP URL to a Archethic node (acting as welcome node)
  final String endpoint;

  /// [logsActivation] manage log activation
  final bool logsActivation;

  /// Send a transaction to the network
  /// @param {Object} tx Transaction to send
  Future<TransactionStatus> sendTx(Transaction transaction) async {
    final completer = Completer<TransactionStatus>();

    var transactionStatus = const TransactionStatus();

    try {
      final jsonRPCRequest = setJsonRPCRequest(
        'send_transaction',
        {
          'transaction': jsonDecode(
            transaction.convertToJSON(),
          ),
        },
      );

      log(
        'sendTx: (${transaction.address}) requestHttp.body=$jsonRPCRequest',
        logsActivation: logsActivation,
      );

      final responseHttp = await http.post(
        Uri.parse('$endpoint/api/rpc'),
        body: jsonRPCRequest,
        headers: kRequestHeaders,
      );
      log(
        'sendTx: (${transaction.address}) responseHttp.body=${responseHttp.body}',
        logsActivation: logsActivation,
      );

      final result = getJsonRPCResult(responseHttp.body);
      transactionStatus = transactionStatusFromJson(
        json.encode(
          result,
        ),
      );

      completer.complete(transactionStatus);
    } catch (e) {
      log(
        'sendTx: (${transaction.address}) $e',
        logsActivation: logsActivation,
      );
      rethrow;
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

    final result = await _client
        .withLogger(
          'getLastTransaction',
          logsActivation: logsActivation,
        )
        .query(
          QueryOptions(
            document: gql(body.toString()),
            parserFn: (data) {
              final transactions = data.mapValues(
                (value) {
                  if (value != null) {
                    return Transaction.fromJson(value as Map<String, dynamic>);
                  }
                },
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
    log(
      'getStorageNoncePublicKey: requestHttp.body=$body',
      logsActivation: logsActivation,
    );

    final result = await _client
        .withLogger(
          'getStorageNoncePublicKey',
          logsActivation: logsActivation,
        )
        .query(
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
    return result.parsedData!.storageNoncePublicKey ?? '';
  }

  /// Query the network to find a balance from a list of addresses
  Future<Map<String, Balance>> fetchBalance(
    List<String> addresses, {
    String request = Transaction.kBalanceQueryAllFields,
  }) async {
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

    final result = await _client
        .withLogger(
          'fetchBalance',
          logsActivation: logsActivation,
        )
        .query(
          QueryOptions(
            document: gql(body.toString()),
            parserFn: (object) {
              final balances = object.mapValues(
                (value) {
                  if (value != null) {
                    return Balance.fromJson(value as Map<String, dynamic>);
                  }
                },
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
    Map<String, String> addresses,
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
      log(
        'getTransactionContent: error=$e',
        logsActivation: logsActivation,
      );
      rethrow;
    }
  }

  /// Query the network to find transaction chains from a map of addresses and pagingAddress
  /// Returns the content scalar type represents transaction content [List<Transaction>]. Depending if the content can displayed it will be rendered as plain text otherwise in hexadecimal
  Future<Map<String, List<Transaction>>> getTransactionChain(
    Map<String, String> addresses, {
    String request = Transaction.kTransactionQueryAllFields,
    bool orderAsc = true,
    int? fromCriteria,
  }) async {
    if (addresses.isEmpty) {
      return {};
    }

    final order = orderAsc == true ? 'ASC ' : 'DESC';

    final fragment = 'fragment fields on Transaction { $request }';
    final body = StringBuffer()..write('query { ');
    // TODO(reddwarf03): Not good the '_' system to define alias but address format is not accepted by graphQL
    addresses.forEach((key, value) {
      body.write(' _$key: transactionChain(address:"$key" ');
      body.write(' order: $order ');
      if (value.isNotEmpty) {
        body.write(' pagingAddress:"$value"');
      }
      if (fromCriteria != null) {
        body.write(' from:$fromCriteria');
      }

      body.write(') { ...fields }');
    });
    body.write('} $fragment');

    final result = await _client
        .withLogger(
          'getTransactionChain',
          logsActivation: logsActivation,
        )
        .query(
          QueryOptions(
            document: gql(body.toString()),
            parserFn: (object) {
              final transactions = object.mapValues(
                (transactions) => (transactions as List<dynamic>)
                    .map(
                      (transaction) => Transaction.fromJson(
                        transaction as Map<String, dynamic>,
                      ),
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

    final result = await _client
        .withLogger(
          'getNodeList',
          logsActivation: logsActivation,
        )
        .query(
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

    final result = await _client
        .withLogger(
          'networkTransactions',
          logsActivation: logsActivation,
        )
        .query(
          QueryOptions(
            document: gql(body),
            parserFn: (json) {
              return TransactionsResponseData.fromJson(json)
                  .networkTransactions!;
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
    int limit = 0,
    int pagingOffset = 0,
  }) async {
    if (addresses.isEmpty) {
      return {};
    }

    final fragment = 'fragment fields on TransactionInput { $request }';
    final body = StringBuffer()..write('query { ');
    for (final address in addresses) {
      body.write(' _$address: transactionInputs(address:"$address" ');
      if (limit > 0) {
        body.write(
          ' limit:$limit ',
        );
      }
      if (pagingOffset > 0) {
        body.write(
          ' pagingOffset:$pagingOffset ',
        );
      }
      body.write(
        '  ) { ...fields } ',
      );
    }
    body.write(' } $fragment');

    final result = await _client
        .withLogger(
          'getTransactionInputs',
          logsActivation: logsActivation,
        )
        .query(
          QueryOptions(
            document: gql(body.toString()),
            parserFn: (json) {
              final transactionInputs = json.mapValues(
                (transactionInputs) => (transactionInputs as List<dynamic>)
                    .map(
                      (transactionInput) => TransactionInput.fromJson(
                        transactionInput as Map<String, dynamic>,
                      ),
                    )
                    .toList(),
                keysToIgnore: _responseKeysToIgnore,
              );
              return removeAliasPrefix<List<TransactionInput>>(
                    transactionInputs,
                  ) ??
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
    final result = await _client
        .withLogger(
          'getTransaction',
          logsActivation: logsActivation,
        )
        .query(
          QueryOptions(
            document: gql(body.toString()),
            parserFn: (json) {
              final transactions = json.mapValues(
                (value) {
                  if (value != null) {
                    return Transaction.fromJson(value as Map<String, dynamic>);
                  }
                },
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
    final jsonRPCRequest = setJsonRPCRequest(
      'estimate_transaction_fee',
      {
        'transaction': jsonDecode(
          transaction.convertToJSON(),
        ),
      },
    );

    log(
      'getTransactionFee: requestHttp.body=$jsonRPCRequest',
      logsActivation: logsActivation,
    );

    final responseHttp = await http.post(
      Uri.parse('$endpoint/api/rpc'),
      body: jsonRPCRequest,
      headers: kRequestHeaders,
    );
    log(
      'getTransactionFee: responseHttp.body=${responseHttp.body}',
      logsActivation: logsActivation,
    );
    final result = getJsonRPCResult(responseHttp.body);

    return TransactionFee.fromJson(
      result,
    );
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
          if (value.data != null) {
            ownershipsMap[key] = value.data!.ownerships;
          }
        },
      );

      return removeAliasPrefix<List<Ownership>>(ownershipsMap) ?? {};
    } catch (e) {
      log(
        'getTransactionOwnerships: error=$e',
        logsActivation: logsActivation,
      );
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
    Uint8List originPrivateKey,
    int blockchainTxVersion, {
    String? serviceName,
    String? derivationPath,
  }) {
    var keychain = Keychain(seed: hexToUint8List(seed));
    if (serviceName!.isNotEmpty && derivationPath!.isNotEmpty) {
      keychain = keychain.copyWithService(serviceName, derivationPath);
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

    return Transaction(
      type: 'keychain',
      version: blockchainTxVersion,
      data: Transaction.initData(),
    )
        .setContent(jsonEncode(keychain.toDID()))
        .addOwnership(
          uint8ListToHex(aesEncrypt(keychain.encode(), aesKey)),
          authorizedKeys,
        )
        .build(seed, 0)
        .transaction
        .originSign(uint8ListToHex(originPrivateKey));
  }

  /// Create a new access keychain and build a transaction
  /// @param {String} seed Access keychain's seed
  /// @param {Uint8List} keychainAddress Keychain's transaction address
  /// @param {Uint8List} originPrivateKey Origin private key to attest the transaction
  Transaction newAccessKeychainTransaction(
    String seed,
    Uint8List keychainAddress,
    Uint8List originPrivateKey,
    int blockchainTxVersion,
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
        publicKey: uint8ListToHex(
          Uint8List.fromList(keypair.publicKey!),
        ),
        encryptedSecretKey: uint8ListToHex(encryptedSecretKey),
      ),
    ];

    return Transaction(
      type: 'keychain_access',
      version: blockchainTxVersion,
      data: Transaction.initData(),
    )
        .addOwnership(
          uint8ListToHex(aesEncrypt(keychainAddress, aesKey)),
          authorizedKeys,
        )
        .build(seed, 0)
        .transaction
        .originSign(uint8ListToHex(originPrivateKey));
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
      final authorizedPublicKey = ownership.authorizedPublicKeys.firstWhere(
        (AuthorizedKey authKey) =>
            authKey.publicKey!.toUpperCase() ==
            uint8ListToHex(
              Uint8List.fromList(keypair.publicKey!),
            ).toUpperCase(),
      );

      final aesKey =
          ecDecrypt(authorizedPublicKey.encryptedSecretKey, keypair.privateKey);
      final keychainAddress = aesDecrypt(ownership.secret, aesKey);
      log(
        'keychainAddress (getKeychain): ${uint8ListToHex(keychainAddress)}',
        logsActivation: logsActivation,
      );

      final lastTransactionKeychainMap = await getLastTransaction(
        [uint8ListToHex(keychainAddress)],
        request: 'address',
      );

      final ownerships2Map = await getTransactionOwnerships(
        [
          lastTransactionKeychainMap[uint8ListToHex(keychainAddress)]!
              .address!
              .address!,
        ],
      );
      final ownership2 = ownerships2Map[
          lastTransactionKeychainMap[uint8ListToHex(keychainAddress)]!
              .address!
              .address!]![0];

      final authorizedPublicKey2 = ownership2.authorizedPublicKeys.firstWhere(
        (AuthorizedKey publicKey) =>
            publicKey.publicKey!.toUpperCase() ==
            uint8ListToHex(
              Uint8List.fromList(keypair.publicKey!),
            ).toUpperCase(),
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
    final jsonRPCRequest = {
      'jsonrpc': '2.0',
      'method': 'add_origin_key',
      'params': <String, String>{
        'origin_public_key': originPublicKey!,
        'certificate': certificate!,
      },
      'id': 1,
    };

    log(
      'addOriginKey: requestHttp.body=${json.encode(jsonRPCRequest)}',
      logsActivation: logsActivation,
    );

    final responseHttp = await http.post(
      Uri.parse('$endpoint/api/rpc'),
      body: json.encode(jsonRPCRequest),
      headers: kRequestHeaders,
    );

    log(
      'addOriginKey: responseHttp.body=${responseHttp.body}',
      logsActivation: logsActivation,
    );

    final result = getJsonRPCResult(responseHttp.body);

    return originKeyResponseFromJson(
      json.encode(
        result,
      ),
    ).toString();
  }

  /// Query the network to find a token's data from a list of token addresses
  Future<Map<String, Token>> getToken(
    List<String> addresses, {
    String request =
        'genesis, name, id, supply, symbol, type, properties, decimals, collection, ownerships { authorizedPublicKeys { encryptedSecretKey,  publicKey }, secret }',
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

    final result = await _client
        .withLogger(
          'getToken',
          logsActivation: logsActivation,
        )
        .query(
          QueryOptions(
            document: gql(body.toString()),
            parserFn: (json) {
              final tokens = json.mapValues(
                (value) {
                  if (value != null) {
                    return Token.fromJson(value as Map<String, dynamic>);
                  }
                },
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

  /// List the nearest endpoints nodes from the client's IP
  /// Returns a [List<Endpoint>] with infos
  Future<List<Endpoint>> getNearestEndpoints() async {
    const body = 'query { nearestEndpoints { ip, port } }';

    final result = await _client
        .withLogger(
          'getNearestEndpoints',
          logsActivation: logsActivation,
        )
        .query(
          QueryOptions(
            document: gql(body),
            parserFn: (json) =>
                NearestEndpointsResponseData.fromJson(json).endpoints,
          ),
        );

    if (result.exception?.linkException != null) {
      throw ArchethicConnectionException(
        result.exception!.linkException.toString(),
      );
    }

    return result.parsedData ?? [];
  }

  /// Query the network to find the genesis address of a transaction
  /// Returns a [Address] with genesisAddress
  Future<Address> getGenesisAddress(String address) async {
    final body = 'query { genesisAddress (address:"$address") }';

    final result = await _client
        .withLogger(
          'getGenesisAddress',
          logsActivation: logsActivation,
        )
        .query(
          QueryOptions(
            document: gql(body),
            parserFn: (json) =>
                GenesisAddressResponseData.fromJson(json).address,
          ),
        );

    if (result.exception?.linkException != null) {
      throw ArchethicConnectionException(
        result.exception!.linkException.toString(),
      );
    }

    return result.parsedData ?? const Address(address: '');
  }

  /// Call a smart contract's function
  /// @param {List<SCCallFunctionRequest>} RPC Requests
  Future<List<dynamic>> callSCFunctionMulti({
    required List<SCCallFunctionRequest> jsonRPCRequests,
  }) async {
    final completer = Completer<List<dynamic>>();
    try {
      log(
        'callSCFunction: requestHttp.body=${json.encode(jsonRPCRequests)}',
        logsActivation: logsActivation,
      );

      final responseHttp = await http.post(
        Uri.parse('$endpoint/api/rpc'),
        body: json.encode(jsonRPCRequests),
        headers: kRequestHeaders,
      );

      log(
        'callSCFunction: responseHttp.body=${responseHttp.body}',
        logsActivation: logsActivation,
      );

      if (responseHttp.statusCode == 200) {
        final jsonResponse = json.decode(responseHttp.body);
        if (jsonResponse is List) {
          completer.complete(jsonResponse);
        } else {
          // 20240327 - Nodes don't send [] when requests have just an element...
          if (jsonResponse is Map && jsonRPCRequests.length == 1) {
            completer.complete([jsonResponse]);
          } else {
            throw const ArchethicInvalidResponseException(
              'callSCFunction: jsonResponse is not a list',
            );
          }
        }
      }
    } catch (e) {
      log(
        'callSCFunction: error=$e',
        logsActivation: logsActivation,
      );
      rethrow;
    }
    return completer.future;
  }

  /// Call a smart contract's function
  /// @param {SCCallFunctionRequest} RPC Request
  /// @param {bool} Format of the response (true=Map, false=String)
  Future<Object> callSCFunction({
    required SCCallFunctionRequest jsonRPCRequest,
    bool resultMap = false,
  }) async {
    final completer = Completer<Object>();
    try {
      log(
        'callSCFunction: requestHttp.body=${json.encode(jsonRPCRequest)}',
        logsActivation: logsActivation,
      );

      final responseHttp = await http.post(
        Uri.parse('$endpoint/api/rpc'),
        body: json.encode(jsonRPCRequest),
        headers: kRequestHeaders,
      );

      log(
        'callSCFunction: responseHttp.body=${responseHttp.body}',
        logsActivation: logsActivation,
      );

      if (responseHttp.statusCode == 200) {
        if (resultMap) {
          completer.complete(
            getJsonRPCResult(responseHttp.body),
          );
        } else {
          completer.complete(
            getJsonRPCResultString(responseHttp.body),
          );
        }
      }
    } catch (e) {
      log(
        'callSCFunction: error=$e',
        logsActivation: logsActivation,
      );
      rethrow;
    }
    return completer.future;
  }

  /// Query the network to find the protocol, transaction and code versions
  /// Returns a [BlockchainVersionModel] with blockchain's versions information
  Future<BlockchainVersionModel> getBlockchainVersion() async {
    const body = 'query { version {code protocol transaction} }';

    final result = await _client
        .withLogger(
          'getBlockchainVersion',
          logsActivation: logsActivation,
        )
        .query(
          QueryOptions(
            document: gql(body),
            parserFn: (json) => BlockchainVersionModel.fromJson(json),
          ),
        );

    if (result.exception?.linkException != null) {
      throw ArchethicConnectionException(
        result.exception!.linkException.toString(),
      );
    }

    return result.parsedData ??
        const BlockchainVersionModel(
          version: BlockchainVersion(protocol: '', transaction: ''),
        );
  }
}
