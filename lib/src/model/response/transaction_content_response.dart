// To parse this JSON data, do
//
//     final transactionContentResponse = transactionContentResponseFromJson(jsonString);

// Dart imports:
import 'dart:convert';

TransactionContentResponse transactionContentResponseFromJson(String str) =>
    TransactionContentResponse.fromJson(json.decode(str));

String transactionContentResponseToJson(TransactionContentResponse data) =>
    json.encode(data.toJson());

class TransactionContentResponse {
  TransactionContentResponse({
    this.data,
    this.errors,
  });

  factory TransactionContentResponse.fromJson(Map<String, dynamic> json) =>
      TransactionContentResponse(
        data: json['data'] == null ? null : TransactionContentResponseData.fromJson(json['data']),
        errors: json['errors'] == null ? null : List<TransactionContentResponseDataError>.from(json['errors'].map((x) => TransactionContentResponseDataError.fromJson(x))),
      );

  TransactionContentResponseData? data;
  List<TransactionContentResponseDataError>? errors;

  Map<String, dynamic> toJson() => {
        'data': data!.toJson(),
        'errors': List<dynamic>.from(errors!.map((x) => x.toJson())),
      };
}

class TransactionContentResponseData {
  TransactionContentResponseData({
    this.transaction,
  });

  factory TransactionContentResponseData.fromJson(Map<String, dynamic> json) =>
      TransactionContentResponseData(
        transaction: Transaction.fromJson(json['transaction']),
      );

  Transaction? transaction;

  Map<String, dynamic> toJson() => {
        'transaction': transaction!.toJson(),
      };
}

class Transaction {
  Transaction({
    this.data,
  });

  factory Transaction.fromJson(Map<String, dynamic> json) => Transaction(
        data: TransactionData.fromJson(json['data']),
      );

  TransactionData? data;

  Map<String, dynamic> toJson() => {
        'data': data!.toJson(),
      };
}

class TransactionData {
  TransactionData({
    this.content,
  });

  factory TransactionData.fromJson(Map<String, dynamic> json) =>
      TransactionData(
        content: json['content'],
      );

  String? content;

  Map<String, dynamic> toJson() => {
        'content': content,
      };
}


class TransactionContentResponseDataError {
    TransactionContentResponseDataError({
        this.locations,
        this.message,
    });

    List<TransactionContentResponseDataErrorLocation>? locations;
    String? message;

    factory TransactionContentResponseDataError.fromJson(Map<String, dynamic> json) => TransactionContentResponseDataError(
        locations: List<TransactionContentResponseDataErrorLocation>.from(json['locations'].map((x) => TransactionContentResponseDataErrorLocation.fromJson(x))),
        message: json['message'],
    );

    Map<String, dynamic> toJson() => {
        'locations': List<dynamic>.from(locations!.map((x) => x.toJson())),
        'message': message,
    };
}

class TransactionContentResponseDataErrorLocation {
    TransactionContentResponseDataErrorLocation({
        this.column,
        this.line,
    });

    int? column;
    int? line;

    factory TransactionContentResponseDataErrorLocation.fromJson(Map<String, dynamic> json) => TransactionContentResponseDataErrorLocation(
        column: json['column'],
        line: json['line'],
    );

    Map<String, dynamic> toJson() => {
        'column': column,
        'line': line,
    };
}
