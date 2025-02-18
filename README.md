[![CI](https://github.com/archethic-foundation/libdart/actions/workflows/test.yaml/badge.svg)](https://github.com/archethic-foundation/libdart/actions/workflows/test.yaml) [![Pub](https://img.shields.io/pub/v/archethic_lib_dart.svg)](https://pub.dartlang.org/packages/archethic_lib_dart) [![Platform](https://img.shields.io/badge/Platform-Flutter-02569B?logo=flutter)](https://flutter.dev) [![CodeFactor](https://www.codefactor.io/repository/github/archethic-foundation/libdart/badge)](https://www.codefactor.io/repository/github/archethic-foundation/libdart)

# Archethic's lib_dart

Archethic dart library for Flutter

## Usage

This library aims to provide a easy way to create Archethic transaction and to send them over the network.

It supports the Archethic Cryptography rules which are:

- Algorithm identification: keys are prepared by metadata bytes to indicate the curve used and the origin of the generation, and hashes are prepended by a byte to indicate the hash algorithm used. 
  Those information help during the verification
  
  ```

      Ed25519   Software Origin   Public key
        |          |              |
        |  |-------|              |
        |  |   |------------------|        
        |  |   |     
      <<0, 0, 106, 58, 193, 73, 144, 121, 104, 101, 53, 140, 125, 240, 52, 222, 35, 181,
      13, 81, 241, 114, 227, 205, 51, 167, 139, 100, 176, 111, 68, 234, 206, 72>>

       NIST P-256  Software Origin   Public key
        |            |              |
        |  |---------|              |
        |  |  |----------------------
        |  |  |    
      <<1, 0, 4, 7, 161, 46, 148, 183, 43, 175, 150, 13, 39, 6, 158, 100, 2, 46, 167,
       101, 222, 82, 108, 56, 71, 28, 192, 188, 104, 154, 182, 87, 11, 218, 58, 107,
      222, 154, 48, 222, 193, 176, 88, 174, 1, 6, 154, 72, 28, 217, 222, 147, 106,
      73, 150, 128, 209, 93, 99, 115, 17, 39, 96, 47, 203, 104, 34>>
  ```
  
- Key derivation:
  
    To be able to retrieve previous public key, the Archethic network designs the key derivation through a seed (passphrase) and an index(number of
     previous public keys/transactions).
    The procedure is described as follows:
    
    ```
    The seed generates a master key and an entropy used in the child keys generation.

                                                               / (256 bytes) Next private key
                          (256 bytes) Master key  --> HMAC-512
                        /                              Key: Master entropy,
      seed --> HMAC-512                                Data: Master key + index)
                        \
                         (256 bytes) Master entropy

    ```  
## API

  <details>
  <summary>Cryptographic functions</summary>
  <br/>

  #### deriveKeyPair(seed, index, curve, isSeedHexa)
  It creates a new keypair into hexadecimal format

  - `seed` is hexadecimal encoding or Uint8Array representing the transaction chain seed to be able to derive and generate the keys
  - `index` is the number of transactions in the chain, to generate the actual and the next public key (see below the cryptography section)
  - `curve` is the elliptic curve to use for the key generation (can be "ed25519", "P256", "secp256k1") - default to: "ed25519"
  - `isSeedHexa` is a parameter used to specify whether the information is in hexadecimal format or not (and thus avoid conversion issues).
  - `originId` is the origin of the public key (can be 0 for "on chain wallet", 1 for "software" or 2 for "tpm") - default to: 1
  
  ```dart
  import 'package:archethic_lib_dart/archethic_lib_dart.dart';
  
  KeyPair keypair = crypto.deriveKeyPair('mysuperpassphraseorseed', 0, isSeedHexa: false);
  // uint8ListToHex(keypair.publicKey) => 0100048cac473e46edd109c3ef59eec22b9ece9f99a2d0dce1c4ccb31ce0bacec4a9ad246744889fb7c98ea75c0f0ecd60002c07fae92f23382669ca9aff1339f44216
  ```

  #### deriveAddress(seed, index, curve, hashAlgo, isSeedHexa)
  It creates a transaction address by extract the public key from the key derivation and hash it into a hexadecimal format

   - `seed` is hexadecimal encoding or Uint8Array representing the transaction chain seed to be able to derive and generate the keys
   - `index` is the number of transactions in the chain, to generate the actual and the next public key (see below the cryptography section)
   - `curve` is the elliptic curve to use for the key generation (can be "ed25519", "P256", "secp256k1") - Default to "ed25519"
   - `hashAlgo` is the hash algorithm to create the address (can be "sha256", "sha512", "sha3-256", "sha3-512", "blake2b") - default to "sha256"
   - `isSeedHexa` is a parameter used to specify whether the information is in hexadecimal format or not (and thus avoid conversion issues).
    

   ```dart
   import 'package:archethic_lib_dart/archethic_lib_dart.dart';

   String address = crypto.deriveAddress("mysuperpassphraseorseed", 0);
   // Address: 00004195d45987f33e5dcb71edfa63438d5e6add655b216acfdd31945d58210fe5d2
   ```

  #### ecEncrypt(data, publicKey, isDataHexa, isPublicKeyHexa)
  Perform an ECIES encryption using a public key and a data
  
  - `data` Data to encrypt
  - `publicKey` Public key to derive a shared secret and for whom the content must be encrypted
  - `isDataHexa` is a parameter used to specify whether the information is in hexadecimal format or not (and thus avoid conversion issues).
  - `isPublicKeyHexa` is a parameter used to specify whether the information is in hexadecimal format or not (and thus avoid conversion issues).
  
  ```dart
  import 'package:archethic_lib_dart/archethic_lib_dart.dart';

  Uint8List cipher = crypto.ecEncrypt('dataToEncrypt' '00b1d3750edb9381c96b1a975a55b5b4e4fb37bfab104c10b0b6c9a00433ec4646');
  ```

  #### aesEncrypt(data, publicKey, isDataHexa, isKeyHexa)
  Perform an AES encryption using a key and a data

  - `data` Data to encrypt
  - `key` Symmetric key
  - `isDataHexa` is a parameter used to specify whether the information is in hexadecimal format or not (and thus avoid conversion issues).
  - `isKeyHexa` is a parameter used to specify whether the information is in hexadecimal format or not (and thus avoid conversion issues).

  ```dart
  import 'package:archethic_lib_dart/archethic_lib_dart.dart';

  Uint8List cipher = crypto.aesEncrypt('dataToEncrypt' '0000b1d3750edb9381c96b1a975a55b5b4e4fb37bfab104c10b0b6c9a00433ec4646');
  ```

  </details>
   <br/>
   <details>
   <summary>Transaction building</summary>
   <br/>
  
  `new Transaction(type)` creates a new instance of the transaction
  
  `type` is the string defining the type of transaction to generate ("keychain", "keychain_access", "transfer", "hosting", "code_proposal", "code_approval", "token", "contract", "data")
  
  The transaction instance contains the following methods:
  
  #### setCode(code) (before transaction version 4)
  Add the code in the `data.code` section of the transaction
  `code` is a string defining the smart contract
  This method is available for transaction version <= 3
  
  #### setContract(contract) (after transaction version 4)
  Add the contract in the `data.contract` section of the transaction

  `contract` is an object with following keys:
  - `bytecode` `Uint8List` of the compiled wasm code compressed using zip
  - `manifest` the manifest of the contrat containing actions and functions spec
 
  #### setContent(content)
  Add the content in the `data.content` section of the transaction
  `content` is a string defining the smart contract
  
  #### addOwnership(secret, authorizedKeys)
   Add an ownership in the `data.ownerships` section of the transaction with a secret and its related authorized public keys to be able to decrypt it.
   This aims to prove the ownership or the delegatation of some secret to a given list of public keys.
  `secret` is the hexadecimal encoding or Uint8Array representing the encrypted secret
  `authorizedKeys` is a list of object represented by 
  - `publicKey` is the hexadecimal encoding or Uint8Array representing the public key
  - `encryptedSecretKey` is the hexadecimal encoding or Uint8Array representing the secret key encrypted with the public key (see `ecEncrypt`)
  
  #### addUCOTransfer(to, amount)
  Add a UCO transfer to the `data.ledger.uco.transfers` section of the transaction
  - `to` is hexadecimal encoding or Uint8List representing the transaction address (recipient) to receive the funds
  - `amount` is the number of uco to send (int)

  #### addTokenTransfer(to, amount, tokenAddress, tokenId)
  Add a token transfer to the `data.ledger.token.transfers` section of the transaction
  - `to` is hexadecimal encoding or Uint8List representing the transaction address (recipient) to receive the funds
  - `amount` is the number of uco to send (int)
  - `tokenAddress` is hexadecimal encoding or Uint8List representing the token address to spend
  - `tokenId` is the ID of the token to use (default to 0)

  #### addRecipient(to, action, args)
  Add a recipient to call a specific smart contract's action.
  - `to` is the contract's address in hexadecimal or Uint8Array
  - `action` is the name of the action
  - `args` is the list of arguments for the action (must contain only JSON valid data) or object
  
  #### build(seed, index, curve, hashAlgo, isSeedHexa)
  Generate `address`, `timestamp`, `previousPublicKey`, `previousSignature` of the transaction and 
  serialize it using a custom binary protocol.
  
  - `seed` is hexadecimal encoding or Uint8Array representing the transaction chain seed to be able to derive and generate the keys
  - `index` is the number of transactions in the chain, to generate the actual and the next public key (see below the cryptography section)
  - `curve` is the elliptic curve to use for the key generation (can be "ed25519", "P256", "secp256k1") - default to "P256"
  - `hashAlgo` is the hash algorithm to use to generate the address (can be "sha256", "sha512", "sha3-256", "sha3-512", "bake2b") - default to "sha256"
  - `isSeedHexa` is a parameter used to specify whether the information is in hexadecimal format or not (and thus avoid conversion issues).
 
  ```dart
  import 'package:archethic_lib_dart/archethic_lib_dart.dart';

  Transaction tx = Transaction(type: 'transfer', data: Transaction.initData())
    .addUCOTransfer('0000b1d3750edb9381c96b1a975a55b5b4e4fb37bfab104c10b0b6c9a00433ec4646', toBigInt(0.420)) 
    .build('mysuperpassphraseorseed', 0, 'P256').transaction;
  ```

  #### originSign(privateKey)
  Sign the transaction with an origin device private key

   - `privateKey` is hexadecimal encoding or Uint8List representing the private key to generate the origin signature to able to perform the ProofOfWork and authorize the transaction

  ```dart
  import 'package:archethic_lib_dart/archethic_lib_dart.dart';
  
  final KeyPair originKeypair = crypto.deriveKeyPair('origin_seed', 0, isSeedHexa: false);
  Transaction tx = Transaction(type: 'transfer', data: Transaction.initData())
    .addUCOTransfer('0000b1d3750edb9381c96b1a975a55b5b4e4fb37bfab104c10b0b6c9a00433ec4646', toBigInt((0.420)) 
    .build('mysuperpassphraseorseed', 0, 'P256').transaction
    .originSign(originKeypair.privateKey);
  ```

  #### convertToJSON()
  Export the transaction generated into JSON

   ```dart
  import 'package:archethic_lib_dart/archethic_lib_dart.dart';

  Transaction tx = Transaction(type: 'transfer', data: Transaction.initData())
    .addUCOTransfer('0000b1d3750edb9381c96b1a975a55b5b4e4fb37bfab104c10b0b6c9a00433ec4646', toBigInt(0.420)) 
    .build('mysuperpassphraseorseed', 0, 'P256').transaction
    .convertToJSON();
  ```
  
  </details>
   <br/>
   <details>
   <summary>Remote Endpoint calls</summary>
   <br/>

  #### getOriginKey()
  Return the hardcoded origin private key for software, this is used for signing transaction (see OriginSign).

  #### addOriginKey(originPublicKey, certificate, endpoint)
  Query a node to add a new origin public to be authorized to sign transaction with the corresponding private key (see OriginSign).
  Calls the 'add_origin_key' JSON-RPC 2.0 method

  - `originPublicKey` is the public key to be added.
  - `certificate` is the certificate that prove the public key is allowed to be added.
  - `endpoint` is the HTTP URL to a Archethic node

  Returns
  ```dart
  {
    transaction_address: "..."
    status: "pending"
  }
  ```  

  Getting the default origin Key :
  ```dart
  final String originPrivateKey = await ApiService('https://testnet.archethic.net').getOriginKey();
  final Transaction tx = Transaction(type: 'transfer', data: Transaction.initData());
  ...
  tx.originSign(originPrivateKey);
  ```
  Getting another origin key :
  ```dart
  final String authPublicKey = '0001be992817b7db9807b1df5faa6bb23036e1f2189eeaab0e1f1260ede8642ecc76'
  final String privateKey = '0001621d7c3bb971a245959679bf0879822a4df60c95c8f7f2193352d85498840b7d'
  final String originPrivateKey = await ApiService('https://testnet.archethic.net').getOriginKey(authPublicKey, privateKey);
  final Transaction tx = Transaction(type: 'transfer', data: Transaction.initData());
  ...
  tx.originSign(originPrivateKey);
  ```

  #### getTransactionIndex(addresses)
  Query a node to find the length of the chain to retrieve the transaction index

  - `addresses` List of transaction addresses (in hexadecimal)

  ```dart
  import 'package:archethic_lib_dart/archethic_lib_dart.dart';

  Map<String, int> indexMap = await ApiService('https://testnet.archethic.net').getTransactionIndex(
         ['00b1d3750edb9381c96b1a975a55b5b4e4fb37bfab104c10b0b6c9a00433ec4646']);
  int index = indexMap['00b1d3750edb9381c96b1a975a55b5b4e4fb37bfab104c10b0b6c9a00433ec4646'];
  // 0
  ``` 

  #### getLastTransaction(addresses)
  Query a node to find the last transaction in the transaction chain from a list of addresses

  - `addresses` List of transaction addresses (in hexadecimal)

  ```dart
  import 'package:archethic_lib_dart/archethic_lib_dart.dart';

  Map<String, Transaction> transactionMap = await ApiService('https://testnet.archethic.net').getLastTransaction(
          ['00b1d3750edb9381c96b1a975a55b5b4e4fb37bfab104c10b0b6c9a00433ec4646']);
  Transaction transaction = transactionMap['00b1d3750edb9381c96b1a975a55b5b4e4fb37bfab104c10b0b6c9a00433ec4646'];
  ``` 

  #### getStorageNoncePublicKey()
  Query a node to find the public key of the shared storage node key

   ```dart
  import 'package:archethic_lib_dart/archethic_lib_dart.dart';

  String storageNoncePublicKey =
          await ApiService('https://testnet.archethic.net').getStorageNoncePublicKey();
  // 00b1d3750edb9381c96b1a975a55b5b4e4fb37bfab104c10b0b6c9a00433ec4646
  ``` 

  #### getOracleData(timestamp)
  Fetch the OracleChain data
  return a value of Oracle Uco_Price in {OracleUcoPrice} from a timestamp
  If timestamp = 0 or not precised, the last price is returned
  - `timestamp`: UNIX timestamp (optional)

  ```dart
  import 'package:archethic_lib_dart/archethic_lib_dart.dart';

  final oracleData =
          await OracleService('https://testnet.archethic.net').getOracleData(timestamp);
  final eurConversionRate = oracleUcoPrice.uco?.eur;
  final usdConversionRate = oracleUcoPrice.uco?.usd;
  ```
  #### getTransactionFee(tx)
  Query a node to fetch the tx fee for a given transaction
  Calls the 'estimate_transaction_fee' JSON-RPC 2.0 method
  
  - `tx` Generated transaction
  
  ```dart
  import 'package:archethic_lib_dart/archethic_lib_dart.dart';

  Transaction tx = Transaction(...)
  TransactionFee transactionFee = await ApiService('https://testnet.archethic.net').getTransactionFee(tx);
  ```

  #### subscribeToOracleUpdates(handler)
  Subscribe to get the real time updates of the OracleChain
  - `handler`: Callback to handle the new data

  ```dart
  import 'package:archethic_lib_dart/archethic_lib_dart.dart';
  
  await OracleService('https://testnet.archethic.net')
            .subscribeToOracleUpdates((data) {
        log('Oracle value: ${data.timestamp} - ${data.uco!.usd} USD');
        // TODO with
        {
          timestamp: ...,
            services: {
            uco: {
             eur: ...,
             usd: ...
            }
          }
        }
    });
  ```

  #### getTransactionOwnerships(addresses)
  Query a node to find the ownerships (secrets and authorized keys) to given transactions addresses

  - `addresses`: List of transactions addresses

  ```dart
  import 'package:archethic_lib_dart/archethic_lib_dart.dart';

  String address = crypto.deriveAddress("mysuperpassphraseorseed", 0);
  Map<String, List<Ownership>> ownershipsMap = await ApiService('https://testnet.archethic.net').getTransactionOwnerships([address]);
  List<Ownership> ownerships = ownershipsMap[address];
  ```

  #### sendTx(transaction)
  Send a transaction to the network
  Calls the 'send_transaction' JSON-RPC 2.0 method

  - `transaction`: Transaction to send

  ```dart
  import 'package:archethic_lib_dart/archethic_lib_dart.dart';

  final tx = Transaction(type: 'transfer', data: Transaction.initData())
            .addUCOTransfer(
              '0000b1d3750edb9381c96b1a975a55b5b4e4fb37bfab104c10b0b6c9a00433ec4646',
              toBigInt(0.00000001),
            )
            .build("mysuperpassphraseorseed", 0)
            .transaction
            .originSign(originPrivateKey);

  await ApiService('https://testnet.archethic.net').sendTx(tx);
  ```


  #### callSCFunction(jsonRPCRequest)
  Call a smart contract's function using JSON-RPC 2.0 method.
  - `jsonRPCRequest` is the json structure based on SCCallFunctionRequest object to request the function
  - `resultMap` (optional) is the format of the response (true=Map, false=String)

  Returns the result of the function called

  Call a function :
  ```dart
  final smCallFunctionResponse =
    await ApiService('https://testnet.archethic.net').callSCFunction(
      jsonRPCRequest: SCCallFunctionRequest(
        method: 'contract_fun',
        params: SCCallFunctionParams(
          contract:
                  '0000a9f3bc500d0ed7d923e983eafc080113633456f53c400814e1d4f34c5fa67220',
          function: 'get_chargeable_htlc',
          args: [
                1692394056,
                '0000a3b7b1d4830a09a5459cb24db36c3d791f337260a11892b5e2e9c382da577f7a',
                '000085f677b365906a5103959e5fa289622b22ed93062b65120b55133da78242ae3e',
                '4BC2DA9ABC1B5667529E3C35141026CB1E1A6DD0376E871C77D2824164F696EF',
                'UCO',
                4.56
          ],
        ),
      ),
    );
  ```

  </details>
   <br/>
   <details>
   <summary>Keychain / Wallet management</summary>
   <br/>

  #### newKeychainTransaction(String seed, List<String> authorizedPublicKeys, Uint8List originPrivateKey)
  Creates a new transaction to build a keychain by embedding the on-chain encrypted wallet.

  - `seed` Keychain's seed
  - `authorizedPublicKeys` List of authorized public keys able to decrypt the wallet
  - `originPrivateKey` Key to make the origin signature of the transaction
  - `blockchainTxVersion` The blockchain transaction version to be used.
  - `servicesMap` (Optional) A map where:
    - Keys are service names (as `String`),
    - Values are derivation paths (as `String`) associated with the respective services.
    
    If provided, the keychain will include these services with their respective derivation paths.


  #### newAccessKeychainTransaction(String seed, Uint8List keychainAddress, Uint8List originPrivateKey)
  Creates a new keychain access transaction to allow a seed and its key to access a keychain

  - `seed` Keychain access's seed
  - `keychainAddress` Keychain's tx address
  - `originPrivateKey` Key to make the origin signature of the transaction  

  #### getKeychain(seed)
  Retrieve a keychain from the keychain access transaction and decrypt the wallet to retrieve the services associated

  - `seed` Keychain access's seed

  ```dart
  import 'package:archethic_lib_dart/archethic_lib_dart.dart';

  Keychain keychain = await ApiService('https://testnet.archethic.net').getKeychain(accessKeychainSeed);
  ```  

  Once retrieved the keychain provide the following methods:

  #### buildTransaction(tx, serviceName, index, suffix)
  Generate `address`, `previousPublicKey`, `previousSignature` of the transaction and 
  serialize it using a custom binary protocol, based on the derivation path, curve and hash algo of the service given in param.

  - `tx` is an instance of `Transaction`
  - `serviceName` is the service name to use for getting the derivation path, the curve and the hash algo
  - `index` is the number of transactions in the chain, to generate the actual and the next public key (see the cryptography section)
  - `suffix`: Additional information to add to a service derivation path (default to empty)

  Return is the signed `Transaction`. Notice that the function also sign the `Transaction` given in param, so getting the return is not mandatory

  ```dart

  final Transaction tx = Transaction(type: 'transfer', data: Transaction.initData()).addUCOTransfert(...);
  final Keychain keychain = await ApiService('https://testnet.archethic.net').getKeychain(accessKeychainSeed);
  final int index = (await ApiService('https://testnet.archethic.net').getTransactionIndex(keychain.deriveAddress('uco', 0))).chainLength);
  Transaction signedTx = keychain.buildTransaction(tx, 'uco', index);
  ```

  #### deriveAddress(service, index, suffix)
  Derive an address for the given service at the index given

  - `service`: Service name to identify the derivation path to use
  - `index`: Chain index to derive (default to 0)
  - `suffix`: Additional information to add to a service derivation path (default to empty)

  ```dart
  Keychain keychain = await ApiService('https://testnet.archethic.net').getKeychain(accessKeychainSeed);
  Uint8List genesisUCOAddress = keychain.deriveAddress('uco', index: 0);
  ``` 

  #### deriveKeypair(service, index, suffix)
  Derive a keypair for the given service at the index given

  - `service`: Service name to identify the derivation path to use
  - `index`: Chain index to derive (default to 0)
  - `suffix`: Additional information to add to a service derivation path (default to empty)
  
  ```dart
  Keychain keychain = await ApiService('https://testnet.archethic.net').getKeychain(accessKeychainSeed);
  KeyPair keyPair = keychain.deriveKeypair('uco', index: 0, isSeedHexa: false);
  ``` 


  #### ecEncryptServiceSeed(service, publicKeys)
  Use ec encryption on the seed for the list of authorizedPublicKeys

  - `service`: Service name to identify the derivation path to use
  - `authorizedPublicKeys`: List of public keys to encrypt the service seed

  ```dart
  final keychain = Keychain(seed: hexToUint8List(generateRandomSeed())).copyWithService('uco', "m/650'/uco");
  final storageNoncePublicKey = await ApiService('https://testnet.archethic.net').getStorageNoncePublicKey();

  final resultECEncryptServiceSeed = keychain.ecEncryptServiceSeed('uco', [storageNoncePublicKey]);
  final secret = uint8ListToHex(resultECEncryptServiceSeed.secret);
  final authorizedPublicKeys = resultECEncryptServiceSeed.authorizedPublicKeys;

  // secret and authorizedPublicKeys can be used to create an ownership
  final tx = Transaction(
        type: 'contract',
        data: Transaction.initData(),
      ).addOwnership(secret, authorizedPublicKeys);
  ```

  #### toDID()
  Return a Decentralized Identity document from the keychain. (This is used in the transaction's content of the keychain tx)

  ```dart
  Keychain keychain = await ApiService('https://testnet.archethic.net').getKeychain(accessKeychainSeed);
  final Map<String, dynamic> did = keychain.toDID();
  log(did)
  {
    "@context": [
       "https://www.w3.org/ns/did/v1"
    ],
    "id": "did:archethic:keychain_address",
    "authentification": servicesMaterials, //list of public keys of the services
    "verificationMethod": servicesMaterials //list of public keys of the services
  }
  ```

  #### addService(String name, String derivationPath, {String curve = 'ed25519', String hashAlgo = 'sha256'})
  Add a service into the keychain

  - `name`: Name of the service to add
  - `derivationPath`: Crypto derivation path
  - `curve`: Elliptic curve to use
  - `hashAlgo`: Hash algo

  ```dart
  Keychain keychain = await ApiService('https://testnet.archethic.net').getKeychain(accessKeychainSeed);
  keychain.addService("nft1", "m/650'/1/0");
  log(keychain)
  {
    version: 1,
    seed: "mymasterseed",
    services: {
      uco: {
        derivationPath: "m/650'/0/0",
        curve: "ed25519",
        hashAlgo: "sha256"
      },
      nft1: {
        derivationPath: "m/650'/1/0",
        curve: "ed25519",
        hashAlgo: "sha256"
      }
    }
  }
  ```

   <br/>
</details>

## Utils

### Keychain Utilities

The `KeychainUtil` mixin provides utility methods for handling keychain transactions on the Archethic network.

#### Methods

- `Future<bool> checkKeychain(String endpoint, Uint8List pubkey)`
  - Checks if a keychain exists for the given public key on the specified network endpoint.
  - Returns `true` if a keychain is found, `false` otherwise.

- `Future<List<String>> keychainAddresses(String endpoint, Uint8List pubkey)`

  - Retrieves the list of keychain addresses associated with the given public key.
  - Returns a list of strings representing the addresses.

- `Future<String?> _findKeychainGenesisAddress(String endpoint, Uint8List pubkey) (private method)`
  - Computes the genesis address of the keychain for the given public key.
  - Returns the genesis address if found, null otherwise.

- `Future<Transaction?> _searchKeychain(String endpoint, String genesisAddress) (private method)`
  - Searches for the keychain transaction associated with the genesis address.
  - Returns the transaction if found, null otherwise.


## Running the tests

```bash
dart test --exclude-tags noCI
```

