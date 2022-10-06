/// SPDX-License-Identifier: AGPL-3.0-or-later

// Project imports:
import 'package:archethic_lib_dart/src/model/error.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'errors.freezed.dart';
part 'errors.g.dart';

@freezed
class Errors with _$Errors {
  const factory Errors({
    @Default([]) final List<Error> errors,
  }) = _Errors;
  const Errors._();

  factory Errors.fromJson(Map<String, dynamic> json) => _$ErrorsFromJson(json);
}
