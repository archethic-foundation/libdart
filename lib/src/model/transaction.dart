/// SPDX-License-Identifier: AGPL-3.0-or-later
import 'dart:convert';
import 'dart:typed_data';
import 'package:archethic_lib_dart/features_flags.dart';
import 'package:archethic_lib_dart/src/model/address.dart';
import 'package:archethic_lib_dart/src/model/authorized_key.dart';
import 'package:archethic_lib_dart/src/model/balance.dart';
import 'package:archethic_lib_dart/src/model/cross_validation_stamp.dart';
import 'package:archethic_lib_dart/src/model/data.dart';
import 'package:archethic_lib_dart/src/model/ownership.dart';
import 'package:archethic_lib_dart/src/model/recipient.dart';
import 'package:archethic_lib_dart/src/model/token_transfer.dart';
import 'package:archethic_lib_dart/src/model/transaction_input.dart';
import 'package:archethic_lib_dart/src/model/uco_transfer.dart';
import 'package:archethic_lib_dart/src/model/validation_stamp.dart';
import 'package:archethic_lib_dart/src/utils/crypto.dart' as crypto
    show deriveKeyPair, sign, deriveAddress;
import 'package:archethic_lib_dart/src/utils/utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hex/hex.dart';

/// [Transaction] represents a unitary transaction in the Archethic network.
part 'transaction.freezed.dart';
part 'transaction.g.dart';

const int cVersion = FeatureFlags.txVersion2 ? 2 : 1;

const Map<String, int> txTypes = <String, int>{
  /// User based transaction types
  'keychain': 255,
  'keychain_access': 254,
  'transfer': 253,
  'hosting': 252,
  'token': 251,
  'data': 250,
  'contract': 249,

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

String? addressToJson(Address? address) => address?.address;

Address addressFromJson(String json) => Address(address: json);

@freezed
class Transaction with _$Transaction {
  const factory Transaction({
    ///  - Address: hash of the new generated public key for the given transaction
    @AddressJsonConverter() Address? address,

    /// - [Balance] represents a ledger balance
    Balance? balance,

    /// - Length of the chain
    int? chainLength,

    /// - Cross validation stamps: endorsements of the validation stamp from the coordinator
    @Default([]) final List<CrossValidationStamp> crossValidationStamps,

    /// - [Data]: transaction data zone (identity, keychain, smart contract, etc.)
    Data? data,

    /// - [TransactionInput] represents the inputs from the transaction
    @Default([]) final List<TransactionInput> inputs,

    /// - Origin signature: signature from the device which originated the transaction (used in the Proof of work)
    String? originSignature,

    /// - Previous address
    @AddressJsonConverter() Address? previousAddress,

    /// - Previous public key: previous generated public key matching the previous signature
    String? previousPublicKey,

    /// - Previous signature: signature from the previous public key
    String? previousSignature,

    /// - Type: transaction type
    String? type,

    /// - [ValidationStamp]: coordinator work result
    ValidationStamp? validationStamp,

    /// - Version: version of the transaction (used for backward compatiblity)
    @Default(cVersion) int version,
  }) = _Transaction;
  const Transaction._();

  factory Transaction.fromJson(Map<String, dynamic> json) =>
      _$TransactionFromJson(json);

  /* @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'address': address!.address,
        'balance': balance!.toJson(),
        'chainLength': chainLength,
        'crossValidationStamps': List<dynamic>.from(
          crossValidationStamps.map((CrossValidationStamp x) => x.toJson()),
        ),
        'data': data!.toJson(),
        'inputs':
            List<dynamic>.from(inputs.map((TransactionInput x) => x.toJson())),
        'originSignature': originSignature,
        'previousPublicKey': previousPublicKey,
        'previousSignature': previousSignature,
        'type': type,
        'validationStamp': validationStamp!.toJson(),
        'version': version,
      };*/

  /// Generate the transaction address, keys and signatures
  /// @param {String} seed Transaction chain seed (hexadecimal or binary buffer)
  /// @param {int} index Number of transaction on the chain
  /// @param {String} curve Elliptic curve to use for the key generation
  /// @param {String} hashAlgo Hash algorithm to use for the address generation
  Transaction build(
    String seed,
    int index, {
    String? curve = 'ed25519',
    String? hashAlgo = 'sha256',
    bool isSeedHexa = true,
  }) {
    final keypair = crypto.deriveKeyPair(
      seed,
      index,
      curve: curve!,
      isSeedHexa: isSeedHexa,
    );
    final transactionWithAddressAndPPK = copyWith(
      address: Address(
        address: crypto.deriveAddress(
          seed,
          index + 1,
          curve: curve,
          hashAlgo: hashAlgo!,
          isSeedHexa: isSeedHexa,
        ),
      ),
      previousPublicKey: uint8ListToHex(
        Uint8List.fromList(
          keypair.publicKey!,
        ),
      ),
    );
    return transactionWithAddressAndPPK.copyWith(
      previousSignature: uint8ListToHex(
        crypto.sign(
          transactionWithAddressAndPPK.previousSignaturePayload(),
          keypair.privateKey,
        ),
      ),
    );
  }

  /// Add smart contract code to the transaction
  /// @param {String} code Smart contract code
  Transaction setCode(String code) {
    return copyWith.data!(
      code: code,
    );
  }

  /// Add a content to the transaction
  /// @param {String} content Hosted content
  Transaction setContent(String content) {
    return copyWith.data!(
      content: content,
    );
  }

  /// Add an ownership with a secret and its authorized public keys
  /// @param {String} secret Secret encrypted (hexadecimal)
  /// @param {List<AuthorizedKey>} authorizedKeys
  Transaction addOwnership(String secret, List<AuthorizedKey> authorizedKeys) {
    if (!isHex(secret)) {
      throw const FormatException("'Secret' must be an hexadecimal string");
    }

    for (final authorizedKey in authorizedKeys) {
      if (!isHex(authorizedKey.publicKey!)) {
        throw const FormatException(
          "'Authorized public key' must be an hexadecimal string",
        );
      }

      if (!isHex(authorizedKey.encryptedSecretKey!)) {
        throw const FormatException(
          "'Encrypted secret' must be an hexadecimal string",
        );
      }
    }

    final newAuthorizedPublicKeys = <AuthorizedKey>[];
    for (final element in authorizedKeys) {
      if (element.publicKey != null) {
        newAuthorizedPublicKeys.add(
          AuthorizedKey(
            encryptedSecretKey: element.encryptedSecretKey,
            publicKey: element.publicKey!.toUpperCase(),
          ),
        );
      }
    }

    final newOwnership = data!.ownerships
      ..add(
        Ownership(
          secret: secret,
          authorizedPublicKeys: newAuthorizedPublicKeys,
        ),
      );

    return copyWith.data!(
      ownerships: newOwnership,
    );
  }

  /// Add a UCO transfer to the transaction
  /// @param {String} to Address of the recipient (hexadecimal)
  /// @param {int} amount Amount of UCO to transfer
  Transaction addUCOTransfer(String to, int amount) {
    if (!isHex(to)) {
      throw const FormatException("'to' must be an hexadecimal string");
    }

    final newUCOTransfer = data!.ledger!.uco!.transfers
      ..add(UCOTransfer(to: to, amount: amount));
    return copyWith.data!.ledger!.uco!(
      transfers: newUCOTransfer,
    );
  }

  /// Add a token transfer to the transaction
  /// @param {String} to Address of the recipient (hexadecimal)
  /// @param {int} amount Amount of token to transfer
  /// @param {String} tokenAddress Address of token to spend (hexadecimal)
  /// @param {int} tokenId ID of the token to use (default to 0)
  Transaction addTokenTransfer(
    String to,
    int amount,
    String tokenAddress, {
    int tokenId = 0,
  }) {
    if (!isHex(to)) {
      throw const FormatException("'to' must be an hexadecimal string");
    }

    if (!isHex(tokenAddress)) {
      throw const FormatException(
        "'tokenAddress' must be an hexadecimal string",
      );
    }

    if (tokenId.isNaN && tokenId < 0) {
      throw Exception("'tokenId' must be a valid integer >= 0");
    }

    final tokenTransfer = TokenTransfer(
      amount: amount,
      tokenAddress: tokenAddress,
      to: to,
      tokenId: tokenId,
    );

    final newTokenTransfer = data!.ledger!.token!.transfers..add(tokenTransfer);
    return copyWith.data!.ledger!.token!(
      transfers: newTokenTransfer,
    );
  }

  /// Add recipient to the transaction (with a named action)
  /// @param {String} to Recipient address (hexadecimal)
  /// @param {string} action The named action
  /// @param {List<Object>} args The arguments list for the named action (can only contain JSON valid data)
  Transaction addRecipient(
    String to, {
    String? action,
    List<Object>? args,
  }) {
    if (!isHex(to)) {
      throw const FormatException("'to' must be an hexadecimal string");
    }

    final newRecipient = data!.recipients
      ..add(Recipient(address: to, action: action, args: args));
    return copyWith.data!(
      recipients: newRecipient,
    );
  }

  /// Set the transaction builder with Previous Publickey and Previous Signature
  /// @param {String} to Previous Signature (hexadecimal)
  /// @param {String} to Previous PublicKey (hexadecimal)
  Transaction setPreviousSignatureAndPreviousPublicKey(
    String prevSign,
    String prevPubKey,
  ) {
    if (!isHex(prevSign)) {
      throw const FormatException("'prevSign' must be an hexadecimal string");
    }

    if (!isHex(prevPubKey)) {
      throw const FormatException("'prevPubKey' must be an hexadecimal string");
    }
    return copyWith(previousSignature: prevSign, previousPublicKey: prevPubKey);
  }

  /// Set the transaction builder with address (required for originSign)
  /// @param {Address} to Address
  Transaction setAddress(Address address) {
    if (!address.isValid()) {
      throw const FormatException(
        "'address' must contain an hexadecimal string",
      );
    }
    return copyWith(address: address);
  }

  /// Set the the transaction with an origin private key
  /// @param {String} to originSignature
  Transaction setOriginSignature(String originSignature) {
    if (!isHex(originSignature)) {
      throw const FormatException(
        "'originSignature' must be an hexadecimal string",
      );
    }
    return copyWith(originSignature: originSignature);
  }

  /// Sign the transaction with an origin private key
  /// @param {String} originPv Origin Private Key (hexadecimal)
  Transaction originSign(String privateKey) {
    if (!isHex(privateKey)) {
      throw const FormatException("'privateKey' must be an hexadecimal string");
    }
    return copyWith(
      originSignature:
          uint8ListToHex(crypto.sign(originSignaturePayload(), privateKey)),
    );
  }

  Uint8List originSignaturePayload() {
    final payloadForPreviousSignature = previousSignaturePayload();
    return concatUint8List(<Uint8List>[
      payloadForPreviousSignature,
      Uint8List.fromList(hexToUint8List(previousPublicKey!)),
      Uint8List.fromList(
        <int>[Uint8List.fromList(hexToUint8List(previousSignature!)).length],
      ),
      Uint8List.fromList(hexToUint8List(previousSignature!)),
    ]);
  }

  /// Generate the payload for the previous signature by encoding address, type and data
  Uint8List previousSignaturePayload() {
    final bufCodeSize = toByteArray(data!.code!.length, length: 4);
    // ignore: prefer_final_locals
    var contentSize = utf8.encode(data!.content!).length;
    final bufContentSize = toByteArray(contentSize, length: 4);

    var ownershipsBuffers = Uint8List(0);
    for (final ownership in data!.ownerships) {
      final bufAuthKeyLength = Uint8List.fromList(
        toByteArray(ownership.authorizedPublicKeys.length),
      );

      final authorizedKeysBuffer = <Uint8List>[
        Uint8List.fromList(<int>[bufAuthKeyLength.length]),
        bufAuthKeyLength,
      ];

      final newAuthorizedPublicKeys = <AuthorizedKey>[];
      for (final element in ownership.authorizedPublicKeys) {
        if (element.publicKey != null) {
          newAuthorizedPublicKeys.add(
            AuthorizedKey(
              encryptedSecretKey: element.encryptedSecretKey,
              publicKey: element.publicKey!.toUpperCase(),
            ),
          );
        }
      }

      newAuthorizedPublicKeys.sort(
        (AuthorizedKey a, AuthorizedKey b) =>
            a.publicKey!.compareTo(b.publicKey!),
      );

      for (final authorizedKey in newAuthorizedPublicKeys) {
        authorizedKeysBuffer
            .add(Uint8List.fromList(hexToUint8List(authorizedKey.publicKey!)));
        authorizedKeysBuffer.add(
          Uint8List.fromList(
            hexToUint8List(authorizedKey.encryptedSecretKey!),
          ),
        );
      }

      ownershipsBuffers = concatUint8List(<Uint8List>[
        ownershipsBuffers,
        toByteArray(
          Uint8List.fromList(hexToUint8List(ownership.secret!)).lengthInBytes,
          length: 4,
        ),
        Uint8List.fromList(hexToUint8List(ownership.secret!)),
        concatUint8List(authorizedKeysBuffer),
      ]);
    }

    var ucoTransfersBuffers = Uint8List(0);
    if (data!.ledger!.uco!.transfers.isNotEmpty) {
      for (final ucoTransfer in data!.ledger!.uco!.transfers) {
        ucoTransfersBuffers = concatUint8List(<Uint8List>[
          ucoTransfersBuffers,
          Uint8List.fromList(hexToUint8List(ucoTransfer.to!)),
          toByteArray(ucoTransfer.amount!, length: 8),
        ]);
      }
    }

    var tokenTransfersBuffers = Uint8List(0);
    if (data!.ledger!.token!.transfers.isNotEmpty) {
      for (final tokenTransfer in data!.ledger!.token!.transfers) {
        final bufTokenId =
            Uint8List.fromList(toByteArray(tokenTransfer.tokenId!));

        tokenTransfersBuffers = concatUint8List(<Uint8List>[
          tokenTransfersBuffers,
          Uint8List.fromList(hexToUint8List(tokenTransfer.tokenAddress!)),
          Uint8List.fromList(hexToUint8List(tokenTransfer.to!)),
          toByteArray(tokenTransfer.amount!, length: 8),
          Uint8List.fromList(<int>[bufTokenId.length]),
          bufTokenId,
        ]);
      }
    }

    var recipientsBuffers = Uint8List(0);
    var recipients = Uint8List(0);
    if (FeatureFlags.txVersion2) {
      if (data!.recipients.isNotEmpty) {
        for (final recipient in data!.recipients) {
          if (recipient.action == null && recipient.args == null) {
            recipientsBuffers = concatUint8List(<Uint8List>[
              recipientsBuffers,
              // 0 = unnamed action
              Uint8List.fromList([0]),
              Uint8List.fromList(hexToUint8List(recipient.address!)),
            ]);
          } else {
            final jsonArgs = jsonEncode(recipient.args);
            final bufJsonLength = toByteArray(jsonArgs.length);

            recipientsBuffers = concatUint8List(<Uint8List>[
              recipientsBuffers,
              // 1 = named action
              Uint8List.fromList([1]),
              Uint8List.fromList(hexToUint8List(recipient.address!)),
              Uint8List.fromList(toByteArray(recipient.action!.length)),
              Uint8List.fromList(utf8.encode(recipient.action!)),
              Uint8List.fromList([bufJsonLength.length]),
              bufJsonLength,
              Uint8List.fromList(utf8.encode(jsonArgs)),
            ]);
          }
        }
      }
    } else {
      for (final recipient in data!.recipients) {
        recipients = concatUint8List(<Uint8List>[
          recipients,
          Uint8List.fromList(hexToUint8List(recipient.address!)),
        ]);
      }
    }

    final bufOwnershipLength =
        Uint8List.fromList(toByteArray(data!.ownerships.length));
    final bufUCOTransferLength =
        Uint8List.fromList(toByteArray(data!.ledger!.uco!.transfers.length));
    final bufTokenTransferLength =
        Uint8List.fromList(toByteArray(data!.ledger!.token!.transfers.length));
    final bufRecipientLength =
        Uint8List.fromList(toByteArray(data!.recipients.length));

    return concatUint8List(<Uint8List>[
      toByteArray(version, length: 4),
      Uint8List.fromList(hexToUint8List(address!.address!)),
      Uint8List.fromList(<int>[txTypes[type]!]),
      bufCodeSize,
      Uint8List.fromList(utf8.encode(data!.code!)),
      bufContentSize,
      Uint8List.fromList(utf8.encode(data!.content!)),
      Uint8List.fromList(<int>[bufOwnershipLength.length]),
      bufOwnershipLength,
      ownershipsBuffers,
      Uint8List.fromList(<int>[bufUCOTransferLength.length]),
      bufUCOTransferLength,
      ucoTransfersBuffers,
      Uint8List.fromList(<int>[bufTokenTransferLength.length]),
      bufTokenTransferLength,
      tokenTransfersBuffers,
      Uint8List.fromList(<int>[bufRecipientLength.length]),
      bufRecipientLength,
      if (FeatureFlags.txVersion2) recipientsBuffers else recipients,
    ]);
  }

  /// Convert the transaction in JSON
  String convertToJSON() {
    final json = jsonEncode(<String, Object?>{
      'version': version,
      'address': address == null ? '' : address!.address,
      'type': type,
      'data': {
        'content': HEX.encode(Uint16List.fromList(utf8.encode(data!.content!))),
        'code': data == null || data!.code == null ? '' : data!.code!,
        'ownerships': List<dynamic>.from(
          data!.ownerships.map((Ownership x) {
            return <String, Object?>{
              'secret': x.secret == null ? '' : x.secret!,
              'authorizedKeys': x.authorizedPublicKeys,
            };
          }),
        ),
        'ledger': {
          'uco': {
            'transfers': List<dynamic>.from(
              data!.ledger!.uco!.transfers.map((UCOTransfer x) {
                return {
                  'to': x.to == null ? '' : x.to!,
                  'amount': x.amount == null ? 0 : x.amount!,
                };
              }),
            ),
          },
          'token': {
            'transfers': List<dynamic>.from(
              data!.ledger!.token!.transfers.map((TokenTransfer x) {
                return {
                  'to': x.to == null ? '' : x.to!,
                  'amount': x.amount == null ? 0 : x.amount!,
                  'tokenAddress': x.tokenAddress,
                  'tokenId': x.tokenId,
                };
              }),
            ),
          },
        },
        'recipients': FeatureFlags.txVersion2
            ? List<dynamic>.from(
                data!.recipients.map(
                  (Recipient x) {
                    return {
                      'address': x.address == null ? '' : x.address!,
                      'action': x.action == null ? '' : x.action!,
                      'args': x.args == null ? '' : x.args!,
                    };
                  },
                ),
              )
            : List<dynamic>.from(
                data!.recipients.map(
                  (Recipient x) {
                    return x.address!;
                  },
                ),
              ),
      },
      'previousPublicKey': previousPublicKey == null ? '' : previousPublicKey!,
      'previousSignature': previousSignature == null ? '' : previousSignature!,
      'originSignature': originSignature == null ? '' : originSignature!,
    });
    return json;
  }

  static Data initData() {
    return Data.fromJson(<String, dynamic>{
      'content': '',
      'code': '',
      'ownerships': <Map<String, dynamic>>[],
      'ledger': {
        'uco': {'transfers': []},
        'token': {'transfers': []},
      },
      'recipients': [],
    });
  }

  static const String kTransactionQueryAllFields =
      ' address, balance { token { address, amount }, uco }, chainLength, crossValidationStamps { nodePublicKey, signature }, data { content,  ownerships {  authorizedPublicKeys { encryptedSecretKey, publicKey } secret } ledger { uco { transfers { amount, to } }, token { transfers { amount, to, tokenAddress, tokenId } } } recipients } inputs { amount, from, tokenAddress, spent, timestamp, type, }, originSignature, previousAddress, previousPublicKey, previousSignature, type, validationStamp { proofOfIntegrity, proofOfWork, signature, timestamp, ledgerOperations { fee } }, version';

  static const String kTransactionInputQueryAllFields =
      'amount, from, tokenAddress, spent, timestamp, type';

  static const String kBalanceQueryAllFields =
      ' token { address, amount, tokenId }, uco ';
}
