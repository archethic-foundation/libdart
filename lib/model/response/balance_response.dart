// To parse this JSON data, do
//
//     final balanceResponse = balanceResponseFromJson(jsonString);

import 'dart:convert';

BalanceResponse balanceResponseFromJson(String str) => BalanceResponse.fromJson(json.decode(str));

String balanceResponseToJson(BalanceResponse data) => json.encode(data.toJson());

class BalanceResponse {
    BalanceResponse({
        this.uco,
        this.nft,
    });

    double? uco;
    BalanceResponseNft? nft;

    factory BalanceResponse.fromJson(Map<String, dynamic> json) => BalanceResponse(
        uco: json["uco"].toDouble(),
        nft: BalanceResponseNft.fromJson(json["nft"]),
    );

    Map<String, dynamic> toJson() => {
        "uco": uco,
        "nft": nft!.toJson(),
    };
}

class BalanceResponseNft {
    BalanceResponseNft({
        this.address,
        this.amount,
    });

    String? address;
    double? amount;

    factory BalanceResponseNft.fromJson(Map<String, dynamic> json) => BalanceResponseNft(
        address: json["address"],
        amount: json["amount"].toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "address": address,
        "amount": amount,
    };
}
