/// SPDX-License-Identifier: AGPL-3.0-or-later

// Dart imports:
import 'dart:convert';
import 'dart:typed_data';

// Project imports:
import 'package:archethic_lib_dart/src/model/authorized_key.dart';
import 'package:archethic_lib_dart/src/model/balance.dart';
import 'package:archethic_lib_dart/src/model/cross_validation_stamp.dart';
import 'package:archethic_lib_dart/src/model/crypto/key_pair.dart';
import 'package:archethic_lib_dart/src/model/data.dart';
import 'package:archethic_lib_dart/src/model/nft_transfer.dart';
import 'package:archethic_lib_dart/src/model/ownership.dart';
import 'package:archethic_lib_dart/src/model/transaction_input.dart';
import 'package:archethic_lib_dart/src/model/uco_transfer.dart';
import 'package:archethic_lib_dart/src/model/validation_stamp.dart';
import 'package:archethic_lib_dart/src/utils/utils.dart';

import 'package:archethic_lib_dart/src/utils/crypto.dart' as crypto
    show deriveKeyPair, sign, deriveAddress;

const int cVersion = 1;

const Map<String, int> txTypes = <String, int>{
  /// User based transaction types
  'keychain_access': 254,
  'keychain': 255,
  'transfer': 253,
  'hosting': 252,
  'nft': 251,

  /// Network based transaction types
  'node': 0,
  'node_shared_secrets': 1,
  'origin_shared_secrets': 2,
  'beacon': 3,
  'beacon_summary': 4,
  'oracle': 5,
  'oracle_summary': 6,
  'code_proposal': 7,
  'code_approval': 8,
  'node_rewards': 9,
};

/// [Transaction] represents a unitary transaction in the Archethic network.
class Transaction {
  Transaction({
    this.address,
    this.balance,
    this.chainLength,
    this.crossValidationStamps,
    this.data,
    this.inputs,
    this.originSignature,
    this.previousPublicKey,
    this.previousSignature,
    required this.type,
    this.validationStamp,
    this.version = cVersion,
  });

  ///  - Address: hash of the new generated public key for the given transaction
  String? address;

  /// - [Balance] represents a ledger balance
  Balance? balance;

  /// - Length of the chain
  int? chainLength;

  /// - Cross validation stamps: endorsements of the validation stamp from the coordinator
  List<CrossValidationStamp>? crossValidationStamps;

  /// - [Data]: transaction data zone (identity, keychain, smart contract, etc.)
  Data? data;

  /// - [TransactionInput] represents the inputs from the transaction
  List<TransactionInput>? inputs;

  /// - Origin signature: signature from the device which originated the transaction (used in the Proof of work)
  String? originSignature;

  /// - Previous public key: previous generated public key matching the previous signature
  String? previousPublicKey;

  /// - Previous signature: signature from the previous public key
  String? previousSignature;

  /// - Type: transaction type
  String? type;

  /// - [ValidationStamp]: coordinator work result
  ValidationStamp? validationStamp;

  /// - Version: version of the transaction (used for backward compatiblity)
  int? version;

  factory Transaction.fromJson(Map<String, dynamic> json) => Transaction(
        address: json['address'],
        balance:
            json['balance'] == null ? null : Balance.fromJson(json['balance']),
        chainLength: json['chainLength'],
        crossValidationStamps: json['crossValidationStamps'] == null
            ? null
            : List<CrossValidationStamp>.from(json['crossValidationStamps']
                .map((dynamic x) => CrossValidationStamp.fromJson(x))),
        data: json['data'] == null ? null : Data.fromJson(json['data']),
        inputs: json['inputs'] == null
            ? null
            : List<TransactionInput>.from(json['inputs']
                .map((dynamic x) => TransactionInput.fromJson(x))),
        originSignature: json['originSignature'],
        previousPublicKey: json['previousPublicKey'],
        previousSignature: json['previousSignature'],
        type: json['type'],
        validationStamp: json['validationStamp'] == null
            ? null
            : ValidationStamp.fromJson(json['validationStamp']),
        version: json['version'],
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'address': address,
        'balance': balance!.toJson(),
        'chainLength': chainLength,
        'crossValidationStamps': List<dynamic>.from(
            crossValidationStamps!.map((CrossValidationStamp x) => x.toJson())),
        'data': data!.toJson(),
        'inputs':
            List<dynamic>.from(inputs!.map((TransactionInput x) => x.toJson())),
        'originSignature': originSignature,
        'previousPublicKey': previousPublicKey,
        'previousSignature': previousSignature,
        'type': type,
        'validationStamp': validationStamp!.toJson(),
        'version': version,
      };

  /// Generate the transaction address, keys and signatures
  /// @param {String} seed Transaction chain seed (hexadecimal or binary buffer)
  /// @param {int} index Number of transaction on the chain
  /// @param {String} curve Elliptic curve to use for the key generation
  /// @param {String} hashAlgo Hash algorithm to use for the address generation
  Transaction build(String seed, int index,
      {String? curve = 'ed25519', String? hashAlgo = 'sha256'}) {
    final KeyPair keypair = crypto.deriveKeyPair(seed, index, curve: curve!);
    address = crypto.deriveAddress(seed, index + 1,
        curve: curve, hashAlgo: hashAlgo!);
    previousPublicKey = uint8ListToHex(keypair.publicKey);
    previousSignature = uint8ListToHex(
        crypto.sign(previousSignaturePayload(), keypair.privateKey));

    return this;
  }

  /// Add smart contract code to the transaction
  /// @param {String} code Smart contract code
  Transaction setCode(String code) {
    data!.code = code;
    return this;
  }

  /// Add a content to the transaction
  /// @param {String | Uint8List} content Hosted content
  Transaction setContent(dynamic content) {
    if (content is! Uint8List && content is! String) {
      throw "'content' must be a string or Uint8List";
    }

    if (content is Uint8List) {
      content = utf8.decode(content);
    }
    data!.content = content;
    return this;
  }

  /// Add an ownership with a secret and its authorized public keys
  /// @param {String | Uint8List} secret Secret encrypted (hexadecimal or binary buffer)
  /// @param {List<AuthorizedKey>} authorizedKeys
  Transaction addOwnership(dynamic secret, List<AuthorizedKey> authorizedKeys) {
    if (secret is! Uint8List && secret is! String) {
      throw "'secret' must be a string or Uint8List";
    }

    if (secret is Uint8List) {
      secret = uint8ListToHex(secret);
    }

    for (AuthorizedKey authorizedKey in authorizedKeys) {
      if (!isHex(authorizedKey.publicKey!)) {
        throw "'Authorized public key' must be an hexadecimal string";
      }

      if (!isHex(authorizedKey.encryptedSecretKey!)) {
        throw "'Encrypted secret' must be an hexadecimal string";
      }
    }

    data!.ownerships!
        .add(Ownership(secret: secret, authorizedPublicKeys: authorizedKeys));
    return this;
  }

  /// Add a UCO transfer to the transaction
  /// @param {String | Uint8List} to Address of the recipient (hexadecimal or binary buffer)
  /// @param {BigInt} amount Amount of UCO to transfer
  Transaction addUCOTransfer(dynamic to, BigInt amount) {
    if (to is! Uint8List && to is! String) {
      throw "'to' must be a string or Uint8List";
    }

    if (to is String) {
      if (!isHex(to)) {
        throw "'to' must be an hexadecimal string";
      }
    } else {
      to = uint8ListToHex(to);
    }
    final UCOTransfer ucoTransfer = UCOTransfer(to: to, amount: amount);
    data!.ledger!.uco!.transfers!.add(ucoTransfer);
    return this;
  }

  /// Add a NFT transfer to the transaction
  /// @param {String | Uint8List} to Address of the recipient (hexadecimal or binary buffer)
  /// @param {BigInt} amount Amount of NFT to transfer
  /// @param {String | Uint8List} nftAddress Address of NFT to spend (hexadecimal or binary buffer)
  /// @param {int} nftId ID of the NFT to use (default to 0)
  Transaction addNFTTransfer(dynamic to, BigInt amount, dynamic nftAddress,
      {int nftId = 0}) {
    if (to is! Uint8List && to is! String) {
      throw "'to' must be a string or Uint8List";
    }

    if (to is String) {
      if (!isHex(to)) {
        throw "'to' must be an hexadecimal string";
      }
    } else {
      to = uint8ListToHex(to);
    }

    if (nftAddress is! Uint8List && nftAddress is! String) {
      throw "'nftAddress' must be a string or Uint8List";
    }

    if (nftAddress is String) {
      if (!isHex(nftAddress)) {
        throw "'nftAddress' must be an hexadecimal string";
      }
    } else {
      nftAddress = uint8ListToHex(nftAddress);
    }

    if (nftId.isNaN && nftId < 0) {
      throw "'nftId' must be a valid integer >= 0";
    }

    final NFTTransfer nftTransfer =
        NFTTransfer(amount: amount, nft: nftAddress, to: to, nftId: nftId);
    data!.ledger!.nft!.transfers!.add(nftTransfer);
    return this;
  }

  /// Add recipient to the transaction
  /// @param {String | Uint8List} to Recipient address (hexadecimal or binary buffer)
  Transaction addRecipient(dynamic to) {
    if (to is! Uint8List && to is! String) {
      throw "'to' must be a string or Uint8List";
    }

    if (to is String) {
      if (!isHex(to)) {
        throw "'to' must be an hexadecimal string";
      }
    } else {
      to = uint8ListToHex(to);
    }
    data!.recipients!.add(to);
    return this;
  }

  /// Set the transaction builder with Previous Publickey and Previous Signature
  /// @param {String | Uint8List} to Previous Signature (hexadecimal)
  /// @param {String | Uint8List} to Previous PublicKey (hexadecimal)
  Transaction setPreviousSignatureAndPreviousPublicKey(
      dynamic prevSign, dynamic prevPubKey) {
    if (prevSign is! Uint8List && prevSign is! String) {
      throw "'prevSign' must be a string or Uint8List";
    }

    if (prevPubKey is! Uint8List && prevPubKey is! String) {
      throw "'prevSign' must be a string or Uint8List";
    }

    if (prevSign is String) {
      if (!isHex(prevSign)) {
        throw "'prevSign' must be an hexadecimal string";
      }
    } else {
      prevSign = uint8ListToHex(prevSign);
    }

    if (prevPubKey is String) {
      if (!isHex(prevPubKey)) {
        throw "'prevPubKey' must be an hexadecimal string";
      }
    } else {
      prevPubKey = uint8ListToHex(prevPubKey);
    }

    previousSignature = prevSign;
    previousPublicKey = prevPubKey;
    return this;
  }

  /// Set the transaction builder with address (required for originSign)
  /// @param {String | Uint8List} to Address (hexadecimal | Uint8List)
  Transaction setAddress(dynamic addr) {
    if (addr is! Uint8List && addr is! String) {
      throw "'addr' must be a string or Uint8List";
    }
    if (addr is String) {
      if (!isHex(addr)) {
        throw "'addr' must be an hexadecimal string";
      }
    } else {
      addr = uint8ListToHex(addr);
    }

    address = addr;
    return this;
  }

  /// Sign the transaction with an origin private key
  /// @param {String | Uint8List} originPv Origin Private Key (hexadecimal or binary buffer)
  Transaction originSign(dynamic privateKey) {
    if (privateKey is! Uint8List && privateKey is! String) {
      throw "'privateKey' must be a string or Uint8List";
    }

    if (privateKey is String) {
      if (!isHex(privateKey)) {
        throw "'privateKey' must be an hexadecimal string";
      }
    } else {
      privateKey = uint8ListToHex(privateKey);
    }

    originSignature =
        uint8ListToHex(crypto.sign(originSignaturePayload(), privateKey));
    return this;
  }

  Uint8List originSignaturePayload() {
    final Uint8List payloadForPreviousSignature = previousSignaturePayload();
    return concatUint8List(<Uint8List>[
      payloadForPreviousSignature,
      hexToUint8List(previousPublicKey!),
      Uint8List.fromList(<int>[hexToUint8List(previousSignature!).length]),
      hexToUint8List(previousSignature!),
    ]);
  }

  /// Generate the payload for the previous signature by encoding address, type and data
  Uint8List previousSignaturePayload() {
    final Uint8List bufCodeSize = encodeInt32(data!.code!.length);
    int contentSize = data!.content!.length;
    final Uint8List bufContentSize = encodeInt32(contentSize);

    Uint8List ownershipsBuffers = Uint8List(0);
    for (Ownership ownership in data!.ownerships!) {
      final List<Uint8List> authorizedKeysBuffer = <Uint8List>[
        Uint8List.fromList(<int>[ownership.authorizedPublicKeys!.length])
      ];
      for (AuthorizedKey authorizedKey in ownership.authorizedPublicKeys!) {
        authorizedKeysBuffer.add(hexToUint8List(authorizedKey.publicKey!));
        authorizedKeysBuffer
            .add(hexToUint8List(authorizedKey.encryptedSecretKey!));
      }

      ownershipsBuffers = concatUint8List(<Uint8List>[
        ownershipsBuffers,
        encodeInt32(hexToUint8List(ownership.secret!).lengthInBytes),
        hexToUint8List(ownership.secret!),
        concatUint8List(authorizedKeysBuffer)
      ]);
    }

    Uint8List ucoTransfersBuffers = Uint8List(0);
    if (data!.ledger!.uco!.transfers!.isNotEmpty) {
      for (UCOTransfer ucoTransfer in data!.ledger!.uco!.transfers!) {
        ucoTransfersBuffers = concatUint8List(<Uint8List>[
          ucoTransfersBuffers,
          hexToUint8List(ucoTransfer.to!),
          encodeBigInt(ucoTransfer.amount!)
        ]);
      }
    }

    Uint8List nftTransfersBuffers = Uint8List(0);
    if (data!.ledger!.nft!.transfers!.isNotEmpty) {
      for (NFTTransfer nftTransfer in data!.ledger!.nft!.transfers!) {
        nftTransfersBuffers = concatUint8List(<Uint8List>[
          nftTransfersBuffers,
          hexToUint8List(nftTransfer.nft!),
          hexToUint8List(nftTransfer.to!),
          encodeBigInt(nftTransfer.amount!),
          Uint8List.fromList(<int>[nftTransfer.nftId!])
        ]);
      }
    }

    Uint8List recipients = Uint8List(0);
    for (String recipient in data!.recipients!) {
      recipients =
          concatUint8List(<Uint8List>[recipients, hexToUint8List(recipient)]);
    }

    return concatUint8List(<Uint8List>[
      encodeInt32(version!),
      hexToUint8List(address!),
      Uint8List.fromList(<int>[txTypes[type]!]),
      bufCodeSize,
      Uint8List.fromList(utf8.encode(data!.code!)),
      bufContentSize,
      Uint8List.fromList(utf8.encode(data!.content!)),
      Uint8List.fromList(<int>[data!.ownerships!.length]),
      ownershipsBuffers,
      Uint8List.fromList(<int>[data!.ledger!.uco!.transfers!.length]),
      ucoTransfersBuffers,
      Uint8List.fromList(<int>[data!.ledger!.nft!.transfers!.length]),
      nftTransfersBuffers,
      Uint8List.fromList(<int>[data!.recipients!.length]),
      recipients
    ]);
  }

  /// Convert the transaction in JSON
  String convertToJSON() {
    final String json = jsonEncode(<String, Object?>{
      'version': version,
      'address': address == null ? '' : address!,
      'type': type,
      'data': {
        'content':
            uint8ListToHex(Uint8List.fromList(utf8.encode(data!.content!))),
        'code': data == null || data!.code == null ? '' : data!.code!,
        'ownerships': List<dynamic>.from(data!.ownerships!.map((Ownership x) {
          return <String, Object?>{
            'secret': x.secret == null ? '' : x.secret!,
            'authorizedKeys': x.authorizedPublicKeys,
          };
        })),
        'ledger': {
          'uco': {
            'transfers': List<dynamic>.from(
                data!.ledger!.uco!.transfers!.map((UCOTransfer x) {
              return {
                'to': x.to == null ? '' : x.to!,
                'amount': x.amount == null ? 0 : x.amount!.toInt(),
              };
            }))
          },
          'nft': {
            'transfers': List<dynamic>.from(
                data!.ledger!.nft!.transfers!.map((NFTTransfer x) {
              return {
                'to': x.to == null ? '' : x.to!,
                'amount': x.amount == null ? 0 : x.amount!.toInt(),
                'nft': x.nft!,
                'nft_id': x.nftId
              };
            }))
          },
        },
        'recipients':
            List<dynamic>.from(data!.recipients!.map((String x) => x)),
      },
      'previousPublicKey': previousPublicKey == null ? '' : previousPublicKey!,
      'previousSignature': previousSignature == null ? '' : previousSignature!,
      'originSignature': originSignature == null ? '' : originSignature!
    });
    return json;
  }

  static Data initData() {
    return Data.fromJson(<String, dynamic>{
      'content': '',
      'code': '',
      'ownerships': [],
      'ledger': {
        'uco': {'transfers': []},
        'nft': {'transfers': []}
      },
      'recipients': []
    });
  }

  static const String kTransactionQueryAllFields =
      ' address, balance { nft { address, amount }, uco }, chainLength, crossValidationStamps { nodePublicKey, signature }, data { content,  ownerships {  authorizedPublicKeys { encryptedSecretKey, publicKey } secret } ledger { uco { transfers { amount, to } }, nft { transfers { amount, to, nft } } } recipients } inputs { amount, from, nftAddress, spent, timestamp, type, }, originSignature, previousPublicKey, previousSignature, type, validationStamp { proofOfIntegrity, proofOfWork, signature, timestamp, ledgerOperations { fee } }, version';
}

String transactionEncoding() {
  /// Version: 4 bytes
  /// Sender Address: See Address
  /// Transaction type: 1 byte
  /// Transaction data:[
  ///   - Smart contract size: 4 bytes
  ///   - Smart contract code: X bytes
  ///   - Content size: 4 bytes
  ///   - Content: X bytes
  ///   - Ownerships length: 1 byte
  ///   - Ownerships:[
  ///     - Secret size: 4 bytes
  ///     - Secret: X bytes
  ///     - Authorized keys length: 1 byte
  ///     - Authorized keys: list[]
  ///   - Ledger:
  ///     - UCO Ledger
  ///       - Transfers length: 1 byte
  ///       - Transfers: recipient | amount * 10^8 [8 bytes]
  ///     - NFT Ledger
  ///       - Transfers length: 1 byte
  ///       - Transfers: nft_address | recipient | amount * 10^8 [8 bytes]
  ///   - Recipients (size): 1 byte
  ///   - Recipients: X bytes
  ///   - Previous public key: curve_type [1 byte] | origin_type [1 byte] | raw_key 04xy [bytes]
  ///   - Previous signature: X bytes
  ///   - Previous signature is computed from [version, address, type, data]
  ///   - Origin signature: X bytes (May be computed by the host)
  ///   - Origin signature is computed from [version, address, type, data, previous public key, previous signature]
  return '';
}
