/// [CrossValidationStamp] represents the approval of the validation stamp by a cross validation node.
class CrossValidationStamp {
  CrossValidationStamp({
    this.node,
    this.signature,
  });

  /// Node: node public key
  String? node;

  /// Signature: signature of the validation stamp
  String? signature;

  factory CrossValidationStamp.fromJson(Map<String, dynamic> json) =>
      CrossValidationStamp(
        node: json['node'],
        signature: json['signature'],
      );

  Map<String, dynamic> toJson() => {
        'node': node,
        'signature': signature,
      };
}
