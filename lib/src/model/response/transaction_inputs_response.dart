/// SPDX-License-Identifier: AGPL-3.0-or-later

import 'package:archethic_lib_dart/src/model/transaction_input.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'transaction_inputs_response.freezed.dart';
part 'transaction_inputs_response.g.dart';

@freezed
abstract class TransactionInputsResponse with _$TransactionInputsResponse {
  const factory TransactionInputsResponse({
    Map<String, List<TransactionInput>>? data,
    Map<String, dynamic>? error,
  }) = _TransactionInputsResponse;
  const TransactionInputsResponse._();

  factory TransactionInputsResponse.fromJson(Map<String, dynamic> json) =>
      _$TransactionInputsResponseFromJson(json);
}
