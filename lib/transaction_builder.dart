// To parse this JSON data, do
//
//     final transactionBuilder = transactionBuilderFromJson(jsonString);

import 'dart:convert';

import 'dart:typed_data';

import 'package:uniris_lib_dart/key_pair.dart';
import 'package:uniris_lib_dart/utils.dart';
import 'package:uniris_lib_dart/crypto.dart' as crypto;

const Map<String, int> txTypes = {
  "identity": 0,
  "keychain": 1,
  "transfer": 2,
  "hosting": 6,
  "code_proposal": 7,
  "code_approval": 8,
  "nft": 9
};

TransactionBuilder transactionBuilderFromJson(String str) =>
    TransactionBuilder.fromJson(json.decode(str));

String transactionBuilderToJson(TransactionBuilder data) =>
    json.encode(data.toJson());

class TransactionBuilder {
  String? type;
  Uint8List? address;
  Uint8List? previousPublicKey;
  Uint8List? previousSignature;
  int? timestamp;
  Uint8List? originSignature;
  Data? data;

  TransactionBuilder.allParams(
      {this.type,
      this.address,
      this.previousPublicKey,
      this.previousSignature,
      this.timestamp,
      this.originSignature,
      this.data});

  TransactionBuilder(String txType) {
    this.type = txType;
    this.data = Data.fromJson({
      'content': new Uint8List(0),
      'code': new Uint8List(0),
      'keys': {'secret': new Uint8List(0), 'authorizedKeys': {}},
      'ledger': {
        'uco': {'transfers': []},
        'nft': {'transfers': []}
      },
      'recipients': []
    });
  }

  factory TransactionBuilder.fromJson(Map<String, dynamic> json) =>
      TransactionBuilder.allParams(
        type: json["type"],
        address: json["address"],
        previousPublicKey: json["previousPublicKey"],
        previousSignature: json["previousSignature"],
        timestamp: json["timestamp"],
        originSignature: json["originSignature"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "address": List<dynamic>.from(address!.map((x) => x)),
        "previousPublicKey":
            List<dynamic>.from(previousPublicKey!.map((x) => x)),
        "previousSignature":
            List<dynamic>.from(previousSignature!.map((x) => x)),
        "timestamp": timestamp,
        "originSignature": List<dynamic>.from(originSignature!.map((x) => x)),
        "data": data!.toJson(),
      };

  /*
   * Add smart contract code to the transaction
   * @param {String} code Smart contract code
   */
  TransactionBuilder setCode(String code) {
    if (!(code is String)) {
      throw "'code' must be a string";
    }
    this.data!.code = Uint8List.fromList(utf8.encode(code));
    return this;
  }

  /*
   * Add a content to the transaction
   * @param {String | Uint8List} content Hosted content
   */
  TransactionBuilder setContent(content) {
    if (!(content is Uint8List) && !(content is String)) {
      throw "'content' must be a string or Uint8List";
    }

    if (content is String) {
      content = Uint8List.fromList(utf8.encode(content));
    }
    this.data!.content = content;
    return this;
  }

  /*
   * Add a secret to the transaction
   * @param {String | Uint8List} secret Secret encrypted (hexadecimal or binary buffer)
   */
  TransactionBuilder setSecret(secret) {
    if (!(secret is Uint8List) && !(secret is String)) {
      throw "'secret' must be a string or Uint8List";
    }

    if (secret is String) {
      if (isHex(secret)) {
        secret = hexToUint8List(secret);
      } else {
        secret = Uint8List.fromList(utf8.encode(secret));
      }
    }
    this.data!.keys!.secret = secret;
    return this;
  }

  /*
   * Add an authorized public key for secret decryption to the transaction with its encrypted secret key
   * @param {String | Uint8List} publicKey Authorized public key (hexadecimal or or binary buffer)
   * @param {String | Uint8List} encryptedSecretKey Encrypted secret key for the given public key (hexadecimal or binary buffer)
   */
  TransactionBuilder addAuthorizedKey(publicKey, encryptedSecretKey) {
    if (!(publicKey is Uint8List) && !(publicKey is String)) {
      throw "'publicKey' must be a string or Uint8List";
    }

    if (!(encryptedSecretKey is Uint8List) && !(encryptedSecretKey is String)) {
      throw "'encryptedSecretKey' must be a string or Uint8List";
    }

    if (publicKey is String) {
      if (isHex(publicKey)) {
        publicKey = hexToUint8List(publicKey);
      } else {
        throw "'publicKey' must be an hexadecimal string";
      }
    }

    if (encryptedSecretKey is String) {
      if (isHex(encryptedSecretKey)) {
        encryptedSecretKey = hexToUint8List(encryptedSecretKey);
      } else {
        throw "'encryptedSecretKey' must be an hexadecimal string";
      }
    }
    this
        .data!
        .keys!
        .authorizedKeys!
        .putIfAbsent(uint8ListToHex(publicKey), () => encryptedSecretKey);

    return this;
  }

  /*
   * Add a UCO transfer to the transaction
   * @param {String | Uint8List} to Address of the recipient (hexadecimal or binary buffer)
   * @param {double} amount Amount of UCO to transfer
   */
  TransactionBuilder addUCOTransfer(to, double amount) {
    if (!(to is Uint8List) && !(to is String)) {
      throw "'to' must be a string or Uint8List";
    }

    if (to is String) {
      if (isHex(to)) {
        to = hexToUint8List(to);
      } else {
        throw "'to' must be an hexadecimal string";
      }
    }
    this.data!.ledger!.uco!.transfers!.add({'to': to, 'amount': amount});
    return this;
  }

  /*
   * Add a NFT transfer to the transaction 
   * @param {String | Uint8List} to Address of the recipient (hexadecimal or binary buffer)
   * @param {double} amount Amount of UCO to transfer
   * @param {String | Uint8List} nftAddress Address of NFT to spend (hexadecimal or binary buffer)
   */
  TransactionBuilder addNFTTransfer(to, double amount, nftAddress) {
    if (!(to is Uint8List) && !(to is String)) {
      throw "'to' must be a string or Uint8List";
    }

    if (to is String) {
      if (isHex(to)) {
        to = hexToUint8List(to);
      } else {
        throw "'to' must be an hexadecimal string";
      }
    }

    if (!(nftAddress is Uint8List) && !(nftAddress is String)) {
      throw "'nftAddress' must be a string or Uint8List";
    }

    if (nftAddress is String) {
      if (isHex(nftAddress)) {
        nftAddress = hexToUint8List(nftAddress);
      } else {
        throw "'nftAddress' must be an hexadecimal string";
      }
    }
    this
        .data!
        .ledger!
        .nft!
        .transfers!
        .add({'to': to, 'amount': amount, 'nftAddress': nftAddress});
    return this;
  }

  /*
   * Add recipient to the transaction
   * @param {String | Uint8List} to Recipient address (hexadecimal or binary buffer) 
   */
  TransactionBuilder addRecipient(to) {
    if (!(to is Uint8List) && !(to is String)) {
      throw "'to' must be a string or Uint8List";
    }

    if (to is String) {
      if (isHex(to)) {
        to = hexToUint8List(to);
      } else {
        throw "'to' must be an hexadecimal string";
      }
    }
    this.data!.recipients = [to];
    return this;
  }

  /*
    * Generate the transaction address, keys and signatures
    * @param {String | Uint8List} seed Transaction chain seed (hexadecimal or binary buffer)
    * @param {Integer} index Number of transaction on the chain
    * @param {String} curve Elliptic curve to use for the key generation
    * @param {String} hashAlgo Hash algorithm to use for the address generation
    */
  TransactionBuilder build(seed, int index,
      {String curve = "ed25519", String hashAlgo = "sha256"}) {
    KeyPair keypair = crypto.deriveKeyPair(seed, index, curve: curve);
    KeyPair nextKeypair = crypto.deriveKeyPair(seed, index + 1, curve: curve);
    Uint8List address = crypto.hash(nextKeypair.publicKey, algo: hashAlgo);

    this.address = address;
    this.previousPublicKey = keypair.publicKey;
    this.timestamp = new DateTime.now().millisecond;
    this.previousSignature =
        crypto.sign(this.previousSignaturePayload(), keypair.privateKey);

    return this;
  }

  /*
     * Sign the transaction with an origin private key
     * @param {String | Uint8List} originPv Origin Private Key (hexadecimal or binary buffer)
     */
  TransactionBuilder originSign(privateKey) {
    if (!(privateKey is Uint8List) && !(privateKey is String)) {
      throw "'privateKey' must be a string or Uint8List";
    }

    if (privateKey is String) {
      if (isHex(privateKey)) {
        privateKey = hexToUint8List(privateKey);
      } else {
        throw "'privateKey' must be an hexadecimal string";
      }
    }

    this.originSignature =
        crypto.sign(this.originSignaturePayload(), privateKey);
    return this;
  }

  /*
   * Generate the payload for the previous signature by encoding address, timestamp, type and data
   */
  Uint8List previousSignaturePayload() {
    Uint8List bufTimestamp = encodeInt32(this.timestamp!);
    Uint8List bufCodeSize = encodeInt32(this.data!.code!.length);
    Uint8List bufContentSize = encodeInt32(this.data!.content!.length);
    Uint8List bufSecretSize = encodeInt32(this.data!.keys!.secret!.length);

    Uint8List? authorizedKeysBuffers;
    this.data!.keys!.authorizedKeys!.forEach((publicKey, authorizedKey) {
      authorizedKeysBuffers = concatUint8List([
        hexToUint8List(publicKey),
        this.data!.keys!.authorizedKeys![publicKey]
      ]);
    });

    Uint8List? ucoTransfersBuffers = concatUint8List([
      this.data!.ledger!.uco!.transfers![0][0],
      encodeFloat64(this.data!.ledger!.uco!.transfers![0][1])
    ]);

    Uint8List? nftTransfersBuffers;
    this.data!.ledger!.nft!.transfers!.map((transfer) {
      nftTransfersBuffers = concatUint8List(
          [transfer.nft, transfer.to, encodeFloat64(transfer.amount)]);
    });

    return concatUint8List([
      this.address!,
      Uint8List.fromList([txTypes[(this.type)]!]),
      bufTimestamp,
      bufCodeSize,
      this.data!.code!,
      bufContentSize,
      this.data!.content!,
      bufSecretSize,
      this.data!.keys!.secret!,
      Uint8List.fromList([this.data!.keys!.authorizedKeys!.length]),
      authorizedKeysBuffers!,
      Uint8List.fromList([this.data!.ledger!.uco!.transfers!.length]),
      ucoTransfersBuffers!,
      Uint8List.fromList([this.data!.ledger!.nft!.transfers!.length]),
      nftTransfersBuffers!,
      Uint8List.fromList([this.data!.recipients!.length]),
      concatUint8List(this.data!.recipients!)
    ]);
  }

  Uint8List originSignaturePayload() {
    var payloadForPreviousSignature = this.previousSignaturePayload();
    return concatUint8List([
      payloadForPreviousSignature,
      this.previousPublicKey!,
      Uint8List.fromList([this.previousSignature!.length]),
      this.previousSignature!,
    ]);
  }
}

class Data {
  Data({
    this.content,
    this.code,
    this.keys,
    this.ledger,
    this.recipients,
  });

  Uint8List? content;
  Uint8List? code;
  Keys? keys;
  Ledger? ledger;
  List<Uint8List>? recipients;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        content: json["content"],
        code: json["code"],
        keys: Keys.fromJson(json["keys"]),
        ledger: Ledger.fromJson(json["ledger"]),
        recipients: List<Uint8List>.from(json["recipients"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "content": List<dynamic>.from(content!.map((x) => x)),
        "code": List<dynamic>.from(code!.map((x) => x)),
        "keys": keys!.toJson(),
        "ledger": ledger!.toJson(),
        "recipients": List<dynamic>.from(recipients!.map((x) => x)),
      };
}

class Keys {
  Keys({
    this.secret,
    this.authorizedKeys,
  });

  Uint8List? secret;
  Map<dynamic, dynamic>? authorizedKeys;

  factory Keys.fromJson(Map<dynamic, dynamic> json) => Keys(
        secret: json["secret"],
        authorizedKeys: Map<dynamic, dynamic>.from(json["authorizedKeys"]
            .map((x, y) => MapEntry<dynamic, dynamic>(x, y))),
      );

  Map<dynamic, dynamic> toJson() => {
        "secret": List<dynamic>.from(secret!.map((x) => x)),
        "authorizedKeys": Map<dynamic, dynamic>.from(
            authorizedKeys!.map((x, y) => MapEntry<dynamic, dynamic>(x, y))),
      };
}

class Ledger {
  Ledger({
    this.uco,
    this.nft,
  });

  Uco? uco;
  Nft? nft;

  factory Ledger.fromJson(Map<String, dynamic> json) => Ledger(
        uco: Uco.fromJson(json["uco"]),
        nft: Nft.fromJson(json["nft"]),
      );

  Map<String, dynamic> toJson() => {
        "uco": uco!.toJson(),
        "nft": nft!.toJson(),
      };
}

class Nft {
  Nft({
    this.transfers,
  });

  List<dynamic>? transfers;

  factory Nft.fromJson(Map<String, dynamic> json) => Nft(
        transfers: List<dynamic>.from(json["transfers"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "transfers": List<dynamic>.from(transfers!.map((x) => x)),
      };
}

class Uco {
  Uco({
    this.transfers,
  });

  List<dynamic>? transfers;

  factory Uco.fromJson(Map<String, dynamic> json) => Uco(
        transfers: List<dynamic>.from(json["transfers"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "transfers": List<dynamic>.from(transfers!.map((x) => x)),
      };
}
