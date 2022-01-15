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
        nodePublicKey: json['nodePublicKey'],
        signature: json['signature'],
      );

  Map<String, dynamic> toJson() => {
        'nodePublicKey': nodePublicKey,
        'signature': signature,
      };
}
