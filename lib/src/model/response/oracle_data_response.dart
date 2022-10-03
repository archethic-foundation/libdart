/// SPDX-License-Identifier: AGPL-3.0-or-later
// To parse this JSON data, do
//
//     final oracleData = oracleDataFromJson(jsonString);

// Dart imports:
import 'dart:convert';

// Project imports:
import 'package:archethic_lib_dart/src/model/uco.dart';

OracleDataResponse oracleDataResponseFromJson(String str) =>
    OracleDataResponse.fromJson(json.decode(str));

String oracleDataResponseToJson(OracleDataResponse data) =>
    json.encode(data.toJson());

class OracleDataResponse {
  OracleDataResponse({
    this.data,
  });

  factory OracleDataResponse.fromJson(Map<String, dynamic> json) =>
      OracleDataResponse(
        data: OracleData.fromJson(json['data']),
      );

  OracleData? data;

  Map<String, dynamic> toJson() => {
        'data': data!.toJson(),
      };
}

class OracleData {
  OracleData({
    this.oracleData,
  });

  factory OracleData.fromJson(Map<String, dynamic> json) => OracleData(
        oracleData: OracleDataClass.fromJson(json['oracleData']),
      );

  OracleDataClass? oracleData;

  Map<String, dynamic> toJson() => {
        'oracleData': oracleData!.toJson(),
      };
}

class OracleDataClass {
  OracleDataClass({
    this.services,
    this.timestamp,
  });

  factory OracleDataClass.fromJson(Map<String, dynamic> json) =>
      OracleDataClass(
        services: OracleServices.fromJson(json['services']),
        timestamp: json['timestamp'],
      );

  OracleServices? services;
  int? timestamp;

  Map<String, dynamic> toJson() => {
        'services': services!.toJson(),
        'timestamp': timestamp,
      };
}

class OracleServices {
  OracleServices({
    this.uco,
  });

  factory OracleServices.fromJson(Map<String, dynamic> json) => OracleServices(
        uco: Uco.fromJson(json['uco']),
      );

  Uco? uco;

  Map<String, dynamic> toJson() => {
        'uco': uco!.toJson(),
      };
}
