/// SPDX-License-Identifier: AGPL-3.0-or-later

// Project imports:
import 'package:archethic_lib_dart/src/model/node.dart';

class NodesResponseData {
  NodesResponseData({
    this.nodes,
  });

  factory NodesResponseData.fromJson(Map<String, dynamic> json) =>
      NodesResponseData(
        nodes: json['nodes'] == null
            ? null
            : List<Node>.from(
                json['nodes'].map((dynamic x) => Node.fromJson(x))),
      );

  List<Node>? nodes;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'nodes': List<dynamic>.from(nodes!.map((Node x) => x.toJson())),
      };
}
