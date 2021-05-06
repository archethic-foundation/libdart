// To parse this JSON data, do
//
//     final transactionChainResponse = transactionChainResponseFromJson(jsonString);

import 'dart:convert';

TransactionChainResponse transactionChainResponseFromJson(String str) => TransactionChainResponse.fromJson(json.decode(str));

String transactionChainResponseToJson(TransactionChainResponse data) => json.encode(data.toJson());

class TransactionChainResponse {
    TransactionChainResponse({
        this.address,
        this.timestamp,
        this.type,
        this.data,
    });

    String? address;
    double? timestamp;
    String? type;
    TransactionChainResponseData? data;

    factory TransactionChainResponse.fromJson(Map<String, dynamic> json) => TransactionChainResponse(
        address: json["address"],
        timestamp: json["timestamp"].toDouble(),
        type: json["type"],
        data: TransactionChainResponseData.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "address": address,
        "timestamp": timestamp,
        "type": type,
        "data": data!.toJson(),
    };
}

class TransactionChainResponseData {
    TransactionChainResponseData({
        this.ledger,
    });

    TransactionChainResponseLedger? ledger;

    factory TransactionChainResponseData.fromJson(Map<String, dynamic> json) => TransactionChainResponseData(
        ledger: TransactionChainResponseLedger.fromJson(json["ledger"]),
    );

    Map<String, dynamic> toJson() => {
        "ledger": ledger!.toJson(),
    };
}

class TransactionChainResponseLedger {
    TransactionChainResponseLedger({
        this.uco,
        this.nft,
    });

    TransactionChainResponseUco? uco;
    TransactionChainResponseNft? nft;

    factory TransactionChainResponseLedger.fromJson(Map<String, dynamic> json) => TransactionChainResponseLedger(
        uco: TransactionChainResponseUco.fromJson(json["uco"]),
        nft: TransactionChainResponseNft.fromJson(json["nft"]),
    );

    Map<String, dynamic> toJson() => {
        "uco": uco!.toJson(),
        "nft": nft!.toJson(),
    };
}

class TransactionChainResponseNft {
    TransactionChainResponseNft({
        this.transfers,
    });

    TransactionChainResponseNftTransfers? transfers;

    factory TransactionChainResponseNft.fromJson(Map<String, dynamic> json) => TransactionChainResponseNft(
        transfers: TransactionChainResponseNftTransfers.fromJson(json["transfers"]),
    );

    Map<String, dynamic> toJson() => {
        "transfers": transfers!.toJson(),
    };
}

class TransactionChainResponseNftTransfers {
    TransactionChainResponseNftTransfers({
        this.amount,
        this.to,
        this.nft,
    });

    double? amount;
    String? to;
    String? nft;

    factory TransactionChainResponseNftTransfers.fromJson(Map<String, dynamic> json) => TransactionChainResponseNftTransfers(
        amount: json["amount"].toDouble(),
        to: json["to"],
        nft: json["nft"],
    );

    Map<String, dynamic> toJson() => {
        "amount": amount,
        "to": to,
        "nft": nft,
    };
}

class TransactionChainResponseUco {
    TransactionChainResponseUco({
        this.transfers,
    });

    TransactionChainResponseUcoTransfers? transfers;

    factory TransactionChainResponseUco.fromJson(Map<String, dynamic> json) => TransactionChainResponseUco(
        transfers: TransactionChainResponseUcoTransfers.fromJson(json["transfers"]),
    );

    Map<String, dynamic> toJson() => {
        "transfers": transfers!.toJson(),
    };
}

class TransactionChainResponseUcoTransfers {
    TransactionChainResponseUcoTransfers({
        this.amount,
        this.to,
    });

    double? amount;
    String? to;

    factory TransactionChainResponseUcoTransfers.fromJson(Map<String, dynamic> json) => TransactionChainResponseUcoTransfers(
        amount: json["amount"].toDouble(),
        to: json["to"],
    );

    Map<String, dynamic> toJson() => {
        "amount": amount,
        "to": to,
    };
}
