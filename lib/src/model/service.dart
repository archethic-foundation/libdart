/// SPDX-License-Identifier: AGPL-3.0-or-later
/// Package archEthic aims to provide a easy way to create Archethic transaction and to send them over the network.
/// This implementation is based on Official Archethic Javascript library for Node and Browser.

import 'package:freezed_annotation/freezed_annotation.dart';

part 'service.freezed.dart';
part 'service.g.dart';

@freezed
class Service with _$Service {
  const factory Service({
    required String derivationPath,
    @Default('ed25519') String curve,
    @Default('sha256') String hashAlgo,
  }) = _Service;
  const Service._();

  factory Service.fromJson(Map<String, dynamic> json) =>
      _$ServiceFromJson(json);
}
