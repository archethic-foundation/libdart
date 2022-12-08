/// SPDX-License-Identifier: AGPL-3.0-or-later
import 'package:freezed_annotation/freezed_annotation.dart';

part 'uco.freezed.dart';
part 'uco.g.dart';

@freezed
class Uco with _$Uco {
  const factory Uco({
    double? eur,
    double? usd,
  }) = _Uco;
  const Uco._();

  factory Uco.fromJson(Map<String, dynamic> json) => _$UcoFromJson(json);
}
