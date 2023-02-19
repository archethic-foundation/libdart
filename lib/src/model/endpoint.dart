/// SPDX-License-Identifier: AGPL-3.0-or-later
import 'package:freezed_annotation/freezed_annotation.dart';

/// [Endpoint] represents a network node's endpoint

part 'endpoint.freezed.dart';
part 'endpoint.g.dart';

@freezed
class Endpoint with _$Endpoint {
  const factory Endpoint({
    @Default('') final String ip,
    @Default(0) final int port,
  }) = _Endpoint;
  const Endpoint._();

  factory Endpoint.fromJson(Map<String, dynamic> json) =>
      _$EndpointFromJson(json);
}
