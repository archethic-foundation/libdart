/// SPDX-License-Identifier: AGPL-3.0-or-later
import 'package:freezed_annotation/freezed_annotation.dart';

part 'hosting_content_metadata.freezed.dart';
part 'hosting_content_metadata.g.dart';

@freezed
class HostingContentMetaData with _$HostingContentMetaData {
  const factory HostingContentMetaData({
    @Default('') String hash,
    @Default(0) int size,
    @Default('') String encoding,
    @Default([]) List<String> addresses,
  }) = _HostingContentMetaData;
  const HostingContentMetaData._();

  factory HostingContentMetaData.fromJson(Map<String, dynamic> json) =>
      _$HostingContentMetaDataFromJson(json);
}
