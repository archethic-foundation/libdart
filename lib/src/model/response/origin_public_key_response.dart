// To parse this JSON data, do
//
//     final originPublicKeyResponse = originPublicKeyResponseFromJson(jsonString);

// Dart imports:
import 'dart:convert';

OriginPublicKeyResponse originPublicKeyResponseFromJson(String str) =>
    OriginPublicKeyResponse.fromJson(json.decode(str));

String originPublicKeyResponseToJson(OriginPublicKeyResponse data) =>
    json.encode(data.toJson());

class OriginPublicKeyResponse {
  OriginPublicKeyResponse({
    this.certificate,
    this.originPublicKey,
  });

  String? certificate;
  String? originPublicKey;

  factory OriginPublicKeyResponse.fromJson(Map<String, dynamic> json) =>
      OriginPublicKeyResponse(
        certificate: json['certificate'],
        originPublicKey: json['originPublicKey'],
      );

  Map<String, dynamic> toJson() => {
        'certificate': certificate,
        'originPublicKey': originPublicKey,
      };
}
