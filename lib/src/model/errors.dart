/// SPDX-License-Identifier: AGPL-3.0-or-later
import 'package:archethic_lib_dart/src/model/error.dart';

class Errors {
  Errors({
    required this.errors,
  });

  List<Error> errors;

  factory Errors.fromJson(Map<String, dynamic> json) => Errors(
        errors: json['errors'] == null
            ? []
            : List<Error>.from(
                json['errors'].map((dynamic x) => Error.fromJson(x))),
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'errors': List<dynamic>.from(errors.map((Error x) => x.toJson())),
      };
}
