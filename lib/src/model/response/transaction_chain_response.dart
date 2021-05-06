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
    Data? data;

    factory TransactionChainResponse.fromJson(Map<String, dynamic> json) => TransactionChainResponse(
        address: json["address"],
        timestamp: json["timestamp"].toDouble(),
        type: json["type"],
        data: Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "address": address,
        "timestamp": timestamp,
        "type": type,
        "data": data!.toJson(),
    };
}

class Data {
    Data({
        this.ledger,
    });

    Ledger? ledger;

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        ledger: Ledger.fromJson(json["ledger"]),
    );

    Map<String, dynamic> toJson() => {
        "ledger": ledger!.toJson(),
    };
}

class Ledger {
    Ledger({
        this.uco,
        this.nft,
    });

    Uco? uco;
    Nft? nft;

    factory Ledger.fromJson(Map<String, dynamic> json) => Ledger(
        uco: Uco.fromJson(json["uco"]),
        nft: Nft.fromJson(json["nft"]),
    );

    Map<String, dynamic> toJson() => {
        "uco": uco!.toJson(),
        "nft": nft!.toJson(),
    };
}

class Nft {
    Nft({
        this.transfers,
    });

    NftTransfers? transfers;

    factory Nft.fromJson(Map<String, dynamic> json) => Nft(
        transfers: NftTransfers.fromJson(json["transfers"]),
    );

    Map<String, dynamic> toJson() => {
        "transfers": transfers!.toJson(),
    };
}

class NftTransfers {
    NftTransfers({
        this.amount,
        this.to,
        this.nft,
    });

    double? amount;
    String? to;
    String? nft;

    factory NftTransfers.fromJson(Map<String, dynamic> json) => NftTransfers(
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

class Uco {
    Uco({
        this.transfers,
    });

    UcoTransfers? transfers;

    factory Uco.fromJson(Map<String, dynamic> json) => Uco(
        transfers: UcoTransfers.fromJson(json["transfers"]),
    );

    Map<String, dynamic> toJson() => {
        "transfers": transfers!.toJson(),
    };
}

class UcoTransfers {
    UcoTransfers({
        this.amount,
        this.to,
    });

    double? amount;
    String? to;

    factory UcoTransfers.fromJson(Map<String, dynamic> json) => UcoTransfers(
        amount: json["amount"].toDouble(),
        to: json["to"],
    );

    Map<String, dynamic> toJson() => {
        "amount": amount,
        "to": to,
    };
}
