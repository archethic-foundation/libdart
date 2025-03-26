import 'package:archethic_lib_dart/src/model/location.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'error.freezed.dart';
part 'error.g.dart';

// TODO(reddwarf03): This is not used anywhere.
@freezed
class Error with _$Error {
  const factory Error({
    @Default([]) final List<Location> locations,
    String? message,
    @Default([]) final List<String> path,
  }) = _Error;
  const Error._();

  factory Error.fromJson(Map<String, dynamic> json) => _$ErrorFromJson(json);
}
