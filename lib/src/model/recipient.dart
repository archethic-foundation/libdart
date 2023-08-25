/// SPDX-License-Identifier: AGPL-3.0-or-later
import 'package:freezed_annotation/freezed_annotation.dart';

/// Recipient represents a Smart Contract call.

part 'recipient.freezed.dart';
part 'recipient.g.dart';

@freezed
class Recipient with _$Recipient {
  const factory Recipient({
    /// Name of the action
    String? action,

    /// Contract's address
    String? address,

    /// List of arguments for the action (must contain only JSON valid data)
    List<Object>? args,
  }) = _Recipient;
  const Recipient._();

  factory Recipient.fromJson(Map<String, dynamic> json) =>
      _$RecipientFromJson(json);
}
