class Node {
  Node({
    this.authorized,
    this.available,
    this.averageAvailability,
    this.firstPublicKey,
    this.geoPatch,
    this.ip,
    this.lastPublicKey,
    this.networkPatch,
    this.port,
    this.rewardAddress,
    this.authorizationDate,
    this.enrollmentDate
  });

  factory Node.fromJson(Map<String, dynamic> json) => Node(
        authorized: json['authorized'],
        available: json['available'],
        averageAvailability: json['averageAvailability'] == null
            ? null
            : json['averageAvailability'].toDouble(),
        firstPublicKey: json['firstPublicKey'],
        geoPatch: json['geoPatch'],
        ip: json['ip'],
        lastPublicKey: json['lastPublicKey'],
        networkPatch: json['networkPatch'],
        port: json['port'],
        rewardAddress: json['rewardAddress'],
        authorizationDate: json['authorizationDate'],
        enrollmentDate: json['enrollmentDate']
      );

  bool? authorized;
  bool? available;
  double? averageAvailability;
  String? firstPublicKey;
  String? geoPatch;
  String? ip;
  String? lastPublicKey;
  String? networkPatch;
  int? port;
  String? rewardAddress;
  int? enrollmentDate;
  int? authorizationDate;

  Map<String, dynamic> toJson() => {
        'authorized': authorized,
        'available': available,
        'averageAvailability': averageAvailability,
        'firstPublicKey': firstPublicKey,
        'geoPatch': geoPatch,
        'ip': ip,
        'lastPublicKey': lastPublicKey,
        'networkPatch': networkPatch,
        'port': port,
        'rewardAddress': rewardAddress,
        'authorizationDate': authorizationDate,
        'enrollmentDate': enrollmentDate,
      };
}
