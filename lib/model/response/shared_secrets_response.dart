// To parse this JSON data, do
//
//     final sharedSecretsResponse = sharedSecretsResponseFromJson(jsonString);

// Dart imports:
import 'dart:convert';

SharedSecretsResponse sharedSecretsResponseFromJson(String str) =>
    SharedSecretsResponse.fromJson(json.decode(str));

String sharedSecretsResponseToJson(SharedSecretsResponse data) =>
    json.encode(data.toJson());

class SharedSecretsResponse {
  SharedSecretsResponse({
    this.data,
  });

  Data? data;

  factory SharedSecretsResponse.fromJson(Map<String, dynamic> json) =>
      SharedSecretsResponse(
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data!.toJson(),
      };
}

class Data {
  Data({
    this.sharedSecrets,
  });

  SharedSecrets? sharedSecrets;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        sharedSecrets: SharedSecrets.fromJson(json["sharedSecrets"]),
      );

  Map<String, dynamic> toJson() => {
        "sharedSecrets": sharedSecrets!.toJson(),
      };
}

class SharedSecrets {
  SharedSecrets({
    this.storageNoncePublicKey,
  });

  String? storageNoncePublicKey;

  factory SharedSecrets.fromJson(Map<String, dynamic> json) => SharedSecrets(
        storageNoncePublicKey: json["storageNoncePublicKey"],
      );

  Map<String, dynamic> toJson() => {
        "storageNoncePublicKey": storageNoncePublicKey,
      };
}
