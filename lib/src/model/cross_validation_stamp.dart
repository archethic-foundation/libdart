// SPDX-License-Identifier: AGPL-3.0-or-later

import 'package:freezed_annotation/freezed_annotation.dart';

part 'cross_validation_stamp.freezed.dart';
part 'cross_validation_stamp.g.dart';

/// [CrossValidationStamp] represents the approval of the validation stamp by a cross validation node.
@freezed
class CrossValidationStamp with _$CrossValidationStamp {
  const factory CrossValidationStamp({
    /// Node public key
    String? nodePublicKey,

    /// Signature of the validation stamp
    String? signature,
  }) = _CrossValidationStamp;
  const CrossValidationStamp._();

  factory CrossValidationStamp.fromJson(Map<String, dynamic> json) =>
      _$CrossValidationStampFromJson(json);
}
