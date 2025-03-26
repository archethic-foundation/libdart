import 'package:freezed_annotation/freezed_annotation.dart';

part 'location.freezed.dart';
part 'location.g.dart';

/// [Location] of an error
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
