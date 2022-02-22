/// SPDX-License-Identifier: AGPL-3.0-or-later

/// [CrossValidationStamp] represents the approval of the validation stamp by a cross validation node.
class CrossValidationStamp {
  CrossValidationStamp({
    this.nodePublicKey,
    this.signature,
  });

  /// Node: node public key
  String? nodePublicKey;

  /// Signature: signature of the validation stamp
  String? signature;

  factory CrossValidationStamp.fromJson(Map<String, dynamic> json) =>
      CrossValidationStamp(
        // TODO: Wait for renaming node -> nodePublicKey
        nodePublicKey: json['node'],
        signature: json['signature'],
      );

  Map<String, dynamic> toJson() => {
        // TODO: Wait for renaming node -> nodePublicKey
        'node': nodePublicKey,
        'signature': signature,
      };
}
