/// SPDX-License-Identifier: AGPL-3.0-or-later
import 'package:archethic_lib_dart/src/model/hosting_ref_content_metadata.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'hosting_ref.freezed.dart';
part 'hosting_ref.g.dart';

@freezed
class HostingRef with _$HostingRef {
  const factory HostingRef({
    @Default(1) int aewebVersion,
    @Default('sha1') String hashFunction,
    @Default({}) final Map<String, HostingRefContentMetaData> metaData,
    @Default('') String sslCertificate,
  }) = _HostingRef;
  const HostingRef._();

  factory HostingRef.fromJson(Map<String, dynamic> json) =>
      _$HostingRefFromJson(json);
}
