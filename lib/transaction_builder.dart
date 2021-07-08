// To parse this JSON data, do
//
//     final transactionBuilder = transactionBuilderFromJson(jsonString);

/*  Represent a transaction in pending validation
  - Address: hash of the new generated public key for the given transaction
  - Type: transaction type
  - Data: transaction data zone (identity, keychain, smart contract, etc.)
  - Previous signature: signature from the previous public key
  - Previous public key: previous generated public key matching the previous signature
  - Origin signature: signature from the device which originated the transaction (used in the Proof of work)
  - Version: version of the transaction (used for backward compatiblity)

  When the transaction is validated the following fields are filled:
  - Validation stamp: coordinator work result
  - Cross validation stamps: endorsements of the validation stamp from the coordinator
*/

// Dart imports:
import 'dart:convert' show json, utf8, jsonEncode;
import 'dart:typed_data' show Uint8List;

// Project imports:
import 'package:archethic_lib_dart/crypto.dart' as crypto;
import 'package:archethic_lib_dart/model/key_pair.dart';
import 'package:archethic_lib_dart/utils.dart';

const int cVersion = 1;

const Map<String, int> txTypes = {
  // User based transaction types
  'keychain_access': 254,
  'keychain': 255,
  'transfer': 253,
  'hosting': 252,
  'nft': 251,
  //Network based transaction types
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

TransactionBuilder transactionBuilderFromJson(String str) =>
    TransactionBuilder.fromJson(json.decode(str));

String transactionBuilderToJson(TransactionBuilder data) =>
    json.encode(data.toJson());

class TransactionBuilder {
  TransactionBuilder(String txType) {
    if (!txTypes.containsKey(txType)) {
      throw 'Transaction type must be \'transfer\', \'hosting\', \'keychain_access\', \'keychain\',  \'nft\', \'code_proposal\', \'code_approval\'';
    }

    type = txType;
    version = cVersion;
    data = Data.fromJson({
      'content': Uint8List(0),
      'code': Uint8List(0),
      'keys': {'secret': Uint8List(0), 'authorizedKeys': {}},
      'ledger': {
        'uco': {'transfers': []},
        'nft': {'transfers': []}
      },
      'recipients': []
    });
  }

  factory TransactionBuilder.fromJson(Map<String, dynamic> json) =>
      TransactionBuilder.allParams(
          type: json['type'],
          address: json['address'],
          previousPublicKey: json['previousPublicKey'],
          previousSignature: json['previousSignature'],
          originSignature: json['originSignature'],
          data: Data.fromJson(json['data']),
          validationStamp: json['validationStamp'],
          version: json['version']);

  TransactionBuilder.allParams(
      {this.type,
      this.address,
      this.previousPublicKey,
      this.previousSignature,
      this.originSignature,
      this.data,
      this.validationStamp,
      this.version});

  String? type;
  int? version;
  Uint8List? address;
  Uint8List? previousPublicKey;
  Uint8List? previousSignature;
  Uint8List? originSignature;
  int? validationStamp;
  Data? data;

  Map<String, dynamic> toJson() => {
        'type': type,
        'address': List<dynamic>.from(address!.map((x) => x)),
        'previousPublicKey':
            List<dynamic>.from(previousPublicKey!.map((x) => x)),
        'previousSignature':
            List<dynamic>.from(previousSignature!.map((x) => x)),
        'validationStamp': validationStamp,
        'originSignature': List<dynamic>.from(originSignature!.map((x) => x)),
        'data': data!.toJson()
      };

  /*
   * Add smart contract code to the transaction
   * @param {String} code Smart contract code
   */
  TransactionBuilder setCode(String code) {
    if (!(code is String)) {
      throw "'code' must be a string";
    }
    data!.code = Uint8List.fromList(utf8.encode(code));
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
    data!.content = content;
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
    data!.keys!.secret = secret;
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
    data!.keys!.authorizedKeys!
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
    final UcoTransfer ucoTransfer = UcoTransfer();
    ucoTransfer.to = to;
    ucoTransfer.amount = amount;
    data!.ledger!.uco!.transfers!.add(ucoTransfer);
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
    final NftTransfer nftTransfer = NftTransfer();
    nftTransfer.to = to;
    nftTransfer.amount = amount;
    nftTransfer.nft = nftAddress;
    data!.ledger!.nft!.transfers!.add(nftTransfer);
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
    data!.recipients!.add(to);
    return this;
  }

  /*
    * Generate the transaction address, keys and signatures
    * @param {String | Uint8List} seed Transaction chain seed (hexadecimal or binary buffer)
    * @param {Integer} index Number of transaction on the chain
    * @param {String} curve Elliptic curve to use for the key generation
    * @param {String} hashAlgo Hash algorithm to use for the address generation
    */
  TransactionBuilder build(seed, int index, String curve,
      {String hashAlgo = 'sha256'}) {
    final KeyPair keypair = crypto.deriveKeyPair(seed, index, curve: curve);
    final KeyPair nextKeypair =
        crypto.deriveKeyPair(seed, index + 1, curve: curve);
    final Uint8List address =
        crypto.hash(nextKeypair.publicKey, algo: hashAlgo);

    this.address = address;
    previousPublicKey = keypair.publicKey;
    validationStamp = DateTime.now().millisecondsSinceEpoch;
    previousSignature =
        crypto.sign(previousSignaturePayload(), keypair.privateKey);

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

    originSignature = crypto.sign(originSignaturePayload(), privateKey);
    return this;
  }

  /*
   * Generate the payload for the previous signature by encoding address, type and data
   */
  Uint8List previousSignaturePayload() {
    final Uint8List bufCodeSize = encodeInt32(data!.code!.length);
    int contentSize = data!.content!.length;
    if(data!.content! is Uint8List)
    {
      contentSize = data!.content!.lengthInBytes;
    }
    final Uint8List bufContentSize = encodeInt32(contentSize);
    final Uint8List bufSecretSize = encodeInt32(data!.keys!.secret!.length);

    Uint8List? authorizedKeysBuffers = Uint8List(0);
    data!.keys!.authorizedKeys!.forEach((publicKey, authorizedKey) {
      authorizedKeysBuffers = concatUint8List(
          [hexToUint8List(publicKey), data!.keys!.authorizedKeys![publicKey]]);
    });

    Uint8List? ucoTransfersBuffers = Uint8List(0);
    if (data!.ledger!.uco!.transfers!.isNotEmpty) {
      ucoTransfersBuffers = concatUint8List([
        data!.ledger!.uco!.transfers![0].to!,
        encodeFloat64(data!.ledger!.uco!.transfers![0].amount!)
      ]);
    }

    Uint8List? nftTransfersBuffers = Uint8List(0);
    if (data!.ledger!.nft!.transfers!.isNotEmpty) {
      nftTransfersBuffers = concatUint8List([
        data!.ledger!.nft!.transfers![0].nft!,
        data!.ledger!.nft!.transfers![0].to!,
        encodeFloat64(data!.ledger!.nft!.transfers![0].amount!)
      ]);
    }

    return concatUint8List([
      encodeInt32(version!),
      address!,
      Uint8List.fromList([txTypes[type]!]),
      bufCodeSize,
      data!.code!,
      bufContentSize,
      data!.content!,
      bufSecretSize,
      data!.keys!.secret!,
      Uint8List.fromList([data!.keys!.authorizedKeys!.length]),
      authorizedKeysBuffers!,
      Uint8List.fromList([data!.ledger!.uco!.transfers!.length]),
      ucoTransfersBuffers,
      Uint8List.fromList([data!.ledger!.nft!.transfers!.length]),
      nftTransfersBuffers,
      Uint8List.fromList([data!.recipients!.length]),
      concatUint8List(data!.recipients!)
    ]);
  }

  Uint8List originSignaturePayload() {
    final Uint8List payloadForPreviousSignature = previousSignaturePayload();
    return concatUint8List([
      payloadForPreviousSignature,
      previousPublicKey!,
      Uint8List.fromList([previousSignature!.length]),
      previousSignature!,
    ]);
  }

  /*
  * Convert the transaction in JSON
  */
  toJSON() {
    final String _json = jsonEncode({
      'address': uint8ListToHex(address!),
      'type': type,
      'data': {
        'content': uint8ListToHex(data!.content!),
        'code': utf8.decode(data!.code!),
        'keys': {
          'secret': uint8ListToHex(data!.keys!.secret!),
          'authorizedKeys': hexAuthorizedKeys(data!.keys!.authorizedKeys!)
        },
        'ledger': {
          'uco': {
            'transfers':
                List<dynamic>.from(data!.ledger!.uco!.transfers!.map((x) {
              return {
                'to': uint8ListToHex(x.to!),
                'amount': x.amount,
              };
            }))
          },
          'nft': {
            'transfers':
                List<dynamic>.from(data!.ledger!.nft!.transfers!.map((x) {
              return {
                'to': uint8ListToHex(x.to!),
                'amount': x.amount,
                'nft': uint8ListToHex(x.nft!)
              };
            }))
          },
        },
        'recipients': List<dynamic>.from(data!.recipients!.map((x) => x)),
      },
      'previousPublicKey': uint8ListToHex(previousPublicKey!),
      'previousSignature': uint8ListToHex(previousSignature!),
      'originSignature': originSignature == null
          ? originSignature
          : uint8ListToHex(originSignature!)
    });
    return _json;
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

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        content: json['content'],
        code: json['code'],
        keys: Keys.fromJson(json['keys']),
        ledger: Ledger.fromJson(json['ledger']),
        recipients: List<Uint8List>.from(json['recipients'].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        'content': List<dynamic>.from(content!.map((x) => x)),
        'code': List<dynamic>.from(code!.map((x) => x)),
        'keys': keys!.toJson(),
        'ledger': ledger!.toJson(),
        'recipients': List<dynamic>.from(recipients!.map((x) => x)),
      };

  Uint8List? content;
  Uint8List? code;
  Keys? keys;
  Ledger? ledger;
  List<Uint8List>? recipients;
}

class Keys {
  Keys({
    this.secret,
    this.authorizedKeys,
  });

  factory Keys.fromJson(Map<dynamic, dynamic> json) => Keys(
        secret: json['secret'],
        authorizedKeys: Map<dynamic, dynamic>.from(json['authorizedKeys']
            .map((x, y) => MapEntry<dynamic, dynamic>(x, y))),
      );

  Map<dynamic, dynamic> toJson() => {
        'secret': List<dynamic>.from(secret!.map((x) => x)),
        'authorizedKeys': Map<dynamic, dynamic>.from(
            authorizedKeys!.map((x, y) => MapEntry<dynamic, dynamic>(x, y))),
      };

  Uint8List? secret;
  Map<dynamic, dynamic>? authorizedKeys;
}

class Ledger {
  Ledger({
    this.uco,
    this.nft,
  });

  factory Ledger.fromJson(Map<String, dynamic> json) => Ledger(
        uco: Uco.fromJson(json['uco']),
        nft: Nft.fromJson(json['nft']),
      );

  Map<String, dynamic> toJson() => {
        'uco': uco!.toJson(),
        'nft': nft!.toJson(),
      };

  Uco? uco;
  Nft? nft;
}

class Nft {
  Nft({
    this.transfers,
  });

  factory Nft.fromJson(Map<String, dynamic> json) => Nft(
        transfers: List<NftTransfer>.from(
            json['transfers'].map((x) => NftTransfer.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        'transfers': List<dynamic>.from(transfers!.map((x) => x.toJson())),
      };

  List<NftTransfer>? transfers;
}

class NftTransfer {
  NftTransfer({
    this.to,
    this.amount,
    this.nft,
  });

  factory NftTransfer.fromJson(Map<String, dynamic> json) => NftTransfer(
        to: json['to'],
        amount: json['amount'].toDouble(),
        nft: json['nft'],
      );

  Map<String, dynamic> toJson() => {
        'to': to,
        'amount': amount,
        'nft': nft,
      };

  Uint8List? to;
  double? amount;
  Uint8List? nft;
}

class Uco {
  Uco({
    this.transfers,
  });

  factory Uco.fromJson(Map<String, dynamic> json) => Uco(
        transfers: List<UcoTransfer>.from(
            json['transfers'].map((x) => UcoTransfer.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        'transfers': List<dynamic>.from(transfers!.map((x) => x.toJson())),
      };

  List<UcoTransfer>? transfers;
}

class UcoTransfer {
  UcoTransfer({
    this.to,
    this.amount,
  });

  factory UcoTransfer.fromJson(Map<String, dynamic> json) => UcoTransfer(
        to: json['to'],
        amount: json['amount'].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        'to': to,
        'amount': amount,
      };

  Uint8List? to;
  double? amount;
}

Map<dynamic, dynamic> hexAuthorizedKeys(Map<dynamic, dynamic> authorizedKeys) {
  final Map<dynamic, dynamic> authorizedKeysHex = {};
  for (String publicKey in authorizedKeys.keys) {
    authorizedKeysHex.putIfAbsent(
        publicKey, () => uint8ListToHex(authorizedKeys[publicKey]));
  }

  return authorizedKeysHex;
}
