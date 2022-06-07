[![CI](https://github.com/archethic-foundation/libdart/actions/workflows/ci.yaml/badge.svg)](https://github.com/archethic-foundation/libdart/actions/workflows/ci.yaml) [![Pub](https://img.shields.io/pub/v/archethic_lib_dart.svg)](https://pub.dartlang.org/packages/archethic_lib_dart) [![Platform](https://img.shields.io/badge/Platform-Flutter-02569B?logo=flutter)](https://flutter.dev) [![CodeFactor](https://www.codefactor.io/repository/github/archethic-foundation/libdart/badge)](https://www.codefactor.io/repository/github/archethic-foundation/libdart)

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

  #### deriveKeyPair(seed, index, curve)
  It creates a new keypair into hexadecimal format

  - `seed` is hexadecimal encoding or Uint8Array representing the transaction chain seed to be able to derive and generate the keys
  - `index` is the number of transactions in the chain, to generate the actual and the next public key (see below the cryptography section)
  - `curve` is the elliptic curve to use for the key generation (can be "ed25519", "P256", "secp256k1") - default to: "ed25519"

  ```dart
  import 'package:archethic_lib_dart/archethic_lib_dart.dart';
  
  KeyPair keypair = crypto.deriveKeyPair('mysuperpassphraseorseed', 0);
  // uint8ListToHex(keypair.publicKey) => 0100048cac473e46edd109c3ef59eec22b9ece9f99a2d0dce1c4ccb31ce0bacec4a9ad246744889fb7c98ea75c0f0ecd60002c07fae92f23382669ca9aff1339f44216
  ```

  #### deriveAddress(seed, index, curve, hashAlgo)
  It creates a transaction address by extract the public key from the key derivation and hash it into a hexadecimal format

   - `seed` is hexadecimal encoding or Uint8Array representing the transaction chain seed to be able to derive and generate the keys
   - `index` is the number of transactions in the chain, to generate the actual and the next public key (see below the cryptography section)
   - `curve` is the elliptic curve to use for the key generation (can be "ed25519", "P256", "secp256k1") - Default to "ed25519"
   - `hashAlgo` is the hash algorithm to create the address (can be "sha256", "sha512", "sha3-256", "sha3-512", "blake2b") - default to "sha256"

   ```dart
   import 'package:archethic_lib_dart/archethic_lib_dart.dart';

   String address = crypto.deriveAddress("mysuperpassphraseorseed", 0);
   // Address: 00004195d45987f33e5dcb71edfa63438d5e6add655b216acfdd31945d58210fe5d2
   ```

  #### ecEncrypt(data, publicKey)
  Perform an ECIES encryption using a public key and a data
  
  - `data` Data to encrypt
  - `publicKey` Public key to derive a shared secret and for whom the content must be encrypted
  
  ```dart
  import 'package:archethic_lib_dart/archethic_lib_dart.dart';

  Uint8List cipher = crypto.ecEncrypt('dataToEncrypt' '00b1d3750edb9381c96b1a975a55b5b4e4fb37bfab104c10b0b6c9a00433ec4646');
  ```

  #### aesEncrypt(data, publicKey)
  Perform an AES encryption using a key and a data

  - `data` Data to encrypt
  - `key` Symmetric key

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
  
  `type` is the string defining the type of transaction to generate ("keychain", "keychain_access", "transfer", "hosting", "code_proposal", "code_approval", "nft")
  
  The transaction instance contains the following methods:
  
  #### setCode(code)
  Add the code in the `data.code` section of the transaction
  `code` is a string defining the smart contract
  
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
  - `amount` is the number of uco to send (BigInt)

  #### addNFTTransfer(to, amount, nft_address)
  Add a NFT transfer to the `data.ledger.nft.transfers` section of the transaction
  - `to` is hexadecimal encoding or Uint8List representing the transaction address (recipient) to receive the funds
  - `amount` is the number of uco to send (double)
  - `nft_address` is hexadecimal encoding or Uint8List representing the NFT address to spend

  #### addRecipient(to)
  Add a recipient (for non UCO transfers, ie. smart contract interaction) to the `data.recipient` section of the transaction
  - `to` is hexadecimal encoding or Uint8List representing the transaction address (recipient)
  
  #### build(seed, index, curve, hashAlgo)
  Generate `address`, `timestamp`, `previousPublicKey`, `previousSignature` of the transaction and 
  serialize it using a custom binary protocol.
  
  - `seed` is hexadecimal encoding or Uint8Array representing the transaction chain seed to be able to derive and generate the keys
  - `index` is the number of transactions in the chain, to generate the actual and the next public key (see below the cryptography section)
  - `curve` is the elliptic curve to use for the key generation (can be "ed25519", "P256", "secp256k1") - default to "P256"
  - `hashAlgo` is the hash algorithm to use to generate the address (can be "sha256", "sha512", "sha3-256", "sha3-512", "bake2b") - default to "sha256"
  
  ```dart
  import 'package:archethic_lib_dart/archethic_lib_dart.dart';

  Transaction tx = Transaction(type: 'transfer', data: Transaction.initData())
    .addUCOTransfer('0000b1d3750edb9381c96b1a975a55b5b4e4fb37bfab104c10b0b6c9a00433ec4646', toBigInt(0.420)) 
    .build('mysuperpassphraseorseed', 0, 'P256');
  ```

  #### originSign(privateKey)
  Sign the transaction with an origin device private key

   - `privateKey` is hexadecimal encoding or Uint8List representing the private key to generate the origin signature to able to perform the ProofOfWork and authorize the transaction

  ```dart
  import 'package:archethic_lib_dart/archethic_lib_dart.dart';
  
  final KeyPair originKeypair = crypto.deriveKeyPair('origin_seed', 0);
  Transaction tx = Transaction(type: 'transfer', data: Transaction.initData())
    .addUCOTransfer('0000b1d3750edb9381c96b1a975a55b5b4e4fb37bfab104c10b0b6c9a00433ec4646', toBigInt((0.420)) 
    .build('mysuperpassphraseorseed', 0, 'P256') 
    .originSign(originKeypair.privateKey);
  ```

  #### convertToJSON()
  Export the transaction generated into JSON

   ```dart
  import 'package:archethic_lib_dart/archethic_lib_dart.dart';

  Transaction tx = Transaction(type: 'transfer', data: Transaction.initData())
    .addUCOTransfer('0000b1d3750edb9381c96b1a975a55b5b4e4fb37bfab104c10b0b6c9a00433ec4646', toBigInt(0.420)) 
    .build('mysuperpassphraseorseed', 0, 'P256') 
    .convertToJSON();
  ```
  
  </details>
   <br/>
   <details>
   <summary>Remote Endpoint calls</summary>
   <br/>

   #### getOriginKey(authorizedPublicKey, privateKey)
   Query a node to get the origin private key encrypted by the `authorizedPublicKey`. This origin private key is used to sign the transaction (see originSign).

   - `authorizedPublicKey` is the public key which encode the origin private key. Default value is set to the genesis origin public key of the network.
   - `privateKey` is the private key corresponding to the `authorizedPublicKey` needed to decrypt the origin private key secret. Default value is set to the genesis origin private key of the network.

   Return is the origin private key.

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

  #### getTransactionIndex(address)
  Query a node to find the length of the chain to retrieve the transaction index

  - `address` Transaction address (in hexadecimal)

  ```dart
  import 'package:archethic_lib_dart/archethic_lib_dart.dart';

  int index = (await ApiService('https://testnet.archethic.net').getTransactionIndex(
          '00b1d3750edb9381c96b1a975a55b5b4e4fb37bfab104c10b0b6c9a00433ec4646').chainLength);
  // 0
  ``` 

  #### getLastTransaction(address)
  Query a node to find the last transaction in the transaction chain from an address

  - `address` Transaction address (in hexadecimal)

  ```dart
  import 'package:archethic_lib_dart/archethic_lib_dart.dart';

  Transaction transaction = await ApiService('https://testnet.archethic.net').getLastTransaction(
          '00b1d3750edb9381c96b1a975a55b5b4e4fb37bfab104c10b0b6c9a00433ec4646');
  ``` 

  #### getStorageNoncePublicKey()
  Query a node to find the public key of the shared storage node key

   ```dart
  import 'package:archethic_lib_dart/archethic_lib_dart.dart';

  String storageNoncePublicKey =
          await ApiService('https://testnet.archethic.net').getStorageNoncePublicKey();
  // 00b1d3750edb9381c96b1a975a55b5b4e4fb37bfab104c10b0b6c9a00433ec4646
  ``` 

  #### getTransactionFee(tx)
  Query a node to fetch the tx fee for a given transaction
  
  - `tx` Generated transaction
  
  ```dart
  import 'package:archethic_lib_dart/archethic_lib_dart.dart';

  Transaction tx = Transaction(...)
  TransactionFee transactionFee = await ApiService('https://testnet.archethic.net').getTransactionFee(tx);
  ```

  #### getTransactionOwnerships(address)
  Query a node to find the ownerships (secrets and authorized keys) to given transaction's address

  - `address`: Transaction's address

  ```dart
  import 'package:archethic_lib_dart/archethic_lib_dart.dart';

  String address = crypto.deriveAddress("mysuperpassphraseorseed", 0);
  List<Ownership> ownerships = await ApiService('https://testnet.archethic.net').getTransactionOwnerships(address);
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

  #### buildTransaction(tx, serviceName, index)
  Generate `address`, `previousPublicKey`, `previousSignature` of the transaction and 
  serialize it using a custom binary protocol, based on the derivation path, curve and hash algo of the service given in param.

  - `tx` is an instance of `Transaction`
  - `serviceName` is the service name to use for getting the derivation path, the curve and the hash algo
  - `index` is the number of transactions in the chain, to generate the actual and the next public key (see the cryptography section)

  Return is the signed `Transaction`. Notice that the function also sign the `Transaction` given in param, so getting the return is not mandatory

  ```dart

  final Transaction tx = Transaction(type: 'transfer', data: Transaction.initData()).addUCOTransfert(...);
  final Keychain keychain = await ApiService('https://testnet.archethic.net').getKeychain(accessKeychainSeed);
  final int index = (await ApiService('https://testnet.archethic.net').getTransactionIndex(keychain.deriveAddress('uco', 0))).chainLength);
  Transaction signedTx = keychain.buildTransaction(tx, 'uco', index);
  ```

  #### deriveAddress(service, index)
  Derive an address for the given service at the index given

  - `service`: Service name to identify the derivation path to use
  - `index`: Chain index to derive (default to 0)

  ```dart
  Keychain keychain = await ApiService('https://testnet.archethic.net').getKeychain(accessKeychainSeed);
  Uint8List genesisUCOAddress = keychain.deriveAddress('uco', index: 0);
  ``` 

  #### deriveKeypair(service, index)
  Derive a keypair for the given service at the index given

  - `service`: Service name to identify the derivation path to use
  - `index`: Chain index to derive (default to 0)
  
  ```dart
  Keychain keychain = await ApiService('https://testnet.archethic.net').getKeychain(accessKeychainSeed);
  KeyPair keyPair = keychain.deriveKeypair('uco', index: 0);
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

  </details>
   <br/>
   <details>
   <summary>Coingecko functions</summary>
   <br/>

  #### getCoinsResponse()
  Get all Archethic Coin infos with http request https://api.coingecko.com/api/v3/coins/archethic

  #### getCoinsChart(currency, nbDays)
  Get Archethic Coin infos (Prices, Marketcaps, Total Volumes) for a period with http request https://api.coingecko.com/api/v3/coins/archethic/market_chart?vs_currency=currency&days=nbDays

  #### getSimplePrice(currency)
  Get Archethic Coin infos (BTC Price, Local Currency Price) with https://api.coingecko.com/api/v3/simple/price?ids=archethic&vs_currencies=currency

  #### getCoinsCurrentData()
  Get Archethic Coin infos (name, price, market, ... including exchange tickers) with https://api.coingecko.com/api/v3/coins/archethic

  </details>
   <br/>

## Running the tests

```bash
dart test --exclude-tags noCI
```

