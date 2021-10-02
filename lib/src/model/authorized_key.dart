import 'dart:convert';

/// [AuthorizedKey] represents list of public keys with the encrypted secret for this given key.
/// By decrypting this secret keys, the authorized public keys will be able to decrypt the secret
class AuthorizedKey {
  AuthorizedKey({
    this.authorizedKey
  });

  Map<String, String>? authorizedKey;

  Map<String, String> authorizedKeyFromJson(String str) =>
      Map.from(json.decode(str)).map((k, v) => MapEntry<String, String>(k, v));

  String authorizedKeyToJson(Map<String, String> data) =>
      json.encode(Map.from(data).map((k, v) => MapEntry<String, String>(k, v)));

  factory AuthorizedKey.fromJson(Map<String, dynamic> json) => AuthorizedKey(
        authorizedKey: json['encryptedKey'],
      );

  Map<String, dynamic> toJson() => {
        'encryptedKey': authorizedKey,
      };
}
