/// SPDX-License-Identifier: AGPL-3.0-or-later

// To parse this JSON data, do
//
//     final tokenResponse = tokenResponseFromJson(jsonString);

// Dart imports:
import 'dart:convert';

// Project imports:
import 'package:archethic_lib_dart/src/model/errors.dart';
import 'package:archethic_lib_dart/src/model/token.dart';

TokenResponse tokenResponseFromJson(String str) =>
    TokenResponse.fromJson(json.decode(str));

String tokenResponseToJson(TokenResponse data) => json.encode(data.toJson());

class TokenResponse {
  TokenResponse({this.data, this.errors});

  Data? data;
  List<Errors>? errors;

  factory TokenResponse.fromJson(Map<String, dynamic> json) => TokenResponse(
        data: json['data'] == null ? null : Data.fromJson(json['data']),
        errors: json['errors'] == null
            ? null
            : List<Errors>.from(
                json['errors'].map((dynamic x) => Errors.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        'data': data!.toJson(),
        'errors': List<dynamic>.from(errors!.map((Errors x) => x.toJson())),
      };
}

class Data {
  Data({
    this.token,
  });

  Token? token;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        token: Token.fromJson(json['token']),
      );

  Map<String, dynamic> toJson() => {
        'token': token!.toJson(),
      };
}
