// To parse this JSON data, do
//
//     final transactionLastResponse = transactionLastResponseFromJson(jsonString);

// Dart imports:
import 'dart:convert';

TransactionLastResponse transactionLastResponseFromJson(String str) =>
    TransactionLastResponse.fromJson(json.decode(str));

String transactionLastResponseToJson(TransactionLastResponse data) =>
    json.encode(data.toJson());

class TransactionLastResponse {
  TransactionLastResponse({
    this.data,
    this.errors,
  });

  factory TransactionLastResponse.fromJson(Map<String, dynamic> json) =>
      TransactionLastResponse(
        data: TransactionLastData.fromJson(json['data']),
        errors: json['errors'] == null ? null : List<TransactionLastDataError>.from(json['errors'].map((x) => TransactionLastDataError.fromJson(x))),
      );

  TransactionLastData? data;
  List<TransactionLastDataError>? errors;

  Map<String, dynamic> toJson() => {
        'data': data!.toJson(),
        'errors': List<dynamic>.from(errors!.map((x) => x.toJson())),
      };
}

class TransactionLastData {
  TransactionLastData({
    this.lastTransaction,
  });

  factory TransactionLastData.fromJson(Map<String, dynamic> json) =>
      TransactionLastData(
        lastTransaction: LastTransaction.fromJson(json['lastTransaction']),
      );

  LastTransaction? lastTransaction;

  Map<String, dynamic> toJson() => {
        'lastTransaction': lastTransaction!.toJson(),
      };
}

class LastTransaction {
  LastTransaction({
    this.chainLength,
  });

  factory LastTransaction.fromJson(Map<String, dynamic> json) =>
      LastTransaction(
        chainLength: json['chainLength'],
      );

  int? chainLength;

  Map<String, dynamic> toJson() => {
        'chainLength': chainLength,
      };
}

class TransactionLastDataError {
    TransactionLastDataError({
        this.locations,
        this.message,
        this.path,
    });

    List<TransactionLastDataErrorLocation>? locations;
    String? message;
    List<String>? path;

    factory TransactionLastDataError.fromJson(Map<String, dynamic> json) => TransactionLastDataError(
        locations: List<TransactionLastDataErrorLocation>.from(json['locations'].map((x) => TransactionLastDataErrorLocation.fromJson(x))),
        message: json['message'],
        path: List<String>.from(json['path'].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        'locations': List<dynamic>.from(locations!.map((x) => x.toJson())),
        'message': message,
        'path': List<dynamic>.from(path!.map((x) => x)),
    };
}


class TransactionLastDataErrorLocation {
    TransactionLastDataErrorLocation({
        this.column,
        this.line,
    });

    int? column;
    int? line;

    factory TransactionLastDataErrorLocation.fromJson(Map<String, dynamic> json) => TransactionLastDataErrorLocation(
        column: json['column'],
        line: json['line'],
    );

    Map<String, dynamic> toJson() => {
        'column': column,
        'line': line,
    };
}
