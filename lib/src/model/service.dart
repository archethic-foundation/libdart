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

  Map<String, dynamic> toJson() => {
        'derivationPath': derivationPath,
        'curve': curve,
        'hashAlgo': hashAlgo,
      };
}
