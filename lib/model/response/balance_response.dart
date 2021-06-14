// To parse this JSON data, do
//
//     final balanceResponse = balanceResponseFromJson(jsonString);

// Dart imports:
import 'dart:convert';

BalanceResponse balanceResponseFromJson(String str) =>
    BalanceResponse.fromJson(json.decode(str));

String balanceResponseToJson(BalanceResponse data) =>
    json.encode(data.toJson());

class BalanceResponse {
  BalanceResponse({
    this.uco,
    this.nft,
  });

  factory BalanceResponse.fromJson(Map<String, dynamic> json) =>
      BalanceResponse(
        uco: json['uco'].toDouble(),
        nft: BalanceResponseNft.fromJson(json['nft']),
      );

  double? uco;
  BalanceResponseNft? nft;

  Map<String, dynamic> toJson() => {
        'uco': uco,
        'nft': nft!.toJson(),
      };
}

class BalanceResponseNft {
  BalanceResponseNft({
    this.address,
    this.amount,
  });

  factory BalanceResponseNft.fromJson(Map<String, dynamic> json) =>
      BalanceResponseNft(
        address: json['address'],
        amount: json['amount'].toDouble(),
      );

  String? address;
  double? amount;

  Map<String, dynamic> toJson() => {
        'address': address,
        'amount': amount,
      };
}
