// To parse this JSON data, do
//
//     final transaction = transactionFromJson(jsonString);

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
import 'package:archethic_lib_dart/src/model/transaction_input.dart';
import 'package:archethic_lib_dart/src/model/uco_transfer.dart';
import 'package:archethic_lib_dart/src/model/validation_stamp.dart';
import 'package:archethic_lib_dart/src/crypto.dart' as crypto
    show deriveKeyPair, hash, sign;
import 'package:archethic_lib_dart/src/utils.dart';

Transaction transactionFromJson(String str) =>
    Transaction.fromJson(json.decode(str));

String transactionToJson(Transaction data) => json.encode(data.toJson());

const int cVersion = 1;

const Map<String, int> txTypes = {
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

/// [Transaction] represents a unitary transaction in the ArchEthic network.
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
  TransactionInput? inputs;

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
                .map((x) => CrossValidationStamp.fromJson(x))),
        data: json['data'] == null ? null : Data.fromJson(json['data']),
        inputs: json['inputs'] == null
            ? null
            : TransactionInput.fromJson(json['inputs']),
        originSignature: json['originSignature'],
        previousPublicKey: json['previousPublicKey'],
        previousSignature: json['previousSignature'],
        type: json['type'],
        validationStamp: json['validationStamp'] == null
            ? null
            : ValidationStamp.fromJson(json['validationStamp']),
        version: json['version'],
      );

  Map<String, dynamic> toJson() => {
        'address': address,
        'balance': balance!.toJson(),
        'chainLength': chainLength,
        'crossValidationStamps':
            List<dynamic>.from(crossValidationStamps!.map((x) => x.toJson())),
        'data': data!.toJson(),
        'inputs': inputs!.toJson(),
        'originSignature': originSignature,
        'previousPublicKey': previousPublicKey,
        'previousSignature': previousSignature,
        'type': type,
        'validationStamp': validationStamp!.toJson(),
        'version': version,
      };

  /// Generate the transaction address, keys and signatures
  /// @param {String | Uint8List} seed Transaction chain seed (hexadecimal or binary buffer)
  /// @param {Integer} index Number of transaction on the chain
  /// @param {String} curve Elliptic curve to use for the key generation
  /// @param {String} hashAlgo Hash algorithm to use for the address generation
  Transaction build(seed, int index, String curve,
      {String hashAlgo = 'sha256'}) {
    final KeyPair keypair = crypto.deriveKeyPair(seed, index, curve: curve);
    final KeyPair nextKeypair =
        crypto.deriveKeyPair(seed, index + 1, curve: curve);
    final Uint8List address =
        crypto.hash(nextKeypair.publicKey, algo: hashAlgo);

    this.address = uint8ListToHex(address);
    previousPublicKey = uint8ListToHex(keypair.publicKey);
    ValidationStamp _validationStamp =
        new ValidationStamp(timestamp: DateTime.now().millisecondsSinceEpoch);
    validationStamp = _validationStamp;
    previousSignature =
        uint8ListToHex(crypto.sign(previousSignaturePayload(), keypair.privateKey));

    return this;
  }

  /// Add smart contract code to the transaction
  /// @param {String} code Smart contract code
  Transaction setCode(String code) {
    if (!(code is String)) {
      throw "'code' must be a string";
    }
    data!.code = code;
    return this;
  }

  /// Add a content to the transaction
  /// @param {String | Uint8List} content Hosted content
  Transaction setContent(content) {
    if (!(content is Uint8List) && !(content is String)) {
      throw "'content' must be a string or Uint8List";
    }

    if (content is Uint8List) {
      content = uint8ListToHex(content);
    }
    data!.content = content;
    return this;
  }

  /// Add a secret to the transaction
  /// @param {String | Uint8List} secret Secret encrypted (hexadecimal or binary buffer)
  Transaction setSecret(secret) {
    if (!(secret is Uint8List) && !(secret is String)) {
      throw "'secret' must be a string or Uint8List";
    }

    if (secret is Uint8List) {
      secret = uint8ListToHex(secret);
    }

    data!.keys!.secret = secret;
    return this;
  }

  /// Add an authorized public key for secret decryption to the transaction with its encrypted secret key
  /// @param {String | Uint8List} publicKey Authorized public key (hexadecimal or or binary buffer)
  /// @param {String | Uint8List} encryptedSecretKey Encrypted secret key for the given public key (hexadecimal or binary buffer)
  Transaction addAuthorizedKey(publicKey, encryptedSecretKey) {
    if (!(publicKey is Uint8List) && !(publicKey is String)) {
      throw "'publicKey' must be a string or Uint8List";
    }

    if (!(encryptedSecretKey is Uint8List) && !(encryptedSecretKey is String)) {
      throw "'encryptedSecretKey' must be a string or Uint8List";
    }

    if (publicKey is String) {
      if (!isHex(publicKey)) {
        throw "'publicKey' must be an hexadecimal string";
      }
    } else {
      publicKey = uint8ListToHex(publicKey);
    }

    if (encryptedSecretKey is String) {
      if (!isHex(encryptedSecretKey)) {
        throw "'encryptedSecretKey' must be an hexadecimal string";
      }
    } else {
      encryptedSecretKey = uint8ListToHex(encryptedSecretKey);
    }

    AuthorizedKey authorizedKey = new AuthorizedKey(
        publicKey: publicKey, encryptedKey: encryptedSecretKey);
    if (data!.keys!.authorizedKeys!.contains(publicKey) == false) {
      data!.keys!.authorizedKeys!.add(authorizedKey);
    }

    return this;
  }

  /// Add a UCO transfer to the transaction
  /// @param {String | Uint8List} to Address of the recipient (hexadecimal or binary buffer)
  /// @param {double} amount Amount of UCO to transfer
  Transaction addUCOTransfer(to, double amount) {
    if (!(to is Uint8List) && !(to is String)) {
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
  /// @param {double} amount Amount of UCO to transfer
  /// @param {String | Uint8List} nftAddress Address of NFT to spend (hexadecimal or binary buffer)
  Transaction addNFTTransfer(to, double amount, nftAddress) {
    if (!(to is Uint8List) && !(to is String)) {
      throw "'to' must be a string or Uint8List";
    }

    if (to is String) {
      if (!isHex(to)) {
        throw "'to' must be an hexadecimal string";
      }
    } else {
      to = uint8ListToHex(to);
    }

    if (!(nftAddress is Uint8List) && !(nftAddress is String)) {
      throw "'nftAddress' must be a string or Uint8List";
    }

    if (nftAddress is String) {
      if (!isHex(nftAddress)) {
        throw "'nftAddress' must be an hexadecimal string";
      }
    } else {
      nftAddress = uint8ListToHex(nftAddress);
    }
    final NFTTransfer nftTransfer =
        NFTTransfer(amount: amount, nft: nftAddress, to: to);
    data!.ledger!.nft!.transfers!.add(nftTransfer);
    return this;
  }

  /// Add recipient to the transaction
  /// @param {String | Uint8List} to Recipient address (hexadecimal or binary buffer)
  Transaction addRecipient(to) {
    if (!(to is Uint8List) && !(to is String)) {
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


  /// Sign the transaction with an origin private key
  /// @param {String | Uint8List} originPv Origin Private Key (hexadecimal or binary buffer)
  Transaction originSign(privateKey) {
    if (!(privateKey is Uint8List) && !(privateKey is String)) {
      throw "'privateKey' must be a string or Uint8List";
    }

    if (privateKey is String) {
      if (!isHex(privateKey)) {
        throw "'privateKey' must be an hexadecimal string";
      }
    } else {
      privateKey = uint8ListToHex(privateKey);
    }

    originSignature = uint8ListToHex(crypto.sign(originSignaturePayload(), privateKey));
    return this;
  }


  Uint8List originSignaturePayload() {
    final Uint8List payloadForPreviousSignature = previousSignaturePayload();
    return concatUint8List([
      payloadForPreviousSignature,
      hexToUint8List(previousPublicKey!),
      Uint8List.fromList([previousSignature!.length]),
      hexToUint8List(previousSignature!),
    ]);
  }

/// Generate the payload for the previous signature by encoding address, type and data
  Uint8List previousSignaturePayload() {
    final Uint8List bufCodeSize = encodeInt32(data!.code!.length);
    int contentSize = data!.content!.length;
    final Uint8List bufContentSize = encodeInt32(contentSize);
    final Uint8List bufSecretSize = encodeInt32(data!.keys!.secret!.length);

    Uint8List authorizedKeysBuffers = Uint8List(0);
    data!.keys!.authorizedKeys!.forEach((authorizedKey) {
      authorizedKeysBuffers = concatUint8List(
          [hexToUint8List(authorizedKey.publicKey!), hexToUint8List(authorizedKey.encryptedKey!)]);
    });

    Uint8List ucoTransfersBuffers = Uint8List(0);
    if (data!.ledger!.uco!.transfers!.isNotEmpty) {
      ucoTransfersBuffers = concatUint8List([
        hexToUint8List(data!.ledger!.uco!.transfers![0].to!),
        encodeFloat64(data!.ledger!.uco!.transfers![0].amount!)
      ]);
    }

    Uint8List nftTransfersBuffers = Uint8List(0);
    if (data!.ledger!.nft!.transfers!.isNotEmpty) {
      nftTransfersBuffers = concatUint8List([
        hexToUint8List(data!.ledger!.nft!.transfers![0].nft!),
        hexToUint8List(data!.ledger!.nft!.transfers![0].to!),
        encodeFloat64(data!.ledger!.nft!.transfers![0].amount!)
      ]);
    }

    Uint8List recipients = Uint8List(0);
    data!.recipients!.forEach((recipient) { 
      recipients = concatUint8List([recipients, hexToUint8List(recipient)]);
    });

    return concatUint8List([
      encodeInt32(version!),
      hexToUint8List(address!),
      Uint8List.fromList([txTypes[type]!]),
      bufCodeSize,
      hexToUint8List(data!.code!),
      bufContentSize,
      hexToUint8List(data!.content!),
      bufSecretSize,
      hexToUint8List(data!.keys!.secret!),
      Uint8List.fromList([data!.keys!.authorizedKeys!.length]),
      authorizedKeysBuffers,
      Uint8List.fromList([data!.ledger!.uco!.transfers!.length]),
      ucoTransfersBuffers,
      Uint8List.fromList([data!.ledger!.nft!.transfers!.length]),
      nftTransfersBuffers,
      Uint8List.fromList([data!.recipients!.length]),
      recipients
    ]);
  }
}
