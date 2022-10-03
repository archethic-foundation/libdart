/// SPDX-License-Identifier: AGPL-3.0-or-later

// To parse this JSON data, do
//
//     final nodesResponse = nodesResponseFromJson(jsonString);

// Dart imports:
import 'dart:convert';

// Project imports:
import 'package:archethic_lib_dart/src/model/errors.dart';
import 'package:archethic_lib_dart/src/model/node.dart';

NodesResponse nodesResponseFromJson(String str) =>
    NodesResponse.fromJson(json.decode(str));

String nodesResponseToJson(NodesResponse data) => json.encode(data.toJson());

class NodesResponse {
  NodesResponse({
    this.data,
    this.errors,
  });

  factory NodesResponse.fromJson(Map<String, dynamic> json) => NodesResponse(
        data: json['data'] == null
            ? null
            : NodesResponseData.fromJson(json['data']),
        errors: json['errors'] == null
            ? null
            : List<Errors>.from(
                json['errors'].map(Errors.fromJson),),
      );

  NodesResponseData? data;
  List<Errors>? errors;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'data': data!.toJson(),
        'errors': List<dynamic>.from(errors!.map((Errors x) => x.toJson())),
      };
}

class NodesResponseData {
  NodesResponseData({
    this.nodes,
  });

  factory NodesResponseData.fromJson(Map<String, dynamic> json) =>
      NodesResponseData(
        nodes: json['nodes'] == null
            ? null
            : List<Node>.from(
                json['nodes'].map(Node.fromJson),),
      );

  List<Node>? nodes;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'nodes': List<dynamic>.from(nodes!.map((Node x) => x.toJson())),
      };
}
