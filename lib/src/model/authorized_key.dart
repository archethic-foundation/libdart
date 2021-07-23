/// [AuthorizedKey] represents list of public keys with the encrypted secret for this given key.
/// By decrypting this secret keys, the authorized public keys will be able to decrypt the secret
class AuthorizedKey {
  AuthorizedKey({
    this.encryptedKey,
    this.publicKey,
  });

  String? encryptedKey;
  String? publicKey;

  factory AuthorizedKey.fromJson(Map<String, dynamic> json) => AuthorizedKey(
        encryptedKey: json['encryptedKey'],
        publicKey: json['publicKey'],
      );

  Map<String, dynamic> toJson() => {
        'encryptedKey': encryptedKey,
        'publicKey': publicKey,
      };
}
