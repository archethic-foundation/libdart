/// SPDX-License-Identifier: AGPL-3.0-or-later
import 'package:freezed_annotation/freezed_annotation.dart';

part 'ae_group_message.freezed.dart';
part 'ae_group_message.g.dart';

@freezed
class AEGroupMessage with _$AEGroupMessage {
  const factory AEGroupMessage({
    @Default('') final String groupName,
    @Default('') final String address,
    @Default([]) final List<String> usersPubKey,
    @Default([]) final List<String> adminPublicKey,
    @Default(0) final int timestamp,
  }) = _AEGroupMessage;
  const AEGroupMessage._();

  factory AEGroupMessage.fromJson(Map<String, dynamic> json) =>
      _$AEGroupMessageFromJson(json);
}
