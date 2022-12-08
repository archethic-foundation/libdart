/// SPDX-License-Identifier: AGPL-3.0-or-later

import 'package:freezed_annotation/freezed_annotation.dart';

/// [SharedSecrets] represents the public shared secret information
part 'shared_secrets.freezed.dart';
part 'shared_secrets.g.dart';

@freezed
class SharedSecrets with _$SharedSecrets {
  const factory SharedSecrets({
    /// The storage nonce public key: Public Key to encrypt data for the node,
    /// so they will be able to decrypt it (mostly for smart contract authorized key)
    String? storageNoncePublicKey,
  }) = _SharedSecrets;
  const SharedSecrets._();

  factory SharedSecrets.fromJson(Map<String, dynamic> json) =>
      _$SharedSecretsFromJson(json);
}
