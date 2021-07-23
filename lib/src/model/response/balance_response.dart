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
    this.errors,
  });

  factory BalanceResponse.fromJson(Map<String, dynamic> json) =>
      BalanceResponse(
        data: json['data'] == null
            ? null
            : BalanceResponseData.fromJson(json['data']),
        errors: json['errors'] == null
            ? null
            : List<BalanceResponseDataError>.from(json['errors']
                .map((x) => BalanceResponseDataError.fromJson(x))),
      );

  BalanceResponseData? data;
  List<BalanceResponseDataError>? errors;

  Map<String, dynamic> toJson() => {
        'data': data!.toJson(),
        'errors': List<dynamic>.from(errors!.map((x) => x.toJson())),
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

class BalanceResponseDataError {
  BalanceResponseDataError({
    this.locations,
    this.message,
  });

  List<BalanceResponseDataErrorLocation>? locations;
  String? message;

  factory BalanceResponseDataError.fromJson(Map<String, dynamic> json) =>
      BalanceResponseDataError(
        locations: List<BalanceResponseDataErrorLocation>.from(json['locations']
            .map((x) => BalanceResponseDataErrorLocation.fromJson(x))),
        message: json['message'],
      );

  Map<String, dynamic> toJson() => {
        'locations': List<dynamic>.from(locations!.map((x) => x.toJson())),
        'message': message,
      };
}

class BalanceResponseDataErrorLocation {
  BalanceResponseDataErrorLocation({
    this.column,
    this.line,
  });

  int? column;
  int? line;

  factory BalanceResponseDataErrorLocation.fromJson(
          Map<String, dynamic> json) =>
      BalanceResponseDataErrorLocation(
        column: json['column'],
        line: json['line'],
      );

  Map<String, dynamic> toJson() => {
        'column': column,
        'line': line,
      };
}
