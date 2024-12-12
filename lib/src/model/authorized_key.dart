import 'package:freezed_annotation/freezed_annotation.dart';

part 'authorized_key.freezed.dart';
part 'authorized_key.g.dart';

/// [AuthorizedKey] represents a authorized public key with the encrypted secret key for this given key.
/// By decrypting this secret key, the authorized public key will be able to decrypt its related secret
@freezed
class AuthorizedKey with _$AuthorizedKey {
  const factory AuthorizedKey({
    String? publicKey,
    String? encryptedSecretKey,
  }) = _AuthorizedKey;
  const AuthorizedKey._();

  factory AuthorizedKey.fromJson(Map<String, dynamic> json) =>
      _$AuthorizedKeyFromJson(json);
}
