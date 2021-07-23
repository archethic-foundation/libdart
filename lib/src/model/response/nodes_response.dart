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
            : List<Errors>.from(json['errors'].map((x) => Errors.fromJson(x))),
      );

  NodesResponseData? data;
  List<Errors>? errors;

  Map<String, dynamic> toJson() => {
        'data': data!.toJson(),
        'errors': List<dynamic>.from(errors!.map((x) => x.toJson())),
      };
}

class NodesResponseData {
  NodesResponseData({
    this.nodes,
  });

  factory NodesResponseData.fromJson(Map<String, dynamic> json) =>
      NodesResponseData(
        nodes: List<Node>.from(json['nodes'].map((x) => Node.fromJson(x))),
      );

  List<Node>? nodes;

  Map<String, dynamic> toJson() => {
        'nodes': List<dynamic>.from(nodes!.map((x) => x.toJson())),
      };
}
