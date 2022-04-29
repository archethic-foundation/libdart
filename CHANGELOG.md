Changelog
=========

#### Version 1.0.7 (2022-04-29)
* Update methods to be conform with libjs 1.4.0
* Adapt crypto key identifiers
* Add hashAlgo param in prepareNewNFT method
* Change logs management
* Add keychain creation and access

#### Version 1.0.6 (2022-03-01)
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