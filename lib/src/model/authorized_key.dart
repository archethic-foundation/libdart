/// [AuthorizedKey] represents a authorized public key with the encrypted secret key for this given key.
/// By decrypting this secret key, the authorized public key will be able to decrypt its related secret
class AuthorizedKey {
  AuthorizedKey({this.publicKey, this.encryptedSecretKey});

  String? publicKey;
  String? encryptedSecretKey;

  factory AuthorizedKey.fromJson(Map<String, dynamic> json) => AuthorizedKey(
      publicKey: json['publicKey'],
      encryptedSecretKey: json['encryptedSecretKey']);

  Map<String, dynamic> toJson() => {
        'publicKey': publicKey,
        'encryptedSecretKey': encryptedSecretKey,
      };
}
