// Project imports:
import 'package:archethic_lib_dart/src/model/authorized_key.dart';

/// [Keys] represents a block to set secret and authorized public keys able to read the secret
class Keys {
  Keys({
    this.authorizedKeys,
    this.secret,
  });

  List<AuthorizedKey>? authorizedKeys;
  String? secret;

  factory Keys.fromJson(Map<String, dynamic> json) => Keys(
        authorizedKeys: json['authorizedKeys'] == null
            ? null
            : List<AuthorizedKey>.from(
                json['authorizedKeys'].map((x) => AuthorizedKey.fromJson(x))),
        secret: json['secret'],
      );

  Map<String, dynamic> toJson() => {
        'authorizedKeys':
            List<dynamic>.from(authorizedKeys!.map((x) => x.toJson())),
        'secret': secret,
      };
}
