// SPDX-License-Identifier: AGPL-3.0-or-later

import 'package:freezed_annotation/freezed_annotation.dart';

part 'hosting_ref_content_metadata.freezed.dart';
part 'hosting_ref_content_metadata.g.dart';

@freezed
class HostingRefContentMetaData with _$HostingRefContentMetaData {
  const factory HostingRefContentMetaData({
    @Default('') String hash,
    @Default(0) int size,
    @Default('') String encoding,
    @Default([]) List<String> addresses,
  }) = _HostingRefContentMetaData;
  const HostingRefContentMetaData._();

  factory HostingRefContentMetaData.fromJson(Map<String, dynamic> json) =>
      _$HostingRefContentMetaDataFromJson(json);
}
