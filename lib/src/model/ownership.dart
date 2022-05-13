/// SPDX-License-Identifier: AGPL-3.0-or-later

// Project imports:
import 'package:archethic_lib_dart/src/model/authorized_key.dart';

/// [Ownership] represents a block to set a secret and the authorized public keys able to decrypt the secret
class Ownership {
  Ownership({
    this.authorizedPublicKeys,
    this.secret,
  });

  List<AuthorizedKey>? authorizedPublicKeys;
  String? secret;

  factory Ownership.fromJson(Map<String, dynamic> json) => Ownership(
        authorizedPublicKeys: json['authorizedPublicKeys'] == null
            ? null
            : List<AuthorizedKey>.from(
                json['authorizedPublicKeys'].map((dynamic x) => x)),
        secret: json['secret'],
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'authorizedPublicKeys': List<dynamic>.from(
            authorizedPublicKeys!.map((AuthorizedKey x) => x)),
        'secret': secret,
      };
}
