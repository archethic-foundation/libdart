/// SPDX-License-Identifier: AGPL-3.0-or-later

// Project imports:
import 'package:archethic_lib_dart/src/model/location.dart';

class Error {
  Error({
    this.locations,
    this.message,
    this.path,
  });

  List<Location>? locations;
  String? message;
  List<String>? path;

  factory Error.fromJson(Map<String, dynamic> json) => Error(
        locations: json['locations'] == null
            ? null
            : List<Location>.from(
                json['locations'].map((dynamic x) => Location.fromJson(x))),
        message: json['message'],
        path: json['path'] == null
            ? null
            : List<String>.from(json['path'].map((dynamic x) => x)),
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'locations':
            List<dynamic>.from(locations!.map((Location x) => x.toJson())),
        'message': message,
        'path': List<dynamic>.from(path!.map((String x) => x)),
      };
}
