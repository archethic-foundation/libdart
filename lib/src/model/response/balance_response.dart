/// SPDX-License-Identifier: AGPL-3.0-or-later

import 'package:archethic_lib_dart/src/model/balance.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'balance_response.freezed.dart';
part 'balance_response.g.dart';

@freezed
abstract class BalanceResponse with _$BalanceResponse {
  const factory BalanceResponse({
    Map<String, Balance>? data,
    Map<String, dynamic>? error,
  }) = _BalanceResponse;
  const BalanceResponse._();

  factory BalanceResponse.fromJson(Map<String, dynamic> json) =>
      _$BalanceResponseFromJson(json);
}
