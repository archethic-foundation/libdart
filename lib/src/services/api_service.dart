/// SPDX-License-Identifier: AGPL-3.0-or-later
import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'dart:typed_data';

// Project imports:
import 'package:archethic_lib_dart/src/model/address.dart';
import 'package:archethic_lib_dart/src/model/authorized_key.dart';
import 'package:archethic_lib_dart/src/model/balance.dart';
import 'package:archethic_lib_dart/src/model/exception/archethic_connection_exception.dart';
import 'package:archethic_lib_dart/src/model/keychain.dart';
import 'package:archethic_lib_dart/src/model/node.dart';
import 'package:archethic_lib_dart/src/model/ownership.dart';
import 'package:archethic_lib_dart/src/model/response/balance_response.dart';
import 'package:archethic_lib_dart/src/model/response/network_transactions_response.dart';
import 'package:archethic_lib_dart/src/model/response/nodes_response.dart';
import 'package:archethic_lib_dart/src/model/response/origin_key_response.dart';
import 'package:archethic_lib_dart/src/model/response/shared_secrets_response.dart';
import 'package:archethic_lib_dart/src/model/response/token_response.dart';
import 'package:archethic_lib_dart/src/model/response/transaction_chain_response.dart';
import 'package:archethic_lib_dart/src/model/response/transaction_content_response.dart';
import 'package:archethic_lib_dart/src/model/response/transaction_inputs_response.dart';
import 'package:archethic_lib_dart/src/model/response/transaction_last_response.dart';
import 'package:archethic_lib_dart/src/model/token.dart';
import 'package:archethic_lib_dart/src/model/transaction.dart';
import 'package:archethic_lib_dart/src/model/transaction_fee.dart';
import 'package:archethic_lib_dart/src/model/transaction_input.dart';
import 'package:archethic_lib_dart/src/model/transaction_status.dart';
import 'package:archethic_lib_dart/src/utils/crypto.dart';
import 'package:archethic_lib_dart/src/utils/logs.dart';
import 'package:archethic_lib_dart/src/utils/utils.dart';
// Package imports:
import 'package:http/http.dart' as http show post;

class ApiService {
  ApiService(this.endpoint);

  /// [endpoint] is the HTTP URL to a Archethic node (acting as welcome node)
  String? endpoint;

  /// Send a transaction to the network
  /// @param {Object} tx Transaction to send
  Future<TransactionStatus> sendTx(Transaction transaction) async {
    final completer = Completer<TransactionStatus>();
    final requestHeaders = <String, String>{
      'Content-type': 'application/json',
      'Accept': 'application/json',
    };
    var transactionStatus = const TransactionStatus();
    log('sendTx: requestHttp.body=${transaction.convertToJSON()}');
    try {
      final responseHttp = await http.post(
        Uri.parse('${endpoint!}/api/transaction'),
        body: transaction.convertToJSON(),
        headers: requestHeaders,
      );
      log('sendTx: responseHttp.body=${responseHttp.body}');
      transactionStatus = transactionStatusFromJson(responseHttp.body);

      completer.complete(transactionStatus);
    } catch (e) {
      log(e.toString());
    }

    return completer.future;
  }

  /// Query the network to find the last transaction from an address
  /// @param {String} The address scalar type represents a cryptographic hash used in the Archethic network with an identification byte to specify from which algorithm the hash was generated. The Hash appears in a JSON response as Base16 formatted string. The parsed hash will be converted to a binary and any invalid hash with an invalid algorithm or invalid size will be rejected
  /// @param {String} request List of informations to retrieve in the GraphQL Query
  Future<Transaction> getLastTransaction(
    String address, {
    String request = Transaction.kTransactionQueryAllFields,
  }) async {
    final completer = Completer<Transaction>();
    var transactionLastResponse = TransactionLastResponse();
    Transaction? lastTransaction = Transaction(
      type: '',
      chainLength: 0,
      data: Transaction.initData(),
      address: const Address(address: ''),
    );
    final requestHeaders = <String, String>{
      'Content-type': 'application/json',
      'Accept': 'application/json',
    };
    try {
      final body =
          '{"query": "query {lastTransaction(address: \\"$address\\") { $request } }"}';
      log('getLastTransaction: requestHttp.body=$body');
      final responseHttp = await http.post(
        Uri.parse('${endpoint!}/api'),
        body: body,
        headers: requestHeaders,
      );
      log('getLastTransaction: responseHttp.body=${responseHttp.body}');
      if (responseHttp.statusCode == 200) {
        transactionLastResponse =
            transactionLastResponseFromJson(responseHttp.body);
        if (transactionLastResponse.data != null &&
            transactionLastResponse.data!.lastTransaction != null) {
          lastTransaction = transactionLastResponse.data!.lastTransaction;
        }
      }
    } catch (e) {
      log('getLastTransaction: error=$e');
    }

    completer.complete(lastTransaction);
    return completer.future;
  }

  Future<Transaction> getTransactionIndex(String address) async {
    final completer = Completer<Transaction>();
    var transactionLastResponse = TransactionLastResponse();
    Transaction? lastTransaction = Transaction(
      type: '',
      chainLength: 0,
      data: Transaction.initData(),
      address: const Address(address: ''),
    );
    final requestHeaders = <String, String>{
      'Content-type': 'application/json',
      'Accept': 'application/json',
    };
    try {
      final body =
          '{"query": "query {lastTransaction(address: \\"$address\\") { chainLength } }"}';
      log('getTransactionIndex: requestHttp.body=$body');
      final responseHttp = await http.post(
        Uri.parse('${endpoint!}/api'),
        body: body,
        headers: requestHeaders,
      );
      log('getTransactionIndex: responseHttp.body=${responseHttp.body}');
      if (responseHttp.statusCode == 200) {
        transactionLastResponse =
            transactionLastResponseFromJson(responseHttp.body);
        if (transactionLastResponse.data != null &&
            transactionLastResponse.data!.lastTransaction != null) {
          lastTransaction = transactionLastResponse.data!.lastTransaction;
        }
      }
    } catch (e) {
      log('getTransactionIndex: error=$e');
    }

    completer.complete(lastTransaction);
    return completer.future;
  }

  /// getStorageNoncePublicKey
  Future<String> getStorageNoncePublicKey() async {
    final completer = Completer<String>();
    var storageNoncePublicKey = '';
    var sharedSecretsResponse = SharedSecretsResponse();

    final requestHeaders = <String, String>{
      'Content-type': 'application/json',
      'Accept': 'application/json',
    };

    try {
      const body = '{"query": "query {sharedSecrets {storageNoncePublicKey}}"}';
      log('getStorageNoncePublicKey: requestHttp.body=$body');
      final responseHttp = await http.post(
        Uri.parse('${endpoint!}/api'),
        body: body,
        headers: requestHeaders,
      );
      log('getStorageNoncePublicKey: responseHttp.body=${responseHttp.body}');
      if (responseHttp.statusCode == 200) {
        sharedSecretsResponse =
            sharedSecretsResponseFromJson(responseHttp.body);
        if (sharedSecretsResponse.data != null &&
            sharedSecretsResponse.data!.storageNoncePublicKey != null) {
          storageNoncePublicKey =
              sharedSecretsResponse.data!.storageNoncePublicKey!;
        }
      }
    } catch (e) {
      log('getStorageNoncePublicKey: error=$e');
    }

    completer.complete(storageNoncePublicKey);
    return completer.future;
  }

  /// Query the network to find a balance from an address
  /// @param {String} The address scalar type represents a cryptographic hash used in the Archethic network with an identification byte to specify from which algorithm the hash was generated. The Hash appears in a JSON response as Base16 formatted string. The parsed hash will be converted to a binary and any invalid hash with an invalid algorithm or invalid size will be rejected
  /// Returns [Balance] represents a ledger balance. It includes: UCO: uco balance & Token: token balances
  Future<Balance> fetchBalance(String address) async {
    final completer = Completer<Balance>();
    BalanceResponse? balanceResponse;
    Balance? balance = const Balance();

    final requestHeaders = <String, String>{
      'Content-type': 'application/json',
      'Accept': 'application/json',
    };

    final body =
        '{"query": "query {balance(address: \\"$address\\") {uco, token {address, amount, tokenId }}}"}';
    log('fetchBalance: requestHttp.body=$body');

    try {
      final responseHttp = await http.post(
        Uri.parse('${endpoint!}/api'),
        body: body,
        headers: requestHeaders,
      );
      log('fetchBalance: responseHttp.body=${responseHttp.body}');

      if (responseHttp.statusCode == 200) {
        balanceResponse = balanceResponseFromJson(responseHttp.body);
        if (balanceResponse.data != null) {
          balance = balanceResponse.data!.balance;
        }
      }
    } catch (e) {
      log('fetchBalance: error=$e');
    }

    completer.complete(balance);
    return completer.future;
  }

  /// Query the network to find a transaction
  /// @param {String} The address scalar type represents a cryptographic hash used in the Archethic network with an identification byte to specify from which algorithm the hash was generated. The Hash appears in a JSON response as Base16 formatted string. The parsed hash will be converted to a binary and any invalid hash with an invalid algorithm or invalid size will be rejected
  /// Returns the content scalar type represents transaction content. Depending if the content can displayed it will be rendered as plain text otherwise in hexadecimal
  Future<String> getTransactionContent(String address) async {
    final completer = Completer<String>();
    var content = '';
    TransactionContentResponse? transactionContentResponse =
        TransactionContentResponse();

    final requestHeaders = <String, String>{
      'Content-type': 'application/json',
      'Accept': 'application/json',
    };

    final body =
        '{"query":"query { transaction(address: \\"$address\\") { data { content }} }"}';
    log('getTransactionContent: requestHttp.body=$body');

    try {
      final responseHttp = await http.post(
        Uri.parse('${endpoint!}/api'),
        body: body,
        headers: requestHeaders,
      );
      log('getTransactionContent: responseHttp.body=${responseHttp.body}');

      if (responseHttp.statusCode == 200) {
        transactionContentResponse =
            transactionContentResponseFromJson(responseHttp.body);
        if (transactionContentResponse.data != null &&
            transactionContentResponse.data!.transaction != null &&
            transactionContentResponse.data!.transaction!.data != null) {
          content =
              transactionContentResponse.data!.transaction!.data!.content!;
        }
      }
    } catch (e) {
      log('getTransactionContent: error=$e');
    }

    completer.complete(content);
    return completer.future;
  }

  /// Query the network to find a transaction chain
  /// @param {String} The address scalar type represents a cryptographic hash used in the Archethic network with an identification byte to specify from which algorithm the hash was generated. The Hash appears in a JSON response as Base16 formatted string. The parsed hash will be converted to a binary and any invalid hash with an invalid algorithm or invalid size will be rejected
  /// @param {String} The address of the last transaction in the page which act as a paginate_state for next page
  /// @param {String} request List of informations to retrieve in the GraphQL Query
  /// Returns the content scalar type represents transaction content [List<Transaction>]. Depending if the content can displayed it will be rendered as plain text otherwise in hexadecimal
  Future<List<Transaction>> getTransactionChain(
    String address, {
    String pagingAddress = '',
    String request = Transaction.kTransactionQueryAllFields,
  }) async {
    final completer = Completer<List<Transaction>>();
    TransactionChainResponse? transactionChainResponse =
        TransactionChainResponse();
    var transactionChain = List<Transaction>.empty(growable: true);
    final requestHeaders = <String, String>{
      'Content-type': 'application/json',
      'Accept': 'application/json',
    };

    var body = '';
    if (pagingAddress.isEmpty) {
      body =
          '{"query":"query { transactionChain(address: \\"$address\\") { $request } }"}';
    } else {
      body =
          '{"query":"query { transactionChain(address: \\"$address\\", pagingAddress: \\"$pagingAddress\\") { $request } }"}';
    }
    log('getTransactionChain: requestHttp.body=$body');

    try {
      final responseHttp = await http.post(
        Uri.parse('${endpoint!}/api'),
        body: body,
        headers: requestHeaders,
      );
      log('getTransactionChain: responseHttp.body=${responseHttp.body}');

      if (responseHttp.statusCode == 200) {
        transactionChainResponse =
            transactionChainResponseFromJson(responseHttp.body);
        if (transactionChainResponse.data != null &&
            transactionChainResponse.data!.transactionChain != null) {
          transactionChain = transactionChainResponse.data!.transactionChain!;
        }
      }
    } catch (e) {
      log('getTransactionChain: error=$e');
    }

    completer.complete(transactionChain);
    return completer.future;
  }

  /// Query the node infos
  /// Returns a [List<Node>] with infos
  Future<List<Node>> getNodeList() async {
    final completer = Completer<List<Node>>();
    var nodesResponse = NodesResponse();
    var nodesList = List<Node>.empty(growable: true);

    final requestHeaders = <String, String>{
      'Content-type': 'application/json',
      'Accept': 'application/json',
    };

    try {
      const body =
          '{"query": "query {nodes {authorized available averageAvailability firstPublicKey geoPatch ip lastPublicKey networkPatch port rewardAddress authorizationDate enrollmentDate}}"}';
      log('getNodeList: requestHttp.body=$body');
      final responseHttp = await http.post(
        Uri.parse('${endpoint!}/api'),
        body: body,
        headers: requestHeaders,
      );
      log('getNodeList: responseHttp.body=${responseHttp.body}');
      if (responseHttp.statusCode == 200) {
        nodesResponse = nodesResponseFromJson(responseHttp.body);
        if (nodesResponse.data != null) {
          nodesList = nodesResponse.data!.nodes!;
        }
      }
    } catch (e) {
      log('getNodeList: error=$e');
    }

    completer.complete(nodesList);
    return completer.future;
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
    final completer = Completer<List<Transaction>>();
    NetworkTransactionsResponse? networkTransactionsResponse =
        NetworkTransactionsResponse();
    var transactionsList = List<Transaction>.empty(growable: true);
    final requestHeaders = <String, String>{
      'Content-type': 'application/json',
      'Accept': 'application/json',
    };

    final body =
        '{"query":"query { networkTransactions(type: \\"$type\\", page: $page) { $request } }"}';
    log('networkTransactions: requestHttp.body=$body');

    try {
      final responseHttp = await http.post(
        Uri.parse('${endpoint!}/api'),
        body: body,
        headers: requestHeaders,
      );
      log('networkTransactions: responseHttp.body=${responseHttp.body}');

      if (responseHttp.statusCode == 200) {
        networkTransactionsResponse =
            networkTransactionsResponseFromJson(responseHttp.body);
        if (networkTransactionsResponse.data != null) {
          transactionsList =
              networkTransactionsResponse.data!.networkTransactions!;
        }
      }
    } catch (e) {
      log('networkTransactions: error=$e');
    }

    completer.complete(transactionsList);
    return completer.future;
  }

  /// Query the network to list the transaction inputs from an address
  /// @param {String} The address scalar type represents a cryptographic hash used in the Archethic network with an identification byte to specify from which algorithm the hash was generated. The Hash appears in a JSON response as Base16 formatted string. The parsed hash will be converted to a binary and any invalid hash with an invalid algorithm or invalid size will be rejected
  /// @param {String} request List of informations to retrieve in the GraphQL Query
  Future<List<TransactionInput>> getTransactionInputs(
    String address, {
    String request = Transaction.kTransactionQueryAllFields,
  }) async {
    final completer = Completer<List<TransactionInput>>();
    var transactionInputs = List<TransactionInput>.empty(growable: true);
    var transactionInputsResponse = TransactionInputsResponse();
    final requestHeaders = <String, String>{
      'Content-type': 'application/json',
      'Accept': 'application/json',
    };
    try {
      final body =
          '{"query":"query { transactionInputs(address: \\"$address\\") { $request } }"}';
      log('getTransactionInputs: requestHttp.body=$body');
      final responseHttp = await http.post(
        Uri.parse('${endpoint!}/api'),
        body: body,
        headers: requestHeaders,
      );
      log('getTransactionInputs: responseHttp.body=${responseHttp.body}');
      if (responseHttp.statusCode == 200) {
        transactionInputsResponse =
            transactionInputsResponseFromJson(responseHttp.body);
        transactionInputs = transactionInputsResponse.data!.transactionInputs!;
      }
    } catch (e) {
      log('getTransactionInputs: error=$e');
    }

    completer.complete(transactionInputs);
    return completer.future;
  }

  /// Query the network to find a transaction
  /// @param {String} The address scalar type represents a cryptographic hash used in the Archethic network with an identification byte to specify from which algorithm the hash was generated. The Hash appears in a JSON response as Base16 formatted string. The parsed hash will be converted to a binary and any invalid hash with an invalid algorithm or invalid size will be rejected
  /// @param {String} request List of informations to retrieve in the GraphQL Query
  /// Returns all informations represent transaction content.
  Future<Transaction> getTransactionAllInfos(
    String address, {
    String request = Transaction.kTransactionQueryAllFields,
  }) async {
    final completer = Completer<Transaction>();
    Transaction? transaction;

    final requestHeaders = <String, String>{
      'Content-type': 'application/json',
      'Accept': 'application/json',
    };

    final body =
        '{"query":"query { transaction(address: \\"$address\\") {$request} }"}';
    log('getTransactionAllInfos: requestHttp.body=$body');

    try {
      final responseHttp = await http.post(
        Uri.parse('${endpoint!}/api'),
        body: body,
        headers: requestHeaders,
      );
      log('getTransactionAllInfos: responseHttp.body=${responseHttp.body}');

      if (responseHttp.statusCode == 200) {
        final transactionResponse =
            transactionContentResponseFromJson(responseHttp.body);
        if (transactionResponse.data != null &&
            transactionResponse.data!.transaction != null) {
          transaction = transactionResponse.data!.transaction;
        }
      }
    } catch (e) {
      log('getTransactionAllInfos: error=$e');
    }

    completer.complete(transaction);
    return completer.future;
  }

  /// Get transaction fees
  /// @param {Object} tx Transaction to estimate fees
  Future<TransactionFee> getTransactionFee(Transaction transaction) async {
    final completer = Completer<TransactionFee>();
    final requestHeaders = <String, String>{
      'Content-type': 'application/json',
      'Accept': 'application/json',
    };
    var transactionFee = const TransactionFee();
    final responseHttp = await http.post(
      Uri.parse('${endpoint!}/api/transaction_fee'),
      body: transaction.convertToJSON(),
      headers: requestHeaders,
    );
    log('getTransactionFee: requestHttp.body=${transaction.convertToJSON()}');
    log('getTransactionFee: responseHttp.body=${responseHttp.body}');
    transactionFee = TransactionFee.fromJson(json.decode(responseHttp.body));

    completer.complete(transactionFee);
    return completer.future;
  }

  /// getTransactionOwnerships
  /// @param {String} address
  Future<List<Ownership>> getTransactionOwnerships(String address) async {
    final completer = Completer<List<Ownership>>();

    final requestHeaders = <String, String>{
      'Content-type': 'application/json',
      'Accept': 'application/json',
    };

    var ownerships = List<Ownership>.empty(growable: true);
    try {
      final body =
          '{"query": "query { transaction(address: \\"$address\\") { data { ownerships { secret, authorizedPublicKeys { encryptedSecretKey, publicKey } } } } }"}';
      log('getTransactionOwnerships: requestHttp.body=$body');
      final responseHttp = await http.post(
        Uri.parse('${endpoint!}/api'),
        body: body,
        headers: requestHeaders,
      );
      log('getTransactionOwnerships: responseHttp.body=${responseHttp.body}');
      if (responseHttp.statusCode == 200) {
        final transactionResponse =
            transactionContentResponseFromJson(responseHttp.body);
        if (transactionResponse.data != null &&
            transactionResponse.data!.transaction != null &&
            transactionResponse.data!.transaction!.data != null) {
          ownerships = transactionResponse.data!.transaction!.data!.ownerships;
        }
      }
    } on SocketException {
      log('getTransactionOwnerships: responseHttp.body=No Internet connection');
      throw const SocketException(
        'getTransactionOwnerships: responseHttp.body=No Internet connection',
      );
    } on HttpException {
      log("getTransactionOwnerships: responseHttp.body=Couldn't find the post");
      throw const HttpException(
        "getTransactionOwnerships: responseHttp.body=Couldn't find the post",
      );
    } on FormatException {
      log('getTransactionOwnerships: responseHttp.body=Bad response format');
      throw const FormatException(
        'getTransactionOwnerships: responseHttp.body=Bad response format',
      );
    } catch (e) {
      log('getTransactionOwnerships: error=$e');
    }

    completer.complete(ownerships);
    return completer.future;
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
    final keychain = Keychain(seed: hexToUint8List(seed));
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
        .addOwnership(
          uint8ListToHex(aesEncrypt(keychain.encode(), aesKey)),
          authorizedKeys,
        )
        .build(seed, 0)
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
        .addOwnership(
          uint8ListToHex(aesEncrypt(keychainAddress, aesKey)),
          authorizedKeys,
        )
        .build(seed, 0)
        .originSign(uint8ListToHex(originPrivateKey));
  }

  /// Retrieve a keychain by using keychain access seed
  /// @param {String} seed Keychain's access seed
  Future<Keychain> getKeychain(String seed) async {
    final keypair = deriveKeyPair(seed, 0);
    final accessKeychainAddress = deriveAddress(seed, 1);

    try {
      final ownerships = await getTransactionOwnerships(accessKeychainAddress);
      if (ownerships.isEmpty) {
        throw Exception("Keychain doesn't exists");
      }

      final ownership = ownerships[0];
      final authorizedPublicKey = ownership.authorizedPublicKeys.firstWhere(
        (AuthorizedKey authKey) =>
            authKey.publicKey!.toUpperCase() ==
            uint8ListToHex(keypair.publicKey).toUpperCase(),
      );

      final aesKey =
          ecDecrypt(authorizedPublicKey.encryptedSecretKey, keypair.privateKey);
      final keychainAddress = aesDecrypt(ownership.secret, aesKey);
      log('keychainAddress (getKeychain): ${uint8ListToHex(keychainAddress)}');

      final lastTransactionKeychain = await getLastTransaction(
        uint8ListToHex(keychainAddress),
        request: 'address',
      );

      final ownerships2 = await getTransactionOwnerships(
        lastTransactionKeychain.address!.address!,
      );
      final ownership2 = ownerships2[0];

      final authorizedPublicKey2 = ownership2.authorizedPublicKeys.firstWhere(
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
    final completer = Completer<String>();
    final requestHeaders = <String, String>{
      'Content-type': 'application/json',
      'Accept': 'application/json',
    };

    final body = jsonEncode(<String, String>{
      'origin_public_key': originPublicKey!,
      'certificate': certificate!
    });
    final responseHttp = await http.post(
      Uri.parse('${endpoint!}/api/origin_key'),
      body: body,
      headers: requestHeaders,
    );
    log('addOriginKey: requestHttp.body=$body');
    log('addOriginKey: responseHttp.body=${responseHttp.body}');

    final originKey = originKeyResponseFromJson(responseHttp.body);

    completer.complete(originKey.toString());
    return completer.future;
  }

  /// Query the network to find a token's data
  /// @param {String} The address scalar type represents a cryptographic hash used in the Archethic network with an identification byte to specify from which algorithm the hash was generated. The Hash appears in a JSON response as Base16 formatted string. The parsed hash will be converted to a binary and any invalid hash with an invalid algorithm or invalid size will be rejected
  /// @param {String} request List of informations to retrieve in the GraphQL Query
  Future<Token> getToken(
    String address, {
    String request = 'genesis, name, id, supply, symbol, type, properties',
  }) async {
    final completer = Completer<Token>();

    // ignore: prefer_final_locals
    var token = const Token();

    final requestHeaders = <String, String>{
      'Content-type': 'application/json',
      'Accept': 'application/json',
    };
    try {
      final body =
          '{"query":"query { token(address: \\"$address\\") { $request } }"}';
      log('getToken: requestHttp.body=$body');
      final responseHttp = await http.post(
        Uri.parse('${endpoint!}/api'),
        body: body,
        headers: requestHeaders,
      );
      log('getToken: responseHttp.body=${responseHttp.body}');
      if (responseHttp.statusCode == 200) {
        final tokenResponse = tokenResponseFromJson(responseHttp.body);
        if (tokenResponse.data != null) {
          token = tokenResponse.data!.token!;
        }
      }
    } catch (e) {
      log('getToken: error=$e');
    }

    completer.complete(token);
    return completer.future;
  }
}
