/// SPDX-License-Identifier: AGPL-3.0-or-later
/// Package archEthic aims to provide a easy way to create Archethic transaction and to send them over the network.
///
/// This implementation is based on Official Archethic Javascript library for Node and Browser.
class Service {
  Service({this.derivationPath, this.curve, this.hashAlgo});

  String? derivationPath;
  String? curve;
  String? hashAlgo;

  factory Service.fromJson(Map<String, dynamic> json) => Service(
        derivationPath: json['derivationPath'],
        curve: json['curve'],
        hashAlgo: json['hashAlgo'],
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'derivationPath': derivationPath,
        'curve': curve,
        'hashAlgo': hashAlgo,
      };
}
