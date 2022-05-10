/// SPDX-License-Identifier: AGPL-3.0-or-later

// Dart imports:
import 'dart:async';
import 'dart:convert';
import 'dart:developer' as dev;
import 'dart:math';
import 'dart:typed_data';

// Package imports:
import 'package:http/http.dart' as http show Response, post;

// Project imports:
import 'package:archethic_lib_dart/src/model/authorized_key.dart';
import 'package:archethic_lib_dart/src/model/balance.dart';
import 'package:archethic_lib_dart/src/model/crypto/key_pair.dart';
import 'package:archethic_lib_dart/src/model/keychain.dart';
import 'package:archethic_lib_dart/src/model/node.dart';
import 'package:archethic_lib_dart/src/model/ownership.dart';
import 'package:archethic_lib_dart/src/model/response/balance_response.dart';
import 'package:archethic_lib_dart/src/model/response/network_transactions_response.dart';
import 'package:archethic_lib_dart/src/model/response/nodes_response.dart';
import 'package:archethic_lib_dart/src/model/response/shared_secrets_response.dart';
import 'package:archethic_lib_dart/src/model/response/transaction_chain_response.dart';
import 'package:archethic_lib_dart/src/model/response/transaction_content_response.dart';
import 'package:archethic_lib_dart/src/model/response/transaction_inputs_response.dart';
import 'package:archethic_lib_dart/src/model/response/transaction_last_response.dart';
import 'package:archethic_lib_dart/src/model/transaction.dart';
import 'package:archethic_lib_dart/src/model/transaction_fee.dart';
import 'package:archethic_lib_dart/src/model/transaction_input.dart';
import 'package:archethic_lib_dart/src/model/transaction_status.dart';
import 'package:archethic_lib_dart/src/utils/crypto.dart';
import 'package:archethic_lib_dart/src/utils/utils.dart';

class ApiService {
  ApiService(this.endpoint);

  /// [endpoint] is the HTTP URL to a Archethic node (acting as welcome node)
  String? endpoint;

  /// Send a transaction to the network
  /// @param {Object} tx Transaction to send
  Future<TransactionStatus> sendTx(Transaction transaction) async {
    final Completer<TransactionStatus> _completer =
        Completer<TransactionStatus>();
    final Map<String, String> requestHeaders = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
    };
    TransactionStatus transactionStatus = TransactionStatus();
    dev.log('sendTx: requestHttp.body=' + transaction.convertToJSON());
    try {
      final http.Response responseHttp = await http.post(
          Uri.parse(endpoint! + '/api/transaction'),
          body: transaction.convertToJSON(),
          headers: requestHeaders);
      dev.log('sendTx: responseHttp.body=' + responseHttp.body);
      transactionStatus = transactionStatusFromJson(responseHttp.body);

      _completer.complete(transactionStatus);
    } catch (e) {
      dev.log(e.toString());
    }

    return _completer.future;
  }

  /// Query the network to find the last transaction from an address
  /// @param {String} The address scalar type represents a cryptographic hash used in the Archethic network with an identification byte to specify from which algorithm the hash was generated. The Hash appears in a JSON response as Base16 formatted string. The parsed hash will be converted to a binary and any invalid hash with an invalid algorithm or invalid size will be rejected
  Future<Transaction> getLastTransaction(String address) async {
    final Completer<Transaction> _completer = Completer<Transaction>();
    TransactionLastResponse transactionLastResponse = TransactionLastResponse();
    Transaction? lastTransaction = Transaction(
        type: '', chainLength: 0, data: Transaction.initData(), address: '');
    final Map<String, String> requestHeaders = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
    };
    try {
      final String _body =
          '{"query": "query {lastTransaction(address: \\"$address\\") { ' +
              Transaction.getQLFields() +
              ' } }"}';
      dev.log('getLastTransaction: requestHttp.body=' + _body);
      final http.Response responseHttp = await http.post(
          Uri.parse(endpoint! + '/api'),
          body: _body,
          headers: requestHeaders);
      dev.log('getLastTransaction: responseHttp.body=' + responseHttp.body);
      if (responseHttp.statusCode == 200) {
        transactionLastResponse =
            transactionLastResponseFromJson(responseHttp.body);
        if (transactionLastResponse.data != null &&
            transactionLastResponse.data!.lastTransaction != null) {
          lastTransaction = transactionLastResponse.data!.lastTransaction;
        }
      }
    } catch (e) {
      dev.log('getLastTransaction: error=' + e.toString());
    }

    _completer.complete(lastTransaction);
    return _completer.future;
  }

  Future<Transaction> getTransactionIndex(String address) async {
    final Completer<Transaction> _completer = Completer<Transaction>();
    TransactionLastResponse transactionLastResponse = TransactionLastResponse();
    Transaction? lastTransaction = Transaction(
        type: '', chainLength: 0, data: Transaction.initData(), address: '');
    final Map<String, String> requestHeaders = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
    };
    try {
      final String _body =
          '{"query": "query {lastTransaction(address: \\"$address\\") { chainLength } }"}';
      dev.log('getTransactionIndex: requestHttp.body=' + _body);
      final http.Response responseHttp = await http.post(
          Uri.parse(endpoint! + '/api'),
          body: _body,
          headers: requestHeaders);
      dev.log('getTransactionIndex: responseHttp.body=' + responseHttp.body);
      if (responseHttp.statusCode == 200) {
        transactionLastResponse =
            transactionLastResponseFromJson(responseHttp.body);
        if (transactionLastResponse.data != null &&
            transactionLastResponse.data!.lastTransaction != null) {
          lastTransaction = transactionLastResponse.data!.lastTransaction;
        }
      }
    } catch (e) {
      dev.log('getTransactionIndex: error=' + e.toString());
    }

    _completer.complete(lastTransaction);
    return _completer.future;
  }

  /// getStorageNoncePublicKey
  Future<String> getStorageNoncePublicKey() async {
    final Completer<String> _completer = Completer<String>();
    String _storageNoncePublicKey = '';
    SharedSecretsResponse sharedSecretsResponse = SharedSecretsResponse();

    final Map<String, String> requestHeaders = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
    };

    try {
      const String _body =
          '{"query": "query {sharedSecrets {storageNoncePublicKey}}"}';
      dev.log('getStorageNoncePublicKey: requestHttp.body=' + _body);
      final http.Response responseHttp = await http.post(
          Uri.parse(endpoint! + '/api'),
          body: _body,
          headers: requestHeaders);
      dev.log(
          'getStorageNoncePublicKey: responseHttp.body=' + responseHttp.body);
      if (responseHttp.statusCode == 200) {
        sharedSecretsResponse =
            sharedSecretsResponseFromJson(responseHttp.body);
        if (sharedSecretsResponse.data != null &&
            sharedSecretsResponse.data!.storageNoncePublicKey != null) {
          _storageNoncePublicKey =
              sharedSecretsResponse.data!.storageNoncePublicKey!;
        }
      }
    } catch (e) {
      dev.log('getStorageNoncePublicKey: error=' + e.toString());
    }

    _completer.complete(_storageNoncePublicKey);
    return _completer.future;
  }

  /// Query the network to find a balance from an address
  /// @param {String} The address scalar type represents a cryptographic hash used in the Archethic network with an identification byte to specify from which algorithm the hash was generated. The Hash appears in a JSON response as Base16 formatted string. The parsed hash will be converted to a binary and any invalid hash with an invalid algorithm or invalid size will be rejected
  /// Returns [Balance] represents a ledger balance. It includes: UCO: uco balance & NFT: NFT balances
  Future<Balance> fetchBalance(String address) async {
    final Completer<Balance> _completer = Completer<Balance>();
    BalanceResponse? balanceResponse;
    Balance? balance = Balance();

    final Map<String, String> requestHeaders = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
    };

    final String _body =
        '{"query": "query {balance(address: \\"$address\\") {uco, nft {address, amount}}}"}';
    dev.log('fetchBalance: requestHttp.body=' + _body);

    try {
      final http.Response responseHttp = await http.post(
          Uri.parse(endpoint! + '/api'),
          body: _body,
          headers: requestHeaders);
      dev.log('fetchBalance: responseHttp.body=' + responseHttp.body);

      if (responseHttp.statusCode == 200) {
        balanceResponse = balanceResponseFromJson(responseHttp.body);
        if (balanceResponse.data != null) {
          balance = balanceResponse.data!.balance;
        }
      }
    } catch (e) {
      dev.log('fetchBalance: error=' + e.toString());
    }

    _completer.complete(balance);
    return _completer.future;
  }

  /// Query the network to find a transaction
  /// @param {String} The address scalar type represents a cryptographic hash used in the Archethic network with an identification byte to specify from which algorithm the hash was generated. The Hash appears in a JSON response as Base16 formatted string. The parsed hash will be converted to a binary and any invalid hash with an invalid algorithm or invalid size will be rejected
  /// Returns the content scalar type represents transaction content. Depending if the content can displayed it will be rendered as plain text otherwise in hexadecimal
  Future<String> getTransactionContent(String address) async {
    final Completer<String> _completer = Completer<String>();
    String _content = '';
    TransactionContentResponse? transactionContentResponse =
        TransactionContentResponse();

    final Map<String, String> requestHeaders = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
    };

    final String _body =
        '{"query":"query { transaction(address: \\"$address\\") { data { content }} }"}';
    dev.log('getTransactionContent: requestHttp.body=' + _body);

    try {
      final http.Response responseHttp = await http.post(
          Uri.parse(endpoint! + '/api'),
          body: _body,
          headers: requestHeaders);
      dev.log('getTransactionContent: responseHttp.body=' + responseHttp.body);

      if (responseHttp.statusCode == 200) {
        transactionContentResponse =
            transactionContentResponseFromJson(responseHttp.body);
        if (transactionContentResponse.data != null &&
            transactionContentResponse.data!.transaction != null &&
            transactionContentResponse.data!.transaction!.data != null) {
          _content =
              transactionContentResponse.data!.transaction!.data!.content!;
        }
      }
    } catch (e) {
      dev.log('getTransactionContent: error=' + e.toString());
    }

    _completer.complete(_content);
    return _completer.future;
  }

  /// Query the network to find a transaction chain
  /// @param {String} The address scalar type represents a cryptographic hash used in the Archethic network with an identification byte to specify from which algorithm the hash was generated. The Hash appears in a JSON response as Base16 formatted string. The parsed hash will be converted to a binary and any invalid hash with an invalid algorithm or invalid size will be rejected
  /// @param {int} The page
  /// Returns the content scalar type represents transaction content [List<Transaction>]. Depending if the content can displayed it will be rendered as plain text otherwise in hexadecimal
  Future<List<Transaction>> getTransactionChain(
      String address, int page) async {
    final Completer<List<Transaction>> _completer =
        Completer<List<Transaction>>();
    TransactionChainResponse? transactionChainResponse =
        TransactionChainResponse();
    List<Transaction> transactionChain =
        List<Transaction>.empty(growable: true);
    final Map<String, String> requestHeaders = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
    };

    final String _body =
        '{"query":"query { transactionChain(address: \\"$address\\", page: $page) { ' +
            Transaction.getQLFields() +
            ' } }"}';
    dev.log('getTransactionChain: requestHttp.body=' + _body);

    try {
      final http.Response responseHttp = await http.post(
          Uri.parse(endpoint! + '/api'),
          body: _body,
          headers: requestHeaders);
      dev.log('getTransactionChain: responseHttp.body=' + responseHttp.body);

      if (responseHttp.statusCode == 200) {
        transactionChainResponse =
            transactionChainResponseFromJson(responseHttp.body);
        if (transactionChainResponse.data != null &&
            transactionChainResponse.data!.transactionChain != null) {
          transactionChain = transactionChainResponse.data!.transactionChain!;
        }
      }
    } catch (e) {
      dev.log('getTransactionChain: error=' + e.toString());
    }

    _completer.complete(transactionChain);
    return _completer.future;
  }

  /// Query the node infos
  /// Returns a [List<Node>] with infos
  Future<List<Node>> getNodeList() async {
    final Completer<List<Node>> _completer = Completer<List<Node>>();
    NodesResponse nodesResponse = NodesResponse();
    List<Node> nodesList = List<Node>.empty(growable: true);

    final Map<String, String> requestHeaders = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
    };

    try {
      const String _body =
          '{"query": "query {nodes {authorized available averageAvailability firstPublicKey geoPatch ip lastPublicKey networkPatch port rewardAddress authorizationDate enrollmentDate}}"}';
      dev.log('getNodeList: requestHttp.body=' + _body);
      final http.Response responseHttp = await http.post(
          Uri.parse(endpoint! + '/api'),
          body: _body,
          headers: requestHeaders);
      dev.log('getNodeList: responseHttp.body=' + responseHttp.body);
      if (responseHttp.statusCode == 200) {
        nodesResponse = nodesResponseFromJson(responseHttp.body);
        if (nodesResponse.data != null) {
          nodesList = nodesResponse.data!.nodes!;
        }
      }
    } catch (e) {
      dev.log('getNodeList: error=' + e.toString());
    }

    _completer.complete(nodesList);
    return _completer.future;
  }

  /// Query the network to list the transaction on the type
  /// @param {String} The type of transaction
  /// @param {int} The page
  /// Returns the content scalar type represents transaction content [List<Transaction>]. Depending if the content can displayed it will be rendered as plain text otherwise in hexadecimal
  Future<List<Transaction>> networkTransactions(String type, int page) async {
    final Completer<List<Transaction>> _completer =
        Completer<List<Transaction>>();
    NetworkTransactionsResponse? networkTransactionsResponse =
        NetworkTransactionsResponse();
    List<Transaction> transactionsList =
        List<Transaction>.empty(growable: true);
    final Map<String, String> requestHeaders = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
    };

    final String _body =
        '{"query":"query { networkTransactions(type: \\"$type\\", page: $page) { ' +
            Transaction.getQLFields() +
            ' } }"}';
    dev.log('networkTransactions: requestHttp.body=' + _body);

    try {
      final http.Response responseHttp = await http.post(
          Uri.parse(endpoint! + '/api'),
          body: _body,
          headers: requestHeaders);
      dev.log('networkTransactions: responseHttp.body=' + responseHttp.body);

      if (responseHttp.statusCode == 200) {
        networkTransactionsResponse =
            networkTransactionsResponseFromJson(responseHttp.body);
        if (networkTransactionsResponse.data != null) {
          transactionsList =
              networkTransactionsResponse.data!.networkTransactions!;
        }
      }
    } catch (e) {
      dev.log('networkTransactions: error=' + e.toString());
    }

    _completer.complete(transactionsList);
    return _completer.future;
  }

  /// Query the network to list the transaction inputs from an address
  /// @param {String} The address scalar type represents a cryptographic hash used in the Archethic network with an identification byte to specify from which algorithm the hash was generated. The Hash appears in a JSON response as Base16 formatted string. The parsed hash will be converted to a binary and any invalid hash with an invalid algorithm or invalid size will be rejected
  Future<List<TransactionInput>> getTransactionInputs(String address) async {
    final Completer<List<TransactionInput>> _completer =
        Completer<List<TransactionInput>>();
    List<TransactionInput> transactionInputs =
        List<TransactionInput>.empty(growable: true);
    TransactionInputsResponse transactionInputsResponse =
        TransactionInputsResponse();
    final Map<String, String> requestHeaders = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
    };
    try {
      final String _body =
          '{"query":"query { transactionInputs(address: \\"$address\\") { amount, from, nftAddress, spent, timestamp, type } }"}';
      dev.log('getTransactionInputs: requestHttp.body=' + _body);
      final http.Response responseHttp = await http.post(
          Uri.parse(endpoint! + '/api'),
          body: _body,
          headers: requestHeaders);
      dev.log('getTransactionInputs: responseHttp.body=' + responseHttp.body);
      if (responseHttp.statusCode == 200) {
        transactionInputsResponse =
            transactionInputsResponseFromJson(responseHttp.body);
        transactionInputs = transactionInputsResponse.data!.transactionInputs!;
      }
    } catch (e) {
      dev.log('getTransactionInputs: error=' + e.toString());
    }

    _completer.complete(transactionInputs);
    return _completer.future;
  }

  /// Query the network to find a transaction
  /// @param {String} The address scalar type represents a cryptographic hash used in the Archethic network with an identification byte to specify from which algorithm the hash was generated. The Hash appears in a JSON response as Base16 formatted string. The parsed hash will be converted to a binary and any invalid hash with an invalid algorithm or invalid size will be rejected
  /// Returns all informations represent transaction content.
  Future<Transaction> getTransactionAllInfos(String address) async {
    final Completer<Transaction> _completer = Completer<Transaction>();
    Transaction? transaction;

    final Map<String, String> requestHeaders = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
    };

    final String _body =
        '{"query":"query { transaction(address: \\"$address\\") {' +
            Transaction.getQLFields() +
            '} }"}';
    dev.log('getTransactionAllInfos: requestHttp.body=' + _body);

    try {
      final http.Response responseHttp = await http.post(
          Uri.parse(endpoint! + '/api'),
          body: _body,
          headers: requestHeaders);
      dev.log('getTransactionAllInfos: responseHttp.body=' + responseHttp.body);

      if (responseHttp.statusCode == 200) {
        final TransactionContentResponse transactionResponse =
            transactionContentResponseFromJson(responseHttp.body);
        if (transactionResponse.data != null &&
            transactionResponse.data!.transaction != null) {
          transaction = transactionResponse.data!.transaction;
        }
      }
    } catch (e) {
      dev.log('getTransactionAllInfos: error=' + e.toString());
    }

    _completer.complete(transaction);
    return _completer.future;
  }

  /// Get transaction fees
  /// @param {Object} tx Transaction to estimate fees
  Future<TransactionFee> getTransactionFee(Transaction transaction) async {
    final Completer<TransactionFee> _completer = Completer<TransactionFee>();
    final Map<String, String> requestHeaders = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
    };
    TransactionFee transactionFee = TransactionFee();
    final http.Response responseHttp = await http.post(
        Uri.parse(endpoint! + '/api/transaction_fee'),
        body: transaction.convertToJSON(),
        headers: requestHeaders);
    dev.log(
        'getTransactionFees: requestHttp.body=' + transaction.convertToJSON());
    dev.log('getTransactionFees: responseHttp.body=' + responseHttp.body);
    transactionFee = transactionFeeFromJson(responseHttp.body);

    _completer.complete(transactionFee);
    return _completer.future;
  }

  /// getTransactionOwnerships
  Future<List<Ownership>> getTransactionOwnerships(String address) async {
    final Completer<List<Ownership>> _completer = Completer<List<Ownership>>();

    final Map<String, String> requestHeaders = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
    };

    List<Ownership> ownerships = List<Ownership>.empty(growable: true);
    try {
      final String _body =
          '{"query": "query { transaction(address: \\"$address\\") { data { ownerships { secret, authorizedPublicKeys { encryptedSecretKey, publicKey } } } } }"}';
      dev.log('getTransactionOwnerships: requestHttp.body=' + _body);
      final http.Response responseHttp = await http.post(
          Uri.parse(endpoint! + '/api'),
          body: _body,
          headers: requestHeaders);
      dev.log(
          'getTransactionOwnerships: responseHttp.body=' + responseHttp.body);
      if (responseHttp.statusCode == 200) {
        final TransactionContentResponse transactionResponse =
            transactionContentResponseFromJson(responseHttp.body);
        if (transactionResponse.data != null &&
            transactionResponse.data!.transaction != null &&
            transactionResponse.data!.transaction!.data != null) {
          ownerships = transactionResponse.data!.transaction!.data!.ownerships!;
        }
      }
    } catch (e) {
      dev.log('getTransactionOwnerships: error=' + e.toString());
    }

    _completer.complete(ownerships);
    return _completer.future;
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
    final Keychain keychain = Keychain(Uint8List.fromList(utf8.encode(seed)));
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

    return Transaction(type: 'hosting', data: Transaction.initData())
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

    final List<AuthorizedKey> authorizedKeys = [
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

    final List<Ownership> ownerships =
        await getTransactionOwnerships(accessKeychainAddress);
    if (ownerships.isEmpty) {
      throw 'Keychain doesn\'t exists';
    }

    final Ownership ownership = ownerships[0];
    final AuthorizedKey authorizedPublicKey = ownership.authorizedPublicKeys!
        .firstWhere((AuthorizedKey authKey) =>
            authKey.publicKey!.toUpperCase() == utf8.decode(keypair.publicKey));

    final Uint8List aesKey =
        ecDecrypt(authorizedPublicKey.encryptedSecretKey, keypair.privateKey);
    final Uint8List keychainAddress = aesDecrypt(ownership.secret, aesKey);

    final List<Ownership> ownerships2 =
        await getTransactionOwnerships(uint8ListToHex(keychainAddress));
    final Ownership ownership2 = ownerships2[0];

    final AuthorizedKey authorizedPublicKey2 = ownership2.authorizedPublicKeys!
        .firstWhere((AuthorizedKey publicKey) =>
            publicKey.publicKey!.toUpperCase() ==
            utf8.decode(keypair.publicKey));
    final Uint8List aesKey2 =
        ecDecrypt(authorizedPublicKey2.encryptedSecretKey, keypair.privateKey);
    final Uint8List keychain = aesDecrypt(ownership2.secret, aesKey2);
    return decodeKeychain(keychain);
  }
}
