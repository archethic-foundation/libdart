// To parse this JSON data, do
//
//     final nodesResponse = nodesResponseFromJson(jsonString);

// Dart imports:
import 'dart:convert';

NodesResponse nodesResponseFromJson(String str) =>
    NodesResponse.fromJson(json.decode(str));

String nodesResponseToJson(NodesResponse data) => json.encode(data.toJson());

class NodesResponse {
  NodesResponse({
    this.data,
  });

  factory NodesResponse.fromJson(Map<String, dynamic> json) => NodesResponse(
        data: Data.fromJson(json['data']),
      );

  Data? data;

  Map<String, dynamic> toJson() => {
        'data': data!.toJson(),
      };
}

class Data {
  Data({
    this.nodes,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        nodes: List<Node>.from(json['nodes'].map((x) => Node.fromJson(x))),
      );

  List<Node>? nodes;

  Map<String, dynamic> toJson() => {
        'nodes': List<dynamic>.from(nodes!.map((x) => x.toJson())),
      };
}

class Node {
  Node({
    this.authorized,
    this.available,
    this.averageAvailability,
    this.firstPublicKey,
    this.geoPatch,
    this.ip,
    this.lastPublicKey,
    this.networkPatch,
    this.port,
    this.rewardAddress,
  });

  factory Node.fromJson(Map<String, dynamic> json) => Node(
        authorized: json['authorized'],
        available: json['available'],
        averageAvailability: json['averageAvailability'] == null
            ? null
            : json['averageAvailability'].toDouble(),
        firstPublicKey: json['firstPublicKey'],
        geoPatch: json['geoPatch'],
        ip: json['ip'],
        lastPublicKey: json['lastPublicKey'],
        networkPatch: json['networkPatch'],
        port: json['port'],
        rewardAddress: json['rewardAddress'],
      );

  bool? authorized;
  bool? available;
  double? averageAvailability;
  String? firstPublicKey;
  String? geoPatch;
  String? ip;
  String? lastPublicKey;
  String? networkPatch;
  int? port;
  String? rewardAddress;

  Map<String, dynamic> toJson() => {
        'authorized': authorized,
        'available': available,
        'averageAvailability': averageAvailability,
        'firstPublicKey': firstPublicKey,
        'geoPatch': geoPatch,
        'ip': ip,
        'lastPublicKey': lastPublicKey,
        'networkPatch': networkPatch,
        'port': port,
        'rewardAddress': rewardAddress,
      };
}
