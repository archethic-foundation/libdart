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

  List<Object>? sortArgs() {
    if (args == null) return null;

    final newList = List<Object>.from(args!);

    for (var i = 0; i < newList.length; i++) {
      if (newList[i] is Map) {
        newList[i] = sortMapKeys(newList[i] as Map<String, dynamic>);
      }
    }
    return newList;
  }

  Map<String, dynamic> sortMapKeys(Map<String, dynamic> map) {
    final sortedMap = Map.fromEntries(
      map.entries.toList()..sort((a, b) => a.key.compareTo(b.key)),
    );

    for (final key in sortedMap.keys) {
      if (sortedMap[key] is Map) {
        sortedMap[key] = sortMapKeys(sortedMap[key]);
      }
    }

    return sortedMap;
  }
}
