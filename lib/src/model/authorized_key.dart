/// SPDX-License-Identifier: AGPL-3.0-or-later

/// [AuthorizedKey] represents a authorized public key with the encrypted secret key for this given key.
/// By decrypting this secret key, the authorized public key will be able to decrypt its related secret
class AuthorizedKey {
  AuthorizedKey({this.publicKey, this.encryptedSecretKey});

  factory AuthorizedKey.fromJson(Map<String, dynamic> json) => AuthorizedKey(
      publicKey: json['publicKey'],
      encryptedSecretKey: json['encryptedSecretKey'],);

  Map<String, dynamic> toJson() => <String, dynamic>{
        'publicKey': publicKey,
        'encryptedSecretKey': encryptedSecretKey,
      };

  String? publicKey;
  String? encryptedSecretKey;
}
