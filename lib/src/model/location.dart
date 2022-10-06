/// SPDX-License-Identifier: AGPL-3.0-or-later

import 'package:freezed_annotation/freezed_annotation.dart';

/// [Location] of an error
part 'location.freezed.dart';
part 'location.g.dart';

@freezed
class Location with _$Location {
  const factory Location({
    int? column,
    int? line,
  }) = _Location;
  const Location._();

  factory Location.fromJson(Map<String, dynamic> json) =>
      _$LocationFromJson(json);
}
