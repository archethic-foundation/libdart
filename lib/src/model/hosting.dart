/// SPDX-License-Identifier: AGPL-3.0-or-later
import 'package:archethic_lib_dart/src/model/hosting_content_metadata.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'hosting.freezed.dart';
part 'hosting.g.dart';

@freezed
class Hosting with _$Hosting {
  const factory Hosting({
    @Default(1) int aewebVersion,
    @Default('sha1') String hashFunction,
    @Default({}) final Map<String, HostingContentMetaData> metaData,
  }) = _Hosting;
  const Hosting._();

  factory Hosting.fromJson(Map<String, dynamic> json) =>
      _$HostingFromJson(json);
}
