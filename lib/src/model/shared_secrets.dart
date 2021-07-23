/// [SharedSecrets] represents the public shared secret information
class SharedSecrets {
  SharedSecrets({
    this.storageNoncePublicKey,
  });

  /// The storage nonce public key: Public Key to encrypt data for the node,
  /// so they will be able to decrypt it (mostly for smart contract authorized key)
  String? storageNoncePublicKey;

  factory SharedSecrets.fromJson(Map<String, dynamic> json) => SharedSecrets(
        storageNoncePublicKey: json['storageNoncePublicKey'],
      );

  Map<String, dynamic> toJson() => {
        'storageNoncePublicKey': storageNoncePublicKey,
      };
}
