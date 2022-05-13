/// SPDX-License-Identifier: AGPL-3.0-or-later

class Uco {
  Uco({
    this.eur,
    this.usd,
  });

  double? eur;
  double? usd;

  factory Uco.fromJson(Map<String, dynamic> json) => Uco(
        eur: json['eur']?.toDouble(),
        usd: json['usd']?.toDouble(),
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'eur': eur,
        'usd': usd,
      };
}
