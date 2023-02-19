Changelog
=========

#### Version 3.0.0 (2023-02-19)
* BREAKING-CHANGE - Dart SDK model classes migrate to immutable classes with freezed.
* BREAKING-CHANGE - Change Address().isConform() to Address().isValid() method

#### Version 2.0.3 (2022-12-22)
* Fix sort public keys in authorizedPublicKeys

#### Version 2.0.2 (2022-12-20)
* Add timestamp, version properties in UnspentOutput model

#### Version 2.0.1 (2022-12-16)
* Fix bugs (null Exception in appService)
* Add lints
  
#### Version 2.0.0 (2022-12-08)
* Change Token structure : add aeip information / add ownerships / add content informations
* Version for the Mainnet Launch
  
#### Version 1.0.27 (2022-11-16)
* Optimization : Use graphql union requests. BREAKING CHANGE
* Remove coingecko references and API
* Use GraphQL lib to manage GraphQL requests
* Manage pagingAddress param in transactionChain method

#### Version 1.0.26 (2022-09-30)
* Reuse Token class in TokenResponse class
* Rename token naming in the API calls
* Remove GraphQL references
* Add varint for token_id
* Manage conection exceptions

#### Version 1.0.25 (2022-09)
* Implementation of tokens management
* Serialization - int management
* Coingecko: Get historical market data include price, market cap, and 24h volume within a range of timestamp
* Check curve type in  method
* Add error field in transactionFee message
* Add field tokenId in fetchBalance method
* Add getToken method to query the network to find a token's data
* Remove NodeMovement class
* Amount management. Int format (10^8) from end to end
* Add API to get last oracle value
* Sort authorizedPublicKeys in ownerships

#### Version 1.0.23 (2022-07-21)
* BREAKING-CHANGE - Implement VarInt when getting signature payload

#### Version 1.0.22 (2022-07-05)
* Add timestamp in logs
* Manage the coding of the transaction's content to hexadecimal with 16 bytes instead 8 bytes

#### Version 1.0.21 (2022-06-23)
* Rename NFT to Token
* Add token id

#### Version 1.0.20 (2022-06-16)
* Optimize graphQL requests to limit the transfer of informations

#### Version 1.0.19 (2022-06-16)
* Add tests for CoinGecko APIs
* Fix nullpointerException in CoinGecko APIs

#### Version 1.0.18 (2022-06-13)
* Add waitConfirmations function to listen acks
* Managing Origin Key
* getLastOracleUcoPrice method : fix nullPointerException
* getCoinsCurrentData method : add params to specify which informations should be retrieve
* Optimize graphQL requests to limit the transfer of informations

#### Version 1.0.17 (2022-06-09)
* Use lastAdress from address store in keychainAccess to get a keychain

#### Version 1.0.16 (2022-06-09)
* Fix bugs in Keychain management

#### Version 1.0.15 (2022-06-07)
* Remove NFTService class

#### Version 1.0.14 (2022-06-01)
* Simplify the derivation path for the Archethic purpose
* Fix Keychain management

#### Version 1.0.13 (2022-05-24)
* Fix authorizedKeys naming in transaction.convertToJSON method

#### Version 1.0.12 (2022-05-24)
* Fix type transaction in newKeychainTransaction

#### Version 1.0.11 (2022-05-17)
* Fix Keychain DID document to be conform

#### Version 1.0.10 (2022-05-14)
* TransactionChain : Pagination based on paging_state as last page last transaction address GraphQl API

#### Version 1.0.9 (2022-05-13)
* Expose API to get the origin key
* Migration to dart 2.17
* Improve codefactor score

#### Version 1.0.8 (2022-05-10)
* Improve README readability
* Add transaction building from the keychain
* Distinct getLastTransaction and getTransactionIndex methods
* Keychain management : Fix bugs (authorizedKeys alimentation, aesKey generation) 
* Move methods newAccessKeychainTransaction & newKeychainTransaction to ApiService class
* Add serviceName and derivationPath in newKeychainTransaction method signature

#### Version 1.0.7 (2022-04-29)
* Update methods to be conform with libjs 1.4.0
* Adapt crypto key identifiers
* Add hashAlgo param in prepareNewNFT method
* Change logs management
* Add keychain creation and access
* Fix Index overflow in ecdh computeSecret() when the output X coordinate is less than 32 bytes
* Add default value to curve type in the address 

#### Version 1.0.5 (2022-01-15)
* Rename node field in CrossValidationStamp with 'nodePublicKey'
* Add flutter_lints
* Add Oracle UCO Price recovery
* Add function to get the tx's fee
* Add function to control address format
* Add curve type in the address
* Fix NullPointerException 
* Add Network transactions list in the API
* Add license notifications
* Add CODE_OF_CONDUCT.md and CONTRIBUTING.md

#### Version 1.0.4 (2022-01-04)
* Add new method to get all transaction informations (ApiService().getTransactionAllInfos())
* Integrate Bitcoin in currencies management
* Fix Null Pointer Exceptions
* Fix Bigint Conversions in UCOTransfer management

#### Version 1.0.3 (2021-12-20)
* Coingecko infos changed : uniris -> archethic

#### Version 1.0.2 (2021-10-27)
* Update dependencies.
* Add createKeychain method : Create a keychain and an access keychain using the initial passphrase

#### Version 1.0.1 (2021-10-01) 
* Update dependencies.
* Change authorized keys to use list instead of map.
* Rename keys to ownerships
* Use integer instead of float
* add getTransactionInputs method

#### Version 1.0.0 (2021-08-08) 
* Initial stable release.