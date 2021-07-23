// To parse this JSON data, do
//
//     final transactionsResponse = transactionsResponseFromJson(jsonString);

// Dart imports:
import 'dart:convert';

TransactionsResponse transactionsResponseFromJson(String str) =>
    TransactionsResponse.fromJson(json.decode(str));

String transactionsResponseToJson(TransactionsResponse data) =>
    json.encode(data.toJson());

class TransactionsResponse {
  TransactionsResponse({this.data, this.errors});

  factory TransactionsResponse.fromJson(Map<String, dynamic> json) =>
      TransactionsResponse(
        data: json['data'] == null
            ? null
            : TransactionsResponseData.fromJson(json['data']),
        errors: json["errors"] == null
            ? null
            : List<TransactionsResponseDataError>.from(json["errors"]
                .map((x) => TransactionsResponseDataError.fromJson(x))),
      );

  TransactionsResponseData? data;
  List<TransactionsResponseDataError>? errors;

  Map<String, dynamic> toJson() => {
        'data': data!.toJson(),
        "errors": List<dynamic>.from(errors!.map((x) => x.toJson())),
      };
}

class TransactionsResponseData {
  TransactionsResponseData({
    this.transactionChain,
  });

  factory TransactionsResponseData.fromJson(Map<String, dynamic> json) =>
      TransactionsResponseData(
        transactionChain: List<TransactionChain>.from(
            json['transactionChain'].map((x) => TransactionChain.fromJson(x))),
      );

  List<TransactionChain>? transactionChain;

  Map<String, dynamic> toJson() => {
        'transactionChain':
            List<dynamic>.from(transactionChain!.map((x) => x.toJson())),
      };
}

class TransactionChain {
  TransactionChain({
    this.address,
    this.data,
    this.type,
  });

  factory TransactionChain.fromJson(Map<String, dynamic> json) =>
      TransactionChain(
        address: json['address'],
        data: TransactionChainData.fromJson(json['data']),
        type: json['type'],
      );

  String? address;
  TransactionChainData? data;
  String? type;

  Map<String, dynamic> toJson() => {
        'address': address,
        'data': data!.toJson(),
        'type': type,
      };
}

class TransactionChainData {
  TransactionChainData({
    this.ledger,
  });

  factory TransactionChainData.fromJson(Map<String, dynamic> json) =>
      TransactionChainData(
        ledger: TransactionChainDataLedger.fromJson(json['ledger']),
      );

  TransactionChainDataLedger? ledger;

  Map<String, dynamic> toJson() => {
        'ledger': ledger!.toJson(),
      };
}

class TransactionChainDataLedger {
  TransactionChainDataLedger({
    this.nft,
    this.uco,
  });

  factory TransactionChainDataLedger.fromJson(Map<String, dynamic> json) =>
      TransactionChainDataLedger(
        nft: TransactionChainDataLedgerNft.fromJson(json['nft']),
        uco: TransactionChainDataLedgerUco.fromJson(json['uco']),
      );

  TransactionChainDataLedgerNft? nft;
  TransactionChainDataLedgerUco? uco;

  Map<String, dynamic> toJson() => {
        'nft': nft!.toJson(),
        'uco': uco!.toJson(),
      };
}

class TransactionChainDataLedgerNft {
  TransactionChainDataLedgerNft({
    this.transfers,
  });

  factory TransactionChainDataLedgerNft.fromJson(Map<String, dynamic> json) =>
      TransactionChainDataLedgerNft(
        transfers: List<dynamic>.from(json['transfers'].map((x) => x)),
      );

  List<dynamic>? transfers;

  Map<String, dynamic> toJson() => {
        'transfers': List<dynamic>.from(transfers!.map((x) => x)),
      };
}

class TransactionChainDataLedgerUco {
  TransactionChainDataLedgerUco({
    this.transfers,
  });

  factory TransactionChainDataLedgerUco.fromJson(Map<String, dynamic> json) =>
      TransactionChainDataLedgerUco(
        transfers: List<dynamic>.from(json['transfers'].map((x) => x)),
      );

  List<dynamic>? transfers;

  Map<String, dynamic> toJson() => {
        'transfers': List<dynamic>.from(transfers!.map((x) => x)),
      };
}

class TransactionsResponseDataError {
  TransactionsResponseDataError({
    this.locations,
    this.message,
  });

  List<TransactionsResponseDataErrorLocation>? locations;
  String? message;

  factory TransactionsResponseDataError.fromJson(Map<String, dynamic> json) =>
      TransactionsResponseDataError(
        locations: List<TransactionsResponseDataErrorLocation>.from(
            json["locations"]
                .map((x) => TransactionsResponseDataErrorLocation.fromJson(x))),
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "locations": List<dynamic>.from(locations!.map((x) => x.toJson())),
        "message": message,
      };
}

class TransactionsResponseDataErrorLocation {
  TransactionsResponseDataErrorLocation({
    this.column,
    this.line,
  });

  int? column;
  int? line;

  factory TransactionsResponseDataErrorLocation.fromJson(
          Map<String, dynamic> json) =>
      TransactionsResponseDataErrorLocation(
        column: json["column"],
        line: json["line"],
      );

  Map<String, dynamic> toJson() => {
        "column": column,
        "line": line,
      };
}
