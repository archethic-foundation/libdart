/// SPDX-License-Identifier: AGPL-3.0-or-later

import 'package:archethic_lib_dart/src/model/transaction.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'transaction_content_response.freezed.dart';
part 'transaction_content_response.g.dart';

@freezed
class TransactionContentResponse with _$TransactionContentResponse {
  const factory TransactionContentResponse({
    Map<String, Transaction?>? data,
    Map<String, dynamic>? error,
  }) = _TransactionContentResponse;
  const TransactionContentResponse._();

  factory TransactionContentResponse.fromJson(Map<String, dynamic> json) =>
      _$TransactionContentResponseFromJson(json);
}
