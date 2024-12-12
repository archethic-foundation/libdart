// SPDX-License-Identifier: AGPL-3.0-or-later

import 'package:freezed_annotation/freezed_annotation.dart';

part 'node.freezed.dart';
part 'node.g.dart';

@freezed
class Node with _$Node {
  const factory Node({
    bool? authorized,
    bool? available,
    double? averageAvailability,
    String? firstPublicKey,
    String? geoPatch,
    String? ip,
    String? lastPublicKey,
    String? networkPatch,
    int? port,
    String? rewardAddress,
    int? enrollmentDate,
    int? authorizationDate,
  }) = _Node;
  const Node._();

  factory Node.fromJson(Map<String, dynamic> json) => _$NodeFromJson(json);
}
