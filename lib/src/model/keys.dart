// Project imports:
import 'package:archethic_lib_dart/src/model/authorized_key.dart';

/// [Keys] represents a block to set secret and authorized public keys able to read the secret
class Keys {
  Keys({
    this.authorizedKeys,
    this.secrets,
  });

  List<Map<String, String>>? authorizedKeys;
  List<String>? secrets;

  factory Keys.fromJson(Map<String, dynamic> json) => Keys(
        authorizedKeys: json['authorizedKeys'] == null
            ? null
            : List<Map<String, String>>.from(
                json['authorizedKeys'].map((x) => AuthorizedKey.fromJson(x))),
        secrets: json['secrets'] == null
            ? null
            : List<String>.from(json["secrets"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        'authorizedKeys':
            List<dynamic>.from(authorizedKeys!.map((x) => x)),
        'secrets': List<dynamic>.from(secrets!.map((x) => x)),
      };
}
