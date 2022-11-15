/// SPDX-License-Identifier: AGPL-3.0-or-later

import 'package:archethic_lib_dart/src/model/transaction.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'transaction_chain_response.freezed.dart';
part 'transaction_chain_response.g.dart';

@freezed
class TransactionChainResponse with _$TransactionChainResponse {
  const factory TransactionChainResponse({
    Map<String, List<Transaction>?>? data,
    Map<String, dynamic>? error,
  }) = _TransactionChainResponse;
  const TransactionChainResponse._();

  factory TransactionChainResponse.fromJson(Map<String, dynamic> json) =>
      _$TransactionChainResponseFromJson(json);
}
