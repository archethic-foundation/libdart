// Project imports:
import 'package:archethic_lib_dart/src/model/authorized_key.dart';

/// [Ownership] represents a block to set secrets and authorized public keys able to read the secrets
class Ownership {
  Ownership({
    this.authorizedPublicKeys,
    this.secrets,
  });

  List<AuthorizedKey>? authorizedPublicKeys;
  List<String>? secrets;

  factory Ownership.fromJson(Map<String, dynamic> json) => Ownership(
        authorizedPublicKeys: json['authorizedPublicKeys'] == null
            ? null
            : List<AuthorizedKey>.from(json['authorizedPublicKeys'].map((x) => x)),
        secrets: json['secrets'] == null
            ? null
            : List<String>.from(json["secrets"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        'authorizedPublicKeys':
            List<dynamic>.from(authorizedPublicKeys!.map((x) => x)),
        'secrets': List<dynamic>.from(secrets!.map((x) => x)),
      };
}
