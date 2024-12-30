// SPDX-License-Identifier: AGPL-3.0-or-later
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
import 'package:archethic_lib_dart/src/utils/utils.dart';
import 'package:graphql/client.dart';
import 'package:http/http.dart' as http;
import 'package:logging/logging.dart';

class ApiService with JsonRPCUtil {
  ApiService(
    this.endpoint,
  ) : _client = GraphQLClient(
          link: HttpLink('$endpoint/api'),
          cache: GraphQLCache(),
          queryRequestTimeout: const Duration(seconds: 10),
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

  final _logger = Logger('ApiService');

  final GraphQLClient _client;

  /// HTTP URL to a Archethic node (acting as welcome node)
  final String endpoint;

  /// Send a transaction to the network
  Future<TransactionStatus> sendTx(Transaction transaction) async {
    final completer = Completer<TransactionStatus>();

    var transactionStatus = const TransactionStatus();

    try {
      final jsonRPCRequest = setJsonRPCRequest(
        'send_transaction',
        {
          'transaction': jsonDecode(
            transaction.toNodeRPC(),
          ),
        },
      );

      _logger.fine(
        'sendTx: (${transaction.address}) requestHttp.body=$jsonRPCRequest',
      );

      final responseHttp = await http.post(
        Uri.parse('$endpoint/api/rpc'),
        body: jsonRPCRequest,
        headers: kRequestHeaders,
      );
      _logger.fine(
        'sendTx: (${transaction.address}) responseHttp.body=${responseHttp.body}',
      );

      final result = getJsonRPCResult(responseHttp.body);
      transactionStatus = transactionStatusFromJson(
        json.encode(
          result,
        ),
      );

      completer.complete(transactionStatus);
    } catch (e, stack) {
      _logger.severe(
        'sendTx: (${transaction.address}) failed',
        e,
        stack,
      );
      rethrow;
    }

    return completer.future;
  }

  /// Query the network to find the last transaction from a list of addresses
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
        )
        .query(
          QueryOptions(
            document: gql(body.toString()),
            parserFn: (data) {
              final transactions = data.mapValues(
                (value) {
                  if (value != null) {
                    return Transaction.fromNodeRPC(
                      value as Map<String, dynamic>,
                    );
                  }
                },
                keysToIgnore: _responseKeysToIgnore,
              );
              return removeAliasPrefix(transactions) ?? {};
            },
          ),
        );

    manageLinkException(result);

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
    _logger.fine('getStorageNoncePublicKey: requestHttp.body=$body');

    final result = await _client
        .withLogger(
          'getStorageNoncePublicKey',
        )
        .query(
          QueryOptions(
            document: gql(body),
            parserFn: (object) => SharedSecrets.fromJson(object),
          ),
        );

    manageLinkException(result);
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
    manageLinkException(result);

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
      final transactionChainMap = await getTransaction(
        addresses,
        request: 'data { content }',
      );

      final contentMap = <String, String>{};

      transactionChainMap.forEach((key, transaction) {
        final content = transaction.data?.content;
        if (content != null) {
          contentMap[key] = content;
        }
      });

      return removeAliasPrefix<String>(contentMap) ?? {};
    } catch (e, stack) {
      _logger.severe(
        'getTransactionContent failed',
        e,
        stack,
      );
      rethrow;
    }
  }

  /// Query the network to find transaction chains from a map of addresses and pagingAddress
  ///
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
        )
        .query(
          QueryOptions(
            document: gql(body.toString()),
            parserFn: (object) {
              final transactions = object.mapValues(
                (transactions) => (transactions as List<dynamic>)
                    .map(
                      (transaction) => Transaction.fromNodeRPC(
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

    manageLinkException(result);

    return result.parsedData ?? {};
  }

  /// Query the node infos
  ///
  /// Returns a [List<Node>] with infos
  Future<List<Node>> getNodeList() async {
    const body =
        'query {nodes {authorized available averageAvailability firstPublicKey geoPatch ip lastPublicKey networkPatch port rewardAddress authorizationDate enrollmentDate}}';

    final result = await _client
        .withLogger(
          'getNodeList',
        )
        .query(
          QueryOptions(
            document: gql(body),
            parserFn: (json) => NodesResponseData.fromJson(json).nodes!,
          ),
        );
    manageLinkException(result);

    return result.parsedData ?? [];
  }

  /// Query the network to list the transaction on the type.
  ///
  /// - [type] : The type of transaction
  /// - [page] : The page
  /// - [request] : List of informations to retrieve in the GraphQL Query
  ///
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
    manageLinkException(result);

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

    manageLinkException(result);
    return result.parsedData ?? {};
  }

  /// Query the network to find a transaction.
  ///
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
        )
        .query(
          QueryOptions(
            document: gql(body.toString()),
            parserFn: (json) {
              final transactions = json.mapValues(
                (value) {
                  if (value != null) {
                    return Transaction.fromNodeRPC(
                      value as Map<String, dynamic>,
                    );
                  }
                },
                keysToIgnore: _responseKeysToIgnore,
              );
              return removeAliasPrefix<Transaction>(transactions) ?? {};
            },
          ),
        );

    manageLinkException(result);

    return result.parsedData ?? {};
  }

  /// Get transaction fees
  Future<TransactionFee> getTransactionFee(Transaction transaction) async {
    final jsonRPCRequest = setJsonRPCRequest(
      'estimate_transaction_fee',
      {
        'transaction': jsonDecode(
          transaction.toNodeRPC(),
        ),
      },
    );

    _logger.fine('getTransactionFee: requestHttp.body=$jsonRPCRequest');

    final responseHttp = await http.post(
      Uri.parse('$endpoint/api/rpc'),
      body: jsonRPCRequest,
      headers: kRequestHeaders,
    );
    _logger.fine('getTransactionFee: responseHttp.body=${responseHttp.body}');
    final result = getJsonRPCResult(responseHttp.body);

    return TransactionFee.fromJson(
      result,
    );
  }

  /// getTransactionOwnerships
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
    } catch (e, stack) {
      _logger.severe(
        'getTransactionOwnerships failed',
        e,
        stack,
      );
    }

    return {};
  }

  /// Create a new keychain and build a transaction
  /// - [seed] : Keychain's seed
  /// - [authorizedPublicKeys] : Authorized public keys able to decrypt the keychain
  /// - [originPrivateKey] : Origin private key to attest the transaction
  /// - [blockchainTxVersion]: The blockchain transaction version to be used.
  /// - [servicesMap]: (Optional) A map where:
  ///     - Keys are service names (as `String`),
  ///     - Values are derivation paths (as `String`) associated with the respective services.
  ///     If provided, the keychain will include these services with their respective derivation paths.
  ///
  Transaction newKeychainTransaction(
    String seed,
    List<String> authorizedPublicKeys,
    Uint8List originPrivateKey,
    int blockchainTxVersion, {
    Map<String, String>? servicesMap,
  }) {
    var keychain = Keychain(seed: hexToUint8List(seed));
    if (servicesMap!.isNotEmpty) {
      servicesMap.forEach((serviceName, derivationPath) {
        keychain = keychain.copyWithService(serviceName, derivationPath);
      });
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
  ///
  /// - [seed] : Access keychain's seed
  /// - [keychainAddress] : Keychain's transaction address
  /// - [originPrivateKey] : Origin private key to attest the transaction
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
      _logger.fine(
        'keychainAddress (getKeychain): ${uint8ListToHex(keychainAddress)}',
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
    } catch (e, stack) {
      _logger.severe(
        'getkeychain failed',
        e,
        stack,
      );

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
  ///
  /// - [originPublicKey] : origin public key to be added
  /// - [certificate] : certificate of the origin public key
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

    _logger.fine(
      'addOriginKey: requestHttp.body=${json.encode(jsonRPCRequest)}',
    );

    final responseHttp = await http.post(
      Uri.parse('$endpoint/api/rpc'),
      body: json.encode(jsonRPCRequest),
      headers: kRequestHeaders,
    );

    _logger.fine('addOriginKey: responseHttp.body=${responseHttp.body}');

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
    manageLinkException(result);

    return result.parsedData ?? {};
  }

  /// List the nearest endpoints nodes from the client's IP
  Future<List<Endpoint>> getNearestEndpoints() async {
    const body = 'query { nearestEndpoints { ip, port } }';

    final result = await _client
        .withLogger(
          'getNearestEndpoints',
        )
        .query(
          QueryOptions(
            document: gql(body),
            parserFn: (json) =>
                NearestEndpointsResponseData.fromJson(json).endpoints,
          ),
        );
    manageLinkException(result);

    return result.parsedData ?? [];
  }

  /// Query the network to find the genesis address of a transaction
  Future<Address> getGenesisAddress(String address) async {
    final body = 'query { genesisAddress (address:"$address") }';

    final result = await _client
        .withLogger(
          'getGenesisAddress',
        )
        .query(
          QueryOptions(
            document: gql(body),
            parserFn: (json) =>
                GenesisAddressResponseData.fromJson(json).address,
          ),
        );
    manageLinkException(result);
    return result.parsedData ?? const Address(address: '');
  }

  /// Call a smart contract's function
  Future<List<dynamic>> callSCFunctionMulti({
    required List<SCCallFunctionRequest> jsonRPCRequests,
  }) async {
    final completer = Completer<List<dynamic>>();
    try {
      _logger.fine(
        'callSCFunction: requestHttp.body=${json.encode(jsonRPCRequests)}',
      );

      final responseHttp = await http.post(
        Uri.parse('$endpoint/api/rpc'),
        body: json.encode(jsonRPCRequests),
        headers: kRequestHeaders,
      );

      _logger.fine('callSCFunction: responseHttp.body=${responseHttp.body}');

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
    } catch (e, stack) {
      _logger.severe(
        'callSCFunction failed',
        e,
        stack,
      );
      rethrow;
    }
    return completer.future;
  }

  /// Call a smart contract's function.
  ///
  /// [resultMap] controls the response format (true=Map, false=String).
  Future<Object> callSCFunction({
    required SCCallFunctionRequest jsonRPCRequest,
    bool resultMap = false,
  }) async {
    final completer = Completer<Object>();
    try {
      _logger.fine(
        'callSCFunction: requestHttp.body=${json.encode(jsonRPCRequest)}',
      );

      final responseHttp = await http.post(
        Uri.parse('$endpoint/api/rpc'),
        body: json.encode(jsonRPCRequest),
        headers: kRequestHeaders,
      );

      _logger.fine('callSCFunction: responseHttp.body=${responseHttp.body}');

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
    } catch (e, stack) {
      _logger.severe(
        'callSCFunction failed',
        e,
        stack,
      );
      rethrow;
    }
    return completer.future;
  }

  /// Query the network to find the protocol, transaction and code versions
  Future<BlockchainVersionModel> getBlockchainVersion() async {
    const body = 'query { version {code protocol transaction} }';

    final result = await _client
        .withLogger(
          'getBlockchainVersion',
        )
        .query(
          QueryOptions(
            document: gql(body),
            parserFn: (json) => BlockchainVersionModel.fromJson(json),
          ),
        );

    manageLinkException(result);

    return result.parsedData ??
        const BlockchainVersionModel(
          version: BlockchainVersion(protocol: '', transaction: ''),
        );
  }

  void manageLinkException(QueryResult result) {
    final exception = result.exception?.linkException;
    if (exception == null) return;

    if (exception is HttpLinkParserException) {
      if (exception.response.statusCode == 429) {
        throw const ArchethicTooManyRequestsException();
      }
    }

    throw ArchethicConnectionException(
      exception.toString(),
    );
  }
}
