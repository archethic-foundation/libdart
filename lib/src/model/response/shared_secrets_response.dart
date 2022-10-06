/// SPDX-License-Identifier: AGPL-3.0-or-later

// To parse this JSON data, do
//
//     final sharedSecretsResponse = sharedSecretsResponseFromJson(jsonString);

// Dart imports:
import 'dart:convert';

// Project imports:
import 'package:archethic_lib_dart/src/model/errors.dart';
import 'package:archethic_lib_dart/src/model/shared_secrets.dart';

SharedSecretsResponse sharedSecretsResponseFromJson(String str) =>
    SharedSecretsResponse.fromJson(json.decode(str));

String sharedSecretsResponseToJson(SharedSecretsResponse data) =>
    json.encode(data.toJson());

class SharedSecretsResponse {
  SharedSecretsResponse({
    this.data,
    this.errors,
  });

  factory SharedSecretsResponse.fromJson(Map<String, dynamic> json) =>
      SharedSecretsResponse(
        data:
            json['data'] == null ? null : SharedSecrets.fromJson(json['data']),
        errors: json['errors'] == null
            ? null
            : List<Errors>.from(
                json['errors'].map(Errors.fromJson),
              ),
      );

  SharedSecrets? data;
  List<Errors>? errors;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'data': data!.toJson(),
        'errors': List<dynamic>.from(errors!.map((Errors x) => x.toJson())),
      };
}
