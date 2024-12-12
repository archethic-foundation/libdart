// SPDX-License-Identifier: AGPL-3.0-or-later

import 'package:archethic_lib_dart/src/model/authorized_key.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'ownership.freezed.dart';
part 'ownership.g.dart';

/// [Ownership] represents a block to set a secret and the authorized public keys able to decrypt the secret
@freezed
class Ownership with _$Ownership {
  const factory Ownership({
    @Default([]) final List<AuthorizedKey> authorizedPublicKeys,
    String? secret,
  }) = _Ownership;
  const Ownership._();

  factory Ownership.fromJson(Map<String, dynamic> json) =>
      _$OwnershipFromJson(json);
}
