// SPDX-License-Identifier: AGPL-3.0-or-later
import 'dart:convert';
import 'dart:typed_data';

import 'package:archethic_lib_dart/src/model/address.dart';
import 'package:archethic_lib_dart/src/model/authorized_key.dart';
import 'package:archethic_lib_dart/src/model/balance.dart';
import 'package:archethic_lib_dart/src/model/contract.dart';
import 'package:archethic_lib_dart/src/model/cross_validation_stamp.dart';
import 'package:archethic_lib_dart/src/model/crypto/key_pair.dart';
import 'package:archethic_lib_dart/src/model/data.dart';
import 'package:archethic_lib_dart/src/model/ownership.dart';
import 'package:archethic_lib_dart/src/model/recipient.dart';
import 'package:archethic_lib_dart/src/model/token_transfer.dart';
import 'package:archethic_lib_dart/src/model/transaction_input.dart';
import 'package:archethic_lib_dart/src/model/uco_transfer.dart';
import 'package:archethic_lib_dart/src/model/validation_stamp.dart';
import 'package:archethic_lib_dart/src/utils/collection_utils.dart';
import 'package:archethic_lib_dart/src/utils/crypto.dart' as crypto
    show deriveKeyPair, sign, deriveAddress;
import 'package:archethic_lib_dart/src/utils/typed_encoding.dart'
    as typed_encoding;
import 'package:archethic_lib_dart/src/utils/utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'transaction.freezed.dart';
part 'transaction.g.dart';

const int kVersion = 3;

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
  'origin': 2,
  'oracle': 3,
  'oracle_summary': 4,
  'code_proposal': 5,
  'code_approval': 6,
  'node_rewards': 7,
  'mint_rewards': 8,
};

String? addressToJson(Address? address) => address?.address;

Address addressFromJson(String json) => Address(address: json);

/// [Transaction] represents a unitary transaction in the Archethic network.
@freezed
class Transaction with _$Transaction {
  const factory Transaction({
    ///  hash of the new generated public key for the given transaction
    @AddressJsonConverter() Address? address,

    /// [Balance] represents a ledger balance
    Balance? balance,

    /// Length of the chain
    int? chainLength,

    /// Cross validation stamps: endorsements of the validation stamp from the coordinator
    @Default([]) final List<CrossValidationStamp> crossValidationStamps,

    /// Transaction data zone (identity, keychain, smart contract, etc.)
    Data? data,

    /// Represents the inputs from the transaction
    @Default([]) final List<TransactionInput> inputs,

    /// Signature from the device which originated the transaction (used in the Proof of work)
    String? originSignature,

    /// Previous address
    @AddressJsonConverter() Address? previousAddress,

    /// Previous generated public key matching the previous signature
    String? previousPublicKey,

    /// Signature from the previous public key
    String? previousSignature,

    /// Transaction type
    String? type,

    /// Coordinator work result
    ValidationStamp? validationStamp,

    /// Version of the transaction (used for backward compatiblity)
    @Default(kVersion) int version,
  }) = _Transaction;
  const Transaction._();

  factory Transaction.fromJson(Map<String, dynamic> json) =>
      _$TransactionFromJson(json);

  factory Transaction.fromNodeRPC(Map<String, dynamic> json) {
    final data = json['data'] as Map<String, dynamic>?;
    data?.renameKey('actionRecipients', 'recipients');

    return Transaction.fromJson(json);
  }

  /// Convert the transaction in JSON
  String toNodeRPC() {
    if (version <= 3) {
      return jsonEncode(<String, Object?>{
        'version': version,
        'address': address?.address ?? '',
        'type': type,
        'data': {
          'content': data?.content ?? '',
          'code': data?.code ?? '',
          'ownerships': List<dynamic>.from(
            data!.ownerships.map((Ownership x) {
              return <String, Object?>{
                'secret': x.secret ?? '',
                'authorizedKeys': x.authorizedPublicKeys,
              };
            }),
          ),
          'ledger': {
            'uco': {
              'transfers': List<dynamic>.from(
                data!.ledger!.uco!.transfers.map((UCOTransfer x) {
                  return {
                    'to': x.to ?? '',
                    'amount': x.amount ?? 0,
                  };
                }),
              ),
            },
            'token': {
              'transfers': List<dynamic>.from(
                data!.ledger!.token!.transfers.map((TokenTransfer x) {
                  return {
                    'to': x.to ?? '',
                    'amount': x.amount ?? 0,
                    'tokenAddress': x.tokenAddress,
                    'tokenId': x.tokenId,
                  };
                }),
              ),
            },
          },
          'recipients': List<dynamic>.from(
            data!.recipients.map(
              (Recipient x) {
                return {
                  'address': x.address ?? '',
                  'action': x.action,
                  'args': x.args,
                };
              },
            ),
          ),
        },
        'previousPublicKey': previousPublicKey ?? '',
        'previousSignature': previousSignature ?? '',
        'originSignature': originSignature ?? '',
      });
    }

    return jsonEncode(<String, Object?>{
      'version': version,
      'address': address?.address ?? '',
      'type': type,
      'data': {
        'content': data?.content ?? '',
        'contract': data?.contract != null
            ? {
                'bytecode': uint8ListToHex(
                  Uint8List.fromList(data!.contract!.bytecode!),
                ),
                'manifest': data!.contract!.manifest,
              }
            : null,
        'ownerships': List<dynamic>.from(
          data!.ownerships.map((Ownership x) {
            return <String, Object?>{
              'secret': x.secret ?? '',
              'authorizedKeys': x.authorizedPublicKeys,
            };
          }),
        ),
        'ledger': {
          'uco': {
            'transfers': List<dynamic>.from(
              data!.ledger!.uco!.transfers.map((UCOTransfer x) {
                return {
                  'to': x.to ?? '',
                  'amount': x.amount ?? 0,
                };
              }),
            ),
          },
          'token': {
            'transfers': List<dynamic>.from(
              data!.ledger!.token!.transfers.map((TokenTransfer x) {
                return {
                  'to': x.to ?? '',
                  'amount': x.amount ?? 0,
                  'tokenAddress': x.tokenAddress,
                  'tokenId': x.tokenId,
                };
              }),
            ),
          },
        },
        'recipients': List<dynamic>.from(
          data!.recipients.map(
            (Recipient x) {
              return {
                'address': x.address ?? '',
                'action': x.action,
                'args': x.args,
              };
            },
          ),
        ),
      },
      'previousPublicKey': previousPublicKey ?? '',
      'previousSignature': previousSignature ?? '',
      'originSignature': originSignature ?? '',
    });
  }

  /// Generate the transaction address, keys and signatures
  ///
  /// - [seed] : Transaction chain seed (hexadecimal or binary buffer)
  /// - [index] : Number of transaction on the chain
  /// - [curve] : Elliptic curve to use for the key generation
  /// - [hashAlgo] : Hash algorithm to use for the address generation
  ({Transaction transaction, KeyPair keyPair}) build(
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
    return (
      transaction: transactionWithAddressAndPPK.copyWith(
        previousSignature: uint8ListToHex(
          crypto.sign(
            transactionWithAddressAndPPK.previousSignaturePayload(),
            keypair.privateKey,
          ),
        ),
      ),
      keyPair: keypair
    );
  }

  /// Add smart contract code to the transaction
  ///
  /// - [code] : Smart contract code
  Transaction setCode(String code) {
    assert(
      version <= 3,
      'Use with transaction version 3 or use setContract instead with version >= 4',
    );
    return copyWith.data!(
      code: code,
    );
  }

  /// Add smart contract's definition to the transaction
  ///
  /// - [Contract] : Smart contract code
  Transaction setContract(Contract contract) {
    assert(
      version > 3,
      'Use only with transaction version >= 4',
    );
    return copyWith.data!(
      contract: contract,
    );
  }

  /// Add a content to the transaction
  ///
  /// - [content] : Hosted content
  Transaction setContent(String content) {
    return copyWith.data!(
      content: content,
    );
  }

  /// Add an ownership with a secret and its authorized public keys
  ///
  /// - [secret] : Secret encrypted (hexadecimal)
  /// - [authorizedKeys] : List of authorizedKeys
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
  ///
  /// - [to] : Address of the recipient (hexadecimal)
  /// - [amount] : Amount of UCO to transfer
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
  ///
  /// - [to] : Address of the recipient (hexadecimal)
  /// - [amount] : Amount of token to transfer
  /// - [tokenAddress] : Address of token to spend (hexadecimal)
  /// - [tokenId] : ID of the token to use (default to 0)
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
  ///
  /// - [to] : Recipient address (hexadecimal)
  /// - [action] : The named action
  /// - [args] : The arguments list for the named action (can only contain JSON valid data)
  Transaction addRecipient(
    String to, {
    String? action,
    List<Object>? args,
  }) {
    if (!isHex(to)) {
      throw const FormatException("'to' must be an hexadecimal string");
    }

    final newRecipient = data!.recipients.toList()
      ..add(Recipient(address: to, action: action, args: args));
    return copyWith.data!(
      recipients: newRecipient,
    );
  }

  /// Set the transaction builder with Previous Publickey and Previous Signature
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
  Transaction setAddress(Address address) {
    if (!address.isValid()) {
      throw const FormatException(
        "'address' must contain an hexadecimal string",
      );
    }
    return copyWith(address: address);
  }

  /// Set the the transaction with an origin private key
  Transaction setOriginSignature(String originSignature) {
    if (!isHex(originSignature)) {
      throw const FormatException(
        "'originSignature' must be an hexadecimal string",
      );
    }
    return copyWith(originSignature: originSignature);
  }

  /// Sign the transaction with an origin private key
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

    if (data!.recipients.isNotEmpty) {
      for (final recipient in data!.recipients) {
        if (recipient.action == null && recipient.args == null) {
          recipientsBuffers = concatUint8List(<Uint8List>[
            recipientsBuffers,
            // 0 = unnamed action
            Uint8List.fromList([0]),
            hexToUint8List(recipient.address!),
          ]);
        } else {
          final serializedArgs = recipient.args!
              .map((arg) => typed_encoding.serialize(arg))
              .toList();
          recipientsBuffers = concatUint8List(
            <Uint8List>[
              recipientsBuffers,
              // 1 = named action
              Uint8List.fromList([1]),
              hexToUint8List(recipient.address!),
              toByteArray(recipient.action!.length),
              Uint8List.fromList(utf8.encode(recipient.action!)),
              Uint8List.fromList([serializedArgs.length]),
              ...serializedArgs,
            ],
          );
        }
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

    if (version <= 3) {
      final bufCodeSize = toByteArray(data!.code!.length, length: 4);
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
        recipientsBuffers,
      ]);
    }

    var bufContract = toByteArray(0);
    if (data?.contract?.bytecode != null) {
      final contract = data!.contract!;
      bufContract = concatUint8List([
        toByteArray(1),
        toByteArray(contract.bytecode!.length, length: 4),
        contract.bytecode!,
        typed_encoding.serialize(contract.manifest),
      ]);
    }

    return concatUint8List(<Uint8List>[
      toByteArray(kVersion, length: 4),
      Uint8List.fromList(hexToUint8List(address!.address!)),
      Uint8List.fromList(<int>[txTypes[type]!]),
      bufContract,
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
      recipientsBuffers,
    ]);
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
      ' address, balance { token { address, amount }, uco }, chainLength, crossValidationStamps { nodePublicKey, signature }, data { content,  ownerships {  authorizedPublicKeys { encryptedSecretKey, publicKey } secret } ledger { uco { transfers { amount, to } }, token { transfers { amount, to, tokenAddress, tokenId } } } recipients, actionRecipients { action address args } } inputs { amount, from, tokenAddress, spent, tokenId, timestamp, type, }, originSignature, previousAddress, previousPublicKey, previousSignature, type, validationStamp { proofOfIntegrity, proofOfWork, signature, timestamp, ledgerOperations { fee, unspentOutputs { state } } }, version';

  static const String kTransactionInputQueryAllFields =
      'amount, from, tokenAddress, spent, tokenId, timestamp, type';

  static const String kBalanceQueryAllFields =
      ' token { address, amount, tokenId }, uco ';
}
