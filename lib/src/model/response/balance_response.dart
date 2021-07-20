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
    this.data,
  });

  factory BalanceResponse.fromJson(Map<String, dynamic> json) =>
      BalanceResponse(
        data: Data.fromJson(json['data']),
      );

  Data? data;

  Map<String, dynamic> toJson() => {
        'data': data!.toJson(),
      };
}

class Data {
  Data({
    this.balance,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        balance: Balance.fromJson(json['balance']),
      );

  Balance? balance;

  Map<String, dynamic> toJson() => {
        'balance': balance!.toJson(),
      };
}

class Balance {
  Balance({
    this.nft,
    this.uco,
  });

  factory Balance.fromJson(Map<String, dynamic> json) => Balance(
        nft: List<dynamic>.from(json['nft'].map((x) => x)),
        uco: json['uco'].toDouble(),
      );

  List<dynamic>? nft;
  double? uco;

  Map<String, dynamic> toJson() => {
        'nft': List<dynamic>.from(nft!.map((x) => x)),
        'uco': uco,
      };
}
