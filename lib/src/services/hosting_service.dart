// Dart imports:

//import 'package:archive/archive.dart';

class HostingService {
  String? endpoint;
/*
  HostingService(this.endpoint);

  /// [endpoint] is the HTTP URL to a Archethic node (acting as welcome node)

  /// Files List in an archive
  List<ArchiveFile> filesInArchive = List.empty(growable: true);

  String _getSeed(String seed, String fileName,
      {String curve = 'ed25519', String hashAlgo = 'sha256'}) {
    crypto.Hmac hmac = crypto.Hmac(crypto.sha256, seed.codeUnits);
    crypto.Digest digest = hmac.convert(fileName.codeUnits);
    Uint8List _seed = Uint8List.fromList(digest.bytes);
    return uint8ListToHex(_seed);
  }

  void deployWebSite(String seed, String originPrivateKey, Archive archive,
      {String curve = 'ed25519', String hashAlgo = 'sha256'}) async {
    List<String> files = [];
    List<String> seeds = [];
    List<String> addresses = [];
    List<String> arrayFiles = [];
    List<String> arrayAddress = [];
*/
  /* for (var file in archive.files) {
      if (file.isFile) {
        print(file.name);
        String _seed =
            _getSeed(seed, file.name, curve: curve, hashAlgo: hashAlgo);
        seeds.add(_seed);
        String _address =
            deriveAddress(_seed, 0, curve: curve, hashAlgo: hashAlgo);
        addresses.add(_address);
        print('address: ' + _address);
        try {
          Transaction txn =
              Transaction(type: 'transfer', data: Transaction.initData())
                  .addUCOTransfer(_address, toBigInt(1))
                  .build(seed, 0)
                  .originSign(originPrivateKey);

          TransactionStatus transactionStatus =
              await ApiService(endpoint).sendTx(txn);
          // await ApiService(endpoint).waitConfirmations(txn.address!,
          //     (nbConfirmations) {
          //   print(nbConfirmations);
          // });

          print(transactionStatus.status);
        } catch (e) {
          print('e: ' + e.toString());
        }
      }
    }*/
/*
    for (int i = 0; i < archive.files.length; i++) {
      crypto.Hmac hmac = crypto.Hmac(crypto.sha256, Uint8List.fromList(hexToUint8List(seed));
      crypto.Digest digest = hmac.convert(archive.files[i].name.codeUnits);
      Uint8List _seed = Uint8List.fromList(digest.bytes);
      String _address = deriveAddress(uint8ListToHex(_seed), 0,
          curve: curve, hashAlgo: hashAlgo);
      addresses.add(_address);
    }

    Transaction txn =
        Transaction(type: 'transfer', data: Transaction.initData());

    for (int i = 0; i < addresses.length; i++) {
      txn.addUCOTransfer(addresses[i], toBigInt(1));
    }
    txn.build(seed, 0).originSign(originPrivateKey);
    try {
      TransactionStatus transactionStatus =
          await ApiService(endpoint).sendTx(txn);
      // await ApiService(endpoint).waitConfirmations(txn.address!,
      //     (nbConfirmations) {
      //   print(nbConfirmations);
      // });

      print(transactionStatus.status);
    } catch (e) {
      print('e: ' + e.toString());
    }

    for (var file in archive.files) {}
/*
      Transaction txBuilder =
          Transaction(type: 'hosting', data: Transaction.initData());
      txBuilder.setContent(files[i]);
      Transaction lastTransaction =
          await ApiService(endpoint).getLastTransaction(_address);
      int index = lastTransaction.chainLength!;
      Transaction transaction =
          txBuilder.build(seed, index).originSign(originPrivateKey);
      TransactionStatus sendFolder =
          await ApiService(endpoint).sendTx(transaction);
      if (sendFolder.status == 'ok') {
        print(files[i]);
        print(endpoint! +
            '/api/last_transaction/' +
            _address +
            '/content?mime=' +
            'TOTOOTOTOT____MIME');
        arrayFiles
            .add(uint8ListToHex(files[i]).substring(files[i].indexOf('/') + 1));
        arrayAddress.add(_address);
      }
    }

    for (int i = 0; i < arrayFiles.length; i++) {
      if (arrayFiles[i] == 'index.html') {
        crypto.Hmac hmac = crypto.Hmac(crypto.sha256, Uint8List.fromList(hexToUint8List(seed));
        crypto.Digest digest = hmac.convert('folder' + 'index.html');
        Uint8List _seed = Uint8List.fromList(digest.bytes);
        String _address = AddressService(endpoint).deriveAddress(
            uint8ListToHex(_seed), 0,
            curve: curve, hashAlgo: hashAlgo);
        Transaction txBuilder =
            Transaction(type: 'hosting', data: Transaction.initData());
        txBuilder.setContent(files[i]);
        Transaction lastTransaction =
            await ApiService(endpoint).getLastTransaction(_address);
        int index = lastTransaction.chainLength!;
        Transaction transaction =
            txBuilder.build(seed, index).originSign(originPrivateKey);
        TransactionStatus sendFolder =
            await ApiService(endpoint).sendTx(transaction);
        if (sendFolder.status == 'ok') {
          print('Check your website at-');
          print(endpoint! +
              '/api/last_transaction/' +
              _address +
              '/content?mime=' +
              'TOTOOTOTOT____MIME');
        }
      }
    }*/
  }*/
}
