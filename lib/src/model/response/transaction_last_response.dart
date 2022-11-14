/// SPDX-License-Identifier: AGPL-3.0-or-later

import 'package:archethic_lib_dart/src/model/transaction.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'transaction_last_response.freezed.dart';
part 'transaction_last_response.g.dart';

@freezed
abstract class TransactionLastResponse with _$TransactionLastResponse {
  const factory TransactionLastResponse({
    Map<String, Transaction>? data,
    Map<String, dynamic>? error,
  }) = _TransactionLastResponse;
  const TransactionLastResponse._();

  factory TransactionLastResponse.fromJson(Map<String, dynamic> json) =>
      _$TransactionLastResponseFromJson(json);
}
