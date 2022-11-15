/// SPDX-License-Identifier: AGPL-3.0-or-later
import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'dart:typed_data';

import 'package:archethic_lib_dart/src/model/authorized_key.dart';
import 'package:archethic_lib_dart/src/model/balance.dart';
import 'package:archethic_lib_dart/src/model/crypto/key_pair.dart';
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
import 'package:http/http.dart' as http show Response, post;

class ApiService {
  ApiService(this.endpoint);

  /// [endpoint] is the HTTP URL to a Archethic node (acting as welcome node)
  String? endpoint;

  /// Send a transaction to the network
  /// @param {Object} tx Transaction to send
  Future<TransactionStatus> sendTx(Transaction transaction) async {
    final Completer<TransactionStatus> completer =
        Completer<TransactionStatus>();
    final Map<String, String> requestHeaders = <String, String>{
      'Content-type': 'application/json',
      'Accept': 'application/json',
    };
    TransactionStatus transactionStatus = TransactionStatus();
    log('sendTx: requestHttp.body=${transaction.convertToJSON()}');
    try {
      final http.Response responseHttp = await http.post(
          Uri.parse('${endpoint!}/api/transaction'),
          body: transaction.convertToJSON(),
          headers: requestHeaders);
      log('sendTx: responseHttp.body=${responseHttp.body}');
      transactionStatus = transactionStatusFromJson(responseHttp.body);

      completer.complete(transactionStatus);
    } catch (e) {
      log(e.toString());
    }

    return completer.future;
  }

  /// Query the network to find the last transaction from a liste of addresses
  Future<Map<String, Transaction>> getLastTransaction(List<String> addresses,
      {String request = Transaction.kTransactionQueryAllFields}) async {
    final Map<String, String> requestHeaders = <String, String>{
      'Content-type': 'application/json',
      'Accept': 'application/json',
    };
    try {
      final String fragment = 'fragment fields on Transaction { $request }';
      String body = '{"query":"query {';
      for (final String address in addresses) {
        body =
            '$body _$address: lastTransaction(address:\\"$address\\") { ...fields }';
      }
      body = '$body } $fragment "}';
      log('getLastTransaction: requestHttp.body=$body');
      final http.Response responseHttp = await http.post(
          Uri.parse('${endpoint!}/api'),
          body: body,
          headers: requestHeaders);
      log('getLastTransaction: responseHttp.body=${responseHttp.body}');
      if (responseHttp.statusCode == 200) {
        final TransactionLastResponse transactionLastResponse =
            TransactionLastResponse.fromJson(json.decode(responseHttp.body));

        return transactionLastResponse.data ?? {};
      }
    } catch (e) {
      log('getLastTransaction: error=$e');
    }

    return {};
  }

  Future<Map<String, int>> getTransactionIndex(List<String> addresses) async {
    final Map<String, Transaction> lastTransactionMap =
        await getLastTransaction(addresses, request: 'chainLength');

    if (lastTransactionMap == {}) {
      return {};
    }
    final Map<String, int> lastTransactionIndexMap = {};
    lastTransactionMap.forEach((key, value) {
      lastTransactionIndexMap[key] = value.chainLength ?? 0;
    });
    return lastTransactionIndexMap;
  }

  /// getStorageNoncePublicKey
  Future<String> getStorageNoncePublicKey() async {
    final Completer<String> completer = Completer<String>();
    String storageNoncePublicKey = '';
    SharedSecretsResponse sharedSecretsResponse = SharedSecretsResponse();

    final Map<String, String> requestHeaders = <String, String>{
      'Content-type': 'application/json',
      'Accept': 'application/json',
    };

    try {
      const String body =
          '{"query": "query {sharedSecrets {storageNoncePublicKey}}"}';
      log('getStorageNoncePublicKey: requestHttp.body=$body');
      final http.Response responseHttp = await http.post(
          Uri.parse('${endpoint!}/api'),
          body: body,
          headers: requestHeaders);
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
    final Completer<Balance> completer = Completer<Balance>();
    BalanceResponse? balanceResponse;
    Balance? balance = Balance();

    final Map<String, String> requestHeaders = <String, String>{
      'Content-type': 'application/json',
      'Accept': 'application/json',
    };

    final String body =
        '{"query": "query {balance(address: \\"$address\\") {uco, token {address, amount, tokenId }}}"}';
    log('fetchBalance: requestHttp.body=$body');

    try {
      final http.Response responseHttp = await http.post(
          Uri.parse('${endpoint!}/api'),
          body: body,
          headers: requestHeaders);
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
    final Completer<String> completer = Completer<String>();
    String content = '';
    TransactionContentResponse? transactionContentResponse =
        TransactionContentResponse();

    final Map<String, String> requestHeaders = <String, String>{
      'Content-type': 'application/json',
      'Accept': 'application/json',
    };

    final String body =
        '{"query":"query { transaction(address: \\"$address\\") { data { content }} }"}';
    log('getTransactionContent: requestHttp.body=$body');

    try {
      final http.Response responseHttp = await http.post(
          Uri.parse('${endpoint!}/api'),
          body: body,
          headers: requestHeaders);
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

  /// Query the network to find transaction chains from a list of addresses
  /// Returns the content scalar type represents transaction content [List<Transaction>]. Depending if the content can displayed it will be rendered as plain text otherwise in hexadecimal
  Future<Map<String, List<Transaction>>> getTransactionChain(
      List<String> addresses,
      {String request = Transaction.kTransactionQueryAllFields}) async {
    if (addresses.isEmpty) {
      return {};
    }

    final Map<String, String> requestHeaders = <String, String>{
      'Content-type': 'application/json',
      'Accept': 'application/json',
    };

    try {
      final String fragment = 'fragment fields on Transaction { $request }';
      String body = '{"query":"query {';
      // TODO(@reddwarf03): Not good the '_' system to define alias but adress format is not accepted by graphQL
      for (final String address in addresses) {
        body =
            '$body _$address: transactionChain(address:\\"$address\\") { ...fields }';
      }
      body = '$body } $fragment "}';
      log('getTransactionChain: requestHttp.body=$body');
      final http.Response responseHttp = await http.post(
          Uri.parse('${endpoint!}/api'),
          body: body,
          headers: requestHeaders);
      log('getTransactionChain: responseHttp.body=${responseHttp.body}');
      if (responseHttp.statusCode == 200) {
        final TransactionChainResponse transactionChainResponse =
            TransactionChainResponse.fromJson(json.decode(responseHttp.body));

        return transactionChainResponse.data ?? {};
      }
    } catch (e) {
      log('getTransactionChain: error=$e');
    }

    return {};
  }

  /// Query the node infos
  /// Returns a [List<Node>] with infos
  Future<List<Node>> getNodeList() async {
    final Completer<List<Node>> completer = Completer<List<Node>>();
    NodesResponse nodesResponse = NodesResponse();
    List<Node> nodesList = List<Node>.empty(growable: true);

    final Map<String, String> requestHeaders = <String, String>{
      'Content-type': 'application/json',
      'Accept': 'application/json',
    };

    try {
      const String body =
          '{"query": "query {nodes {authorized available averageAvailability firstPublicKey geoPatch ip lastPublicKey networkPatch port rewardAddress authorizationDate enrollmentDate}}"}';
      log('getNodeList: requestHttp.body=$body');
      final http.Response responseHttp = await http.post(
          Uri.parse('${endpoint!}/api'),
          body: body,
          headers: requestHeaders);
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
  Future<List<Transaction>> networkTransactions(String type, int page,
      {String request = Transaction.kTransactionQueryAllFields}) async {
    final Completer<List<Transaction>> completer =
        Completer<List<Transaction>>();
    NetworkTransactionsResponse? networkTransactionsResponse =
        NetworkTransactionsResponse();
    List<Transaction> transactionsList =
        List<Transaction>.empty(growable: true);
    final Map<String, String> requestHeaders = <String, String>{
      'Content-type': 'application/json',
      'Accept': 'application/json',
    };

    final String body =
        '{"query":"query { networkTransactions(type: \\"$type\\", page: $page) { $request } }"}';
    log('networkTransactions: requestHttp.body=$body');

    try {
      final http.Response responseHttp = await http.post(
          Uri.parse('${endpoint!}/api'),
          body: body,
          headers: requestHeaders);
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

  /// Query the network to list the transaction inputs from a list of addresses
  Future<Map<String, List<TransactionInput>>> getTransactionInputs(
      List<String> addresses,
      {String request = Transaction.kTransactionInputQueryAllFields}) async {
    if (addresses.isEmpty) {
      return {};
    }

    final Map<String, String> requestHeaders = <String, String>{
      'Content-type': 'application/json',
      'Accept': 'application/json',
    };

    try {
      final String fragment =
          'fragment fields on TransactionInput { $request }';
      String body = '{"query":"query {';
      for (final String address in addresses) {
        body =
            '$body _$address: transactionInputs(address:\\"$address\\") { ...fields }';
      }
      body = '$body } $fragment "}';
      log('getTransactionInputs: requestHttp.body=$body');
      final http.Response responseHttp = await http.post(
          Uri.parse('${endpoint!}/api'),
          body: body,
          headers: requestHeaders);
      log('getTransactionInputs: responseHttp.body=${responseHttp.body}');
      if (responseHttp.statusCode == 200) {
        final TransactionInputsResponse transactionInputsResponse =
            TransactionInputsResponse.fromJson(json.decode(responseHttp.body));

        return transactionInputsResponse.data ?? {};
      }
    } catch (e) {
      log('getTransactionInputs: error=$e');
    }

    return {};
  }

  /// Query the network to find a transaction
  /// @param {String} The address scalar type represents a cryptographic hash used in the Archethic network with an identification byte to specify from which algorithm the hash was generated. The Hash appears in a JSON response as Base16 formatted string. The parsed hash will be converted to a binary and any invalid hash with an invalid algorithm or invalid size will be rejected
  /// @param {String} request List of informations to retrieve in the GraphQL Query
  /// Returns all informations represent transaction content.
  Future<Transaction> getTransactionAllInfos(String address,
      {String request = Transaction.kTransactionQueryAllFields}) async {
    final Completer<Transaction> completer = Completer<Transaction>();
    Transaction? transaction;

    final Map<String, String> requestHeaders = <String, String>{
      'Content-type': 'application/json',
      'Accept': 'application/json',
    };

    final String body =
        '{"query":"query { transaction(address: \\"$address\\") {$request} }"}';
    log('getTransactionAllInfos: requestHttp.body=$body');

    try {
      final http.Response responseHttp = await http.post(
          Uri.parse('${endpoint!}/api'),
          body: body,
          headers: requestHeaders);
      log('getTransactionAllInfos: responseHttp.body=${responseHttp.body}');

      if (responseHttp.statusCode == 200) {
        final TransactionContentResponse transactionResponse =
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
    final Completer<TransactionFee> completer = Completer<TransactionFee>();
    final Map<String, String> requestHeaders = <String, String>{
      'Content-type': 'application/json',
      'Accept': 'application/json',
    };
    TransactionFee transactionFee = TransactionFee();
    final http.Response responseHttp = await http.post(
        Uri.parse('${endpoint!}/api/transaction_fee'),
        body: transaction.convertToJSON(),
        headers: requestHeaders);
    log('getTransactionFee: requestHttp.body=${transaction.convertToJSON()}');
    log('getTransactionFee: responseHttp.body=${responseHttp.body}');
    transactionFee = transactionFeeFromJson(responseHttp.body);

    completer.complete(transactionFee);
    return completer.future;
  }

  /// getTransactionOwnerships
  /// @param {String} address
  Future<List<Ownership>> getTransactionOwnerships(
      List<String> addresses) async {
    final Map<String, String> requestHeaders = <String, String>{
      'Content-type': 'application/json',
      'Accept': 'application/json',
    };

    try {
      const String fragment =
          'fragment fields on Transaction { { data { ownerships { secret, authorizedPublicKeys { encryptedSecretKey, publicKey } } } } } }';
      String body = 'query {';
      for (final String address in addresses) {
        body =
            '$body a$address: transaction(address:\\"$address\\") { ...fields }';
      }
      body = '$body } $fragment';

      final http.Response responseHttp = await http.post(
          Uri.parse('${endpoint!}/api'),
          body: body,
          headers: requestHeaders);
      log('getTransactionOwnerships: responseHttp.body=${responseHttp.body}');
      if (responseHttp.statusCode == 200) {
        final TransactionContentResponse transactionResponse =
            transactionContentResponseFromJson(responseHttp.body);
        if (transactionResponse.data != null &&
            transactionResponse.data!.transaction != null &&
            transactionResponse.data!.transaction!.data != null) {
          return transactionResponse.data!.transaction!.data!.ownerships!;
        }
      }
    } catch (e) {
      log('getTransactionOwnerships: error=$e');
    }

    return [];
  }

  /// Create a new keychain and build a transaction
  /// @param {String} seed Keychain's seed
  /// @param {List<AuthorizedKey>} authorizedPublicKeys List of authorized public keys able to decrypt the keychain
  /// @param {Uint8List} originPrivateKey Origin private key to attest the transaction
  /// @param {String} service name
  /// @param {String} derivation path associated to service name
  Transaction newKeychainTransaction(String seed,
      List<String> authorizedPublicKeys, Uint8List originPrivateKey,
      {String? serviceName, String? derivationPath}) {
    final Keychain keychain =
        Keychain(Uint8List.fromList(hexToUint8List(seed)));
    if (serviceName!.isNotEmpty && derivationPath!.isNotEmpty) {
      keychain.addService(serviceName, derivationPath);
    }

    final String aesKey = uint8ListToHex(Uint8List.fromList(
        List<int>.generate(32, (int i) => Random.secure().nextInt(256))));

    final List<AuthorizedKey> authorizedKeys =
        List<AuthorizedKey>.empty(growable: true);
    for (String key in authorizedPublicKeys) {
      authorizedKeys.add(AuthorizedKey(
          encryptedSecretKey: uint8ListToHex(ecEncrypt(aesKey, key)),
          publicKey: key));
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
      String seed, Uint8List keychainAddress, Uint8List originPrivateKey) {
    final String aesKey = uint8ListToHex(Uint8List.fromList(
        List<int>.generate(32, (int i) => Random.secure().nextInt(256))));

    final KeyPair keypair = deriveKeyPair(seed, 0);

    final Uint8List encryptedSecretKey = ecEncrypt(aesKey, keypair.publicKey);

    final List<AuthorizedKey> authorizedKeys = <AuthorizedKey>[
      AuthorizedKey(
          publicKey: uint8ListToHex(keypair.publicKey),
          encryptedSecretKey: uint8ListToHex(encryptedSecretKey))
    ];

    return Transaction(type: 'keychain_access', data: Transaction.initData())
        .addOwnership(aesEncrypt(keychainAddress, aesKey), authorizedKeys)
        .build(seed, 0)
        .originSign(originPrivateKey);
  }

  /// Retrieve a keychain by using keychain access seed
  /// @param {String} seed Keychain's access seed
  Future<Keychain> getKeychain(String seed) async {
    final KeyPair keypair = deriveKeyPair(seed, 0);
    final String accessKeychainAddress = deriveAddress(seed, 1);

    try {
      final List<Ownership> ownerships =
          await getTransactionOwnerships([accessKeychainAddress]);
      if (ownerships.isEmpty) {
        throw 'Keychain doesn\'t exists';
      }

      final Ownership ownership = ownerships[0];
      final AuthorizedKey authorizedPublicKey = ownership.authorizedPublicKeys!
          .firstWhere((AuthorizedKey authKey) =>
              authKey.publicKey!.toUpperCase() ==
              uint8ListToHex(keypair.publicKey).toUpperCase());

      final Uint8List aesKey =
          ecDecrypt(authorizedPublicKey.encryptedSecretKey, keypair.privateKey);
      final Uint8List keychainAddress = aesDecrypt(ownership.secret, aesKey);
      log('keychainAddress (getKeychain): ${uint8ListToHex(keychainAddress)}');

      final Map<String, Transaction> lastTransactionKeychain =
          await getLastTransaction([uint8ListToHex(keychainAddress)],
              request: 'address');

      final List<Ownership> ownerships2 = await getTransactionOwnerships(
          [lastTransactionKeychain.values.first.address!]);
      final Ownership ownership2 = ownerships2[0];

      final AuthorizedKey authorizedPublicKey2 = ownership2
          .authorizedPublicKeys!
          .firstWhere((AuthorizedKey publicKey) =>
              publicKey.publicKey!.toUpperCase() ==
              uint8ListToHex(keypair.publicKey).toUpperCase());
      final Uint8List aesKey2 = ecDecrypt(
          authorizedPublicKey2.encryptedSecretKey, keypair.privateKey);
      final Uint8List keychain = aesDecrypt(ownership2.secret, aesKey2);
      return decodeKeychain(keychain);
    } catch (e) {
      if (e.toString() == 'Keychain doesn\'t exists') {
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
  Future<String> addOriginKey(
      {String? originPublicKey, String? certificate}) async {
    final Completer<String> completer = Completer<String>();
    final Map<String, String> requestHeaders = <String, String>{
      'Content-type': 'application/json',
      'Accept': 'application/json',
    };

    final String body = jsonEncode(<String, String>{
      'origin_public_key': originPublicKey!,
      'certificate': certificate!
    });
    final http.Response responseHttp = await http.post(
        Uri.parse('${endpoint!}/api/origin_key'),
        body: body,
        headers: requestHeaders);
    log('addOriginKey: requestHttp.body=$body');
    log('addOriginKey: responseHttp.body=${responseHttp.body}');

    final OriginKeyResponse originKey =
        originKeyResponseFromJson(responseHttp.body);

    completer.complete(originKey.toString());
    return completer.future;
  }

  /// Query the network to find a token's data from a list of token addresses
  Future<Map<String, List<Token>>> getToken(List<String> addresses,
      {String request =
          'genesis, name, id, supply, symbol, type, properties'}) async {
    final Map<String, String> requestHeaders = <String, String>{
      'Content-type': 'application/json',
      'Accept': 'application/json',
    };

    if (addresses.isEmpty) {
      return {};
    }

    try {
      final String fragment = 'fragment fields on Token { $request }';
      String body = '{"query":"query {';
      for (final String address in addresses) {
        body = '$body a$address: token(address:\\"$address\\") { ...fields }';
      }
      body = '$body } $fragment "}';
      log('getToken: requestHttp.body=$body');
      final http.Response responseHttp = await http.post(
          Uri.parse('${endpoint!}/api'),
          body: body,
          headers: requestHeaders);
      log('getToken: responseHttp.body=${responseHttp.body}');

      if (responseHttp.statusCode == 200) {
        final TokenResponse tokenResponse =
            TokenResponse.fromJson(json.decode(responseHttp.body));

        return tokenResponse.data ?? {};
      }
    } catch (e) {
      log('getToken: error=$e');
    }

    return {};
  }
}
