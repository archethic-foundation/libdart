/// SPDX-License-Identifier: AGPL-3.0-or-later

// To parse this JSON data, do
//
//     final originKey = originKeyFromJson(jsonString);

// Dart imports:
import 'dart:convert';

OriginKeyResponse originKeyResponseFromJson(String str) =>
    OriginKeyResponse.fromJson(json.decode(str));

String originKeyResponseToJson(OriginKeyResponse data) =>
    json.encode(data.toJson());

class OriginKeyResponse {
  OriginKeyResponse({
    this.encryptedOriginPrivateKeys,
    this.encryptedSecretKey,
  });

  String? encryptedOriginPrivateKeys;
  String? encryptedSecretKey;

  factory OriginKeyResponse.fromJson(Map<String, dynamic> json) =>
      OriginKeyResponse(
        encryptedOriginPrivateKeys: json['encrypted_origin_private_keys'],
        encryptedSecretKey: json['encrypted_secret_key'],
      );

  Map<String, dynamic> toJson() => {
        'encrypted_origin_private_keys': encryptedOriginPrivateKeys,
        'encrypted_secret_key': encryptedSecretKey,
      };
}
