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
    this.errors,
  });

  factory NodesResponse.fromJson(Map<String, dynamic> json) => NodesResponse(
        data: json['data'] == null ? null : NodesResponseData.fromJson(json['data']),
        errors: json["errors"] == null ? null : List<NodesResponseDataError>.from(json["errors"].map((x) => NodesResponseDataError.fromJson(x))),
      );

  NodesResponseData? data;
  List<NodesResponseDataError>? errors;

  Map<String, dynamic> toJson() => {
        'data': data!.toJson(),
        "errors": List<dynamic>.from(errors!.map((x) => x.toJson())),
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


class NodesResponseDataError {
    NodesResponseDataError({
        this.locations,
        this.message,
    });

    List<NodesResponseDataErrorLocation>? locations;
    String? message;

    factory NodesResponseDataError.fromJson(Map<String, dynamic> json) => NodesResponseDataError(
        locations: List<NodesResponseDataErrorLocation>.from(json["locations"].map((x) => NodesResponseDataErrorLocation.fromJson(x))),
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "locations": List<dynamic>.from(locations!.map((x) => x.toJson())),
        "message": message,
    };
}

class NodesResponseDataErrorLocation {
    NodesResponseDataErrorLocation({
        this.column,
        this.line,
    });

    int? column;
    int? line;

    factory NodesResponseDataErrorLocation.fromJson(Map<String, dynamic> json) => NodesResponseDataErrorLocation(
        column: json["column"],
        line: json["line"],
    );

    Map<String, dynamic> toJson() => {
        "column": column,
        "line": line,
    };
}
