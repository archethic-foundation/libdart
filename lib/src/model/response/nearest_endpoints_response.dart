import 'package:archethic_lib_dart/src/model/endpoint.dart';

class NearestEndpointsResponseData {
  NearestEndpointsResponseData({
    this.endpoints,
  });

  factory NearestEndpointsResponseData.fromJson(Map<String, dynamic> json) =>
      NearestEndpointsResponseData(
        endpoints: json['nearestEndpoints'] == null
            ? null
            : List<Endpoint>.from(
                json['nearestEndpoints']
                    .map((dynamic x) => Endpoint.fromJson(x)),
              ),
      );

  List<Endpoint>? endpoints;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'nearestEndpoints':
            List<dynamic>.from(endpoints!.map((Endpoint x) => x.toJson())),
      };
}
