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
        data: BalanceResponseData.fromJson(json['data']),
      );

  BalanceResponseData? data;

  Map<String, dynamic> toJson() => {
        'data': data!.toJson(),
      };
}

class BalanceResponseData {
  BalanceResponseData({
    this.balance,
  });

  factory BalanceResponseData.fromJson(Map<String, dynamic> json) =>
      BalanceResponseData(
        balance: BalanceResponseDataBalance.fromJson(json['balance']),
      );

  BalanceResponseDataBalance? balance;

  Map<String, dynamic> toJson() => {
        'balance': balance!.toJson(),
      };
}

class BalanceResponseDataBalance {
  BalanceResponseDataBalance({
    this.nft,
    this.uco,
  });

  factory BalanceResponseDataBalance.fromJson(Map<String, dynamic> json) =>
      BalanceResponseDataBalance(
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
