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
    Nft? nft;

    factory BalanceResponse.fromJson(Map<String, dynamic> json) => BalanceResponse(
        uco: json["uco"].toDouble(),
        nft: Nft.fromJson(json["nft"]),
    );

    Map<String, dynamic> toJson() => {
        "uco": uco,
        "nft": nft!.toJson(),
    };
}

class Nft {
    Nft({
        this.address,
        this.amount,
    });

    String? address;
    double? amount;

    factory Nft.fromJson(Map<String, dynamic> json) => Nft(
        address: json["address"],
        amount: json["amount"].toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "address": address,
        "amount": amount,
    };
}
